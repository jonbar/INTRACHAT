<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Iniciar sesion</title>
</head>
<body>
	<%@ page import="es.eroski.intrachat.models.*" %>
	<%@ page import="es.eroski.intrachat.classes.*" %>
	<%@ page import="java.util.*" %>
	<%
		
		UserModel userModel = new UserModel();
	
		String received_user = (String) request.getParameter("user");
		String received_password = (String) request.getParameter("password");
		
		int sesion_luzera = session.getValueNames().length;
		User user = userModel.selectUserLogin(received_user, received_password);

<<<<<<< HEAD
		if (user.getName() != null) {
			response.sendRedirect("userMenu.jsp?");
=======
		if (sesion_luzera == 0) {

			if (user != null) {

				session.setAttribute("User", user);
				User user_sesion = (User) session.getAttribute("User");
				int id_user = user.getId_user();
				response.sendRedirect("../userMenu.jsp?id_user");
			}
	%>
	<p>
		<a href="loginForm.jsp">Logout</a>
	</p>
	<%
		
>>>>>>> branch 'master' of https://github.com/jonbar/intrachat.git
		} else {

			response.sendRedirect("loginForm.jsp?error=datosmal");
		}
	%>

</body>
</html>