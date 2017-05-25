<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Iniciar sesion</title>
</head>
<body>
	<%@ page import="es.eroski.intrachat.models.*"%>
	<%@ page import="es.eroski.intrachat.classes.*"%>
	<%@ page import="java.util.*"%>
	<%
		UserModel userModel = new UserModel();

		String received_user = (String) request.getParameter("user");
		String received_password = (String) request.getParameter("password");
		int session_lenght = 0;

		session_lenght = session.getValueNames().length;
		User user = userModel.selectUserLogin(received_user, received_password);

		if (session_lenght == 0) {
			if (user == null) {
				response.sendRedirect("loginForm.jsp?error=datosmal");
			} else {
				session.setAttribute("User", user);
				if (user.getWorkstation().equals("Director")) {
					response.sendRedirect("../menu/adminMenu.jsp");
				} else {
					response.sendRedirect("../menu/userMenu.jsp");
				}
			}
		}
	%>

</body>
</html>