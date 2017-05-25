<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	session.setAttribute("User", null); 
	session.invalidate();
	response.sendRedirect("loginForm.jsp");
%>