<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Añadir contacto</title>
</head>
<body>
	<%@ page import="es.eroski.intrachat.models.*"%>
	<%@ page import="es.eroski.intrachat.classes.*"%>
	<%@ page import="java.util.*"%>
	<%
		String email = request.getParameter("contact");
	%>
	<%
		UserModel userModel = new UserModel();
		ContactModel contactModel = new ContactModel();

		User userSesion = (User) session.getAttribute("User");
		User userEmail = userModel.selectUserFromEmail(email);

		ArrayList<User> contacts = contactModel.selectContactsFromUser(userSesion.getId_user());

		if (userEmail != null) {
			if (!contacts.contains(userEmail)) {
				contactModel.insertContact(userSesion.getId_user(), userEmail.getId_user());
				response.sendRedirect("showContacts.jsp");
			} else {
				response.sendRedirect("showContacts.jsp?error=yaencontactos");
			}
		} else {

			response.sendRedirect("showContacts.jsp?error=usernoexiste");

		}
		
	%>
	
	
</body>
</html>