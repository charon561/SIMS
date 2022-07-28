<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel=stylesheet>
<title>图书阅读界面</title>
</head>
<body background="img/bg6.jpg" style="background-style:no-repeat;">
 <div class="text-center">
 <h1 style="color:black; font-size:50px;">图书管理系统</h1>
 <hr>
 <div>${msg}</div>
 </div>
	<div style="height:50px">
 <div class="text-right">
 <h3 style="color:white;"><% out.println(session.getAttribute("username").toString());%>
  <a href="${pageContext.request.contextPath}/login.jsp" onclick="if(confirm('是否注销?')==false)return false">注销</a></h3>
 </div>
 </div>
	<div>
		<form action="queryBookByTitleAndTypename.do" method="post">
		请输入查询的图书名称:<input type="text" name="title">
		 	图书类别:<select name="typename">
		 				<option></option>
		 	<c:forEach items="${books}" var="book">
		 	 			<option >${book.type.typename}</option>		 	 			
		 	 </c:forEach>	
		 			</select>
					<input type="submit" value="查询">
		</form>
	</div>
	<div style="height:50px">
	</div>
<table class="table table-bordered table-hover" style="table-layout:fixed">
		<c:forEach items="${books}" var="book" varStatus="status">
		<c:if test="${status.count % 4 != 0}">
			<td>
			<img style="height:180;weight:180" src="img/${book.photo}">
			<br>${book.title}<br>
			<br>${book.author}<br>
				<form action="queryBookByTitle.do" method="post">
				<input type="hidden" name="isbn" value="${book.isbn}">
				<input type="submit" value="详情" >
				</form>
				<form action="queryCommentByIsbn.do" method="post">
				<input type="hidden" name="isbn" value="${book.isbn}">
				<input type="submit" value="评论区" >
				</form>
			</td>
		</c:if>
		<c:if test="${status.count % 4 == 0}">
				<td>
				<img style="height:180;weight:180" src="img/${book.photo}">
				<br>${book.title}<br>
				<br>${book.author}<br>
				<form action="queryBookByTitle.do" method="post">
				<input type="hidden" name="isbn" value="${book.isbn}">
				<input type="submit" value="详情" >
				</form>
				<form action="queryCommentByIsbn.do" method="post">
				<input type="hidden" name="isbn" value="${book.isbn}">
				<input type="submit" value="评论区" >
				</form>
				</td>	
			<tr>
			</tr>
		</c:if>
		</c:forEach>
</table>
</body>
</html>