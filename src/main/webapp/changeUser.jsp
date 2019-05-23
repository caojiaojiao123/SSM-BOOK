<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
   <div class="container">
   <h1 align="center">图书管理系统-----修改信息</h1>
   <hr width="1000px">
<form action="user" class="form-horizontal" method="post">
  
  <div class="form-group">
    <label for="name" class="col-sm-4 control-label">姓名</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="name" name="name" value="${user.name }">
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-4">
      <button type="submit" class="btn btn-primary">修改图书信息</button>
    </div>
  </div>
</form>
<hr>
<div class="col-sm-offset-3 col-sm-4">
<p><a href="addUI?user.id=${id }">去添加图书</a></p>
<p><a href="users?user.id=${id }">去查询图书</a></p>
</div>
	</div>
</body>
</html>