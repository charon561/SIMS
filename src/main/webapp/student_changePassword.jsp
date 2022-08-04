<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生信息管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
#main-top{ width:100%; height:70px; background:url(${pageContext.request.contextPath}/img/main-top-bg.png) no-repeat right center #2d62a3; border-bottom:1px #245086 solid }

</style>
</head>
<body>
<div id="main-top">
	<div class="text-center">
		<img style="height:100%" src="${pageContext.request.contextPath}/img/logo.png" />
	</div>
</div>


<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid"> 
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
			<span class="sr-only">切换导航</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>

	<div class="collapse navbar-collapse" id="example-navbar-collapse">
		<ul class="nav navbar-nav">
			<li><a href="${pageContext.request.contextPath}/student.jsp">首页</a></li>
			<li><a href="#">学籍信息</a></li>
			<li><a href="#">联系信息</a></li>
			<li><a href="${pageContext.request.contextPath}/student_modifyInformation.jsp">修改资料</a></li>
			<li class="active"><a href="${pageContext.request.contextPath}/student_changePassword.jsp">修改密码</a></li>
		</ul>
	</div>
	</div>
</nav>

<div class="container-fluid">
	<div class="row">
		<br><br><br>
		<div class="col-md-2 ">
			<div class="panel panel-info ">
			    <div class="panel-heading">
			    
			        <h3 class="panel-title text-center"><span class=" glyphicon glyphicon-list-alt"></span> 登入信息</h3>
			    </div>
			    <div class="panel-body">
					<ul class="list-group">
					   	<li class="list-group-item"><span class=" glyphicon glyphicon-user"></span>  ${user.type } ${user.username }</li>
					    <li class="list-group-item"><span class=" glyphicon glyphicon-time"></span><fmt:formatDate value=" ${time}" pattern="yyyy-MM-dd HH:mm:ss"/></li>
					    <li class="list-group-item"><span class=" glyphicon glyphicon-map-marker"></span> ${ip }</li>
					</ul>
					<a href="logout.do" class="btn btn-primary btn-lg text-center">
						<span class="glyphicon glyphicon-off"></span>
					</a>
			    </div>
			</div>
		</div>
	<div class="col-md-2 col-md-offset-2" style="position: relative;">
	    <div class="panel panel-primary">
	        <div class="panel-heading">
	            <h3 class="panel-title ">修改密码</h3>
	        </div>    
	        <div class="panel-body">
	       		<form action="updatePassword.do" method="post" enctype="multipart/form-data">
	                <div class="input-group">
	                    <span  class="input-group-addon">原密码</span>
	                    <input type="password" class="form-control" name="old_password">
	                </div>
	  				<br>
	                 <div class="input-group">
	                    <span  class="input-group-addon">新密码</span>
	                    <input type="password" class="form-control" name="new_password">
	                </div>
	                <br>    
					<!-- 模态框（Modal） -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
					            </div>
					            <div class="modal-body">是否确认提交？</div>
					            <div class="modal-footer">
					                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					                <button type="submit" class="btn btn-primary">确定</button>
					            </div>
					        </div><!-- /.modal-content -->
					    </div><!-- /.modal -->
					</div>
	               	
	       		</form>
	            <!-- 按钮触发模态框 -->
				<button class="btn btn-success btn-sm col-md-offset-9 col-md-3" data-toggle="modal" data-target="#myModal">提交</button> 		
	        </div>	

		</div>
	</div>
	</div>
</div>

</body>
</html>