<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar datos</title>
</head>
<body>
	<%@ page import="es.eroski.intrachat.models.*" %>
	<%@ page import="es.eroski.intrachat.classes.*" %>
	<%@ page import="java.util.*" %>
 	<%@ page import="java.sql.*"%>
	<%
		UserModel userModel = new UserModel();
		User user = userModel.selectUserFromId(2);
	%>
	<table>
		<tr>
			<td colspan="2">Modificar usuario</td>
		</tr>
		<tr>
			<td>ID:</td><td><input type="text" name="id" id="id" readonly="readonly" value="<%= user.getId_user() %>"/></td>
		</tr>
		<tr>
			<td>Nombre:</td><td><input type="text" name="name" id="name" value="<%= user.getName() %>"/></td>
		</tr>
		<tr>
			<td>Apellido:</td><td><input type="text" name="last_name" id="last_name" value="<%= user.getLast_name() %>"/></td>
		</tr>
		<tr>
			<td>Contraseña:</td><td><input type="text" name="password" id="password" value="<%= user.getPassword() %>"/></td>
		</tr>
		<tr>
			<td>Correo:</td><td><input type="text" name="email" id="email" readonly="readonly" value="<%= user.getEmail() %>"/></td>
		</tr>
		<tr>
			<td>Puesto:</td><td><input type="text" name="workstation" id="workstation" readonly="readonly" value="<%= user.getWorkstation() %>"/></td>
		</tr>
		<tr>
			<td>Departamento:</td><td><input type="text" name="department" id="department" readonly="readonly" value="<%= user.getDepartment().getName() %>"/></td>
		</tr>
	</table>
</body>
</html>