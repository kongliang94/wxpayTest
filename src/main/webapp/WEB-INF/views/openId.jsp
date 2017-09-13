<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style> 
body{ text-align:center} 
.div{ margin:0 auto; width:400px; height:150px; border:1px solid #F00} 
/* css注释：为了观察效果设置宽度 边框 高度等样式 */ 
</style> 
<script type="text/javascript" src="resources/js/jquery-1.4.2.min.js"></script>
<body>
<h2>扫描二维码获取OpenId</h2>
<div class="div">


<img src="http://pan.baidu.com/share/qrcode?w=145&h=148&url=${codeUrl}"   alt="erwei"/>
</div>
</body>

</html>