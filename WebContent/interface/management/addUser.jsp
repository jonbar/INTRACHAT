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
	<%@ page import="java.sql.*"%>

	<%
		UserModel userModel = new UserModel();
		DepartmentModel departmentModel = new DepartmentModel();

		String name = (String) request.getParameter("name");
		String last_name = (String) request.getParameter("last_name");
		String password = (String) request.getParameter("password");
		String email = (String) request.getParameter("email");
		String workstation = (String) request.getParameter("workstation");
		int id_department = Integer.parseInt(request.getParameter("department"));

		Department department = departmentModel.selectDepartmentId(id_department);

		User user = new User();
		user.setName(name);
		user.setLast_name(last_name);
		user.setPassword(password);
		user.setEmail(email);
		user.setWorkstation(workstation);
		user.setDepartment(department);

		userModel.insertUser(user);

		response.sendRedirect("manageUsers.jsp");
	%>

</body>
</html>