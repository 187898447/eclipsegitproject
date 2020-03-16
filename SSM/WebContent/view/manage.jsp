<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="java.text.*" import="java.util.Date" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="Expires" content="0">
		<title>图书系统  V1.0</title>
		<link rel="stylesheet" type="text/css" href="css/manage.css"/>
	</head>
	<body>
	<input type="hidden" id="admin" value="<% if(session.getAttribute("adminname")!=null)out.print(session.getAttribute("adminname")); %>">
		<div id="div1">
			<div id="div3" align="center">图书管理系统.v1</div><br />
			<div>
				<span id="sp1">当前用户：<%
				if(session.getAttribute("adminname")!=null){
					if(session.getAttribute("adminname").equals("admin")){
						out.print(session.getAttribute("adminname")+"(最高管理员)");
					}else{
						out.print(session.getAttribute("adminname")+"(管理员)");
					}
				}else{
					out.print(session.getAttribute("username"));
				}
				%>
				</span>
				<a href="MyServlet"><input type="button" id="dbt5" value="退出登录" /></a>
				<span id="sp2"><%SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd EEEE");out.print(df.format(new Date()));%></span><br />
			</div><br />
			<div>
				<a href="addUser.jsp"><input type="button" id="adduser" value="新增用户" /></a>
				<a href="newbook.jsp"><input type="button" id="dbt" value="新增图书" /></a>
				<a href="manageuser"><input type="button" id="dbt4" value="管理用户" /></a>
				<a href="changepwd.jsp?name=${sessionScope.username}"><input type="button" id="dbt2" value="更改密码" /></a>
				<div id="div2">
					<form action="qureybook" method="post">
						书名：<input type="text" name="bookname" />
						<input type="submit" value="搜索" ><br /><br />
					</form>
					<form action="qureyBookWithType" method="post">
						类型：<select id="type" name="type">
								<option></option>
								<option value="经典著作" >经典著作</option>
								<option value="历史地理" >历史地理</option>
								<option value="社会科学" >社会科学</option>
								<option value="休闲图书" >休闲图书</option>
							</select>
					<input type="submit" value="搜索" ><br /><br />
			</form>
				</div>
			</div><br />
			<div style="width: 700px">
				<span id="sp3">书籍总数：${requestScope.booksnumber}</span>
				<a href="books"><input type="button" id="dbt4" value="查看全部书籍" /></a>
				<a href="mybbooks?name=${sessionScope.username}"><input type="button" id="dbt3" value="我借的书" /></a>
			</div><br />
			<table align="center" border="3px">
				<thead>
					<tr align="center">
						<th>编号</th>
						<th>书名</th>
						<th>作者</th>
						<th>类型</th>
						<th>价格</th>
						<th>数量</th>
						<th>操作</td>
					</tr>
				</thead>
				<thead>
					<c:forEach items="${requestScope.books}" var="book">
						<tr>
							<td id="bookid">${book.id}</td>
							<td>${book.bookname}</td>
							<td>${book.author}</td>
							<td>${book.type}</td>
							<td>${book.price}</td>
							<td>${book.number}</td>
							<td>
								<a class="a1" href="changebook.jsp?id=${book.id}&bookname=${book.bookname}&type=${book.type}&author=${book.author}&price=${book.price}&number=${book.number}"><input type="button" value="修改图书"></a>
								<a class="a2" href="deletebook?id=${book.id}&bookname=${book.bookname}" onclick="return determine()"><input type="button" value="删除图书"></a>
								<a class="a3" href="addbbooks?name=${sessionScope.username}&bookname=${book.bookname}&number=${book.number}"><input type="button" value="借书"></a>
								<a class="a4" href="rbooks?name=${sessionScope.username}&bookname=${book.bookname}&number=${book.number}"><input type="button" value="还书"></a>
							</td>
						</tr>
					</c:forEach>
				</thead>
			</table>
			<c:forEach items="${sessionScope.mybbooks}" var="mybbook">
				<span class="mybbook" hidden>${mybbook.bookname}</span>
			</c:forEach>
		</div>
	</body>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	if($("#admin").val()!=""){
		var a3 = $(".a3")
		var a4 = $(".a4")
		for(var i=0;i<a3.length;i++){
			a3[i].style.display = "none"
			a4[i].style.display = "none"
		}
		if($("#admin").val()!="admin"){
			$("#adduser").css("display", "none")
			$("#dbt4").css("display", "none")
		}
		$("#dbt2").css("display", "none")
		$("#dbt3").css("display", "none")
	}else{
		var a1 = $(".a1")
		var a2 = $(".a2")
		for(var i=0;i<a1.length;i++){
			a1[i].style.display = "none"
			a2[i].style.display = "none"
		}
		var a3 = $(".a3")
		var a4 = $(".a4")
		for(var i=0;i<a3.length;i++){
			a3[i].children[0].style.backgroundColor = "#00FFFF"
			a4[i].children[0].style.backgroundColor = "red"
			a3[i].children[0].style.color = "black"
			a4[i].children[0].style.color = "black"
		}
		$("#adduser").css("display", "none")
		$("#dbt").css("display", "none")
		$("#dbt4").css("display", "none")
	}
	function determine(){
		var x= confirm("确定删除吗?")
		if(!x){
			return false
		}
	}
	var mybbook = $(".mybbook")
	var td = $("td")
	for(var i=0;i<mybbook.length;i++){
		for(var j=0;j<td.length;j++){
			if(mybbook[i].innerHTML==td[j].innerHTML){
				td[j+5].children[2].children[0].setAttribute("disabled", true)
				td[j+5].children[2].children[0].style.backgroundColor = "red"
				td[j+5].children[2].children[0].style.color = "black"
				td[j+5].children[3].children[0].style.backgroundColor = "#00FFFF"
				td[j+5].children[3].children[0].style.color = "black"
			}
		}
	}
	</script>
</html>