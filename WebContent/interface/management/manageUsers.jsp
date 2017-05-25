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
		User session_user = new User();
		session_user = (User) session.getAttribute("User");
		int id_user = session_user.getId_user();

		ArrayList<User> all_users = userModel.selectAllUsers();
	%>
	<table>
		<tr>
			<td class="separatedLogout">
				<form action="../menu/userMenu.jsp" method="post">
					<img src="../../img/go_back.png" height="15px" width="15px">
					<input style="border-radius: 5px;" type="submit" name="volver"
						id="volver" value="Volver" />
				</form>
			</td>
			<td>
				<form action="../index/logout.jsp" method="post">
					<img src="../../img/logout.png" height="15px" width="15px"> <input
						style="border-radius: 5px;" type="submit" name="logout"
						id="logout" value="logout" />
				</form>
			</td>
		</tr>
	</table>
	<div class="container">
		<div class="row">
			<div class="table-responsive">
				<table class="table table-bordered table-striped">
					<tr align="center">
						<th>ID USUARIO</th>
						<th>NOMBRE</th>
						<th>APELLIDO</th>
						<th>EMAIL</th>
						<th>PUESTO</th>
						<th>DEPT.</th>
						<th></th>
					</tr>
					<%
						for (User user : all_users) {
					%>

					<tr>
						<td><%=user.getId_user()%></td>
						<td><%=user.getName()%></td>
						<td><%=user.getLast_name()%></td>
						<td><%=user.getEmail()%></td>
						<td><%=user.getWorkstation()%></td>
						<td><%=user.getDepartment().getName()%></td>

						<td><a href="deleteUser.jsp?del_id=<%=user.getId_user()%>"><img
								src="../../img/delete.png" height="20px" width="20px" /></a></td>

					</tr>

					<%
						} //cierre for
					%>
				</table>

				<!-- Trigger the modal with a button -->
				Nuevo usuario <button type="button" data-toggle="modal" data-target="#myModal" style="margin-bottom: 20px">Crear</button>

				<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<form action="addUser.jsp" method="post">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Crear nuevo usuario</h4>
							</div>
							<div class="modal-body">
								<table style="margin-left: 25%" >
									<tr style="margin-bottom: 15px">
										<td>Nombre:</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td>Apellido:</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td>Contraseña:</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td>Puesto trabajo:</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td>Departamento:</td>
										<td>
											<select style="width: 174px">
												<option name="Direccion">Direccion</option>
												<option name="Recursos_humanos">Recursos humanos</option>
												<option name="Informatica"> Informatica</option>
												<option name="Manteniemiento">Manteniemiento</option>
												<option name="Compras">Compras</option>
												<option name="Ventas">Ventas</option>
											</select>
										</td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Crear</button>
							</div>
							</form>
						</div>

					</div>
				</div>
</body>
</html>