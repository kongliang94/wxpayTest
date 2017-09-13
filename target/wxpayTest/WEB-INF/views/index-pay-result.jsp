<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
<title>微信支付</title>
<meta name="description" content="微信支付" />
<meta name="keywords" content="微信支付" />
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js" type="text/javascript"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />

	<script type="text/javascript">
	   //var timer;
		/* $(function(){
			var handler = function(){
				var out_trade_no = $('input[name=out_trade_no]').val();
				$.post("testPayResultQuery?out_trade_no="+out_trade_no,null,function(msg){
					//alert(msg);
					if(msg == '1'){
// 						alert("支付成功");
						document.location.href="pay_success.jsp";
						clearInterval(timer);
					}
				});
			}
			timer = setInterval(handler , 5000);
		}); */
		//调用微信JS api 支付
		
		function jsApiCall()
		{	
			var appId = $('input[name=appId]').val();
			var timeStamp = $('input[name=timeStamp]').val();
			var nonceStr = $('input[name=nonceStr]').val();
			var package1 = $('input[name=package1]').val();
			var signType = $('input[name=signType]').val();
			var paySign = $('input[name=paySign]').val();
			var payInfo=$('input[name=payInfo]').val();
			//alert(appId);
			//alert(package1);
			//alert(paySign); 
			
			/* wx.config({
			    //debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			    appId: appId, // 必填，公众号的唯一标识
			    timestamp: timeStamp, // 必填，生成签名的时间戳
			    nonceStr: nonceStr, // 必填，生成签名的随机串
			    signature: paySign,// 必填，签名，见附录1
			    jsApiList: ['chooseWXPay','checkJsApi'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
			});
			wx.ready(function(){
			    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
				//
				
				/* wx.checkJsApi({
					jsApiList : [ 'chooseWXPay' ], // 需要检测的JS接口列表，所有JS接口列表见附录2,
					success : function(res) {
						// 以键值对的形式返回，可用的api值true，不可用为false
						// 如：{"checkResult":{"chooseImage":true},"errMsg":"checkJsApi:ok"}
						alert(res.errMsg);
					}
				}); */
				//alert(222);
				/* wx.chooseWXPay({
					timestamp : timeStamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
					nonceStr : nonceStr, // 支付签名随机串，不长于 32 位
					package : package1, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
					signType : signType, // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
					paySign : paySign, // 支付签名
					success : function(res) {
						// 支付成功后的回调函数
						alert(res.errMsg);
						document.location.href = "pay_success.jsp";
					}
				});

			}); 
 */
			/* wx.error(function(res){
			    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
			  alert(errMsg);
			}); */
			WeixinJSBridge.invoke(
				'getBrandWCPayRequest',{
					 "appId" : appId, //公众号名称，由商户传入
					"timeStamp": timeStamp, //时间戳，自1970 年以来的秒数
					"nonceStr" : nonceStr, //随机串
					"package" : package1,
					"signType" : signType, //微信签名方式:
					"paySign" : paySign  //微信签名, 
				},function(res){
					/* alert(1);
					alert(res);
					alert(2);
					alert(res.err_msg); */
					/* if(res.err_msg == "get_brand_wcpay_request:ok" ) {
						// 此处可以使用此方式判断前端返回,微信团队郑重提示：res.err_msg 将在用户支付成功后返回ok，但并不保证它绝对可靠。
						
						document.location.href="pay_success.jsp";
					} */
					if(res.err_msg == "get_brand_wcpay_request:ok" ) {
		                alert("支付成功!")
		            } else if(res.err_msg == "get_brand_wcpay_request:cancel") {
		                alert("支付取消!");
		            } else if(res.err_msg == "get_brand_wcpay_request:fail") {
		                alert("支付失败!");
		            }
				}
			); 

		}
		if (typeof WeixinJSBridge == "undefined"){

			if( document.addEventListener ){

			document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);

			}else if (document.attachEvent){

			document.attachEvent('WeixinJSBridgeReady', onBridgeReady);

			document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);}

			}
		else{onBridgeReady();}
	</script>
</head>
<body>
<div align="center" bgcolor="#666666">
   <div>
<!--扫描代码-->
	<input type="hidden" name="out_trade_no"  value="${out_trade_no}"/>
	<input type="hidden" name="appId"  value="${appId}"/>
	<input type="hidden" name="timeStamp"  value="${timeStamp}"/>
	<input type="hidden" name="nonceStr"  value="${nonceStr}"/>
	<input type="hidden" name="package1"  value="${package1}"/>
	<input type="hidden" name="signType"  value="${signType}"/>
	<input type="hidden" name="paySign"  value="${paySign}"/>
	<input type="hidden" name="payInfo"  value="${payinfo}"/>
      <div class="s-con" id="codem">
	   <div class="m26">
               <h1 style="font-size:50px;">订单提交成功，请您尽快付款！</h1>
               <div class="num"><span class="color1 ml16" style="font-size:50px;">订单号：<label id="out_trade_no" class="orange">${out_trade_no}</label></span></div>
         </div>
         <div class="num"><span class="color1 ml16" style="font-size:50px;">商品名称：<label class="orange">${body}</label></span>
		 
		 <div class="num"><span class="color1 ml16" style="font-size:50px;">订单金额：<label class="orange">${total_fee/100}</label></span></div>
		 </div>
         
         <div align="center">
		<button style="width:600px; height:100px; background-color:#FE6714; border:0px #FE6714 solid; cursor: pointer;  color:white;  font-size:50px;" type="button" onclick="jsApiCall()" >微信支付</button>
	</div>
      </div>

</div>
</body>
</html>
