<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" isErrorPage="true" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>图书系统  V1.0</title>
<script type="text/javascript">
		var fromurl = window.location.href
		if(fromurl.indexOf("index")!=-1){
			alert("登陆成功!")
			window.location.href="books"
		}else if(fromurl.indexOf("addbook")!=-1){
			alert("新增成功!")
			window.location.href="books"
		}else if(fromurl.indexOf("changebook")!=-1){
			alert("修改成功!")
			window.location.href="books"
		}else if(fromurl.indexOf("addUser")!=-1){
			alert("新增成功!")
			window.location.href="MyServlet"
		}else if(fromurl.indexOf("setpwd")!=-1){
			alert("修改成功!")
			window.location.href="MyServlet"
		}else if(fromurl.indexOf("deletebook")!=-1){
			alert("删除成功!")
			window.location.href="books"
		}else if(fromurl.indexOf("addbbooks")!=-1){
			alert("借书成功!")
			window.location.href="books"
		}else if(fromurl.indexOf("rbooks")!=-1){
			alert("还书成功!")
			window.location.href="books"
		}else if(fromurl.indexOf("changepwd")!=-1){
			alert("修改成功!")
			window.location.href="MyServlet"
		}else if(fromurl.indexOf("manageuser")!=-1){
			window.location.href="manageuser.jsp"
		}else if(fromurl.indexOf("changeuser")!=-1){
			alert("修改成功!")
			window.location.href="manageuser"
		}else if(fromurl.indexOf("deleteuser")!=-1){
			alert("删除成功!")
			window.location.href="manageuser"
		}
		
	</script>
</head>
<body>
	<%session.setMaxInactiveInterval(60*10); %>
</body>
</html>