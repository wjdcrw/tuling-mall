/**
 * 
 */
package com.tuling.tulingmall.common.api;

import lombok.Data;

import java.util.Date;
import java.util.Map;

/**
* @vlog: 高于生活，源于生活
* @desc: 类的描述:认证服务器返回的TokenInfo的封装
* @author: smlz
* @createDate: 2020/1/22 15:06
* @version: 1.0
*/
@Data
public class TokenInfo {

	private String access_token;

	private String token_type;

	private String refresh_token;
	
	private String scope;
	
	private Map<String,String> additionalInfo;
 	
}
