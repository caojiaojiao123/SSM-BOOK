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

<style type="text/css">

.table{

width:400px;

}

</style>

<script type="text/javascript" src="js/ajax.js"></script>

<script type="text/javascript">

<%--function validatepassword() {

	var password = document.changepassword.password;

	var xmlhttp = getXMLHttpRequest();

	xmlhttp.open("POST", "AdminServlet", true);

	xmlhttp.setRequestHeader("content-type",
			"application/x-www-form-urlencoded");

	xmlhttp.send("action=validatepassword&password=" + password.value);

	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

			var content = xmlhttp.responseText;

			//alert(content);

			var span = document.getElementById("passwordMsg");

			if (content == "0") {

				span.style.color = "red";

				span.innerHTML = "你输入的密码和原密码不同！";

				span.focus();

				flag = false;

			} else {

				span.style.color = "green";

				span.innerHTML = "密码正确，可以登录";

				flag = true;

			}

		}

	}

}--%>

    var flag;
    
    function validatepassword() {
		
		var password = document.changepassword.password;
		
		var passwordMsg = document.getElementById("passwordMsg");

		var opt = {

			method : "POST",

			url : "AdminServlet",

			params : "action=validatepassword&password=" + password.value,

			type : "text",

			success : function(data) {

				if (data == "1") {

					passwordMsg.style.color = "green";

					passwordMsg.innerHTML = "密码正正确";

					flag = true;

				}else{
					
					passwordMsg.style.color = "red";

					passwordMsg.innerHTML = "你输入的密码和原密码不同！";

					passwordMsg.focus();

					flag = false;
				}
			}
		};

		ajax(opt);

	}

	function validatenewpassword() {

		var newpassword = document.changepassword.newpassword;

		var password = document.changepassword.password;

		var reg = /^(\w|\W){6,15}$/;

		var newpasswordMsg = document.getElementById("newpasswordMsg");

		if (!reg.test(newpassword.value)) {

			newpasswordMsg.style.color = "red";

			newpasswordMsg.innerHTML = "新密码必须是6-15的任意符号";

			newpassword.focus();

			return false;

		}
		if (password.value == newpassword.value) {

			newpasswordMsg.style.color = "red";

			newpasswordMsg.innerHTML = "新密码不能和原密码一样";

			newpassword.focus();

			return false;

		} else {

			newpasswordMsg.style.color = "green";

			newpasswordMsg.innerHTML = "新密码合法";

			return true;
		}

	}

	function validaterenewpassword() {

		var newpassword = document.changepassword.newpassword;

		var renewpassword = document.changepassword.renewpassword;

		var renewpasswordMsg = document.getElementById("renewpasswordMsg");

		if (renewpassword.value == newpassword.value) {//true

			renewpasswordMsg.style.color = "green";

			renewpasswordMsg.innerHTML = "两次密码一致";

			return true;

		} else {

			renewpasswordMsg.style.color = "red";

			renewpasswordMsg.innerHTML = "两次密码不一致";

			renewpassword.focus();

			return false;

		}

	}

	function test() {

		return flag && validatenewpassword()
				
		&& validaterenewpassword();
	}
</script>

</head>

<body background=".\imgs\001.jpg">

	<form action="AdminServlet?action=changepassword" method="post"name="changepassword" onsubmit="return test()"enctype="application/x-www-form-urlencoded">

		<table class="table table-striped table-hover" align="center">

			<h2 class="text-center text-info">修改密码</h2>

			<tr align="center">

				<td>原密码：</td>

				<td><input type="password" name="password"onblur="validatepassword()" /><span id="passwordMsg"></span></td>		

			</tr>

			<tr align="center">

				<td>新密码：</td>

				<td><input type="password" name="newpassword" onblur="validatenewpassword()" /><span id="newpasswordMsg"></span></td>

			</tr>

			<tr align="center">

				<td>确认新密码：</td>

				<td><input type="password" name="renewpassword" onblur="validaterenewpassword()" /><span id="renewpasswordMsg"></span></td>

			</tr>

			<tr align="center">

				<td colspan="2"><button class="btn btn-info">确认修改</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-info">重新填写</button></td>

			</tr>

		</table>
</body>

</html>