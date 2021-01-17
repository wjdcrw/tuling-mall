package com.tuling.tulingmall.service.impl;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.common.api.TokenInfo;
import com.tuling.tulingmall.mapper.UmsMemberLevelMapper;
import com.tuling.tulingmall.mapper.UmsMemberMapper;
import com.tuling.tulingmall.model.UmsMember;
import com.tuling.tulingmall.model.UmsMemberExample;
import com.tuling.tulingmall.model.UmsMemberLevel;
import com.tuling.tulingmall.model.UmsMemberLevelExample;

import com.tuling.tulingmall.constant.MDA;
import com.tuling.tulingmall.service.RedisService;
import com.tuling.tulingmall.service.UmsMemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.http.*;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * 会员管理Service实现类
 * Created by macro on 2018/8/3.
 */
@Service
public class UmsMemberServiceImpl implements UmsMemberService {
    private static final Logger LOGGER = LoggerFactory.getLogger(UmsMemberServiceImpl.class);

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UmsMemberMapper memberMapper;

    @Autowired
    private UmsMemberLevelMapper memberLevelMapper;

    @Autowired
    private RedisService redisService;

    @Value("${redis.key.prefix.authCode}")
    private String REDIS_KEY_PREFIX_AUTH_CODE;

    @Value("${redis.key.expire.authCode}")
    private Long AUTH_CODE_EXPIRE_SECONDS;

    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @Override
    public UmsMember getByUsername(String username) {
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria().andUsernameEqualTo(username);
        List<UmsMember> memberList = memberMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(memberList)) {
            return memberList.get(0);
        }
        return null;
    }

    @Override
    public UmsMember getById(Long id) {
        return memberMapper.selectByPrimaryKey(id);
    }

    @Override
    public CommonResult register(String username, String password, String telephone, String authCode) {
        //验证验证码
        if(!verifyAuthCode(authCode,telephone)){
            return CommonResult.failed("验证码错误");
        }
        //查询是否已有该用户
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria().andUsernameEqualTo(username);
        example.or(example.createCriteria().andPhoneEqualTo(telephone));
        List<UmsMember> umsMembers = memberMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(umsMembers)) {
            return CommonResult.failed("该用户已经存在");
        }
        //没有该用户进行添加操作
        UmsMember umsMember = new UmsMember();
        umsMember.setUsername(username);
        umsMember.setPhone(telephone);
        umsMember.setPassword(passwordEncoder.encode(password));
        umsMember.setCreateTime(new Date());
        umsMember.setStatus(1);
        //获取默认会员等级并设置
        UmsMemberLevelExample levelExample = new UmsMemberLevelExample();
        levelExample.createCriteria().andDefaultStatusEqualTo(1);
        List<UmsMemberLevel> memberLevelList = memberLevelMapper.selectByExample(levelExample);
        if (!CollectionUtils.isEmpty(memberLevelList)) {
            umsMember.setMemberLevelId(memberLevelList.get(0).getId());
        }
        memberMapper.insert(umsMember);
        umsMember.setPassword(null);
        return CommonResult.success(null,"注册成功");
    }

    @Override
    public CommonResult generateAuthCode(String telephone) {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for(int i=0;i<6;i++){
            sb.append(random.nextInt(10));
        }
        //验证码绑定手机号并存储到redis
        redisService.set(REDIS_KEY_PREFIX_AUTH_CODE+telephone,sb.toString());
        redisService.expire(REDIS_KEY_PREFIX_AUTH_CODE+telephone,AUTH_CODE_EXPIRE_SECONDS);
        return CommonResult.success(sb.toString(),"获取验证码成功");
    }

    @Override
    public CommonResult updatePassword(String telephone, String password, String authCode) {
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria().andPhoneEqualTo(telephone);
        List<UmsMember> memberList = memberMapper.selectByExample(example);
        if(CollectionUtils.isEmpty(memberList)){
            return CommonResult.failed("该账号不存在");
        }
        //验证验证码
        if(!verifyAuthCode(authCode,telephone)){
            return CommonResult.failed("验证码错误");
        }
        UmsMember umsMember = memberList.get(0);
        umsMember.setPassword(passwordEncoder.encode(password));
        memberMapper.updateByPrimaryKeySelective(umsMember);
        return CommonResult.success(null,"密码修改成功");
    }

    @Override
    public UmsMember getCurrentMember() {
        return null;
    }

/*    @Override
    public UmsMember getCurrentMember() {
        SecurityContext ctx = SecurityContextHolder.getContext();
        Authentication auth = ctx.getAuthentication();
        MemberDetails memberDetails = (MemberDetails) auth.getPrincipal();
        return memberDetails.getUmsMember();
    }*/

    @Override
    public void updateIntegration(Long id, Integer integration) {
        UmsMember record=new UmsMember();
        record.setId(id);
        record.setIntegration(integration);
        memberMapper.updateByPrimaryKeySelective(record);
    }

/*    @Override
    public UserDetails loadUserByUsername(String username) {
        UmsMember member = getByUsername(username);
        if(member!=null){
            return new MemberDetails(member);
        }
        throw new UsernameNotFoundException("用户名或密码错误");
    }*/

    @Override
    public TokenInfo login(String username, String password) {

        ResponseEntity<TokenInfo> response;

        try{

            //远程调用认证服务器 进行用户登陆

            response = restTemplate.exchange(MDA.OAUTH_LOGIN_URL, HttpMethod.POST, wrapOauthTokenRequest(username,password), TokenInfo.class);

            TokenInfo tokenInfo = response.getBody();

            LOGGER.info("根据用户名:{}登陆成功:TokenInfo:{}",username,tokenInfo);

            return tokenInfo;

        }catch (Exception e) {
            LOGGER.error("根据用户名:{}登陆异常:{}",username,e.getMessage());

            return null;
        }
    }

    /**
     * 方法实现说明:封装用户到认证中心的请求头 和请求参数
     * @author:smlz
     * @param userName 用户名
     * @param password 密码
     * @return:
     * @exception:
     * @date:2020/1/22 15:32
     */
    private HttpEntity<MultiValueMap<String, String>> wrapOauthTokenRequest(String userName, String password) {

        //封装oauth2 请求头 clientId clientSecret
        HttpHeaders httpHeaders = wrapHttpHeaders();

        //封装请求参数
        MultiValueMap<String, String> reqParams = new LinkedMultiValueMap<>();
        reqParams.add(MDA.USER_NAME,userName);
        reqParams.add(MDA.PASS,password);
        reqParams.add(MDA.GRANT_TYPE,MDA.PASS);
        reqParams.add(MDA.SCOPE,MDA.SCOPE_AUTH);

        //封装请求参数
        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(reqParams, httpHeaders);

        return entity;
    }

    /**
     * 方法实现说明:封装刷新token的请求
     * @author:smlz
     * @param refreshToken:刷新token
     * @return: HttpEntity
     * @exception:
     * @date:2020/1/22 16:14
     */
    private HttpEntity<MultiValueMap<String, String>> wrapRefreshTokenRequest(String refreshToken) {

        HttpHeaders httpHeaders = wrapHttpHeaders();

        MultiValueMap<String,String> param = new LinkedMultiValueMap<>();
        param.add("grant_type","refresh_token");
        param.add("refresh_token",refreshToken);

        HttpEntity<MultiValueMap<String,String>> httpEntity = new HttpEntity<>(param,httpHeaders);

        return httpEntity;
    }

    /**
     * 方法实现说明:封装请求头
     * @author:smlz
     * @return:HttpHeaders
     * @exception:
     * @date:2020/1/22 16:10
     */
    private HttpHeaders wrapHttpHeaders() {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        httpHeaders.setBasicAuth(MDA.CLIENT_ID,MDA.CLIENT_SECRET);
        return httpHeaders;
    }

    @Override
    public String refreshToken(String token) {

        LOGGER.info("RefreshToken的值为:{}",token);

        if(StringUtils.isEmpty(token)) {
            LOGGER.warn("刷新令牌不能为空:{}",token);
            return null;
        }

        ResponseEntity<TokenInfo> responseEntity = null ;

        String jwtTokenValue=null ;

        try{
            jwtTokenValue = token.substring(tokenHead.length());
            //刷新令牌
            responseEntity = restTemplate.exchange(MDA.OAUTH_LOGIN_URL, HttpMethod.POST, wrapRefreshTokenRequest(jwtTokenValue), TokenInfo.class);

            TokenInfo tokenInfo = responseEntity.getBody();

            String newAccessToken = tokenInfo.getAccess_token();

            LOGGER.info("通过RefreshToken:{}刷新令牌成功accessToken:{}",jwtTokenValue,newAccessToken);

            return newAccessToken;

        }catch (Exception e) {
            LOGGER.error("通过RefreshToken:{}刷新令牌失败:{}",jwtTokenValue,e.getMessage());
            return jwtTokenValue;
        }
    }

    //对输入的验证码进行校验
    private boolean verifyAuthCode(String authCode, String telephone){
        if(StringUtils.isEmpty(authCode)){
            return false;
        }
        String realAuthCode = redisService.get(REDIS_KEY_PREFIX_AUTH_CODE + telephone);
        return authCode.equals(realAuthCode);
    }

    /**
     * 修改Member资料
     * @param umsMember
     * @return
     */
    public int updateUmsMember(UmsMember umsMember){
        //部分信息不能修改，全部置空
        umsMember.setMemberLevelId(null);
        umsMember.setUsername(null);
        umsMember.setCreateTime(null);
        umsMember.setHistoryIntegration(null);
        umsMember.setIntegration(null);
        umsMember.setStatus(null);
        umsMember.setGrowth(null);
        return memberMapper.updateByPrimaryKeySelective(umsMember);
    }
}
