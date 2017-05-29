<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Eliminar usuario</title>
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

		int id_user_delete = Integer.parseInt(request.getParameter("del_id"));
		userModel.deleteUser(id_user_delete);
	
		response.sendRedirect("manageUsers.jsp");
	
	%>

	
</body>
</html>