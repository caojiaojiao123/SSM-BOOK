<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta  charset="UTF-8">

<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="tubiao/iconfont.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<link type="text/css" rel="stylesheet" href="jquery-ui.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript">

$(function() {
	
	$(".deleteId").click(function() {
		var $url = this.href;

		$("#deleteForm").attr("action", $url);
		
		// alert($url);
		
		$("#deleteForm").submit();

		return false;
	});
});
</script>

<script type="text/javascript">

window.onload=function(){
	
	var selectall=document.getElementById("selectall");
	
	selectall.onclick=function(){
		
		var chek=document.getElementsByName("ids");
		
		for(var i=0;i<chek.length;i++){
			
			chek[i].checked=true; 
			
		}
	}
		
		var noselect=document.getElementById("noselect");
		
		noselect.onclick=function(){
			
			var chek=document.getElementsByName("ids");
			
			for(var i=0;i<chek.length;i++){
				
				chek[i].checked=false;
				
			}
		
		}
			
		var fanxuan=document.getElementById("fanxuan");
		
		fanxuan.onclick=function(){
			
			var chek=document.getElementsByName("ids");
			
			for(var i=0;i<chek.length;i++){
				
				if(chek[i].checked==true){
					
					chek[i].checked=false;
					
				}
				else{
					
					chek[i].checked=true;
				}
				
				
			}
			
		};
		
	var delete1=document.getElementById("delete1");
	
	delete1.onclick=function(){
		
		var chek=document.getElementsByName("ids");

        var flag=false;
		
		for(var i=0;i<chek.length;i++){
			
			if(chek[i].checked==true){
				
				flag=true;
				
				break;
				
			}
		}
			if(flag==false){
				
				alert("请至少选择一个进行删除！");
				
				return;
				
			}
			var str="";
			
			for(var i=0;i<chek.length;i++){
				
				if(chek[i].checked==true){
					
					str=str+chek[i].value+",";
					
				}
		
			}
			
			str=str.slice(0,str.length-1);
			
			 queren=confirm("你确定要删除吗？");
			
			if(queren==true){
				
				location.href="http://localhost/ssm_book/delete/"+str;
				
			}else{
				
				location.reload();
			}
	
	}
	
	var outAll=document.getElementById("outAll");
	
	outAll.onclick=function(){
		
		var flag=confirm("你确定要导出所有的用户吗？");
		
		if(flag){
			
			window.location.href="outputUserServlet?action=all";
		}
	}
	
    var outSelect=document.getElementById("outSelect");
	
	outSelect.onclick=function(){
		
		var chek=document.getElementsByName("ids");

        var flag=false;
		
		for(var i=0;i<chek.length;i++){
			
			if(chek[i].checked==true){
				
				flag=true;
				
				break;
				
			}
		}
			if(flag==false){
				
				alert("请至少选择一个进行导出！");
				
				return;
				
			}
			var str="";
			
			for(var i=0;i<chek.length;i++){
				
				if(chek[i].checked==true){
					
					str=str+chek[i].value+",";
					
				}
		
			}
			
			str=str.slice(0,str.length-1);
		
		var flag=confirm("你确定要导出选中的用户吗？");
		
		if(flag){
			
			window.location.href="outputUserServlet?action=select&ids="+str;
			
		}else{
			
			location.reload();
		}
	}
}
	
$(function(){
  
	$("table tr:even").addClass("warning");
   
   $("table tr:odd").addClass("danger");
  
  });
        
</script>
	
</head>
<body background=".\imgs\001.jpg">
	 <div class="container">
		<table align="center" width="600px" height="200px" border="1px" class="table"
			cellspacing="0" bordercolor="silver">
			<caption align="center" >
				<h1 align="center">
					<font color="red" >查看用户信息</font>
				</h1>
				<hr color="red" />
			</caption>
			<tr align="center">
			
				<td>编号</td>
				
				<td>姓名</td>
				
				<td>头像</td>
				
				<td>用户名</td>
				
				<td>密码</td>
				
				<td>手机号码</td>
				
				<td>注册时间</td>
				
				<td>删除</button></td>
				
				<td>修改</td>
				
			</tr>
						
			<c:forEach items="${pb.beanList }" var="u" varStatus="s">
			
				<tr>
				
				<td>${s.index+1 }</td>
				
				<td>${u.name }</td>
				
				<td><img src="${u.touxiang }" width="30" height="30"></td>
				
				<td>${u.username }</td>
				
				<td>${u.password }</td>
				
				<td>${u.phone }</td>
				
				<td>${u.date }</td>
				
				<!--<fmt:formatDate value="${u.date }" pattern="yyyy-MM-dd"/>-->
				
			    <td><input type="checkbox" name="ids" value="${u.id }" /></td>

			    <!--<td><a href="user/${u.id  }" class="deleteId btn btn-danger">删除</a></td>-->
				
				<td><a href="user/${u.id  }" class="btn btn-primary">修改</a></td>
				
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="7"></td>
				
				<td align="center"><button id=delete1 class="btn btn-info btn-xs">删除</button></td>
				
				<td></td>
				
			</tr>
		</table>
		<!-- 准备一个隐藏的表单 -->
		<form action="" method="post" id="deleteForm">
		  <input type="hidden" name="_method" value="DELETE"/>
		</form>
		<center>
		    <!-- 更改分页的样式=====》ul列表 -->
		    <ul class="pager text-center" >
			<li><a href="users?pageNow=1">首页</a> &nbsp;&nbsp;<li>
			<c:if test="${pb.pageNow>1 }">
				<li><a href="users?pageNow=${pb.pageNow-1 }">上一页</a><li>
			</c:if>
			&nbsp; 
			<!-- 分两种情况：
		         如果页数小于10：
		         如果页数大于10：         
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
						<c:set var="begin" value="${pb.pages-9 }"></c:set>
						<c:set var="end" value="${pb.pages }"></c:set>
					</c:if>
				</c:otherwise>
			</c:choose> 
			<!-- 循环十个数 -->
		 <c:forEach begin="${begin }" end="${end }" var="i">
				<c:choose>
					<c:when test="${pb.pageNow==i }">
						<span>${i}</span>
					</c:when>
					<c:otherwise>
						<li><a href="users?pageNow=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			&nbsp;
			<c:if test="${pb.pageNow<pb.pages }">
				<li><a href="users?pageNow=${pb.pageNow+1 }">下一页</a></li>
			</c:if>
			&nbsp;&nbsp; <li><a href="users?pageNow=${pb.pages }">尾页</a></li>
           </ul>
		</center>
		<p align="center">第${pb.pageNow }页/共${pb.pages }页</p>
		
		<p align="center">
		
		 <button id="selectall" class="btn btn-info btn-xs">全选</button>&nbsp;&nbsp;&nbsp;&nbsp;
		 
		 <button id="noselect" class="btn btn-info btn-xs">全不选</button>&nbsp;&nbsp;&nbsp;&nbsp;
		 
		 <button id="fanxuan" class="btn btn-info btn-xs">反选</button>&nbsp;&nbsp;&nbsp;&nbsp;
		 
		 <button id="outAll" class="btn btn-info btn-xs">导出所有</button>&nbsp;&nbsp;&nbsp;&nbsp;
		 
		 <button id="outSelect" class="btn btn-info btn-xs">导出选中</button>
		
		</p>
		
		<p align="center">
		
			<a href="addUser.jsp" class="btn btn-primary">添加用户</a>
			
		</p>
		</div>
</body>
</html>