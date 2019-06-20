<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<!-- 要使用Bootscript的话，必须是html5文档 -->

<meta charset="UTF-8">

<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<link type="text/css" rel="stylesheet" href="jquery-ui.css">

<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript" src="js/jquery-ui.js"></script>

<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css" />

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>

<script type="text/javascript" src="js/ajax.js"></script>

<script type="text/javascript">
	$(function() {

		$(".form-horizontal").bootstrapValidator({

			feedbackIcons:{
				 valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
				
			}, 
							fields : {

								name : {
									validators : {

										notEmpty : {

											message : '姓名不能为空'
										},
										stringLength : {
											min : 2,
											max : 15,
											message : '姓名必须是2-15个汉字'
										},
										regexp : {
											regexp : /^[\u0391-\uFFE5]{2,15}$/,
											message : '姓名必须是2-15个汉字'
										}

									}
								},
								touxiang : {

									validators : {
										file : {
											extension : 'pdf,jpg,gif,png,bmp,jpeg',
											type : 'image/pdf,image/jpg,image/gif,image/png,image/bmp,image/jpeg',
											message : '头像不合法.'
										}
									}
								},
								username : {
									validators : {
										notEmpty : {
											message : '用户名不能为空'
										},
										regexp : {
											regexp : /^[A-z0-9_]{3,25}$/,
											message : '用户名必须由3-25个英文字母、数字和下划线组成'
										},
										remote : {
													
											message : '该用户已被注册，请重新输入',
											url : "validate2",
											type : 'post',
											data : function(validator) {
												return {
													username : $("input[name=username]").val()
												}
											}
										}
									}
								},
								password : {
									validators : {
										notEmpty : {

											message : '密码不能为空'
										},
										different : {
											field : 'username',
											message : '密码不能和用户名一样'
										},
										regexp : {
											regexp : /^(?=.*\d)(?=.*[A-z])[A-z\d]{6,15}$/,
											message : '密码是6-15位，必须含有字母和数字'
										},
									}
								},
								repassword : {
									validators : {
										notEmpty : {

											message : '确认密码不能为空'
										},
										identical : {
											field : 'password',
											message : '与密码不一致，请重新输入!'
										}
									}
								},
								phone : {
									validators : {
										notEmpty : {

											message : '电话号码不能为空'
										},
										regexp : {
											regexp : /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/,
											message : '请输入正确的电话号码'
										},
									}
								}
								

							}

						});
	});
</script>
<style>
td {
	color: #663300;
	font-size: 20px;
}

body {
	margin: 0;
}

.icon {
	width: 1em;
	height: 1em;
	vertical-align: -0.15em;
	fill: currentColor;
	overflow: hidden;
	margin-top: 10px;
}

.footer {
	color: #777;
	border-top: 1px solid #e5e5e5;
	text-align: center;
	padding: 30px 0;
}

 #div1 {
	height: 130px;
	background-color: #FFFFFF;
}
#top2{

	 margin-top: 42px;
	 margin-left: 90px;
}
/* .bg {
	background:url("imgs/001.jpg") no-repeat center 0;

 height: 600px;
	
 width: 2000px;
}
 */
#fr{
	border: 2px solid #FFFFFF;
    background-color: #FFFFFF;
	opacity:0.96;
	margin-top: 60px;
}

h2 {
	font-size: 34px;
}

label {
	font-size: 16px;
}

.btn-danger {
	background-color: #2D6A9C;
}

a {
	text-decoration: none;
	color: #FFFFFF;
}
</style>

</head>

<body>

	<div class="container-fluid">
		<div class="row header" id="div1">
			<!-- 上 -->
			<div class="col col-md-8 col-sm-10" id="top">
				<div class="col col-md-6 " id="top2">

					<font size="7" color="#2D6B9E" face='华文中宋'>图书管理系统</font><font
						size="5" color="#2D6B9E"> | </font><font size="3" color="#2D6B9E"
						face='华文中宋'>注册</font>
					<!-- </marquee> -->


				</div>
			</div>
		</div>

		<div class="container-fluid bg">
			<!-- 中 -->
			<div class="container">
				<div class="col-md-5 col-sm-10  col-xs-12 col-md-offset-4" id="fr">
					<form action="register" method="post" enctype="multipart/form-data" class="form-horizontal">
						<div class="form-group">
							<h2 class="col-sm-7 col-sm-offset-3">
								<font color="#2D6A9C" size="7" face="楷体"><b>管理员注册</b></font>
							</h2>
						</div>

						<div class="form-group">
							<label for="name" class="col-sm-4 control-label "> <font
								color="#2D6A9C">姓名:</font></label>
							<div class="col-sm-6">
								<input type='text' name='name' class="form-control input-sm" />
							</div>
						</div>
						<div class="form-group">
							<label for="touxiang" class="col-sm-4 control-label "> <font
								color="#2D6A9C"> 头像: </font></label>
							<div class="col-sm-6">
								<input type="file" name='touxiang' class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label for="username" class="col-sm-4 control-label "> <font
								color="#2D6A9C"> 用户名 </font></label>
							<div class="col-sm-6">
								<input type='text' name='username' class="form-control input-sm">

							</div>
						</div>

						<div class="form-group">
							<label for="password" class="col-sm-4 control-label  "> <font
								color="#2D6A9C"> 密&nbsp;&nbsp;码: </font></label>
							<div class="col-sm-6">
								<input type="password" name='password'
									class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label for="repassword" class="col-sm-4 control-label "><font
								color="#2D6A9C"> 确认密码: </font></label>
							<div class="col-sm-6">
								<input type="password" name='repassword'
									class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-4 control-label   "> <font
								color="#2D6A9C"> 手机号码: </font>
							</label>
							<div class="col-sm-6">
								<input type='text' name='phone' class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-3 col-sm-10 col-xs-11 col-lg-offset-4 ">
								<button type='submit' class="btn btn-primary ">
									注册 <span class="glyphicon glyphicon-plus"></span>

								</button>
							</div>
							<div class="col-lg-3 col-sm-10 col-xs-11 ">

								<a href='login.jsp' class="btn btn-primary">返回 <span
									class="glyphicon glyphicon-repeat"> </span></a>

							</div>
						</div>

						<br> <br>
					</form>
				</div>
			</div>
		</div>
		<footer class="footer">
			<!-- 下 -->

			<h4>
				<font size="3" color="#b1b1b1">oracle公司版权所有 &copy; 2012-2018</font>
			</h4>
		</footer>
	</div>

</body>

</html>