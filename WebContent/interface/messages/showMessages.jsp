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
<title>Mis mensajes</title>
</head>
<body><%@ page import="es.eroski.intrachat.models.*"%>
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
	%>
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
							<td><%=message.getReceiver().getEmail()%></td>
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
					<input type="text" value="<%=message.getSubject()%>" name="subject"
						id="subject" style="WIDTH: 250px; HEIGHT: 25px" disabled /> <br>
					<br>
					<h4>MENSAJE</h4>
					<input type="text" value="<%=message.getText()%>" name="text"
						id="text" style="WIDTH: 250px; HEIGHT: 140px" disabled> <br>

					<%
						} else {
					%>
					<h4>ASUNTO</h4>
					<input type="text" name="subject" id="subject"
						style="WIDTH: 250px; HEIGHT: 25px" disabled /> <br> <br>
					<h4>MENSAJE</h4>
					<input type="text" name="text" id="text"
						style="WIDTH: 250px; HEIGHT: 140px" disabled><br>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>