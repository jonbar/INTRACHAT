<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mis contactos</title>
</head>
<body>
	<%@ page import="es.eroski.intrachat.models.*" %>
	<%@ page import="es.eroski.intrachat.classes.*" %>
	<%@ page import="java.util.*" %>
 	<%@ page import="java.sql.*"%>
	
	<%	
		UserModel userModel = new UserModel();
		/* User user = new User();
		int id_user = (int) session.getAttribute(String.valueOf((user.getId_user())));
		user =	userModel.selectUserFromId(1); */
		User user = new User();
		user = (User) session.getAttribute("User");
		int id_user = user.getId_user();
		
		ContactModel contactModel = new ContactModel();
		ArrayList<User> contacts = contactModel.selectContactsFromUser(id_user);
		%>
	<div class="table-responsive">
		<table class="table table-bordered table-striped">
			<tr align="center">
				<th>NOMBRE</th>
				<th>APELLIDO</th>
				<th>EMAIL</th>
				<th>DEPARTAMENTO</th>
				<th></th>
			</tr>
			<%
				for (User contact : contacts) {
			%>

			<tr>
				<td><%= contact.getName()%></td>
				<td><%= contact.getLast_name()%></td>
				<td><%= contact.getEmail()%></td>
				<td><%= contact.getDepartment().getName() %></td> 
				
				<td> <a href="deleteContact.jsp?del_id=<%=contact.getId_user()%>"><img src="../../img/delete.png" height="20px" width="20px" /></a></td>
			
			</tr>
			
			<%
				} //cierre for
			%>
		</table>
		<br>
		<br>
		<h3>Agregar contacto:</h3>
		<form action="addContact.jsp" method="post">
			<input type="text" name="contact" id="contact" width="1000px"/><br>
			<input type="submit" value="Agregar" name="addContact" id="addContact" style="margin-top: 5px"/>
		</form>
	</div>
</body>
</html>