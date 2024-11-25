<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Login JEE</title>
	</head>
	<body>
		<br method="post" action="VerifLogin">
			<label for="username">Username : </label>
			<input type="text" name="username" id="username" />
			<br>
			<br>
			<label for="password">Password : </label>
			<input type="password" name="password" id="password" />
			<br>
			<br>
			<input type="radio" id="student" name="status" value="HTML">
			<label for="student">Student</label><br>
			<input type="radio" id="professor" name="status" value="CSS">
			<label for="professor">Professor</label><br>
			<input type="radio" id="admin" name="status" value="JavaScript">
			<label for="admin">Admin</label>
			<input type="submit" />
		</form>

		<% if(request.getAttribute("message")!=null){ %>
			<%=request.getAttribute("message")%>
	<%}%>



	</body>
</html>