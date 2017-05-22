<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Añadir contacto</title>
</head>
<body>
	<%@ page import="es.eroski.intrachat.models.*" %>
	<%@ page import="es.eroski.intrachat.classes.*" %>
	<%@ page import="java.util.*" %>
	<%
		String email = request.getParameter("contact");
	%>
	<% 
		UserModel userModel = new UserModel();
		ContactModel contactModel = new ContactModel();
		
		User userSesion = (User) session.getAttribute("user");
		
		User userEmail = userModel.selectUserFromEmail(email);
		ArrayList<User> users = userModel.selectAllUsers();
		
		if(users.contains(userEmail)){
			//if(){
				
			//}else{

			//}
		}else{
			%>
			<h1>Usuario no registrado</h1>
			<h3>Por favor, comprueba que el usuario introducido es correcto.</h3>
			<a href="showContact.jsp" id="goBack" >Volver</a>
			<%
		}
	%>
</body>
</html>