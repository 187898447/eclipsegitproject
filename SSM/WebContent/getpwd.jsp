<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>图书系统  V1.0</title>
<link rel="stylesheet" type="text/css" href="css/repeat.css"/>
</head>
<body>
<section id="box">
	<a href="MyServlet"><input type="button" value="上一页" ></a>
	<form action="setpwd" method="post" align="center" onsubmit="return determine()">
		账号：<input type="text" name="name" id="name" /><br /><br />
		<input type="hidden" name="problem" id="hi"  />
		<div style="display:none">问题：<input type="text" name="problem" id="problem" disabled="disabled"  /><br /><br /></div>
		<div style="display:none">答案：<input type="text" name="answer" id="answer"  /><br /><br /></div>
		<div style="display:none">新密码：<input type="text" name="pwd" id="pwd" /><br /><br /></div>
		<input type="reset" id="reset" value="重填" />
		<input type="submit" id="add" value="更改" />
	</form>
</section>
</body>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function determine(){
		var x= confirm("确定更改吗?")
		var name = document.getElementById("name").value.replace(/\s+/g,"")
		var pwd = document.getElementById("pwd").value.replace(/\s+/g,"")
		var problem = document.getElementById("problem").value.replace(/\s+/g,"")
		var answer = document.getElementById("answer").value.replace(/\s+/g,"")
		if(x){
			if(name!="" && pwd!="" && problem!="" && answer!=""){
				return true
			}else if($("div").css("display")=="none"){
				alert("本账号未注册，请联系最高管理员注册账号！")
				return false
			}else{
				alert("所有选项皆不能为空")
				return false
			}
		}
	}
	$("#name").blur(function(){
		if($("#name").val().indexOf("admin")>=0){
			alert("您是管理员，无法找回密码")
			$("div").css("display","none")
		}else if($("#name").val()!=""){
			$.ajax({
				url:"getpwd",
				type:"post",
				data:{"name":$("#name").val()},
				dataType:"text",
				contentType:"application/x-www-form-urlencoded; charset=utf-8",
				async:true,
				success:function(x){
					if(x=="no"){
						alert("本账号未注册，请联系最高管理员注册账号！")
						$("div").css("display","none")
						$("#add").attr("disabled", true)
					}else{
						$("#hi").attr("value",x)
						$("#problem").attr("value",x)
						$("div").css("display","block")
						$("#add").attr("disabled", false)
					}
	            }
			});
		}else{
			$("div").css("display","none" )
			$("#add").attr("disabled", true)
		}
	})
	$("#reset").click(function(){
		$("div").css("display","block" )
		$("#add").attr("disabled", false)
	})
</script>
</html>