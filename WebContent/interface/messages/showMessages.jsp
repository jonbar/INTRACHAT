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
<link rel="stylesheet" href="../../css/showMessages.css" type="text/css" media="all" />
<link rel="stylesheet" href="../../css/general.css" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mis mensajes</title>
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
		int id_user = user.getId_user();

		MessageModel messageModel = new MessageModel();
		ArrayList<Message> received_messages = messageModel.selectReceivedMessagesFromUser(id_user);
		ArrayList<Message> sended_messages = messageModel.selectSendedMessagesFromUser(id_user);
		//
	%>
	<form action="../menu/userMenu.jsp" method="post">
		<img src="../../img/go_back.png" height="15px" width="15px">
		<input style="border-radius: 5px;" type="submit" name="volver" id="volver" value="Volver" />
	</form>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<br> <br>
				<h4>MENSAJES RECIBIDOS</h4>
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<tr align="center">
							<th>DE</th>
							<th>DEPT</th>
							<th>ASUNTO</th>
							<th>FECHA</th>
						</tr>
						<%
							for (Message message : received_messages) {
						%>

						<tr>
							<td><%=message.getSender().getEmail()%></td>
							<td><%=message.getSender().getDepartment().getName()%></td>
							<td><a
								href="showMessages.jsp?mes_id=<%=message.getId_message()%>"><%=message.getSubject()%></a></td>
							<td><%=message.getDate()%></td>


						</tr>

						<%
							} //cierre for
						%>
					</table>
				</div>

				<h4>MENSAJES ENVIADOS</h4>
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<tr align="center">
							<th>PARA</th>
							<th>DEPT</th>
							<th>ASUNTO</th>
							<th>FECHA</th>
						</tr>
						<%
							for (Message message : sended_messages) {
						%>

						<tr>
							<td><%= message.getReceiver().getEmail() %></td>
							<td><%=message.getReceiver().getDepartment().getName()%></td>
							<td><a
								href="showMessages.jsp?mes_id=<%=message.getId_message()%>"><%=message.getSubject()%></a></td>
							<td><%=message.getDate()%></td>
						</tr>

						<%
							} //cierre for
						%>
					</table>
				</div>
			</div>
			<div class="col-sm-6">
				<div>
					<br> <br> <br>

					<%
						if (request.getParameter("mes_id") != null) {
							int id_message = Integer.parseInt(request.getParameter("mes_id"));
							Message message = messageModel.selectMessageFromId(id_message);
					%>
					<h4>ASUNTO</h4>
					<textarea readonly rows="1" 
						style="overflow: hidden; border-radius: 5px" cols="50"
						name="subject" id="subject"><%=message.getSubject()%></textarea>
					<br>
					<br>
					<h4>MENSAJE</h4>
					<textarea readonly rows=10 cols="50" name="text" id="text" 
						style="border-radius: 5px"><%=message.getText()%></textarea>
					<br>

					<%
						} else {
					%>
					<h4>ASUNTO</h4>
					<textarea readonly rows="1"
						style="overflow: hidden; border-radius: 5px" cols="50"
						name="subject" id="subject"></textarea>
					<br> <br>
					<h4>MENSAJE</h4>
					<textarea readonly rows=10 cols="50" name="text" id="text"
						style="border-radius: 5px"></textarea>
					<br>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>