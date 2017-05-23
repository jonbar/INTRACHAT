<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
</head>
<body style="background-color:#E6E6E6">
	<form action="login.jsp" method="post">
		

		<table align="center" style="margin-top: 20%">
			<tr>
				<td align="center"><img style="margin-bottom: 15px" src="../../img/eroski_logo.png" align="middle" width="75px" height="75px"/></td>		
			</tr>
			<tr>
				<td>
					<input type="text" name="user" id="user" placeholder="Email"/>
				</td>
			</tr>
			<tr style="margin-top: 50px;">
				<td>
					<input type="password"  name="password" id="password" style="margin-top: 5px" placeholder="Contraseña" />
				</td>
			</tr>
			<tr>
				<td align="center">
					<input style="height:25px; margin-top:10px; border-radius: 5px" value="Entrar" type="submit" name="login" id="login" />
				</td>
			</tr>
		</table>
	</form>
	<%
		if (request.getParameter("error") != null) {
	%>
			<br>
			<div><p style="background-color:#ff9999; display:inline">Usuario o contraseña incorrectos.</p></div>
	
	<%
		}
	%>
</body>
</html>