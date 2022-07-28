<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head lang="en">
 <meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel=stylesheet>
<title>管理员页面</title>
</head>
<body>
	<div>
		请输入查询的图书名称:<input type="text" name="bookname">
		 	图书类别:<select>
		 	 			<option></option>
		 	 			<option value=1>文学类</option>
		 	 			<option value=2>小说类</option>
		 	 			<option value=3>科幻类</option>
		 	 			<option value=4>诗歌类</option>
		 	 			<option value=5>散文类</option>			 
		 			</select>
					<input type="submit" value="查询">
	</div>
	<div style="height:50px">
		${username}
		<p align="right"><a href="${pageContext.request.contextPath}/login.jsp">注销</a>
	</div>
<div class="container">
	<table border="1" class="table table-striped table-bordered">
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
				<td><img src="img/${book.photo}" width="50" height="60"></td>
				<td>${book.title}</td>
				<td>${book.type.getTypename()}</td>
				<td>${book.author}</td>
				<td>${book.price}</td>
				<td>${book.publisher}</td>
				<td>${book.publishcationDate}</td>
				<td>${book.introduction}</td>
				<td><a href="${pageContext.request.contextPath}/modify.jsp">修改</a></td>
				<td><a href="#" onclick="if(confirm('是否确定删除?')==false)return false">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>