<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mis contactos</title>
</head>
<body>
	<%@ page import="es.eroski.intrachat.models.*" %>
	<%@ page import="es.eroski.intrachat.classes.*" %>ç
	<%@ page import="java.util.*" %>
 	<%@ page import="java.sql.*"%>
	
	<%
	
	//SELECT contacts.id_user, users.*, departments.name from (contacts join users on 
	//contacts.id_contact = users.id_user ) join departments on users.id_department = 
	//departments.id_department where contacts.id_user=1
	
		UserModel userModel = new UserModel();
		int id_user=1;
		User user = userModel.selectUserFromId(id_user);
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
				for (Contact contact : contacts) {
			%>

			<tr>
				<td><%=user.getName()%></td>
				<td><%=user.getLast_name()%></td>
				<td><%=user.getEmail()%></td>
				<!-- Hay que cambiar para que salga el nombre -->
				<td><%=user.getId_department()%></td> 
				
				<td> <a href="deleteContact.jsp?id=<%=contact.getId_user()%>">Eliminar</a></td>
			
			</tr>
			
			<%
				} //cierre for
			%>
		</table>
	</div>
</body>
</html>