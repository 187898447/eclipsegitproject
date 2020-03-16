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
				var x= confirm("确定修改吗?")
				var bookname = document.getElementById("bookname").value.replace(/\s+/g,"")
				var author = document.getElementById("author").value.replace(/\s+/g,"")
				var type = document.getElementById("type").value.replace(/\s+/g,"")
				var price = document.getElementById("price").value.replace(/\s+/g,"")
				var number = document.getElementById("number").value.replace(/\s+/g,"")
				if(x){
					if(bookname!="" && author!="" && type!="" && price!="" && number!="" && !isNaN(price) && !isNaN(number)){
						return true
					}else if(isNaN(price) || isNaN(number)){
						alert("价格和数量必须是数字")
						return false
					}else{
						alert("所有值皆不能为空")
						return false
					}
				}else{
					return false
				}
			}
			$(document).ready(function(){
				var op = $("option")
				for(var i=0;i<op.length;i++){
					if(op[i].value == $("#hi").val()){
						op[i].selected  = "selected "
					}
				}
			})
		</script>
	</head>
	<body>
	<div id="box">
		<a href="books"><input type="button" value="上一页" ></a>
		<input type="hidden" id="hi"  value="${param.type}" />
		<form action="changebook" method="post" onsubmit="return determine()">
			<jsp:include page="repeat.jsp?id=${param.id}&bookname=${param.bookname}&author=${param.author}&price=${param.price}&number=${param.number}" flush="true"/>
			<input type="reset"  value="重填" />
			<input type="submit" value="更新"/>
		</form>
	</div>
	</body>
</html>