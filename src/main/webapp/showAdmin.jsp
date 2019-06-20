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

$(function(){
	   
	$("table tr:even").addClass("info");
	  
	$("table tr:odd").addClass("danger");
	
});
</script>

<style type="text/css">
a {
	text-decoration: none;
}
</style>

<title>Insert title here</title>

<script type="text/javascript" src="js/ajax.js"></script>

</head>

<body background=".\imgs\001.jpg">

	 <caption align="center" >
				
				<h1 align="center">
					
					<font color="red" >查看管理员信息</font>
				
				</h1>
				
				<hr color="red" />
			
			</caption>
		<h1 class="text-center text-danger"><span class="glyphicon glyphicon-user"></span></h1>

		<table  border="1" align="center" width="500px"
			height="300px" cellspacing="0">
			<tr align="center">
				<th>编号</th>
				<th>${admin.id}</th>
			</tr>
			
			<tr align="center">
				<th>姓名</th>
				<th>${admin.name}</th>
			</tr>
			
			<tr align="center">
				<th>头像</th>
				<th>
			       <img src="upload/${sessionScope.touxiang }" style="width:50px;height:50px" class="img-cicle img-responsive" />
			    </th>
			</tr>
			
			<tr align="center">
				<th>账号</th>
				<th>${admin.username}</th>
			</tr>
			
			<tr align="center">
				<th>密码</th>
				<th><input type="password" value="${admin.password}" disabled="disabled"/></th>
			</tr>
			
			<tr align="center">
				<th>手机</th>
				<th>${admin.phone}</th>
			</tr>
			
		</table>
</body>

</html>