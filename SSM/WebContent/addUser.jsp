<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>图书系统  V1.0</title>
<link rel="stylesheet" type="text/css" href="css/repeat.css"/>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		function determine(){
			var x= confirm("确定新增吗?")
			var name = document.getElementById("name").value.replace(/\s+/g,"")
			var pwd = document.getElementById("pwd").value.replace(/\s+/g,"")
			var type = document.getElementById("type").value.replace(/\s+/g,"")
			var problem = document.getElementById("problem").value.replace(/\s+/g,"")
			var answer = document.getElementById("answer").value.replace(/\s+/g,"")
			if(x){
				if(name!="" && pwd!="" && type=="管理员"){
					return true
				}else if(name!="" && pwd!="" && type=="普通用户" && problem!="" && answer!="" && !isNaN(pwd)){
					return true
				}else if(name!="" && pwd!="" && type=="普通用户" && problem!="" && answer!="" && isNaN(pwd)){
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
		
		$(document).ready(function(){
			$("#name").blur(function(){
				if(($("#name").val()!="")){
					$.post(
						"qureyUserWhithName",
						{"name":$("#name").val()},
						function(x){
							if(x=="yes"){
								alert("本账号已存在，请更换账号名！")
								$("#d4").css("display","none")
								$("#d3").css("display","none")
								$("#d1").css("display","none")
								$("#d2").css("display","none")
								$("#add").attr("disabled", true)
							}else{
								$("#pwd").val("")
								$("#type").val("")
								$("#problem").val("")
								$("#answer").val("")
								$("#d3").css("display","block")
								$("#d4").css("display","block")
								$("#d1").css("display","block")
								$("#d2").css("display","block")
								$("#add").attr("disabled", false)
							}
						}
					)
				}else{
					$("#d4").css("display","none")
					$("#d3").css("display","none")
					$("#d1").css("display","none")
					$("#d2").css("display","none")
					$("#add").attr("disabled", true)
				}
			})
			
			$("#type").change(function(){
				if($("#type").val()=="管理员"){
					$("#d3").css("display","none")
					$("#d4").css("display","none")
				}else{
					$("#d3").css("display","block")
					$("#d4").css("display","block")
				}
			})
			
			$("#reset").click(function(){
				$("#d3").css("display","block")
				$("#d4").css("display","block")
				$("#d1").css("display","block")
				$("#d2").css("display","block")
			})
		})
	</script>
</head>
<body>
<section id="box">
	<a href="books"><input type="button" value="上一页" ></a>
	<form action="addUser"  method="post" align="center" onsubmit="return determine()">
		账号：<input type="text" name="name" id="name" /><br /><br />
		<div id="d1">密码：<input type="text" name="pwd" id="pwd" /><br /><br /></div>
		<div id="d2">权限：<select id="type" name="type">
				<option value="" ></option>
				<option value="管理员" >管理员</option>
				<option value="普通用户" >普通用户</option>
			 </select><br /><br /></div>
		 <div id="d3" style="margin-right: 2em">密保问题：<select id="problem" name="problem">
		 		<option value="" ></option>
				<option value="姓名" >姓名</option>
				<option value="生日" >生日</option>
			 </select><br /><br /></div>
		<div id="d4">答案：<input type="text" name="answer" id="answer" /><br /><br /></div>
		<input type="reset" id="reset" value="重填" />
		<input type="submit" id="add" value="新增" />
	</form>
</section>
</body>
</html>