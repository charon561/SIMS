<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生信息管理系统</title>
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<style type="text/css">
#main-top{ width:100%; height:70px; background:url(${pageContext.request.contextPath}/img/main-top-bg.png) no-repeat right center #2d62a3; border-bottom:1px #245086 solid }

</style>
</head>
<body>
<div >
	<div id="main-top">
			<div class="text-center">
				<img style="height:100%" src="${pageContext.request.contextPath}/img/logo.png" />
			</div>
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
				<li class="active"><a href="${pageContext.request.contextPath}/student.jsp">首页</a></li>
				<li><a href="#">学籍信息</a></li>
				<li><a href="#">联系信息</a></li>
				<li><a href="${pageContext.request.contextPath}/student_modifyInformation.jsp">修改资料</a></li>
				<li><a href="${pageContext.request.contextPath}/student_changePassword.jsp">修改密码</a></li>
			</ul>
			
		</div>

	</div>
</nav>

<div class="container-fluid">
	<div class="row">
		<br><br><br>
		<div class="col-md-2">
			<div class="panel panel-info ">
			    <div class="panel-heading">
			    
			        <h3 class="panel-title text-center"><span class=" glyphicon glyphicon-list-alt"></span> 登入信息</h3>
			    </div>
			    <div class="panel-body">
					<ul class="list-group">
						<li class="list-group-item"><span class=" glyphicon glyphicon-user"></span>  ${user.type } ${user.username }</li>
					    <li class="list-group-item"><span class=" glyphicon glyphicon-time"></span><fmt:formatDate value="${time}" pattern="yyyy-MM-dd HH:mm:ss"/></li>
					    <li class="list-group-item"><span class=" glyphicon glyphicon-map-marker"></span> ${ip }</li>
					</ul>
					<a href="logout.do" class="btn btn-primary btn-lg text-center">
						<span class="glyphicon glyphicon-off"></span>
					</a>
			    </div>
			</div>
		</div>
		<div class=" col-md-8 col-md-offset-1">
			<div class="panel panel-info">
			    <div class="panel-heading ">
			        <h3 class="panel-title text-center">个人基础信息</h3>
			    </div>
			    <div class="panel-body">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th class="col-md-2">姓名</th>
									<td class="col-md-3">${queryStudent.name }</td>
									<th class="col-md-2">学号</th>
									<td class="col-md-3"></td>
									<th class="col-md-2">照片</th>
								</tr>
			
								<tr>
									<th>班级</th>
									<td></td>
									<th>学院</th>
									<td></td>
									<th rowspan="5"></th>
								</tr>
								
								<tr>
									<th>出生年月 </th>
									<td></td>
									<th>民族</th>
									<td>${queryStudent.nation }</td>
								</tr>
								
								<tr>
									<th>政治面貌</th>
									<td>${queryStudent.political_outlook }</td>
									<th>籍贯</th>
									<td></td>
								</tr>
								
								<tr>
									<th>联系电话 </th>
									<td>${queryStudent.phone_number }</td>
									<th>宿舍</th>
									<td>${queryStudent.dormitory }</td>
								</tr>
								
								<tr>
									<th>家庭电话</th>
									<td>${queryStudent.home_phone }</td>
									<th>家长电话</th>
									<td>${queryStudent.parent_phone }</td>
								</tr>
								
								<tr>
									<th>是否为独生子女</th>
									<td>${queryStudent.is_only_child }</td>
									<th>家庭地址</th>
									<td colspan="2">${queryStudent.home_adress }</td>
								</tr>					
			
													
								<tr>
									<th>个人特长</th>
									<td colspan="4"></td>
								</tr>
			
								<tr>
									<th>兴趣爱好</th>
									<td colspan="4">${queryStudent.hobby }</td>
								</tr>
											
								<tr>
									<th>个人理想与目标:</th>
									<td colspan="4">${queryStudent.goals }</td>
								</tr>
								
								<tr>
									<th colspan="5">班主任谈话记录:</th>
								</tr>
							
								<tr>
									<td  colspan="5" >第一次谈话：</td>
								</tr>
			
								<tr>
									<td  colspan="5" >第二次谈话：</td>
								</tr>
			
								<tr>
									<td  colspan="5" >第三次谈话：</td>
								</tr>
							</thead>
						</table>
					</div>  
			</div>	
			    </div>
		</div>

	</div>
</div>

</body>
</html>