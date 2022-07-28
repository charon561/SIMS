<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员页面</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel=stylesheet>
</head>
<body background="${pageContext.request.contextPath}/img/bg4.jpg" style="background-style:no-repeat;">
<div style="margin-right:10px;">
	<input type="button" onclick="window.location.href='queryAllUsersToAdmin.do'" value="用户管理">
	</div>
	<div class="cantainer">
 		<h1 align="center">图书管理系统</h1>
	</div>
	<hr>
	<div>
		<form action="${pageContext.request.contextPath}/queryBookByTitleAndTypename.do" method="post">
		请输入查询的图书名称:<input type="text" name="title">
		 	图书类别:<select name="typename">
		 				<option></option>
		 	<c:forEach items="${books}" var="book">
		 	 			<option >${book.type.typename}</option>		 	 			
		 	 </c:forEach>	
		 			</select>
					<input type="submit" value="查询">
					<input type="button" value="添加图书" onclick="window.location.href='addBook.jsp'">
		</form>
	</div>
<div style="margin-right:10px;">
</div>
 <div style="height:50px">
 <div class="text-right">
 <h3><% out.println(session.getAttribute("username").toString());%>
  <a href="${pageContext.request.contextPath}/login.jsp">注销</a></h3>
 </div>
 </div>
<div class="container">
	<table border="1" class="table table-striped table-bordered table-hover">
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
			<td>操作1</td>
			<td>操作2</td>
		</tr>
		<c:forEach items="${books}" var="book">
			<tr>
				<td>${book.isbn}</td>
				<td><img src="${pageContext.request.contextPath }/img/${book.photo}" width="100" height="150"></td>
				<td>${book.title}</td>
				<td>${book.type.typename}</td>
				<td>${book.author}</td>
				<td>${book.price}</td>
				<td>${book.publisher}</td>
				<td>${book.publishcationDate}</td>
				<td>${book.introduction}</td>
		<td>
		<form action="updatebook.do" method="post">
		<input type="hidden" name="isbn" value="${book.isbn}">
		<input type="submit" value="修改">
		</form>
		</td>
		<td>
		<form action="deleteByIsbn.do" method="post">
		<input type="hidden" name="isbn" value="${book.isbn }">
		<input type="submit" value="删除" onclick="if(confirm('是否确定删除?')==false)return false">
		</form>
		</td>
		</tr>
		</c:forEach>
</table>
</div>
</body>
</html>