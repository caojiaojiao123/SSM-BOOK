<%@ page language="java" contentType="text/html; charset=utf-8"
	
	pageEncoding="utf-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<!-- 要使用Bootscript的话，必须是html5文档 -->

<meta charset="UTF-8">

<!-- 移动设备优先 -->

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 导入核心的css文件 -->

<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />

<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css" />

<!-- 需要引入jQuery文件 -->

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<!-- 引入BootScript的核心JS文件 -->

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>

<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript" src="js/ajax.js"></script>

<title>登录</title>

<style>
body {
	margin: 0;
	
	
}

.footer {
	color: #777;
	border-top: 1px solid #e5e5e5;
	text-align: center;
	 padding-top: 20px;
	 margin-top: 0px;
}

#div1 {
	height: 130px;
	background-color: #FFFFFF;
}

/* #top{

	background-color: #FFFFFF;
} */
#top2{

	 margin-top: 42px;
	 margin-left: 90px;
}
#top3{

	background-color: #337AB7
}
.btn-danger {
	background-color: #E9445C;
}

#form {
	border: 1px solid #FFFFFF;
	border-style: groove;
	width: 400px;
	background-color:#FFFFFF;
	opacity:0.93;
	 margin-top: 180px;
}
label{
font-size:19px;
 
 
}
h2{
font-size:39px;
}

.icon {
	width: 1em;
	height: 1em;
	vertical-align: -0.15em;
	fill: currentColor;
	overflow: hidden;
	margin-top: 10px;
}
.gl{
margin-left: 25%;

}
 
</style>

</head>

<body>

	<div class="container-fluid">
		<c:if test="${!empty mag }">
			<script>
				alert("${mag}");
			</script>
		</c:if>
		<c:remove var="mag" />
	<div class="row header" id="div1">
			<!-- 上 -->
			<div class="col col-md-8 col-sm-10 col-xs-12" id="top2">
				 
				 
                 <font size="7" color="#2D6B9E" face='华文中宋'>图书管理系统</font><font size="5" color="#2D6B9E"> | </font><font size="3" color="#2D6B9E" face='华文中宋'> 登录</font>
				 
			 
			</div>
		</div>
		<div class="container-fluid bg"  >
			<!-- 中 -->
			<div class="col-md-4 col-sm-8  col-xs-8 col-md-offset-8  " id="form">
				<form action="login" method="post"
					class="form-horizontal" >
					<div class="form-group">
					<div class="gl">
						<h2>
							<font color="#2D6A9C"   face="楷体"><b>管理员登录</b></font>
						</h2>
						</div>
					</div>
					<div class="form-group">
						<label for="username" class="col-md-4 control-label"><font
							color="#2D6A9C"  face="宋体"><b>账号:</b></font></label>
						<div class="col-md-6">
							<input type="text" name="username" id="username"
								class="form-control  input-sm" />
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-md-4 control-label"> <font
							color="#2D6A9C"  face="宋体"><b>密码:</b></font></label>
						<div class="col-md-6">
							<input type="password" name="password" id="password"
								class="form-control  input-sm" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-6 col-md-offset-4">
							<div class="checkbox">
								<label> <input type="checkbox" class="checkbox" checked="checked" /><font size="2"
									color="silver">两周内自动登录</font>
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-10 col-md-offset-1">
							<button class="btn btn-primary  btn-md btn-block" type="submit">登录</button>
						</div>
					</div>
              
					<div class="form-group">
					<div class="col-md-10 col-md-offset-1">
						<button class="btn btn-primary  btn-md btn-block"  type="button" ><a href="register.jsp"><font size="2" color="#FFFFFF"><center>立即注册</center></font></a></button>
					</div>
					</div>
				</form>

			</div>
		</div>

		<footer  class="footer">
			<!-- 下 -->
			<center>
			<h4>
				<font size="3" color="#b1b1b1">oracle公司版权所有 &copy; 2012-2018</font>
			</h4>
		</center>
		</footer>
	</div> 
</body>

</html>