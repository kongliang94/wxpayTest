package com.juhe.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.juhe.config.CodeUrl;
import com.juhe.config.HttpRequest;
import com.juhe.config.WxConfig;

@Controller
public class PayController {

	//服务器上获取openid的方法可如下实现
	//如果用户同意授权，页面将跳转至 redirect_uri/?code=CODE&state=STATE。
	//
	 /* @RequestMapping("/getOpenId")
	  public String getUserOpenId(String code){
		String access_token = "appid="
				+ WxConfig.appid
				+ "&secret="
				+ WxConfig.secret
				+ "&code="+code+"&grant_type=authorization_code";

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式	
		System.out.println("--------------------------获取openID时间  [ "+df.format(new Date())+" ] --------------------------");
		String openIdInfo = HttpRequest.sendGet("https://api.weixin.qq.com/sns/oauth2/access_token", access_token);
		JSONObject json = JSONObject.parseObject(openIdInfo);
		String openid = json.getString("openid");
		return openid;
	}*/
	@RequestMapping("/getOpenId.html")
	public String getOpenId(Model model,HttpServletRequest request){

		model.addAttribute("codeUrl",CodeUrl.codeurl);
		//model.addAttribute("codeUrl","https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxee6ca381ab7006d5&redirect_uri=http://juhezhifujia.net/openid&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect");
		return "openId";
	}
	@RequestMapping("/getOpenId")
	public String getOpenIdValue(String code) throws Exception{

		HttpRequest http=new HttpRequest();
		String openIdInfo = http.sendGet("https://api.weixin.qq.com/sns/oauth2/access_token", "appid=" + WxConfig.appid + "&secret=" + WxConfig.secret +"&code=" + code + "&grant_type=authorization_code");
		//openIdInfo json字符串
		JSONObject json = JSONObject.parseObject(openIdInfo);
		String openid = json.getString("openid");
		System.out.println("openid :"+openid);
		return openid;
		
	}
	@RequestMapping("/index")
	public String index(){
		return "index-pay";
	}
	//https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect

	
	/*@RequestMapping("/pay")
	public String payTest(Model model, String code, String out_trade_no) throws Exception{

		String nonce_str =  String.valueOf(new Date().getTime());//生成随机数，可直接用系统提供的方法
		String spbill_create_ip = "127.0.0.1";//用户端ip,这里随意输入的
		String trade_type = "JSAPI";
		String openid = "";
		String prepay_id = "";
		
		 * 1、静默登录
		 * 2、获取openid
		 * 3、调用统一下单接口
		 * 
		HttpRequest http=new HttpRequest();
		//code="http://pan.baidu.com/share/qrcode?w=145&h=148&url=http://juhezhifujia.net/openid";
		//静默登录获取openid
		String openIdInfo = http.sendGet("https://api.weixin.qq.com/sns/oauth2/access_token", "appid=" + WxConfig.appid + "&secret=" + WxConfig.secret +"&code=" + code + "&grant_type=authorization_code");
		//openIdInfo json字符串
		JSONObject json = JSONObject.parseObject(openIdInfo);
		openid = json.getString("openid");
		HashMap<String, Object> map = new HashMap();
		map.put("appid", WxConfig.appid);
		map.put("mch_id", WxConfig.mch_id);
		map.put("device_info", "WEB");
		map.put("nonce_str", nonce_str);
		map.put("body", "购买金币");//订单标题
		map.put("out_trade_no", out_trade_no);//订单ID
		map.put("total_fee", 1);//订单需要支付的金额
		map.put("spbill_create_ip", spbill_create_ip);
		map.put("trade_type", trade_type);
		map.put("notify_url", WxConfig.notifyUrl);//notify_url 支付成功之后 微信会进行异步回调的地址
		map.put("openid", openid);
		String sign = PayUtil.getSign(map);//参数加密  该方法key的需要根据你当前公众号的key进行修改
		map.put("sign", sign);
		//String content = XMLParser.getXMLFromMap(map);
		http = new HttpRequest();
		//调用统一下单接口
		String PostResult = http.sendPost("https://api.mch.weixin.qq.com/pay/unifiedorder", map);
		Map<String, Object> cbMap = XMLParser.getMapFromXML(PostResult);
		if (cbMap.get("return_code").equals("SUCCESS") && cbMap.get("result_code").equals("SUCCESS")) {
			prepay_id = cbMap.get("prepay_id") + "";//这就是预支付id
			String timeStamp = String.valueOf(new Date().getTime()/ 1000);
			map = new HashMap<String, Object>();
			map.put("appId", WxConfig.appid);
			map.put("nonceStr", nonce_str);
			map.put("package", "prepay_id=" + prepay_id);
			map.put("signType", "MD5");
			map.put("timeStamp", timeStamp);
			sign = PayUtil.getSign(map);//参数加密
		}
		return "index-pay-result";
	}*/
}
