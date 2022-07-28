<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>图书修改</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        .form-group {
            margin-bottom: 0;
        }
    </style>
</head>
<body background="${pageContext.request.contextPath}/img/login_bg.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
${msg }
<div id="header"></div>
<div style="position: relative;padding-top: 60px; width: 80%;margin-left: 10%">
    <form action="updateUser.do" method="post" id="updateUser">
        <div class="form-group">
            <label for="name">用户名</label>
            <input type="text" class="form-control" name="username" placeholder="请输入用户名">
        </div>
        <div class="form-group">
            <label for="classId">密码</label>
            <input type="password" class="form-control" name="password"  placeholder="请输入密码">
        </div>
		<input type="hidden" name="id" value="${id}">
        <input type="submit" value="修改" class="btn btn-success btn-sm" class="text-left">
        <input type="reset" value="重置" class="btn btn-success btn-sm" class="text-left">
		<input type="button" value="返回" class="btn btn-success btn-sm" class="text-left" onclick="history.back()">
    </form>
</div>
</body>
</html>
<script type="text/javascript" src="static/calendar/WdatePicker.js"></script>