<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	    <title>前台</title>
		<style>
		    body{
			margin: 0;
			}
		</style>
	</head>
	<body background=".\imgs\004.jpg">
	<table border="1"width="100%" height="60px" cellspacing="0">
	<tr height="80px">
		    <td colspan="2">
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red" size="7" face="黑体"><b>Oracle</b></font>&nbsp;<font size="6">图书管理系统前台页面</font>
			</td>
		</tr>
	</table>
		<br>
		<br>
	<table border="1"width="100%" height="880px" cellspacing="0">
		<tr>
	   <td>
	   <form>
	    <table align="center" border="1" cellspacing="0" width="800px" height="400px">
		   <h1 align="center">显示所有图书信息</h1>
	       <tr align="center"><td>编号</td><td>分类名称</td><td>图书名称</td><td>图书价格</td><td>图书出版社</td><td>状态</td><td>借/还</td></tr>
		   <tr align="center"><td>1</td><td>计算机</td><td>Java</td><td>56</td><td>清华出版社</td><td>借出</td><td><input type="button" value="还书"/></td></tr>
		   <tr align="center"><td>2</td><td>管理学</td><td>国富论</td><td>78</td><td>北大出版社</td><td>未借出</td><td><input type="button" value="借书"/></td></tr>
		   <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
		   <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
		</table>
		<p align="center"><a href="index.jsp"target="_blank"/>进入Oracle图书管理系统后台</a></p>
		</form>
	   </td>
    </tr>
	</table>
	<br>
	<br>
	<table border="1"width="100%" height="60px" cellspacing="0">
	<tr height="100px">
	      <td colspan="2" align="center"><font color="silver" size="4" face="华文新魏"> Copyright &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &copy; &nbsp;&nbsp;oracle公司版权所有</font>
		  </td>
	   </tr>
	</table>
	</body>
</html>