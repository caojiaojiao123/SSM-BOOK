<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body background=".\imgs\001.jpg">
   <div class="container">
   <h1 align="center">图书管理系统-----添加用户信息</h1>
   <hr width="1000px">
   <form action="user" class="form-horizontal" method="post" enctype="multipart/form-data">
  
  <div class="form-group">
    <label for="name" class="col-sm-4 control-label">姓名</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="name" name="name">
    </div>
  </div>
  
  <div class="form-group">
    <label for="touxiang" class="col-sm-4 control-label">头像</label>
    <div class="col-sm-4">
      <input type="file" class="form-control" id="touxiang" name="touxiang">
    </div>
  </div>
  
  <div class="form-group">
    <label for="username" class="col-sm-4 control-label">用户名</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="username" name="username">
    </div>
  </div>
  
  <div class="form-group">
    <label for="password" class="col-sm-4 control-label">密码</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" id="password" name="password">
    </div>
  </div>
  
  <div class="form-group">
    <label for="phone" class="col-sm-4 control-label">手机号码</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="phone" name="phone">
    </div>
  </div>
  
  <div class="form-group">
    <label for="date" class="col-sm-4 control-label">注册时间</label>
    <div class="col-sm-4">
      <input type="date" class="form-control" id="date" name="date">
    </div>
  </div>
 
  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-4">
      <button type="submit" class="btn btn-primary">添加用户</button>
    </div>
  </div>
</form>
</div>
</body>
</html>