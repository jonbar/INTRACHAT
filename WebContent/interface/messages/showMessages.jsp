<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mis mensajes</title>
</head>
<body><%@ page import="es.eroski.intrachat.models.*" %>
	<%@ page import="es.eroski.intrachat.classes.*" %>
	<%@ page import="java.util.*" %>
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
		<p>MENSAJES RECIBIDOS</p>
	<div class="table-responsive">
		<table class="table table-bordered table-striped">
			<tr align="center">
				<th>DE</th>
				<th>ASUNTO</th>
				<th>FECHA</th>
			</tr>
			<%
				for (Message message : received_messages) {
			%>

			<tr>
				<td><%= message.getSender().getN%></td>
				<td><%= message.getSubject()%></td>
				<td><%= message.getDate()%></td> 
			
			</tr>
			
			<%
				} //cierre for
			%>
		</table>
	</div>
	
			<p>MENSAJES ENVIADOS</p>
	<div class="table-responsive">
		<table class="table table-bordered table-striped">
			<tr align="center">
				<th>PARA</th>
				<th>ASUNTO</th>
				<th>FECHA</th>
			</tr>
			<%
				for (Message message : sended_messages) {
			%>

			<tr>
				<td><%= message.getId_receiver()%></td>
				<td><%= message.getSubject()%></td>
				<td><%= message.getDate()%></td> 
			
			</tr>
			
			<%
				} //cierre for
			%>
		</table>
	</div>

</body>
</html>