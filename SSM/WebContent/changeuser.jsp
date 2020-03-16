<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>图书系统  V1.0</title>
<link rel="stylesheet" type="text/css" href="css/repeat.css"/>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var type = document.getElementById("type").value.replace(/\s+/g,"")
			var problem = document.getElementById("problem").value.replace(/\s+/g,"")
			if(type=="管理员"){
				$("#d1").css("display","none")
				$("#d2").css("display","none")
			}
			var op = $("option")
			for(var i=0;i<op.length;i++){
				if(op[i].value == problem){
					op[i].selected  = "selected "
				}
			}
		})
		function determine(){
				var pwd = document.getElementById("pwd").value.replace(/\s+/g,"")
				var type = document.getElementById("type").value.replace(/\s+/g,"")
				var problem = document.getElementById("problem").value.replace(/\s+/g,"")
				var answer = document.getElementById("answer").value.replace(/\s+/g,"")
				var x= confirm("确定修改吗?")
				if(x){
					if(pwd!="" && type=="管理员"){
						return true
					}else if(pwd!="" && type=="普通用户" && problem!="" && answer!="" && !isNaN(pwd)){
						return true
					}else if(pwd!="" && type=="普通用户" && problem!="" && answer!="" && isNaN(pwd)){
						alert("密码必须是数字")
						return false
					}else{
						alert("所有选项皆不能为空")
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
	<input type="hidden" id="problem" value="${param.problem }">
	<form action="changeuser"  method="post" align="center" onsubmit="return determine()">
		<input type="hidden" id="type" name="type" value="${param.type}">
		<input type="hidden" name="name" value="${param.name}">
		账号：<input type="text" value="${param.name}" disabled ="disabled" /><br /><br />
		密码：<input type="text" name="pwd" id="pwd" value="${param.pwd}" /><br /><br />
		<div id="d1">问题：<select name="problem" value="${param.problem }">
		 		<option value="" ></option>
				<option value="姓名" >姓名</option>
				<option value="生日" >生日</option>
			 </select><br /><br /></div>
		<div id="d2">答案：<input type="text" name="answer" id="answer" value="${param.answer}" /><br /><br /></div>
		<input type="reset" id="reset" value="重填" />
		<input type="submit" id="add" value="修改" />
	</form>
</section>
</body>
</html>