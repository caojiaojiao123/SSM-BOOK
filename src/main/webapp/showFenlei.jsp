<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String path=request.getContextPath();

String base=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+path+"/";

%>

<!DOCTYPE html>

<html>

<head>

<!-- 要使用Bootscript的话，必须是html5文档 -->

<meta charset="UTF-8">

<!-- 移动设备优先 -->

<meta name="viewport" content="width=device-width, initial-scale=1"> 

<!-- 导入核心的css文件 -->

<link  rel="stylesheet" href="<%=base %>bootstrap/css/bootstrap.css"/>

<!-- 需要引入jQuery文件 -->

<script type="text/javascript" src="<%=base %>bootstrap/js/jquery.js"></script>

<!-- 引入BootScript的核心JS文件 -->

<script type="text/javascript" src="<%=base %>bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="<%=base %>js/jquery-1.8.3.js"></script>

<script type="text/javascript" src="<%=base %>js/ajax.js"></script>

<script type="text/javascript">

	$(function() {

		$("tr:even").css("background-color", "pink");

		$("tr:odd").css("background-color", "lightblue");
		
		//事件
		
		$("tr").mouseover(function(){
			
			$(this).css("background-color", "#ff9");
			
		});
		
		$("tr").mouseout(function(){
			
			$("tr:even").css("background-color", "pink");

			$("tr:odd").css("background-color", "lightblue");
			
		});

	});
</script>

<title>Insert title here</title>

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
				
				location.href="<%=base %>FenLeiServlet?action=delete&ids="+str;
				
			}else{
				
				location.reload();
		}
	}
	
     var outAll=document.getElementById("outAll");
	
	     outAll.onclick=function(){
		
		   var flag=confirm("你确定要导出所有的分类吗？");
		
		   if(flag){
			
			window.location.href="<%=base %>outputFenLeiServlet?action=all";
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
	 		
	 		var flag=confirm("你确定要导出选中的分类吗？");
	 		
	 		if(flag){
	 			
	 			window.location.href="<%=base %>outputFenLeiServlet?action=select&ids="+str;
	 			
	 		}else{
	 			
	 			location.reload();
	 		}
	 	}
}
 
</script>

<style type="text/css">

.table{

width:800px;

}

</style>

</head>

<body background="<%=base %>.\imgs\001.jpg">
	
		<table class="table table-striped table-hover" align="center">
			
			<h2 class="text-center text-info">查看所有分类</h2>

			<tr align="center">
			
				<td>编号</td>
				
				<td>Id</td>
				
				<td>分类名称</td>
				
				<td>删除</td>
				
				<td>修改</td>
				
			</tr>
			
			<c:forEach items="${pb.beanList }" var="fl" varStatus="s">
			
				<tr align="center">
				
					<td>${s.index+1 }</td>
					
					<td>${fl.id }</td>
					
					<td>${fl.name }</td>
					
					<td><input type="checkbox" name="ids" value="${fl.id }" /></td>
					
					<td><a href="<%=base %>changeFenlei.jsp"><button class="btn btn-info btn-xs">修改</button></a></td>
							
				</tr>
				
			</c:forEach>
			
			<tr>
				<td colspan="3"></td>
				
				<td align="center"><button id="delete1" class="btn btn-info btn-xs">删除</button></td>
				
				<td></td>
				
			</tr>
			
		</table>
		
		 <center>
		
		<p>     
		      
		      第${pb.pageNow }页/共${pb.pages }页
		      
		      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      
		      <ul class="pagination">
		   
		      <li><a href="<%=base %>FenLeiServlet?action=showFenleiByPage&pageNow=1">首页</a></li>
		      
		       &nbsp;
		       
		        <c:choose>
		       
		           <c:when test="${pb.pages<=10 }">
		           
		               <c:set var="begin" value="1"></c:set>
		               
		               <c:set var="end" value="${pb.pages }"></c:set>
		           
		           </c:when>
		           
		           <c:otherwise>
		           
		               <c:set var="begin" value="${pb.pageNow-5 }"></c:set>
		           
		               <c:set var="end" value="${pb.pageNow+4 }"></c:set>
		               
		               <c:if test="${begin<1 }">
		               
		                   <c:set var="begin" value="1"></c:set>
		                   
		                   <c:set var="end" value="10"></c:set>
		               
		               </c:if>
		               
		               
		               <c:if test="${end>=pb.pages }">
		               
		                   <c:set var="begin" value="${pb.pages-9 }"></c:set>
		                   
		                   <c:set var="end" value="${pb.pages }"></c:set>
		               
		               </c:if>
		           
		           </c:otherwise>
		       
		       </c:choose>
		       
		       <c:forEach begin="${begin }" end="${end}" var="i">
		       
		           <c:choose>
		           
		               <c:when test="${pb.pageNow==i }">
		               
		               <li class="active"><span>${i }</span></li>
		          
		               </c:when>
		               
		               <c:otherwise>
		               
		                   <li><a href="<%=base %>FenLeiServlet?action=showFenleiByPage&pageNow=${i }">${i }</a></li>
		               
		               </c:otherwise>
		           
		           </c:choose>
		       
		       </c:forEach>
		       
		       &nbsp;
		      
		      <c:if test="${pb.pageNow>1 }">
		      
		      <li><a href="<%=base %>FenLeiServlet?action=showFenleiByPage&pageNow=${pb.pageNow-1 }">上一页</a></li>
		      
		      </c:if>
		      
		       &nbsp;&nbsp;
		      
		      <c:if test="${pb.pageNow<pb.pages }">
		      
		      <li><a href="<%=base %>FenLeiServlet?action=showFenleiByPage&pageNow=${pb.pageNow+1 }">下一页</a></li>
		      
		      </c:if>
		      
		       &nbsp;&nbsp;
		      
		      <li><a href="<%=base %>FenLeiServlet?action=showFenleiByPage&pageNow=${pb.pages }">尾页</a></li>
	   
		      </ul>		            
		   
		</p>
		
		</center>
		
		<p align="center">
		
			没有您要的分类？您可以点击这里<a href="<%=base %>addFenlei.jsp" />添加分类</a>
			
		</p>
		
		<p align="center">
		
		<button id="selectall" class="btn btn-info btn-xs">全选</button>&nbsp;&nbsp;&nbsp;&nbsp;
		 
		 <button id="noselect" class="btn btn-info btn-xs">全不选</button>&nbsp;&nbsp;&nbsp;&nbsp;
		 
		 <button id="fanxuan" class="btn btn-info btn-xs">反选</button>&nbsp;&nbsp;&nbsp;&nbsp;
		
		 <button id="outAll" class="btn btn-info btn-xs">导出所有</button>&nbsp;&nbsp;&nbsp;&nbsp;
		 
		 <button id="outSelect" class="btn btn-info btn-xs">导出选中</button>
		
		</p>        
	
</body>

</html>