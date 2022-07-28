<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel=stylesheet>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book-read.css">
<title>图书详情页面</title>
</head>
<body background="${pageContext.request.contextPath}//img/1.png" style="background-style:no-repeat;">

<div class="text-center">
<h1>图书详情页</h1>
</div>
<hr>
<div class='btn'>
<input type="button" value="返回" class="btn btn-success btn-sm" class="text-left" onclick="history.back()"><br>
</div>
<table class="table table-striped table-bordered table-cover">
<tr>
   <td>图书号</td>
   <td>封面</td>
   <td>书名</td>
   <td>图书类型</td>
   <td>作者</td>
   <td>价格</td>
   <td>出版社</td>
   <td>出版时间</td>
   <td>简介</td>
</tr>
<tr>
	<c:forEach items="${books}" var="book">
	<tr>
		<td>${book.isbn }</td>	
		<td ><img style="height:180;weight:180" src="img/${book.photo }"></td>
		<td>${book.title }</td>		
		<td>${book.type.typename }</td>	
		<td>${book.author}</td>
		<td>${book.price }</td>	
		<td>${book.publisher }</td>	
		<td>${book.publishcationDate }</td>	
		<td>${book.introduction }</td>	
	</tr>
	</c:forEach>
</tr>
</table>
</body>
</html>