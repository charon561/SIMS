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
<body background="${pageContext.request.contextPath}/img/bg2.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
${msg }
<div id="header"></div>
<div style="position: relative;padding-top: 60px; width: 80%;margin-left: 10%">
    <form action="updateBook.do" method="post" id="addbook">
        <div class="form-group">
            <label for="name">图书名</label>
            <input type="text" class="form-control" name="title" id="title" placeholder="请输入书名">
        </div>
        <div class="form-group">
            <label for="classId">分类号</label>
            <input type="text" class="form-control" name="type_id" id="type_id" placeholder="请输入分类号">
        </div>
        <div class="form-group">
            <label for="author">作者</label>
            <input type="text" class="form-control" name="author" id="author" placeholder="请输入作者名">
        </div>
        <div class="form-group">
            <label for="introduction">简介</label>
            <textarea class="form-control" rows="3" name="introduction" id="introduction"
                      placeholder="请输入简介"></textarea>
        </div>
        <div class="form-group">
            <label for="price">价格</label>
            <input type="text" class="form-control" name="price" id="price" placeholder="请输入价格">
        </div>
        <div class="form-group">
            <label for="publish">出版社</label>
            <input type="text" class="form-control" name="publisher" id="publisher" placeholder="请输入出版社">
        </div>
        <div class="form-group">
            <label for="number">照片</label>
            <input type="file" class="form-control" name="photo" id="photo" placeholder="请输入图片名字">
        </div>
        <div class="form-group" >
            <label for="publishcationDate">出版日期</label>
            <input type="date" class="form-control" onclick="WdatePicker();"  id="publishcationDate" name="publishcationDate">
        </div>
		<input type="hidden" name="isbn" value="${isbn}">
        <input type="submit" value="修改" class="btn btn-success btn-sm" class="text-left">
        <input type="reset" value="重置" class="btn btn-success btn-sm" class="text-left">
		<input type="button" value="返回" class="btn btn-success btn-sm" class="text-left" onclick="history.back()">
        <script>
            $("#addbook").submit(function () {
                if ($("#name").val() == '' || $("#author").val() == '' || $("#publish").val() == '' || $("#isbn").val() == '' || $("#introduction").val() == '' || $("#language").val() == '' || $("#price").val() == '' || $("#pubstr").val() == '' || $("#classId").val() == '' || $("#pressmark").val() == '' || $("#number").val() == '') {
                    alert("请填入完整图书信息！");
                    return false;
                }
            })
        </script>
    </form>
</div>
</body>
</html>
<script type="text/javascript" src="static/calendar/WdatePicker.js"></script>