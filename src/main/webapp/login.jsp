<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
 <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<br>
<br>
	<div class="container">
		<h1 align="center">妖怪管理系统----姜子牙专用版</h1>
		<br>
		<br>
		<br>
		<form action="login" method="get" class="form-horizontal">
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">账号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="account"
						name="account">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">密码</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="password"
						name="password">
				</div>
			</div>
			<div class="form-group" >
				<div class="col-sm-offset-4 col-sm-4">
					<button type="submit" class="btn btn-primary">登录</button>
				</div>
			</div>
		<p align="center"><a href="register.jsp"><font size="2"
						color="#ffae5e">还不是管理员？立即注册</font></a></p>
	
		</form>
	</div>
</body>
</html>