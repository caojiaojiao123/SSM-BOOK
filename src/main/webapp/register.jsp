<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrapValidator.css">
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<style>
body {
	padding-top: 200px;
}
</style>

<script type="text/javascript">

						
	$(function(){
		$("#register").bootstrapValidator({
			feedbackIcons : {

				valid : "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-refresh"
			},
			fields : {

				account : {

					validators : {

						notEmpty : {

							message : '登录账号不能为空'
						},
						regexp : {

							regexp : /^[A-Za-z0-9_]{3,12}$/,
							message : '登录账号必须由3-12个英文字母、数字或者下划线组成'
						},
						remote:{
							message:'登录账号已存在',
							url:'validateAccount',
							type:'get',//不指定type,默认是get
							data: {
								
								account:$('input[name=account]').val()
							} ,
							delay:300
						}

					}
				}
			
				
			}
		});
});
</script> 
</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="register" action="register" method="post"  enctype="application/x-www-form-urlencoded" >
					<h3 class="text-center text-success">注册</h3>
					<div class="form-group">
						<label class="text-center text-success">姓名:</label> <input type="text" name="name"
							class="form-control" />
					</div>
					<div class="form-group">
						<label class="text-center text-success">登录账号:</label> <input type="text" name="account"
							  class="form-control" />
					</div>
					<div class="form-group">
						<label class="text-center text-success">密码:</label> <input type="password" name="password"
							 class="form-control" />
					</div>
					<div class="form-group">
						<label class="text-center text-success">手机号码:</label> <input type="text" name="phone"
							 class="form-control" />
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-danger btn-block">注册</button>
					</div>

					<p align="center">
						<font class="text-center text-success" size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是管理员，请点击<a
							href="login.jsp">&nbsp;登录</a></font>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>