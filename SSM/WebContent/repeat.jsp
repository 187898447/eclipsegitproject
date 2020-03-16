<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>图书系统  V1.0</title>
	</head>
	<body>
		<input type="hidden" name="id" value="${param.id}">
		书名：<input type="text" id="bookname" name="bookname" value="${param.bookname}" /><br /><br />
		作者：<input type="text" id="author" name="author" value="${param.author}" /><br /><br />
		<section id="d1">类型：<select id="type" name="type" value="${param.type}" >
				<option></option>
				<option value="经典著作" >经典著作</option>
				<option value="历史地理" >历史地理</option>
				<option value="社会科学" >社会科学</option>
				<option value="休闲图书" >休闲图书</option>
			</select><br /><br /></section>
		<div id="d2">价格：<input type="text" id="price" name="price" value="${param.price}" /><br /><br /></div>
		<div id="d3">数量：<input type="text" id="number" name="number" value="${param.number}" /><br /><br /></div>
	</body>
</html>