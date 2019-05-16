<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1 align="center">图书管理系统----张珍专用版</h1>
		<br> <br>
		<form action="addBook" method="post" class="form-horizontal">
			<div class="form-group">
				<label for="schoolName" class="col-sm-4 control-label">分类名称</label>
				<div class="col-sm-4">
					<select name="fenlei.id" class="form-control">
						<c:forEach items="${sList }" var="s">
							<option value="${s.id }" >${s.name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">图书名称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name" name="name">
				</div>
			</div>

			<div class="form-group">
				<label for="price" class="col-sm-4 control-label">图书价格</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price">
				</div>
			</div>

			<div class="form-group">
				<label for="chubanshe" class="col-sm-4 control-label">出版社</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="chubanshe"
						name="chubanshe">
				</div>
			</div>
			<div class="form-group">
				<label for="zhuangtai" class="col-sm-4 control-label">状态</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="zhuangtai"
						name="zhuangtai">
				</div>
			</div>
			<div class="form-group">
				<label for="username" class="col-sm-4 control-label">借书人</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="username"
						name="username">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button type="submit" class="btn btn-primary">添加图书</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>