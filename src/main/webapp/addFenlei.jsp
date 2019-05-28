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

<script type="text/javascript">

function validatename() {
	
	var flag;

	var name = document.addFenlei.name;

		var xmlhttp = getXMLHttpRequest();

		xmlhttp.open("POST", "FenLeiServlet", true);

		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");

		xmlhttp.send("action=validatename&name=" + name.value);

		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var content = xmlhttp.responseText;

				var span = document.getElementById("nameMsg");

				if (content == "0") {

					span.style.color = "green";

					span.innerHTML = "你输入的分类名合法";

					flag = true;

				} else {

					span.style.color = "red";

					span.innerHTML = "分类名已存在";

					span.focus();
					
					flag = false;
					
				   

				}

			}

		}

		return flag;
		
	}

</script>

<style type="text/css">

.table{

width:500px;

}

</style>

</head>

<body background=".\imgs\001.jpg">

	<form action="fenlei" method="post" >

		<table class="table table-striped table-hover" align="center">

			<h2 class="text-center text-info">添加分类</h2>

			<tr align="center">
			
				<td align="center">请输入分类的名字</td>
				
				<td><input type="text" name="name" onblur="validatename()"/></td>
				
				<td><span id="nameMsg"></span></td>
				
				  
			</tr>

			<tr align="center">
			
				<td colspan="3"><button type="submit" class="btn btn-info">添加</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-info">重填</button></td>
			</tr>

		</table>

	</form>

</body>

</html>