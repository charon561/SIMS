<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel=stylesheet>
<title>注册页面</title>
</head>
<body background="img/.register.jpg" style="background-style:no-repeat;">>
<div class="text-center">
<h1 style="color:black; font-size:50px;">图书管理系统</h1>
<hr style="margin-bottom:100px;">
</div>
<div class="box">
<h2>账户注册</h2>
<form action="${pageContext.request.contextPath}/register.do" method="post">
	<div class="input-box">
	账号<input type="text" name="username"/><br>
	密码:<input type="password" name="password"/><br>
	</div>
	<div class=btn-box>
	<input type="submit" value="注册"/>
	<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/login.jsp'" value="返回">
	</div>
</form>
</div>
</body>
</html>