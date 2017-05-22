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
<title>Menu</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<form action="../contacts/showContacts.jsp" method="post">
					<input style="width: 150px; height: 25px" type="submit"
						value="Ver amigos" name="see_friends" id="see_friends" />
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<form action="../messages/showMessages.jsp" method="post">
					<input type="submit" style="width: 150px; height: 25px"
						value="Ver mensajes" name="ver_mensajes" id="ver_mensajes" />
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<form action="../writteMessage/writteMessage.jsp" method="post">
					<input style="width: 150px; height: 25px" type="submit"
						value="Escribir mensaje" name="Escribir_mensaje"
						id="Escribir_mensaje" />
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<form action="../updateUserData/updateUserData.jsp" method="post">
					<input style="width: 150px; height: 25px" type="submit"
						value="Modificar datos" name="Modificar_datos"
						id="Modificar_datos" />
				</form>
			</td>
		</tr>
	</table>
</body>
</html>