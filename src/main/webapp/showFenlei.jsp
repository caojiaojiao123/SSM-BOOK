<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bokkstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<mate name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入jQuery文件 --> <script type="text/javascript"
	src="bootstrap/js/jQuery.js"></script> <!-- 5.引入Bookstrap的核心JS文件 --> <script
	type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<title>查看所有分类</title>
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
			
			var deleteStudent=document.getElementById("deleteStudent");
			
			deleteStudent.onclick=function(){
				
				var check=document.getElementsByName("ids");
				
				//判断一下,他选了没有
				var flag=false;
				
				for(var i=0;i<check.length;i++){
					
					if(check[i].checked==true){   
						
						flag=true;
						
						break;
						
					}																
				}

if(flag==false){
					
					alert("请至少勾选一项进行删除！");
					
					location.href="FenleiServlet?action=showFenleiByPage";
					
					return;
				}	
						
				//如果选择了
						
				var str="";
						
				for(var i=0;i<check.length;i++){
							
					if(check[i].checked==true){
								
					str=str+check[i].value+",";
	
				}
			}
								
				//去除最后一个逗号
				str=str.slice(0,str.length-1);
												
		        //发送给服务器
				var queren=confirm("您确定要删除这些分类吗？");
				
				if(queren==true){
					
					location.href="FenleiServlet?action=delete&ids="+ str;

			} else {

				location.reload();
			}
		};

	};
	
	$(function() {

		$("tr:even").css("background-color", "transparent");

		$("tr:odd").css("background-color", "transparent");

		//事件
		$("tr").mouseover(function() {

			$(this).css("background-color", "LightYellow");
		});

		$("tr").mouseout(function() {

			$("tr:even").css("background-color", "transparent");

			$("tr:odd").css("background-color", "transparent");
		});
	});
</script>

</head>
<body background=".\imgs\001.jpg">
	
	<div class="col col-md-8">
		<ul class="nav nav-tabs">
		    <li class="active"><a href="addFenlei.jsp">添加分类</a></li>
		    <li class="active"><a href="updateFenlei.jsp">修改分类</a></li>
			<li><a id="selectAll" href="#">全选</a></li>
			<li><a id="unselectAll" href="#">全不选</a></li>
			<li><a id="fanxuan" href="#">反选</a></li>
			<li><a id="deleteStudent" href="#">删除</a></li>
			</ul>
	<div class="container">
     <div class="panel panel-warning">
       <div class="panel-heading">
         <div class="panel-title">
           <h2>查看所有分类</h2>
         </div>
       </div>
       <div class="panel-body">
         <table class="table table-borderd table-striped table-hover">
		 <!-- info蓝色    success绿色    warning黄色    danger红色    active灰色 -->
			<tr align="center">
			<td>选择</td>
			<td>编号</td>
			<td>分类名称</td>
		</tr>
			<c:forEach items="${pb.beanList }" var="f" varStatus="s">
			<tr align="center">
				<td><input type="checkbox" name="ids" value="${f.id }" /></td>
				<td>${s.index+1 }</td>
				<td>${f.name }</td>
			</tr>
		</c:forEach>
		</table>
		</div>
		</div>
		</div>
</body>
<html>
