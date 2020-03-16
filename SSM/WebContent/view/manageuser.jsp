<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="css/manage.css"/>
<style type="text/css">td{text-align: center;} </style>
</head>
<body>
<div id="div1">
<a href="books"><input type="button" value="上一页"></a>
	<h3 align="center">管理员</h3>
	<table align="center" border=3>
		<thead>
			<tr align="center">
				<th>账号</th>
				<th>密码</th>
				<th>相关操作</th>
			</tr>
		</thead>
		<thead>
			<c:forEach items="${requestScope.admins}" var="admin">
				<tr>
					<td>${admin.name}</td>
					<td>${admin.pwd}</td>
					<td>
						<a href="changeuser.jsp?name=${admin.name}&pwd=${admin.pwd}&type=管理员" ><input type="button" value="修改"></a>
						<a href="deleteuser?name=${admin.name}&type=管理员 "><input type="button" value="删除"></a>
					</td>
				</tr>
			</c:forEach>
		</thead>
	</table><br ><br >
	<h3 align="center">普通用户</h3>
	<table align="center" border=3>
		<thead>
			<tr align="center">
				<th>账号</th>
				<th>密码</th>
				<th>密保问题</th>
				<th>答案</th>
				<th>相关操作</th>
			</tr>
		</thead>
		<thead>
			<c:forEach items="${requestScope.users}" var="user">
				<tr>
					<td>${user.name}</td>
					<td>${user.pwd}</td>
					<td>${user.problem}</td>
					<td>${user.answer}</td>
					<td>
						<a href="changeuser.jsp?name=${user.name}&pwd=${user.pwd}&type=普通用户&problem=${user.problem}&answer=${user.answer}"><input type="button" value="修改"></a>
						<a href="deleteuser?name=${user.name}&type=普通用户 "><input type="button" value="删除"></a>
					</td>
				</tr>
			</c:forEach>
		</thead>
	</table>
</div>
</body>
</html>