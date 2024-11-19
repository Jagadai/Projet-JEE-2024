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
			<input type="submit" />
			<br> <p> ${ reponse }</p>
		</form>
	</body>
</html>