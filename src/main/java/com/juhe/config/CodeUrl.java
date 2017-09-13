package com.juhe.config;

public class CodeUrl {

	public static String codeurl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
			+ WxConfig.appid+ "&redirect_uri="
			+ Util.urlEncode(WxConfig.redirect_uri)
			+ "&response_type=code&scope="
			+ WxConfig.scope+ "&state="
			+WxConfig.state+"#wechat_redirect";
	public static void main(String[] args) {
		System.out.println(codeurl);
	}
	
}
