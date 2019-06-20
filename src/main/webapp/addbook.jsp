<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>添加图书</title>
<style>
table {
	margin-top: 50px;
}
</style>
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


<script>
	$(function() {

		$("#bf").bootstrapValidator({

			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'

			},
			fields : {
				name : {
					validators : {

						notEmpty : {

							message : '图书名不能为空'
						},
						stringLength : {
							min : 1,
							max : 10,
							message : '书名长度小于20'
						},

						// threshold :  6 , 有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
						remote : {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
							url : "http://localhost/ssm_book/yanzhengAddBook",//验证地址
							//提示消息
							message : '该分类下存在此图书',
							delay : 500,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
							type : 'GET',//请求方式

							//自定义提交数据，默认值提交当前input value
							data : function(validator) {
								return {
									name : $("#name").val(),
									f_id : $("#f_id").val(),
									id: $("#id").val()
								}
							}

						}

					}

				},
				price : {

					validators : {

						notEmpty : {

							message : '价格不能为空'
						}
					}

				},
				f_id : {

					validators : {

						callback : {

							callback : function(value, validator) {

								if (f_id.value == 0) {
									return {
										valid : false,

										message : '必须选择',
									}

								}
								return true;

							}
						}
					}

				},
				chubanshe : {
					validators : {

						notEmpty : {

							message : '出版社不能为空'
						}
					}
				},
				username : {
					validators : {

						notEmpty : {

							message : '借书人不能为空'
						}
					}
				},
				kucun : {
					validators : {
						notEmpty : {

							message : '请填写库存量'
						}
					}
				}
			}

		})
	});
</script>
<style>
#div9 {
	/* background-image: url("tu/t6.jpg"); 
	background-size: cover;*/
	height: 500px;
	margin-top: 20px;
}
</style>
</head>
<body background=".\imgs\001.jpg">

	<div class="container-fluid" id="div9">
		<!--  <marquee align="texttop" behavior="slide" scrollamount="60"
			direction="up">-->
		<div class="col col-md-8 col-md-offset-2" >

			<h2 class="text-center text-warning">  <font size="6"
							face="楷体">添加图书</h2>
			<hr>
			<form action="addBook" method="post" name="bf" id="bf"
				class="form-horizontal">

				<div class="form-group">
					<label class="col-sm-3 col-sm-offset-2 control-label text-warning">选择分类:</label>
					<div class="col-sm-4">
						<select  id="f_id" name="f_id" style="color: #265C88;"
							class="form-control input-sm">
							<option value="0">----请选择----</option>
							<c:forEach items="${flist }" var="s" >
								<option value="${s.fid}">${s.fname }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label col-sm-offset-2 text-warning">图书名称:</label>
					<div class="col-sm-4">
						<input type="text" name="name" class="form-control input-sm"
							id="name" />
					</div>

				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label col-sm-offset-2 text-warning">图书价格:</label>
					<div class="col-sm-4">
						<input type="text" name="price" class="form-control input-sm" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label col-sm-offset-2 text-warning">出版社:</label>
					<div class="col-sm-4">
						<input type="text" name="chubanshe" class="form-control input-sm" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label col-sm-offset-2 text-warning">状态:</label>
					<div class="col-sm-4">
						<input type="text" name="zhuangtai" class="form-control input-sm" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label col-sm-offset-2 text-warning">借书人:</label>
					<div class="col-sm-4">
						<input type="text" name="username" class="form-control input-sm" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label col-sm-offset-2 text-warning">库存量:</label>
					<div class="col-sm-4">
						<input type="text" name="kucun" class="form-control input-sm" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2  col-sm-offset-4 ">
						<button type="submit" class="btn btn-success">
							添加 <span class="glyphicon glyphicon-ok"></span>
						</button>
					</div>
					<div class="col-sm-2  col-sm-offset-1">
						<button type="reset" class="btn btn-danger">
							重置 <span class="glyphicon glyphicon-repeat"></span>
						</button>
					</div>
				</div>
				<br>
			</form>

		</div>

		<!-- </marquee>-->
	</div>

</body>
</html>