<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- 1.要使用Bootstrap的话，必须是html5文档 -->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="js/Ajax.js"></script>

<!-- <script>
	window.onload = function() {
		ajax({
			method : "POST",
			url : "fenleiServlet",
			params : "action=updateShowfenlei",
			type : "xml",
			
	        succest : function(date) {

	        	alert("ok");
				var select = document.getElementById("fenleiList");
				var names = date.getElementsByTagName("name");
				for (var i = 0; i < names.length; i++) {
					var name = names[i];
					var opt = document.createElement("option");
					var value;
					if (window.addEventListener) {
						value = name.textContent;
					} else {
						value = name.text;
					}
					opt.innerHTML = value;
					opt.value = value;//没有给value属性：：：
					select.appendChild(opt);

				}
			}
		});
	}
</script> -->
<title>查看图书</title>
<script>
	window.onload = function() {

		ajax({
			method : "POST",
			url : "fenleiServlet",
			params : "action=updateShowfenlei",
			type : "xml",

			succest : function(date) {

				//alert("ok");
				var select = document.getElementById("fenleiList");
				var names = date.getElementsByTagName("name");
				for (var i = 0; i < names.length; i++) {
					var name = names[i];
					var opt = document.createElement("option");
					var value;
					if (window.addEventListener) {
						value = name.textContent;
					} else {
						value = name.text;
					}
					opt.innerHTML = value;
					opt.value = value;//没有给value属性：：：
					select.appendChild(opt);
				}
			}
		});

		var selectAll = document.getElementById("selectAll");
		var flag = false;
		selectAll.onclick = function() {

			var chek = document.getElementsByName("ids");
			for (var i = 0; i < chek.length; i++) {
				chek[i].checked = true;
			}
		};
		var noselectAll = document.getElementById("noselectAll");
		noselectAll.onclick = function() {
			var chek = document.getElementsByName("ids");
			for (var i = 0; i < chek.length; i++) {
				chek[i].checked = false;
			}
		};
		var fanxuan = document.getElementById("fanxuan");
		fanxuan.onclick = function() {
			var chek = document.getElementsByName("ids");
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					chek[i].checked = false;
				} else {
					chek[i].checked = true;
				}
			}
		}
		var deletes = document.getElementById("deletes");
		deletes.onclick = function() {
			var chek = document.getElementsByName("ids");
			//判断一下：
			var flag = false;
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {//里面有选中的：：
					flag = true;
					break;
				}
			}
			if (flag == false) {
				alert("请至少选择一个进行删除：：");
				return;
			}
			//如果他选择了，拿到value值：：
			var str = "";
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					str += chek[i].value + ",";

				}
			}//祛除最后一个逗号：
			str = str.slice(0, str.length - 1);
			//发送给服务器：
			var que = confirm("请确认你要删除这些图书吗？")
			if (que == true) {
				location.href = "bookServlet?action=delete&ids=" + str;
			} else {
				location.reload();
			}
		}
		//	var outall = document.getElementById("outall");

		//outall.onclick = function() {
		//	var que = confirm("你确定要导出这些图书的信息吗？")
		//if (que == true) {
		//	window.location.href = "outputbookServlet?action=all";
		//	}
		//};
		//var outselect = document.getElementById("outselect");
		//var chek = document.getElementsByName("ids");
		//outselect.onclick = function() {
		//var flag = false;
		//for (var i = 0; i < chek.length; i++) {
		//	if (chek[i].checked == true) {//里面有选中的：：
		//	flag = true;
		//	break;
		//	}
		//}
		//if (flag == false) {
		///	alert("请至少选择一个进行删除：：");
		//	return;
		//	} else {
		//var str = "";

		//for (var i = 0; i < chek.length; i++) {

		//if (chek[i].checked == true) {

		//str += chek[i].value + ",";

		//	}
		//}
		//str = str.slice(0, str.length - 1);
		//var flage = confirm("你确定导出选中的图书信息？");
		//if (flage) {//确定
		//window.location.href = "outputbookServlet?action=outselect&ids="
		//	+ str;
		//	}
		//	}
		;
		//}
	}
</script>
<style>
table {
	margin-top: 40px;
}
</style>
</head>
<body background="image/6.jpg">

	<br />
	<p align="center">
		<font size="6" color="blue">查看图书信息</font>
	</p>
	<li class="dropdown"><a href="#" class="dropdown-toggle"
		data-toggle="dropdown">高级搜索<span class="caret"></span></a>
		<ul class="dropdown-menu dropdown-menu" role="menu">
			<li>
				<form action="bookServlet" class="form-horizontal">

					<input type="hidden" name="action" value="findBookByWhere">
					<div class="control-group">
						<br> <label class="col-sm-4  control-label">选择分类：</label>
						<div class="controls col-sm-6 ">
							<select name="f_name" id="fenleiList"
								class="form-control  input-sm">
								<option value="0">----请选择----</option>
							</select><br>
						</div>
					</div>
					<div class="control-group">
						<label class="col-sm-4  control-label">书名:</label>
						<div class="controls col-sm-6 ">
							<input name="name" type="text" class="form-control  input-sm" /><br>
						</div>
					</div>
					<div class="control-group">
						<label class="col-sm-4 control-label"> 出版社:</label>
						<div class="controls  col-sm-6">
							<input name="chubanshe" type="text"
								class="form-control  input-sm" /><br>
						</div>
					</div>

					<div class="control-group">
						<label class="col-sm-4 control-label">借书人:</label>
						<div class="controls  col-sm-6">
							<input name="sp" type="text" class="form-control  input-sm" /><br>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label col-sm-4 "> 状态:</label>
						<div class="controls  col-sm-6">
							<input name="zhuangtai" type="text"
								class="form-control  input-sm" /><br>
						</div>
					</div>

					<div class="control-group">

						<div class="controls ss">
							<button type="submit" class="btn   btn-info ">
								<span class="glyphicon glyphicon-search"></span> 开始搜索
							</button>
							<br> <br>
						</div>
					</div>

				</form>
			</li>

		</ul></li>
	</ul>

	<table border="1" width="800px" height="500px" align="center"
		cellspacing="0" background="6.jpg">
		<tr align="center">
			<td>选择</td>
			<td>编号</td>
			<td>分类</td>
			<td>名称</td>
			<td>价格</td>
			<td>出版社</td>
			<td>状态</td>
			<td>借出人</td>

			<td>是否修改</td>
			<!-- 		<td>删除</td>
				<td>修改</td> -->
		</tr>
		<c:forEach items="${pb.beanList }" var="f" varStatus="s">

			<tr align="center" valign="middle">
				<td><input type="checkbox" name="ids" value="${f.id }" /></td>

				<td>${s.index+1}</td>
				<!-- 下标是从0开始的： -->
				<td>${f.f_name}</td>
				<td>${f.name}</td>
				<td>${f.price}</td>
				<td>${f.chubanshe}</td>
				<td>${f.zhuangtai}</td>
				<td>${f.sp}</td>
				<!--<td colspan="4">
					<input type="button" value="删除"/></td>-->
				<td><a
					href="bookServlet?action=showOne&id=${f.id }&pageNow=${pb.pageNow}"><button
							class="btn btn-warning  btn-xs">修改</button></a></td>
			</tr>
		</c:forEach>
		<tr align="center">
			<td colspan="9">
				<button id="selectAll" class="btn btn-info btn-xs">全选
					&nbsp;&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="noselectAll" class="btn btn-info btn-xs">全不选
					&nbsp;&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="fanxuan" class="btn btn-info btn-xs">反选
					&nbsp;&nbsp;&nbsp;&nbsp;</button>
				<button id="outselect" class="btn btn-info btn-xs">导出勾选
					&nbsp;&nbsp;&nbsp;&nbsp;</button>
				<button id="outall" class="btn btn-info btn-xs">导出全部
					&nbsp;&nbsp;&nbsp;&nbsp;</button>
			</td>
		</tr>
		<!--   <tr align="center"  >
  <td colspan="4"> <button id="deletes"><input type="submit" value="删除"/>删除</button></td>
   </tr> -->
		<tr align="center">
			<td colspan="9">
				<button id="deletes" class="btn btn-danger btn-xs">删除</button>
			</td>
		</tr>
	</table>
	<p>
	<p>
	<center>
		第${pb.pageNow }页/共${pb.pages }页 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<!--  	href="bookServlet?action=showbookByPage&pageNow=1">首页</a>-->
		<a href="${pb.url}&pageNow=1">首页</a>
		&nbsp;&nbsp;
		<c:if test="${pb.pageNow>1 }">
			<a href="${pb.url}&pageNow=${pb.pageNow-1 }">上一页</a>
		</c:if>
		&nbsp;
		<!-- 分两种情况：
		         1,如果页数小于10：1，到pages；
		       2,  如果页数大于10：要变
		         
		        -->
		<c:choose>
			<c:when test="${pb.pages<=10 }">
				<c:set var="begin" value="1"></c:set>
				<!-- 设置俩个变量 -->
				<c:set var="end" value="${pb.pages }"></c:set>
				<!--  -->
			</c:when>
			<c:otherwise>
				<!--  -->
				<c:set var="begin" value="${pb.pageNow-5 }"></c:set>
				<c:set var="end" value="${pb.pageNow+4 }"></c:set>
				<c:if test="${begin<=1 }">
					<!--过滤负数  -->
					<c:set var="begin" value="1"></c:set>
					<c:set var="end" value="10"></c:set>
				</c:if>
				<c:if test="${end>=pb.pages }">
					<!-- 防止尾移除 -->
					<c:set var="begin" value="${pb.pages-9 }"></c:set>
					<c:set var="end" value="${pb.pages }"></c:set>
				</c:if>
			</c:otherwise>
		</c:choose>
		<!-- 循环十个数  首先第一个数！！    -->
		<c:forEach begin="${begin }" end="${end }" var="i">
			<c:choose>
				<c:when test="${pb.pageNow==i }">
		                  [${i}]<!-- 显示普通的当前页i -->
				</c:when>
				<c:otherwise>
					<a href="${pb.url}&pageNow=${i}">[${i}]</a>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		&nbsp;
		<c:if test="${pb.pageNow<pb.pages }">
			<a href="${pb.url}&pageNow=${pb.pageNow+1 }">下一页</a>
		</c:if>
		&nbsp;&nbsp; <a
			href="${pb.url}&pageNow=${pb.pages }">尾页</a>
	</center>

	</table>

	<p align="center">
		没有找到指定图书？点击这里<a href="addbook.jsp">添加图书</a>
	</p>
</body>
</html>