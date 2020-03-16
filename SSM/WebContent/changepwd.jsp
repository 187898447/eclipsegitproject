<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>图书系统  V1.0</title>
		<link rel="stylesheet" type="text/css" href="css/repeat.css"/>
		<script type="text/javascript">
			function determine(){
				var x= confirm("确定修改吗?")
				var pwd = document.getElementById("pwd").value.replace(/\s+/g,"")
				if(x){
					if(pwd!="" && !isNaN(pwd) ){
						return true
					}else if(isNaN(pwd)){
						alert("密码必须是数字")
						return false
					}else if(pwd==""){
						alert("新密码不能为空")
						return false
					}
				}else{
					return false
				}
			}
		</script>
	</head>
	<body>
	<section id="box">
		<a href="books"><input type="button" value="上一页" ></a>
		<form action="changepwd" method="post" onsubmit="return determine()">
			<input type="hidden" name="name" value=${param.name }>
			新密码：<input type="text" name="pwd" id="pwd"><br />
			<input type="reset"  value="重填" />
			<input type="submit" value="更新"/>
		</form>
	</section>
	</body>
</html>