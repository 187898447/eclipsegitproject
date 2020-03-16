<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>图书系统  V1.0</title>
		<link rel="stylesheet" type="text/css" href="css/repeat.css"/>
		<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript">
			function determine(){
				var x= confirm("确定新增吗?")
				var bookname = document.getElementById("bookname").value.replace(/\s+/g,"")
				var author = document.getElementById("author").value.replace(/\s+/g,"")
				var type = document.getElementById("type").value.replace(/\s+/g,"")
				var price = document.getElementById("price").value.replace(/\s+/g,"")
				var number = document.getElementById("number").value.replace(/\s+/g,"")
				if(x){
					if(bookname!="" && author!="" && type=="" && price=="" && number==""){
						return true;
					}else if(isNaN(price) || isNaN(number)){
						alert("价格和数量必须是数字")
						return false
					}else if(bookname!="" && author!="" && type!="" && price!="" && number!="" && !isNaN(price) && !isNaN(number)){
						return true
					}else{
						alert("所有值皆不能为空")
						return false
					}
				}else{
					return false
				}
			}
			$(document).ready(function(){
				$("#author").blur(function(){
					$.post(
						"qureyBookWithBookName2",
						{"bookname":$("#bookname").val(),"author":$("#author").val()},
						function(x){
							if(x=="yes"){
								alert("温馨提示：本书已存在，所以只能新增一本!")
								$("#d1").css("display","none")
								$("#d2").css("display","none")
								$("#d3").css("display","none")
							}
						}
					)
				})
			})
		</script>
	</head>
	<body>
	<section id="box">
	<a href="books"><input type="button" value="上一页" ></a>
		<form action="addbook" method="post" align="center" onsubmit="return determine()">
			<jsp:include page="repeat.jsp"/>
			<input type="reset" id="reset"  value="重填" />
			<input type="submit" value="新增" />
		</form>
	</section>
	</body>
</html>