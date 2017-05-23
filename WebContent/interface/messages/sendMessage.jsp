<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="es.eroski.intrachat.models.*"%>
	<%@ page import="es.eroski.intrachat.classes.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.sql.* "%>
	<%
		
		MessageModel messageModel = new MessageModel();
		
		
		User user = (User) session.getAttribute("User");
		
		Message message = new Message();
		int id_receiver = Integer.parseInt(request.getParameter("contact"));
		int id_sender = (int) user.getId_user();
		String subject = (String) request.getParameter("subject");
		String text = (String) request.getParameter("text");
		java.util.Date utilDate = new java.util.Date();

		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
		message.setId_sender(id_sender);
		message.setId_receiver(id_receiver);
		message.setSubject(subject);
		message.setText(text);
		message.setDate(sqlDate);
		
		messageModel.insert(message);		
	%>
	<h1>Mensaje enviado correctamente</h1>
	<a href="writeMessage.jsp">Volver</a>
</body>
</html>