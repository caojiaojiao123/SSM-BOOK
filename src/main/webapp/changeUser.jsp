<%@ page language="java"
	import="java.util.List,com.oracle.web.bean.User"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="tubiao/iconfont.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<link type="text/css" rel="stylesheet" href="jquery-ui.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript">
  $(function(){
	   $("table tr:even").addClass("warning");
	   $("table tr:odd").addClass("danger");
	})
</script>
<title>修改界面</title>
</head>
<body background=".\imgs\001.jpg">
	
	<form action="user" method="post"  class="form-horizontal">
        
		<caption align=center color=red>
			<h1 align="center">修改用户界面</h1>
		</caption>
		<hr color=red></hr>
		<div class="container">
		  <input type="hidden" name="_method" value="PUT">
		<table align=center width="400px" height="200px"  border=1 class="table"
			cellspacing="0" bordercolor="silver">
			 <input type="hidden" name="id" value="${u.id }"/> 
			
			<tr align="center">
			
				<td>姓&nbsp;&nbsp;&nbsp;&nbsp;名</td>
				
				<td><input type='text' name='name' value="${u.name }"  /></td>
			</tr>
			
			<tr align="center">
			
				<td>头&nbsp;&nbsp;&nbsp;&nbsp;像</td>
				
				<td><img src="/img${u.touxiang }"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="changetouxiang.jsp">修改头像</a></td>
			</tr>
			
			<tr align="center">
			
				<td>用&nbsp;&nbsp;&nbsp;&nbsp;户</td>
				
				<td><input type='text' name='username' value="${u.username }"  /></td>
			</tr>
			
			<tr align="center">
			
				<td>密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
				
				<td><input type='password' name='password' value="${u.password }"  /></td>
			</tr>
			
			<tr align="center">
			
				<td>手&nbsp;&nbsp;&nbsp;&nbsp;机</td>
				
				<td><input type='text' name='phone' value="${u.phone }"  /></td>
			</tr>
			
			<tr align="center">
			
				<td>注册时间</td>
				
				<td><input type='text' name='date' value="${u.date }"  /></td>
			</tr>
			<tr>
				<td align='center' colspan='2'><input type='submit' value='修改' class="btn btn-primary" />
				   &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;<a
					href='users' class="btn btn-primary">取消</a></td>
			</tr>
			</table>		
	  </form>
</div>
</body>
</html>