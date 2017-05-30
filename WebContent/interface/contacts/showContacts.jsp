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
<link rel="stylesheet" href="../../css/showContacts.css" type="text/css"
	media="all" />
<link rel="stylesheet" href="../../css/general.css" type="text/css"
	media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mis contactos</title>
</head>
<body class="ligth">
	<%@ page import="es.eroski.intrachat.models.*"%>
	<%@ page import="es.eroski.intrachat.classes.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.sql.*"%>

	<%
		UserModel userModel = new UserModel();
		User user = new User();
		user = (User) session.getAttribute("User");
		int id_user = user.getId_user();

		ContactModel contactModel = new ContactModel();
		ArrayList<User> contacts = contactModel.selectContactsFromUser(id_user);
	%>
	<table class="buttons">
		<tr>
			<td><a href="../menu/userMenu.jsp"> <img
					class="separatedLogout" src="../../img/go_back.png" height="25px"
					width="25px">
			</a></td>
			<td><a href="../index/logout.jsp"> <img
					src="../../img/logout.png" height="25px" width="25px">
			</a></td>
		</tr>
	</table>
	<div class="container">
		<div class="row">
			<div class="table-responsive" style="overflow:hidden;">
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
						<td><%=contact.getName()%></td>
						<td><%=contact.getLast_name()%></td>
						<td><%=contact.getEmail()%></td>
						<td><%=contact.getDepartment().getName()%></td>

						<td><a
							href="deleteContact.jsp?del_id=<%=contact.getId_user()%>"><img
								src="../../img/delete.png" height="20px" width="20px" /></a></td>
					</tr>
					<%
						} //cierre for
					%>
				</table>
				<br>
				<table>
					<tr>
						<td>
							<h4>Agregar contacto:</h4>
							<form action="addContact.jsp" method="post">
								<input type="text" name="contact" id="contact" width="1000px"
									placeholder="Email" /><br> <input type="submit"
									value="Agregar" name="addContact" id="addContact"
									style="margin-top: 5px" />
							</form>
						</td>
						<td>
							<%
								if (request.getParameter("error") != null) {
									if (request.getParameter("error").equals("yaencontactos")) {
							%>
							<br>
							<div>
								<div class="container">
								<div  class="alert alert-danger" style="text-align: center; margin-right: 15%;">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									<strong>ATENCIÓN!</strong> Usuario ya en tu lista de contactos.
								</div>
								</div>
							</div>
			
							<%
								}
									if (request.getParameter("error").equals("usernoexiste")) {
							%>
							<br>
							<div>
								<div class="container">
								<div  class="alert alert-danger" style="text-align: center; margin-right: 15%;">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
									<strong>ATENCIÓN!</strong> Usuario no encontrado.
								</div>
								</div>
							</div>
			
							<%
								}
								}
							%>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>