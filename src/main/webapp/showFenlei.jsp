<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<!-- 要使用Bootscript的话，必须是html5文档 -->

<meta charset="UTF-8">

<!-- 移动设备优先 -->

<meta name="viewport" content="width=device-width, initial-scale=1"> 

<!-- 导入核心的css文件 -->

<link  rel="stylesheet" href="bootstrap/css/bootstrap.css"/>

<!-- 需要引入jQuery文件 -->

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<!-- 引入BootScript的核心JS文件 -->

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<script type="text/javascript" src="js/ajax.js"></script>

<script type="text/javascript">

		window.onload=function(){
			
			var selectAll=document.getElementById("selectAll");
			
			selectAll.onclick=function(){
				
				var check=document.getElementsByName("ids");
	
				for(var i=0;i<check.length;i++){
					
					check[i].checked=true;
				}
			};
			
			var unselectAll=document.getElementById("unselectAll");
			
			unselectAll.onclick=function(){
				
				var check=document.getElementsByName("ids");
				
				for(var i=0;i<check.length;i++){
					
					check[i].checked=false;
				}
				
			};
			
			var fanxuan=document.getElementById("fanxuan");
		
			fanxuan.onclick=function(){
				
				var check=document.getElementsByName("ids");

                for(var i=0;i<check.length;i++){
                	
					if(check[i].checked==true){
						
						check[i].checked=false;
						
					}else{
						
						check[i].checked=true;
					}				
                	
                }
				
			};
	 
	 var deleteF=document.getElementById("DeleteF");
		
		deleteF.onclick=function(){
			
			var check=document.getElementsByName("ids");
			//判断一下,他选了没有
			var flag = false;
			for (var i = 0; i < check.length; i++) {
				if (check[i].checked == true) {
					flag = true;
					break;
				}
			}
			if (flag == false) {
				alert("请至少勾选一项进行删除！");
				location.href = "fenleis";
				return;
			}
			//如果选择了
			var str = "";
			for (var i = 0; i < check.length; i++) {
				if (check[i].checked == true) {
					str = str + check[i].value + ",";
				}
				
			}
			;
			//去除最后一个逗号
			str = str.slice(0, str.length - 1);
			//发送给服务器
			var queren = confirm("您确定要删除这些分类吗？");
			if (queren == true) {
			   var $url="fenlei/"+str;
				   
			   //alert($url);
			   
			   $("#deleteForm").attr("action",$url);
			   
			   //提交表单
			   $("#deleteForm").submit();
			   
			   return false;
			} else {
				window.location.href = "http://localhost/ssm_book/DeleteF/"+str;
			}
		};
		 
		 
	 
	 
	 
	 var  outAll=document.getElementById("OutAll");
		
		outAll.onclick=function(){
		
			var flag=confirm("你确定导出所有分类信息吗？");
			
			if(flag){
			
				window.location.href="http://localhost/ssm_book/OutAll "
			
			}
		
		};
		
		var outSelect=document.getElementById("OutSelect");
		
		outSelect.onclick=function(){
			
			var chek=document.getElementsByName("ids");
			
			var flag = false;


			for (i = 0; i < chek.length; i++) {


				if (chek[i].checked == true) {
				
					flag = true;
					
					break;
				}
			}


			if (flag == false) {
				
				alert("请至少选一项");
				
				return;


			} else {    
				
				var str = "";


				for (var i = 0; i < chek.length; i++) {


					if (chek[i].checked == true) {


						str += chek[i].value + ",";


					}
				}
				
				str = str.slice(0, str.length - 1);
				
				var flag = confirm("你确定导出选中的分类信息？");
				
				if (flag) {//确定
					
					
					window.location.href = "http://localhost/ssm_book/OutSelect/"+str;


				}
			}
			
		};


	};
	
	 
	 $(function(){
  	   
     	$("table tr:even").addClass("info");
     	  
     	$("table tr:odd").addClass("danger");
     	
     });
</script>
</head>
<body background=".\imgs\001.jpg">

<div class="col col-md-8">
		<ul class="nav nav-tabs">
		    <li class="active"><a href="addFenlei.jsp">添加分类</a></li>
			<li><a id="selectAll" href="#">全选</a></li>
			<li><a id="unselectAll" href="#">全不选</a></li>
			<li><a id="fanxuan" href="#">反选</a></li>
			<li><a id="OutSelect" href="#">导出选中</a></li>
			<li><a id="OutAll" href="#">导出全部</a></li>
			<li><a id="DeleteF" href="#">删除</a></li>
			</ul>

<div class="container">
		
		<table align="center" width="600px" height="200px" border="1px" class="table"
			
			cellspacing="0" bordercolor="silver">
			
			<caption align="center" >
				
				<h1 align="center">
					
					<font color="red" >查看分类信息</font>
				
				</h1>
				
				<hr color="red" />
			
			</caption>
			
			<tr align="center">
			
			<td>选择</td>
			
			<td>编号</td>
			
			<td>分类名称</td>
			
			<td>修改</td>
			
			</tr>
						
			<c:forEach items="${pb.beanList }" var="f" varStatus="s">
			
			<tr align="center">
				
				<td><input type="checkbox" name="ids" value="${f.fid }" /></td>
				
				<td>${s.index+1 }</td>
				
				<td>${f.fname }</td>
				
				<td><a href="fenlei/${f.fid }">
				
				<input type="submit" value="修改" class="btn btn-info" /></a></td>
			    
			    <%-- <td><a href="fenlei/${f.id }" class="deleteId btn btn-danger">删除</a></td> --%>
			
			</tr>
				
			</c:forEach>
			
		</table>
	
		<form action="" method="post" id="deleteForm">
		  <input type="hidden" name="_method" value="DELETE"/>
		</form>
		
		</div>

	<center>
		<p align="center">第${pb.pageNow }页/共${pb.pages }页
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<ul class="pagination">
				<li><a href="fenleis?pageNow=1">首页</a></li>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pb.pageNow>1 }">
					<li><a href="fenleis?pageNow=${pb.pageNow-1 }">上一页</a></li>
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
							<li><a href="fenleis?pageNow=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${pb.pageNow<pb.pages }">
					<li><a href="fenleis?pageNow=${pb.pageNow+1 }">下一页</a></li>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li><a href="fenleis?pageNow=${pb.pages }">尾页</a></li>
			</ul>
		</center>
		</div>
</body>

</html>