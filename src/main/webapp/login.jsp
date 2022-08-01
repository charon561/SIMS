<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生信息管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

<style>
.login-box {
  width: 100%;
  height: 500px;
  margin: 0px auto;
  border-bottom: 3px #006dc0 solid;
  background: url("${pageContext.request.contextPath}/img/login.jpg") no-repeat 50% 0;
  position: relative;
  overflow: hidden;
}
.login{
	position:absolute;
	top:50%;
	margin-top: -150px;
	left:50%;
	margin-left: -150px;
	/* 居中*/
	
	background-color: whitesmoke;
	width:300px;
	height:250px;
	border-radius:25px;  /*边框为圆 */
	text-align:center;
	padding:5px 40px;
	box-sizing:border-box;
}
</style>
</head>
<body>
	<div class="text-center">
		<img style="height:100%" src="${pageContext.request.contextPath}/img/logo.png" />
	</div>
	<hr>
	<div class="container-fluid login-box">
	<br><br><br><br><br><br><br><br><br><br><br><br>
		<div class="row" >
			<div class="col-md-4 col-md-offset-7">
				<div class="login">
				<br>
					<div class="h4 text-center">用户登录</div>
					<form class="form-horizontal" role="form" action="login.do" method="post">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">账号</label>
								<div class="col-md-9">
     			 					<input type="text" class="form-control" name="username" placeholder="请输入账号">
    							</div>
  						</div>
  						<div class="form-group">
    						<label for="lastname" class="col-sm-3 control-label">密码</label>
    						<div class="col-sm-9">
      							<input type="password" class="form-control" name="password" placeholder="请输入密码">
    						</div>
  						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-1 col-sm-10">
      							<label class="radio-inline">
      								<input type="radio" checked name="type" value="学生"/>学生
      							</label>
      							<label class="radio-inline">
      								<input type="radio" name="type" value="教职工"/>教职工
      							</label>
    						</div>
  						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-2 col-sm-10">
      							<button type="submit" class="btn btn-info">登录</button>
    						</div>
  						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>