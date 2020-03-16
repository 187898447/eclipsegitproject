<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="java.text.*" import="java.util.Date" errorPage="" %>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>图书系统  V1.0</title>
		<link href="css/index.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript">
			window.onload = function (){
				var hi = document.getElementById("hi").value
				var save = document.getElementById("save")
				if(hi=="yes"){
					save.checked = "checked"
				}
			}
			function isNull(){
				var name = document.getElementById("name").value.replace(/\s+/g,"")
				var pwd = document.getElementById("pwd").value.replace(/\s+/g,"")
				if(name!="" && pwd!="" && !isNaN(pwd) ){
					return true
				}else if(name!="" && pwd!="" && isNaN(pwd)){
					alert("密码必须是数字")
					return false
				}else{
					alert("账号或密码不能为空")
					return false
				}
			}
			function blank() {
				var name = document.getElementById("name")
				var pwd = document.getElementById("pwd")
				var save = document.getElementById("save")
				name.value=""
				pwd.value=""
				save.checked = false
			}
		</script>
	</head>
	<body>
	<%session.invalidate(); %>
		<table border="3px" align="center">
			<thead>
				<tr>
					<td id="div1" align="center">图书管理系统.v1</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center"><img src="img/星空3.gif" alt="非常好看的图片"/></td>
				</tr>
				<tr>
					<td>
						<form action="index" method="post" onsubmit="return isNull()">
							账号名称:<input id="name" type="text" name="name" value="${requestScope.uname}"><br /><br />
							登录密码:<input id="pwd" type="password" name="pwd" value="${requestScope.upwd}"><br />
							<a href="getpwd.jsp" >忘记密码</a>
							<input type="hidden" name="save" value="0">
							<input type="checkbox" id="save" name="save" style="margin-left: 330px">记住密码<br />
					     	<input type="button" value="重填" onclick="blank()" />
					      	<input id="btn1" type="submit" value="登录"  />
				        </form>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" id="hi" value="${requestScope.save}">
	</body>
</html>