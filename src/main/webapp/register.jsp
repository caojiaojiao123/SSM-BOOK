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

<link  rel="stylesheet" href="bootstrap/css/bootstrap.css"/>

<link  rel="stylesheet" href="bootstrap/css/bootstrapValidator.css"/>

<!-- 需要引入jQuery文件 -->

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<!-- 引入BootScript的核心JS文件 -->

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<script type="text/javascript" src="js/ajax.js"></script>

<script type="text/javascript">

	function validateName() {

		var name = document.register.name;

		nameReg = /^[\u0391-\uFFE5{2,10}$]/;

		var flag = nameReg.test(name.value);

		var nameMsg = document.getElementById("nameMsg");

		if (flag) {

			nameMsg.style.color = "green";

			nameMsg.innerHTML = "姓名合法";

			return true;

		} else {

			nameMsg.style.color = "red";

			nameMsg.innerHTML = "姓名必须是汉字";

			name.focus();

			return false;

		}

	}

	//2.验证用户名
<%--function validateusername() {

		// var flag=false;

		var flag;

		var username = document.register.username;

		var xmlhttp = getXMLHttpRequest();

		xmlhttp.open("POST", "AdminServlet", true);

		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");

		xmlhttp.send("action=validateusername&username=" + username.value);

		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var content = xmlhttp.responseText;

				//alert(content);

				var span = document.getElementById("usernameMsg");

				if (content == "0") {

					span.style.color = "green";

					span.innerHTML = "用户名合法";

					flag = true;

				} else {

					span.style.color = "red";

					span.innerHTML = "用户名已存在";

					span.focus();

					flag = false;
								
				}

			}

		}

		// return flag;
	}--%>
	
	function validateusername() {

		var username = document.register.username;

		nameReg = /^\w{3,15}$/;

		var flag = nameReg.test(username.value);

		var usernameMsg = document.getElementById("usernameMsg");

		if (flag) {

			usernameMsg.style.color = "green";

			usernameMsg.innerHTML = "用户名输入正确";

			var username = document.register.username;

			var xmlhttp = getXMLHttpRequest();

			xmlhttp.open("POST", "AdminServlet", true);

			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");

			xmlhttp.send("action=validateusername&username=" + username.value);

			xmlhttp.onreadystatechange = function() {

				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

					var content = xmlhttp.responseText;

					var span = document.getElementById("usernameMsg");

					if (content == "0") {

						span.style.color = "green";

						span.innerHTML = "你输入的用户名合法";

						span.focus();

						flag = true;

					} else {

						span.style.color = "red";

						span.innerHTML = "用户名已存在";

						flag = false;

					}

				}

			}

			return true;
			
		} else {
			
			usernameMsg.style.color = "red";

			usernameMsg.innerHTML = "用户名已存在，请重新输入";

			username.focus();

			return false;
		}

	}

	//3.验证密码

	function validatepassword() {

		var password = document.register.password;

		var reg = /^(\w|\W){6,15}$/;

		var passwordMsg = document.getElementById("passwordMsg");

		if (reg.test(password.value)) {//true

			passwordMsg.style.color = "green";

			passwordMsg.innerHTML = "密码合法";

			return true;

		} else {

			passwordMsg.style.color = "red";

			passwordMsg.innerHTML = "密码必须是6-15的任意符号";

			password.focus();

			return false;

		}

	}

	//4.确认密码

	function validaterepassword() {

		var password = document.register.password;

		var repassword = document.register.repassword;

		var repasswordMsg = document.getElementById("repasswordMsg");

		if (repassword.value == password.value) {//true

			repasswordMsg.style.color = "green";

			repasswordMsg.innerHTML = "两次密码一致";

			return true;

		} else {//false

			repasswordMsg.style.color = "red";

			repasswordMsg.innerHTML = "两次密码不一致";

			repassword.focus();

			return false;

		}

	}

	//5.验证手机号码

	function validatephone() {

		var phone = document.register.phone;

		var reg = /^1[3-9][0-9]{9}$/;

		var phoneMsg = document.getElementById("phoneMsg");

		if (reg.test(phone.value)) {//true

			phoneMsg.style.color = "green";

			phoneMsg.innerHTML = "手机号合法";

			return true;

		} else {//false

			phoneMsg.style.color = "red";

			phoneMsg.innerHTML = "手机号不合法";

			phone.focus();

			return false;

		}

	}

	function jiaoyan() {

		return validateName() && validateusername() && validatepassword()
				&& validaterepassword() && validatephone();

	}
</script>

<title>注册</title>

<style>

body {

	margin: 0;
	
}
</style>

</head>

<body>

	<%-- <c:if test="${!(empty msg) }">
	
   <script>
   
       alert("${msg}");
       
   </script>
   
   <c:remove var="msg" scope="session"/>
   
</c:if>--%>

	<table width="100%" height="1000px" cellspacing="0">

		<tr height="80px">

			<td colspan="2">

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
				
				color="red" size="7" face="黑体"><b>Oracle</b></font>&nbsp;<font
				
				size="6">图书管理系统</font>&nbsp;<font size="6" color="silver">|</font>&nbsp;<font
				
				color="silver" size="5">注册</font>

			</td>

		</tr>

		<tr background=".\imgs\004.jpg">

			<td width="50%"></td>

			<td>

				<form action="AdminServlet?action=register" method="post" name="register" onsubmit="return jiaoyan()" enctype="multipart/form-data">

					<table align="center" frame="box" width="500px" height="280px">

						<tr align="center">

							<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>

							<td><input type="text" name="name" onblur="validateName()" /></td>

							<td><span id="nameMsg"></span></td>

						</tr>
						
						<tr align="center">

							<td>头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：</td>

							<td><input type="file" name="touxiang"/></td>

						</tr>

						<tr align="center">

							<td>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</td>

							<td><input type="text" name="username"
							
								onblur="validateusername()" /></td>

							<td><span id="usernameMsg"></span></td>

						</tr>

						<tr align="center">

							<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>

							<td><input type="password" name="password"
							
								onblur="validatepassword()" /></td>

							<td><span id="passwordMsg"></span></td>

						</tr>

						<tr align="center">

							<td>确认密码：</td>

							<td><input type="password" name="repassword"
							
								onblur="validaterepassword()" /></td>

							<td><span id="repasswordMsg"></span></td>

						</tr>

						<tr align="center">

							<td>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td>

							<td><input type="text" name="phone" onblur="validatephone()" /></td>

							<td><span id="phoneMsg"></span></td>

						</tr>

						<tr align="center">

							<td colspan="2" align="center"><input type="submit"
								value="注册" />&nbsp;&nbsp;&nbsp;<input type="reset" value="重置" /></td>
						</tr>

					</table>

				</form>

				<p align="center">

					是管理员，请点击<a href="login.jsp">登录</a>

				</p>

			</td>

		</tr>

		<tr height="100px">

			<td colspan="2" align="center"><font color="silver" size="4"
				face="华文新魏">oracle公司版权所有 &copy; 2012-2018</font></td>

		</tr>

	</table>

</body>

</html>