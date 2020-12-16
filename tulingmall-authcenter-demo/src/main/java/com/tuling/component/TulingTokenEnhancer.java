package com.tuling.component;

import com.tuling.domin.MemberDetails;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;

import java.util.HashMap;
import java.util.Map;

/**
 * @Description: jwd自定义增强器(根据自己的业务需求添加非敏感字段)
 * @Author dcr
 * @Date 2020/12/13 9:25
 */
public class TulingTokenEnhancer implements TokenEnhancer {

    @Override
    public OAuth2AccessToken enhance(OAuth2AccessToken oAuth2AccessToken, OAuth2Authentication oAuth2Authentication) {
        MemberDetails memberDetails = (MemberDetails) oAuth2Authentication.getPrincipal();
        Map<String,Object> additionalInfo=new HashMap<>();
        Map<String,Object> retMap=new HashMap<>();

        //这里暴露memberId到JWT令牌中，后期可以根据自己的业务需要 进行添加字段
        additionalInfo.put("memberId",memberDetails.getUmsMember().getId());
        additionalInfo.put("nickName",memberDetails.getUmsMember().getNickname());
        additionalInfo.put("integration",memberDetails.getUmsMember().getIntegration());

        retMap.put("additionalInfo",additionalInfo);
        ((DefaultOAuth2AccessToken)oAuth2AccessToken).setAdditionalInformation(additionalInfo);
        return oAuth2AccessToken;
    }
}
