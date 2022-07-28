<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel=stylesheet>
<title></title>
</head>
<body>
<h3>${msg }</h3>
<div class="text-center">
<h1 style="color:black; font-size:50px;">图书管理系统</h1>
<hr style="margin-bottom:100px;">
</div>
<div class="box">
	<h2>账户登录</h2>
	<form action="login.do" method="post">
	<div class="input-box">
	账号:<input type = "text" name="username"><br>
	</div>
	<div class="input-box">
	密码:<input type="password" name="password"><br>
	</div>
	<div class="btn-box">
		<input type="submit" value ="登录">
		<input type="button" onclick="window.location.href='${pageContext.request.contextPath}/register.jsp'" value="注册">
	</div>
</form>
</div>
</body>
</html>