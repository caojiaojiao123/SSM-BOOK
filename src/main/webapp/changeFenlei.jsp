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

<title>Insert title here</title>

<script type="text/javascript" src="js/ajax.js"></script>

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

<style type="text/css">

.table{

width:500px;

}

</style>

<script type="text/javascript" src="js/ajax.js"></script>

<script type="text/javascript">

window.onload=function(){
	
	var select=document.getElementById("fenleiList");
	
	ajax({
		
		method:"POST",
	
	    url:"FenLeiServlet",
	
	    params:"action=changeFenlei",
	
	    type:"xml",
	
	    success:function(data){
	    	
	    	var names=data.getElementsByTagName("name");
			
			for(var i=0;i<names.length;i++){
				
				var name=names[i];
				
				var opt=document.createElement("option");
				
				var value;
				
				if(window.addEventListener){
					
					value=name.textContent;
					
				}else{
					
					value=name.text;
				}
				
				opt.innerHTML=value;
				
				opt.value=value;
				
				select.appendChild(opt);
				
		    }
		
	    }
		
	});
};
		
	/*	
	
	var xmlhttp=getXMLHttpRequest();
		
		xmlhttp.open("POST","FenLeiServlet",true);
		
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		
		xmlhttp.send("action=changeFenlei");
		
		xmlhttp.onreadystatechange=function(){
			
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				
				var content=xmlhttp.responseXML;
				
				var names=content.getElementsByTagName("name");
				
				for(var i=0;i<names.length;i++){
					
					var name=names[i];
					
					var opt=document.createElement("option");
					
					var value;
					
					if(window.addEventListener){
						
						value=name.textContent;
						
					}else{
						
						value=name.text;
					}
					
					opt.innerHTML=value;
					
					opt.value=value;
					
					select.appendChild(opt);
					
			    }
			}
		}
	}*/

</script>

</head>

<body background=".\imgs\001.jpg">

	<form action="FenLeiServlet?action=update" method="post">
	
		<table class="table table-striped table-hover" align="center">
			
			<h2 class="text-center text-info">修改分类</h2>
			
			<tr align="center">
			
				<td>请选择您要修改的分类</td>
				
				<td><select name="name" id="fenleiList">
				
				<option>--请选择你要修改的分类--</option>
				
				<%-- 		 <c:forEach items="${updateList }" var="fenlei">
						
							<option>${fenlei.name }</option>
							
						</c:forEach>--%>
						
				</select></td>
				
			</tr>
			
			<tr align="center">
			
				<td>请输入新的分类名称</td>
				
				<td><input type="text" name="newname" /></td>
				
			</tr>
			
			<tr align="center">
			
				<td colspan="2"><button class="btn btn-danger">修改</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-danger">清空</button></td>
					
			</tr>
			
		</table>
		
	</form>
	
</body>

</html>