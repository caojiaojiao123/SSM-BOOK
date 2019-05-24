<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<h1 align="center">妖怪管理系统----姜子牙专用版</h1>
		<br>
		<br>
		<!-- action="Http://localhost/SSH2_SpringMVC/updateMonster" -->
		<form action="updateBook" method="post" class="form-horizontal">
			<!-- PUT -->
			<input type="hidden" name="_method" value="PUT">
			<input type="hidden" name="id"  value="${m.id }">
			<div class="form-group">
				<label for="fenlei.name" class="col-sm-4 control-label">分类名称</label>
				<div class="col-sm-4">
					<select name="fid" class="form-control">
						<c:forEach  items="${sLis}" var="s">
							<c:if test="${s.id==m.fid}">
								<option value="${s.id}" selected="selected">${s.name }</option>
							</c:if>		
							<c:if test="${s.id==m.fid}">
								<option value="${s.id }">${s.name }</option>
							</c:if>
						</c:forEach>	
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">图书名称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name" name="name"  value="${m.name }">
				</div>
			</div>
			
		<div class="form-group">
				<label for="price" class="col-sm-4 control-label">图书价格</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price"  value="${m.price }">
				</div>
			</div>
			
			<div class="form-group">
				<label for="chubanshe" class="col-sm-4 control-label">出版社</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="chubanshe" name="chubanshe"  value="${m.chubanshe }">
				</div>
			</div>	
			<div class="form-group">
				<label for="zhuangtai" class="col-sm-4 control-label">状态</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="zhuangtai" name="zhuangtai"  value="${m.zhuangtai}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="username" class="col-sm-4 control-label">借书人</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="username" name="username"  value="${m.username}">
				</div>
			</div>
		
		
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button type="submit" class="btn btn-primary">修改妖怪</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>