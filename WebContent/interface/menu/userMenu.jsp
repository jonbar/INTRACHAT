<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../../css/menu.css" type="text/css" media="all" />
<link rel="stylesheet" href="../../css/general.css" type="text/css" media="all" />
<title>Menu</title>
</head>
<body>
<%@ page import="es.eroski.intrachat.models.*"%>
	<%@ page import="es.eroski.intrachat.classes.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.sql.* "%>
<% User user = (User) session.getAttribute("User");
if (user.getWorkstation().equals("Director")) {
	response.sendRedirect("adminMenu.jsp");
}
	
	%>
	<table class="buttons">
	<tr>
		<td>
			<a href="../index/logout.jsp">
				<img src="../../img/logout.png" height="25px" width="25px">
			</a>
		</td>
	</tr>
</table>
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	});
	</script>
	<div class="container">
	<div class="row">
	<div class="center">
	<table align="center" class="menu">
		<tr>
			<td>
				<a href="#" data-toggle="tooltip" data-placement="top" title="Ver contactos" >
				<form action="../contacts/showContacts.jsp" method="post">
						<input value="Ver contactos" type=image src="../../img/showContacts.png" width="200" height="200">
				</form>
				</a>
			</td>
			<td>
				<a href="#" data-toggle="tooltip" title="Ver mensajes" data-placement="top">
				<form action="../messages/showMessages.jsp" method="post">
						<input value="Ver mensajes" type=image src="../../img/showMessages.png" width="200" height="200">
				</form>
				</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#" data-toggle="tooltip" title="Escribir mensaje" data-placement="bottom">
				<form action="../messages/writeMessage.jsp" method="post">
					<input value="escribir mensaje" type=image src="../../img/newMessage.png" width="200" height="200">
				</form>
				</a>
			</td>
			<td>
				<a href="#" data-toggle="tooltip" title="Modificar datos persoanles" data-placement="bottom">
				<form action="../updateUserData/updateUserData.jsp" method="post">
					<input value="Modify data" type=image src="../../img/settings.png" width="200" height="200">
				</form>
				<a href="#" data-toggle="tooltip" title="Ver mensajes" data-placement="bottom">
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</body>
</html>