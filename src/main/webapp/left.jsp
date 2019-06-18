<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>

<head>

<!-- 要使用Bootscript的话，必须是html5文档 -->

<meta charset="UTF-8">

<!-- 移动设备优先 -->

<meta name="viewport" content="width=device-width, initial-scale=1">

<link type="text/css" rel="stylesheet" href="jquery-ui.css">

<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript" src="js/jquery-ui.js"></script>

<script type="text/javascript">

$(function(){
	
	$("#accordion").accordion();
	
});

</script>

<title>Insert title here</title>

<style type="text/css">

li{

list-style-type: none;

margin-top: 5px;

}

a{

text-decoration: none;

}

#accordion{

width:250px;

}

</style>

</head>

<body bgcolor="#c4e1ff">

	<!-- Accordion -->
	
	<div id="accordion">
	
		<h3>分类管理</h3>
		
		<div> 
		      
		   <li><a href="addFenlei.jsp" target="right"><span class="ui-icon ui-icon-plus"></span>添加分类</a></li>
		   
		   <li><a href="fenleis" target="right"><span class="ui-icon ui-icon-folder-open"></span>查看分类</a></li>
		   
		   <!--  <li><a href="changeFenlei.jsp" target="right"><span class="ui-icon ui-icon-tag"></span>修改分类</a></li>-->
		
		</div>
		
		<h3>图书管理</h3>
		
		<div>
	
		   <li><a href="addBookUl" target="right"><span class="ui-icon ui-icon-cart"></span>添加图书</a></li>
		   
		   <li><a href="showBookHandler/1"target="right"><span class="ui-icon ui-icon-folder-open"></span>查看图书</a></li>
		   
		   <!-- <li><a href="changeBook.jsp" target="right"><span class="ui-icon ui-icon-bookmark"></span>修改图书</a></li> -->
	
		</div>
		
		<h3>用户管理</h3>
		
		<div>
		
		   <li><a href="addUser.jsp" target="right"><span class="ui-icon ui-icon-refresh"></span>添加用户</a></li>
		   
		   <li><a href="users" target="right"><span class="ui-icon ui-icon-document-b"></span>查看用户</a></li>
		   
		   <!--  <li><a href="UserServlet?action=changeUser" target="right"><span class="ui-icon ui-icon-comment"></span>修改用户</a></li>-->
		   
		</div>
		
		<h3>管理员管理</h3>
		
		<div>
		
		   <li><a href="AdminServlet?action=showxinxi&username=${username }" target="right"><span class="ui-icon ui-icon-locked"></span>查看管理员</a></li>
		   
		   <li><a href="AdminServlet?action=changepassword&username=${username }" target="right"><span class="ui-icon ui-icon-unlocked"></span>修改密码</a></li>
		   
		   <li><a href="AdminServlet?action=exitSystem" target="_parent"><span class="ui-icon ui-icon-power"></span>退出系统</a></li>
		   	   
		</div>
	
	</div>

</body>
</html>