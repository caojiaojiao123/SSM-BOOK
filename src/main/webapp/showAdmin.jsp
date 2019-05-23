<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>

<head>

<!-- 要使用Bootscript的话，必须是html5文档 -->

<meta charset="UTF-8">

<!-- 移动设备优先 -->

<meta name="viewport" content="width=device-width, initial-scale=1"> 

<!-- 导入核心的css文件 -->

<link  rel="stylesheet" href="bootstrap/css/bootstrap.css"/>

<!-- 需要引入jQuery文件 -->

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<!-- 引入BootScript的核心JS文件 -->

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<title>Insert title here</title>

<script type="text/javascript" src="js/ajax.js"></script>

<script type="text/javascript">

	$(function() {

		$("tr:even").css("background-color", "pink");

		$("tr:odd").css("background-color", "lightblue");
		
		//事件
		
		$("tr").mouseover(function(){
			
			$(this).css("background-color", "#ff9");
			
		});
		
		$("tr").mouseout(function(){
			
			$("tr:even").css("background-color", "pink");

			$("tr:odd").css("background-color", "lightblue");
			
		});

	});
</script>

<title>Insert title here</title>

<script type="text/javascript" src="js/ajax.js"></script>

<script type="text/javascript">

	window.onload = function() {

		var opt = {

			method : "POST",

			url : "AdminServlet",

			params : "action=showAdmin",

			type : "json",

			success : function(data) {

				var admin = data;

				var id = document.getElementById("id");

				id.innerHTML = admin.id;

				var name = document.getElementById("name");

				name.innerHTML = admin.name;

				var username = document.getElementById("username");

				username.innerHTML = admin.username;

				var password = document.getElementById("password");

				password.value = admin.password;
				
				var phone = document.getElementById("phone");

				phone.innerHTML = admin.phone;
				
				var touxiang=document.getElementById("touxiang");
				
				var img=document.createElement("img");
				
				img.src="/img"+admin.touxiang;
				
				img.width=30;
				
				img.height=30;
				
				touxiang.appendChild(img);
			}
		};

		ajax(opt);

	}
</script>

</head>

<style type="text/css">

.table{

width:400px;

}

</style>

<body background=".\imgs\001.jpg">

	<table class="table table-striped table-hover" align="center">

		<h2 class="text-center text-info">管理员信息</h2>
		
		<tr align="center">

			<td>编号</td>

			<td id="id"></td>

		</tr>

		<tr align="center">

			<td>姓名</td>

			<td id="name"></td>

		</tr>
		
		<tr align="center">

			<td>头像</td>

			<td id="touxiang"></td>

		</tr>

		<tr align="center">

			<td>账号</td>

			<td id="username"></td>

		</tr>

		<tr align="center">

			<td>密码</td>

			<td><input type="password" id="password" disabled="disabled" /></td>

		</tr>

		<tr align="center">

			<td>手机</td>

			<td id="phone"></td>

		</tr>

	<%-- 第一种方法	<tr align="center">

			<td>编号</td>

			<td>${admin.id }</td>

		</tr>

		<tr align="center">

			<td>姓名</td>

			<td>${admin.name }</td>

		</tr>

		<tr align="center">

			<td>账号</td>

			<td>${admin.username }</td>

		</tr>

		<tr align="center">

			<td>密码</td>

			<td><input type="password" value="${admin.password }"
				disabled="disabled" /></td>

		</tr>

		<tr align="center">

			<td>手机</td>

			<td>${admin.phone }</td>

		</tr>--%>

	</table>

</body>

</html>