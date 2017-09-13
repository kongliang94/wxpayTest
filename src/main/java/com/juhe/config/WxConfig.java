package com.juhe.config;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Properties;


public class WxConfig {


	public static String appid;
	
	public static String secret;
	
    public static String key ;
    
 
    public static String mch_id;
    
   
    public static String notifyUrl;
    public static String redirect_uri;
	public static String scope;
	public static String state;
    
    
    static{
        Properties prop = new Properties();   
        InputStream in = WxConfig.class.getResourceAsStream("/config.properties");   
        try {   
            prop.load(in);
            appid=prop.getProperty("appid").trim();
            secret=prop.getProperty("secret").trim();
            key = prop.getProperty("key").trim();   
            mch_id = prop.getProperty("mch_id").trim();   
            notifyUrl = prop.getProperty("notify_url").trim(); 
            String  redirect = prop.getProperty("redirect_uri").trim(); 
			redirect_uri=URLEncoder.encode(redirect);
			scope = prop.getProperty("scope").trim();   
			state = prop.getProperty("state").trim();
              
        } catch (IOException e) {   
            e.printStackTrace();   
        } 
    }
}
