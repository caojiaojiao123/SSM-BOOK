<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<!-- 1.要使用Bootstrap的话，必须是html5文档 -->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<title>修改图书</title>
<style>
body {
	margin: 0
}

table {
	margin-top: 80px;
}
</style>
</head>
<center align="middle">
	<body background="image/6.jpg">
		<form  action="bookServlet?action=update" method="post">
			<input type="hidden" name="id" value="${s.id }">
			<!-- 拿到的通过session的键值拿到的：：-->
			<table frame="void" align="center" width="500px" height="300px"
				border="0">
				<caption align="top">
					<font size="6" face="黑体">修改图书信息
						
				</caption>
<tr>
<tr>
				<tr align="center">
					<td align="left"><label class="text-success">分类:</label></td>

					<td><input  class="form-control" type="text" name="f_name" value="${s.f_name }"
						onblur="vname()" /> <span id="nameMsg"></span></td>
				</tr>
	
		
				<tr align="center">
					<td align="left"><label class="text-success">名称:</label></td>
					<td><input  class="form-control" type="text" name="name" value="${s.name}"
						onblur="zname()" /> <span id="zhanghaoMsg"></span></td>
				</tr>
				<tr align="center">
				<tr>
					<td align="left"><label class="text-success">价格:</label></td>
					<td align="center"><input  class="form-control" type="text" name="price"
						value="${s.price}" onblur="pname()" /> <span id="passwordMsg"></span></td>
				</tr>

				<tr align="center">
					<td align="left"><label class="text-success">出版社:</label></td>
					<td><input  class="form-control" type="text" name="chubanshe"
						value="${s.chubanshe }" /> <span id="phoneMsg"></span></td>
				</tr>
				<tr align="center">

					<td align="left"><label class="text-success">状态:</label></td>
					<td><input  class="form-control" type="text" name="zhuangtai"
						value="${s.zhuangtai }" /> <span id="phoneMsg"></span></td>
				<tr align="center">
					<td align="left"><label class="text-success">借书人:</label></td>
					<td><input class="form-control" type="text" name="sp" value="${s.sp}" /> <span
						id="phoneMsg"></span></td>
				</tr>
				<tr align="center">
				<tr align="center">
					<td align="center" colspan="2"><button class="btn btn-success">修改</button>
						&nbsp&nbsp&nbsp&nbsp <button class="btn btn-danger">重新填写</button></td>
				<tr align="center">
			</table>
	</body>
</html>