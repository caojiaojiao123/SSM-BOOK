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

<title>登录</title>

<style>

body {

	margin: 0;
	
}

.table{

width:300px;

}


</style>

</head>

<body>

	 <c:if test="${!(empty msg) }">
	
   <script>
   
       alert("${msg}");
       
   </script>
   
   <c:remove var="msg" scope="session"/>
   
</c:if>

	<table width="100%" height="1000px" cellspacing="0">

		<tr height="80px">

			<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
				
				color="red" size="7" face="华文新魏">Oracle</font><font size="6"
				
				face="华文新魏">图书管理系统</font><font color="silver" size="6" face="华文新魏">|</font></font><font
				
				color="silver" size="5" face="华文新魏">登录</font>

			</td>

		</tr>

		<tr background=".\imgs\001.jpg">

			<td align="center">

				<form action="AdminServlet?action=login" method="post" name="login"
					
					enctype="application/x-www-form-urlencoded" onsubmit="return test()">

					<table class="table table-striped table-hover" align="center">

						<tr class="info">
							<td colspan="2">&nbsp;&nbsp;&nbsp;<font size="4">会员登录</font></td>
						</tr>

						<tr class="info">
							<td align="center"><font>账号：</font></td>
							
							<td><input type="text" name="username"
								
								onblur="validateusername()" /><span id="usernameMsg"></span></td>
						</tr>

						<tr class="info">
							<td align="center"><font>密码：</font></td>
							
							<td><input type="password" name="password"  onblur="validatepassword()"/></td>
						
						</tr>

						<tr class="info">
							
							<td></td>
							
							<td><input type="checkbox" checked /><font size="2"
								
								color="gray">两周内自动登录</font></td>
						</tr>

						<tr class="info">
							<td></td>
							
							<td><button class="btn btn-info">登录</button>&nbsp;&nbsp;&nbsp;<font
								
								size="2" color="silver"><a href="register.jsp">忘记密码</a></font></td>
						
						</tr>

						<tr class="info">
							
							<td colspan="2" align="center"><a href="register2.jsp">
									
									还不是会员？立即注册</a></td>
						</tr>

					</table>

				</form>

			</td>

			<td width="50%"></td>

		</tr>

		<tr height="100px">

			<td colspan="2" align="center"><font color="silver" size="4"
				
				face="华文新魏">oracle公司版权所有 &copy; 2012-2018</font></td>

		</tr>

	</table>

</body>

</html>