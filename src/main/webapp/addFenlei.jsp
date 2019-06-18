<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>

<head>

<!-- 要使用Bootscript的话，必须是html5文档 -->

<meta charset="UTF-8">

<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<link type="text/css" rel="stylesheet" href="jquery-ui.css">

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<script type="text/javascript" src="js/jquery-ui.js"></script>

<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css" />

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>

<script type="text/javascript" src="js/ajax.js"></script>

<script type="text/javascript">

 $(function(){
	  $(".form-horizontal").bootstrapValidator({
		  
		  feedbackIcons:{
			  
			  valid : "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-refresh"
		  },
		  
		  fields:{
			  
			  name:{
				  
				  validators :{
					  
					  notEmpty : {
							message : '分类名称不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5_A-z0-9]{1,15}$/,
							message : '分类名称必须由长度为1-15的汉字字母数字下划线组成'
						},
					  
						remote:{
						  message:'该分类已被添加，请重新输入',
						  
						  url:"validate",
						
						  type:'post',
						  
						  data:function(validator){
							  
							  return{
								  
								  name:$("input[name=fname]").val()
							  }
						  }
					  }
					 
				  }
			  }
			  
		  }
	  });
}); 


 $(function(){
	   
 	$("table tr:even").addClass("info");
 	  
 	$("table tr:odd").addClass("danger");
 	
 });
</script>
</head>
<body background=".\imgs\001.jpg">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
	<form action="add" method="post" class="form-horizontal">
		<br>
					<br>
						<h1 class="text-center text-danger"><font face="幼圆">添加分类</font></h1>
						<hr>
	                <div class="form-group">
						<label>请输入分类的名称:</label> 
					    <input type="text" name="fname" id="fname" class="form-control" placeholder="分类名称" />
					</div>
					<br>
					<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-info" style="width:100px;">添加</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-warning" style="width:100px;">重填</button></li>
						</ul>
						</div>
					
					</form>
					</div>
					</div>
					</div>
</body>

</html>