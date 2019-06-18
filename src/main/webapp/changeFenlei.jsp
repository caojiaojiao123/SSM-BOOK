<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<title>Insert title here</title>

<script type="text/javascript">
		 

		/* window.onload = function() {

			ajax({

				method : "POST",

				url : "FenleiServlet",

				ansy : true,

				params : "action=updateShowFenlei",

				type : "xml",

				success : function(data) {

					var select = document.getElementById("fenleiList");

					var names = data.getElementsByTagName("name");

					for (var i = 0; i < names.length; i++) {

						var name = names[i];

						var opt = document.createElement("option");

						var value;

						if (window.addEventListener) {

							value = name.textContent;

						} else {

							value = text;
						}

						opt.innerHTML = value;

						opt.value = value;

						select.appendChild(opt);
					}
				}
			});
		}; */

		
	</script>
</head>
<body background=".\imgs\001.jpg">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form action="fenlei" method="post"
					enctype="application/x-www-form-urlencoded">
					<input type="hidden" name="_method" value="PUT">
					<input type="hidden" name="fid" value="${fenlei.fid }" />
					<h1 class="text-center text-danger">
						<font face="幼圆">修改分类信息</font>
					</h1>
					<hr>
					<br>
						<div class="form-group">
						<label>新&nbsp;的&nbsp;分&nbsp;类&nbsp;名&nbsp;称:</label> <input type="text"
							name="fname" class="form-control" value="${fenlei.fname }" />
					</div>
						<br>
						<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-info" style="width:100px;">修改</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-warning" style="width:100px;">清空</button></li>
						</ul>
						</div>
				</form>
			</div>
		</div>
	</div>
	
</body>

</html>