package com.tuling.tulingmall.utils;


import com.tuling.tulingmall.common.api.ResultCode;
import com.tuling.tulingmall.common.exception.GateWayException;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwsHeader;
import io.jsonwebtoken.Jwt;
import io.jsonwebtoken.Jwts;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.*;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.util.Map;

/**
* @vlog: 高于生活，源于生活
* @desc: 类的描述:Jwt操作类
* @author: smlz
* @createDate: 2020/1/22 11:29
* @version: 1.0
*/
@Slf4j
public class JwtUtils {

    /**
     * 认证服务器许可我们的网关的clientId(需要在oauth_client_details表中配置)
     */
    private static final String CLIENT_ID = "api-gateway";

    /**
     * 认证服务器许可我们的网关的client_secret(需要在oauth_client_details表中配置)
     */
    private static final String CLIENT_SECRET = "smlz";

    /**
     * 认证服务器暴露的获取token_key的地址
     */
    private static final String AUTH_TOKEN_KEY_URL = "http://tulingmall-authcenter/oauth/token_key";

    /**
     * 请求头中的 token的开始
     */
    private static final String AUTH_HEADER = "bearer ";

    /**
     * 方法实现说明: 通过远程调用获取认证服务器颁发jwt的解析的key
     * @author:smlz
     * @param restTemplate 远程调用的操作类
     * @return: tokenKey 解析jwt的tokenKey
     * @exception:
     * @date:2020/1/22 11:31
     */
    private static String getTokenKeyByRemoteCall(RestTemplate restTemplate) throws GateWayException {

        //第一步:封装请求头
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.setBasicAuth(CLIENT_ID,CLIENT_SECRET);
        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(null, headers);

        //第二步:远程调用获取token_key
        try {

            ResponseEntity<Map> response = restTemplate.exchange(AUTH_TOKEN_KEY_URL, HttpMethod.GET, entity, Map.class);

            String tokenKey = response.getBody().get("value").toString();

            log.info("去认证服务器获取Token_Key:{}",tokenKey);

            return tokenKey;

        }catch (Exception e) {

            log.error("远程调用认证服务器获取Token_Key失败:{}",e.getMessage());

            throw new GateWayException(ResultCode.GET_TOKEN_KEY_ERROR);
        }
    }

    /**
     * 方法实现说明:生成公钥
     * @author:smlz
     * @param restTemplate:远程调用操作类
     * @return: PublicKey 公钥对象
     * @exception:
     * @date:2020/1/22 11:52
     */
    public static PublicKey genPulicKey(RestTemplate restTemplate) throws GateWayException {

        String tokenKey = getTokenKeyByRemoteCall(restTemplate);

        try{

            //把获取的公钥开头和结尾替换掉
            String dealTokenKey =tokenKey.replaceAll("\\-*BEGIN PUBLIC KEY\\-*", "").replaceAll("\\-*END PUBLIC KEY\\-*", "").trim();

            java.security.Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());

            X509EncodedKeySpec pubKeySpec = new X509EncodedKeySpec(Base64.decodeBase64(dealTokenKey));

            KeyFactory keyFactory = KeyFactory.getInstance("RSA");

            PublicKey publicKey = keyFactory.generatePublic(pubKeySpec);

            log.info("生成公钥:{}",publicKey);

            return publicKey;

        }catch (Exception e) {

            log.info("生成公钥异常:{}",e.getMessage());

            throw new GateWayException(ResultCode.GEN_PUBLIC_KEY_ERROR);
        }
    }

    public static Claims validateJwtToken(String authHeader,PublicKey publicKey) {
        String token =null ;
        try{
            token = StringUtils.substringAfter(authHeader, AUTH_HEADER);

            Jwt<JwsHeader, Claims> parseClaimsJwt = Jwts.parser().setSigningKey(publicKey).parseClaimsJws(token);

            Claims claims = parseClaimsJwt.getBody();

            //log.info("claims:{}",claims);

            return claims;

        }catch(Exception e){

            log.error("校验token异常:{},异常信息:{}",token,e.getMessage());

            throw new GateWayException(ResultCode.JWT_TOKEN_EXPIRE);
        }
    }
}
