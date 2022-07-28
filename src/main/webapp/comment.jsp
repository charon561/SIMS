<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel=stylesheet>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book-read.css">
<title>图书评论页面</title>
</head>
<body background="img/1.png" style="background-style:no-repeat;">

<div class="text-center">
<h1>图书详情页</h1>
</div>
<hr>
<div class='btn'>
<input type="button" value="返回" onclick = "window.location.href = 'queryAllBooksToUser.do'"><br>
</div>

<form action="insertComment.do" method="post">
评论:<input type="text" name="content" ><br>
<input type="hidden" name="isbn" value="${isbn}">
<input type="submit" value="评论"><br>
</form>

<table class="table table-striped table-bordered table-cover">
<tr>
   <td>图书号</td>
   <td>评论id</td>
   <td>评论人ip</td>
   <td>昵称</td>
   <td>内容</td>
   <td>日期</td>
   
</tr>
<tr>
	<c:forEach items="${comments}" var="comment">
	<tr>
		<td>${comment.book.isbn }</td>	
		<td>${comment.id}</td>
		<td>${comment.ip }</td>	
		<td>${comment.nick }</td>	
		<td>${comment.content}</td>	
		<td>${comment.date }</td>	
	</tr>
	</c:forEach>
</tr>
</table>
</body>
</html>