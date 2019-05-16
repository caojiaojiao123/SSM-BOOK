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
<script type="text/javascript">
   $(function(){
	   
	   $(".deleteId").click(function(){
		   
		   var $url=this.href;
		   
		   //alert($url);
		   
		   $("#deleteForm").attr("action",$url);
		   
		   //提交表单
		   $("#deleteForm").submit();
		   
		   return false;
	   });
   });

</script>
</head>
<body>
	<div class="container">
		<h1 align="center">查看用户信息</h1>
		<table class="table table-bordered table=striped table-responsive">
			<tr>
				<td>编号</td>
				
				<td>姓名</td>
				
				<td>头像</td>
				
				<td>用户名</td>
				
				<td>密码</td>
				
				<td>手机号码</td>
				
				<td>注册时间</td>
				
				<td>删除</td>
				
				<td>修改</td>
				
			</tr>
			
			<c:forEach items="${pb.beanList }" var="u" varStatus="s">
			
				<tr>
				
				<td>${s.index+1 }</td>
				
				<td>${u.name }</td>
				
				<td><img src="/img${u.touxiang }"/></td>
				
				<td>${u.username }</td>
				
				<td>${u.password }</td>
				
				<td>${u.phone }</td>
				
				<td>
				
				<fmt:formatDate value="${u.date }" pattern="yyyy-MM-dd"/>
				
				</td>
				
				<td><input type="checkbox" name="ids" value="${u.id }" /></td>
				
			    <td><a href="http://localhost/ssm_book/user/${u.id  }" class="deleteId btn btn-danger">删除</a></td>
				
				<td><a href="http://localhost/ssm_book/user/${u.id  }" class="btn btn-primary">修改</a></td>
				</tr>
			</c:forEach>
		</table>
		<!-- 准备一个隐藏的表单 -->
		<form action="" method="post" id="deleteForm">
		  <input type="hidden" name="_method" value="DELETE"/>
		</form>
		<hr>
		<center>
		<p>第${pb.pageNow }页/共${pb.pages }页
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<ul class="pagination">
				<li><a href="1">首页</a></li>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pb.pageNow>1 }">
					<li><a href="${pb.pageNow-1 }">上一页</a></li>
				</c:if>
				<!-- 分两种情况		 
		        1.如果页数小于10
		        2.如果页数大于10 
		-->
				<c:choose>
					<c:when test="${pb.pages<=10 }">
						<c:set var="begin" value="1"></c:set>
						<c:set var="end" value="${pb.pages }"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="begin" value="${pb.pageNow-5 }"></c:set>
						<c:set var="end" value="${pb.pageNow+4 }"></c:set>
						<c:if test="${begin<=1 }">
							<c:set var="begin" value="1"></c:set>
							<c:set var="end" value="10"></c:set>
						</c:if>
						<c:if test="${end>=pb.pages }">
							<c:set var="begin" value="${pb.pageNow-9 }"></c:set>
							<c:set var="end" value="${pb.pages }"></c:set>
						</c:if>
					</c:otherwise>
				</c:choose>
				<!-- 循环十个数 -->
				<c:forEach begin="${begin }" end="${end }" var="i">
					<c:choose>
						<c:when test="${pb.pageNow==i }">
							<li class="active"><span>${i }</span></li>
						</c:when>
						<c:otherwise>
							<li><a href="${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pb.pageNow<pb.pages }">
					<li><a href="${pb.pageNow+1 }">下一页</a></li>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li><a href="${pb.pages }">尾页</a></li>
			</ul>

		</center>
		<p align="center"><a href="http://localhost/ssm_crud/addUI">点击添加妖怪</a></p>
	</div>
</body>
</html>