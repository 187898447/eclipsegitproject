<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>图书系统  V1.0</title>
</head>
<body>
	<script type="text/javascript">
	var fromurl = window.location.href
	if(fromurl.indexOf("index")!=-1){
		alert("登陆失败!账号或密码错误!如果未注册，请联系管理员添加!")
		window.location.href="books"
	}else if(fromurl.indexOf("addbook")!=-1){
		alert("新增失败!")
		window.location.href="books"
	}else if(fromurl.indexOf("changebook")!=-1){
		alert("修改失败!")
		window.location.href="books"
	}else if(fromurl.indexOf("addUser")!=-1){
		alert("新增失败!用户名重复!")
		window.location.href="addUser.jsp"
	}else if(fromurl.indexOf("setpwd")!=-1){
		alert("修改失败，问题答案错误!")
		window.location.href="MyServlet"
	}else if(fromurl.indexOf("deletebook")!=-1){
		alert("删除失败!请联系管理员！")
		window.location.href="books"
	}else if(fromurl.indexOf("addbbooks")!=-1){
		alert("借书失败!")
		window.location.href="books"
	}else if(fromurl.indexOf("rbooks")!=-1){
		alert("还书失败，你没有借过这本书!")
		window.location.href="books"
	}else if(fromurl.indexOf("changepwd")!=-1){
		alert("修改失败!")
		window.location.href="MyServlet"
	}else if(fromurl.indexOf("manageuser")!=-1){
		window.location.href="manageuser.jsp"
	}else if(fromurl.indexOf("changeuser")!=-1){
		alert("修改失败!")
		window.location.href="manageuser"
	}else if(fromurl.indexOf("deleteuser")!=-1){
		alert("删除失败!")
		window.location.href="manageuser"
	}
	</script>
</body>
</html>