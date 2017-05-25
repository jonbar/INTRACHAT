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
<body style="background-color: #E6E6E6">
	<div class="container">
		<div class="row">
			<table align="center">
				<tr>
					<td>
						<form action="../management/manageUsers.jsp" method="post">
							<input value="Administrar usuarios" type=image
								src="../../img/manageUsers.png" width="200" height="200">
						</form>
					</td>
					<td>
						<form action="../contacts/showContacts.jsp" method="post">
							<input value="Ver contactos" type=image
								src="../../img/showContacts.png" width="200" height="200">
						</form>
					</td>
					<td>
						<form action="../messages/showMessages.jsp" method="post">
							<input value="Ver mensajes" type=image
								src="../../img/showMessages.png" width="200" height="200">
						</form>
					</td>
				</tr>
				<tr>
					<td>
						<form action="../management/showArchives.jsp" method="post">
							<input value="Ver archivos" type=image
								src="../../img/showArchives.png" width="200" height="200">
						</form>
					</td>
					<td>
						<form action="../messages/writeMessage.jsp" method="post">
							<input value="escribir mensaje" type=image
								src="../../img/newMessage.png" width="200" height="200">
						</form>
					</td>
					<td>
						<form action="../updateUserData/updateUserData.jsp" method="post">
							<input value="Modify data" type=image
								src="../../img/settings.png" width="200" height="200">
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>