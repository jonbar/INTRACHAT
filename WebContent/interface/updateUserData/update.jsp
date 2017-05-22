<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="es.eroski.intrachat.models.*" %>
	<%@ page import="es.eroski.intrachat.classes.*" %>
	<%@ page import="java.util.*" %>
 	<%@ page import="java.sql.*"%>
 	<%
 	int id_user = Integer.parseInt(request.getParameter("id"));
 	String name = (String) request.getParameter("name");
 	String last_name = (String) request.getParameter("last_name");
 	String password = (String) request.getParameter("password");

 	UserModel userModel = new UserModel();
 	userModel.updateUser(id_user, password, name, last_name);
 	%>
 	<h3>Usuario actualizado correctamente</h3>
 	<%
 	User user = (User) session.getAttribute("User");
 	user.setName(name);
 	user.setLast_name(last_name);
 	user.setPassword(password);
 	session.setAttribute("User", user);
 	%>
 	<a href="updateUserData.jsp">Volver</a>
</body>
</html>