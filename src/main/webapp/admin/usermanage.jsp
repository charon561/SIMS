<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel=stylesheet>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background="${pageContext.request.contextPath}/img/bg3.jpg" style="background-style:no-repeat;">

	<div class="cantainer">
 		<h1 align="center" style="color:black; font-size:50px;">用户管理</h1>
	</div>
	<hr>
	${msg}
	<hr>
	<input type="button" value="返回" onclick = "window.location.href = 'queryAllBooksToAdmin.do'"><br>
	<div>
		<form action="queryUserByUsername.do"method="post">
		用户名:<input type="text" name="username">
			<input type="submit" value="查询">
			</form>
	</div>
	<div style="height:50px">
		<h2><p align="right"><a href="${pageContext.request.contextPath}/login.jsp">注销</a></p></h2>
	</div>
<div class="container">
	<table border="1" class="table table-striped table-bordered table-cover">
		<tr>
			<td>序号</td>
			<td>用户名</td>
			<td>密码</td>
			<td>权限</td>
			<td>操作1</td>
			<td>操作2</td>
		</tr>
	<c:forEach items="${users}" var="user">
			<tr>
				<td>${user.id}</td>
				<td>${user.username}</td>
				<td>${user.password}</td>
				<td>${user.permission}</td>
				<td>
				<form action="updateuser.do" method="post">
				<input type="hidden" name="id" value="${user.id}">
				<input type="submit" value="修改">
				</form>
				</td>
				<td><form action="deleteUserByUsername.do" method="post">
				<input type="hidden" name="username" value="${user.username }">
				<input type="submit" value="删除" onclick="if(confirm('是否确定删除?')==false)return false">
				</form></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>