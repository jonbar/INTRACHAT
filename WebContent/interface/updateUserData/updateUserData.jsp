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
<link rel="stylesheet" href="../../css/general.css" type="text/css" media="all" />
<link rel="stylesheet" href="../../css/updateUserData.css" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar datos</title>
</head>
<body>
	<%@ page import="es.eroski.intrachat.models.*"%>
	<%@ page import="es.eroski.intrachat.classes.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.sql.*"%>
	<%
		UserModel userModel = new UserModel();
		User user = new User();
		user = (User) session.getAttribute("User");
	%>
		<table>
		<tr>
			<td class="separatedLogout">
				<form action="../menu/userMenu.jsp" method="post">
					<img src="../../img/go_back.png" height="15px" width="15px">
					<input style="border-radius: 5px;" type="submit" name="volver" id="volver" value="Volver" />
				</form>
			</td>
			<td>
				<form action="../index/logout.jsp" method="post">
					<img src="../../img/logout.png" height="15px" width="15px">
					<input style="border-radius: 5px;" type="submit" name="logout" id="logout" value="logout" />
				</form>
			</td>
		</tr>
	</table>
	<form action="update.jsp" method="post">
		<table align="center">
			<tr>
				<td colspan="2"><h3 class="title">Modificar usuario:</h3></td>
			</tr>
			<tr>
				<td>ID:</td>
				<td><input type="text" name="id" id="id" readonly="readonly"
					value="<%=user.getId_user()%>" /></td>
			</tr>
			<tr>
				<td>Nombre:</td>
				<td><input type="text" name="name" id="name"
					 value="<%=user.getName()%>" /></td>
			</tr>
			<tr>
				<td>Apellido:</td>
				<td><input type="text" name="last_name" 
					id="last_name" value="<%=user.getLast_name()%>" /></td>
			</tr>
			<tr>
				<td>Contrase�a:</td>
				<td><input type="text" name="password" id="password"
					value="<%=user.getPassword()%>" /></td>
			</tr>
			<tr>
				<td>Correo:</td>
				<td><input type="text" name="email" id="email"
					 value="<%=user.getEmail()%>" /></td>
			</tr>
			<tr>
				<td>Puesto:</td>
				<td><input type="text" name="workstation" readonly="readonly"
					id="workstation" readonly="readonly"
					value="<%=user.getWorkstation()%>" /></td>
			</tr>
			<tr>
				<td>Departamento:</td>
				<td><input type="text" name="department" readonly="readonly"
					id="department" readonly="readonly"
					value="<%=user.getDepartment().getName()%>" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input class="button" type="submit" value="Actualizar" name="update"
			id="update" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>