<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<style type="text/css">

img{

width:30px;

height:30px;

}

</style>

</head>
<body background=".\imgs\001.jpg">

    <form action="UserServlet?action=touxiang" method="post" enctype="multipart/form-data">
      
       <p>ID:<input type="text" name="id" value="${u.id }"/></p>
       
       <p>原头像：<img src="/img${u.touxiang }"/></p>
    
       <p>新头像:<input type="file" name="newtouxiang"/></p>
       
       <p><input type="submit" value="上传"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='showOne.jsp'>取消</td></p>
       
    </form>
</body>
</html>