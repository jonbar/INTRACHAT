<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="../../css/index.css" type="text/css" media="all" />
	<link rel="stylesheet" href="../../css/general.css" type="text/css" media="all" />
	<title>Login</title>
</head>
<body>
	<% session.invalidate(); %>
	<form action="login.jsp" method="post">
		<table align="center" class="tableLogin">
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
					<input type="password"  name="password" id="password" class="separacion" placeholder="Contraseña" />
				</td>
			</tr>
			<tr>
				<td align="center">
					<input class="sendButton" value="Entrar" type="submit" name="login" id="login" />
				</td>
			</tr>
		</table>
	</form>
	<%
		if (request.getParameter("error") != null) {
	%>
		<div class="container">
			<div class="alert alert-danger" style="margin-top: 10px; text-align: center; margin-left: 25%; margin-right: 25%">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
				<strong>ATENCIÓN!</strong> email o contraseña incorrectos.
			</div>
		</div>
	<%
		}
	%>
</body>
</html>