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
	<%
		UserModel userModel = new UserModel();
	
		String received_user = request.getParameter("user");
		String received_password = request.getParameter("password");
		
		//ERROR
		User user = userModel.selectUserLogin(received_user, received_password);

		if (user.getName() != null) {
			%> Usuario correcto <%
		} else {
			%> Usuario incorrecto <%
		}
	%>

</body>
</html>