<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../css/general.css" type="text/css" media="all" />
<link rel="stylesheet" href="../../css/writeMessage.css" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Escribir mensaje</title>
</head>
<body>
	<%@ page import="es.eroski.intrachat.models.*"%>
	<%@ page import="es.eroski.intrachat.classes.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.sql.* "%>
	
	<%
		UserModel userModel = new UserModel();
		ContactModel contactModel = new ContactModel();
		User user = (User) session.getAttribute("User");
		ArrayList<User> userContacts = contactModel.selectContactsFromUser(user.getId_user());
	%>
	<table>
		<tr>
			<td class="separatedLogout">
				<form action="../menu/userMenu.jsp" method="post">
					<img src="../../img/go_back.png" height="15px" width="15px">
					<input style="border-radius: 5px;" type="submit" name="volver" id="volver" value="Volver" />
				</form>
				</td>
				<td>
				<form action="../index/logout.jsp" method="post">
					<img src="../../img/logout.png" height="15px" width="15px">
					<input style="border-radius: 5px;" type="submit" name="logout" id="logout" value="logout" />
				</form>
			</td>
		</tr>
	</table>
	
	
	<div class="container">
	<div class="row">
	<form action="sendMessage.jsp" method="post">
	<table align="center">
		<tr>
			<td class="tableMargin">
			<p> Elegir contacto: </p> 
			
				<select name="contact" id="contact">
					<%
					for (User contact : userContacts) {
					%>
						<option value="<%= contact.getId_user() %>"> <%= contact.getName() + " " + contact.getLast_name()%> </option>
					<%
					}
					%>
				 </select>
			</td>
			<td>
				 Asunto:<br>
				 <textarea name="subject" rows="1" cols="50" class="editable"></textarea> <br>
				 Texto:<br>
				 <textarea name="text" rows="5" cols="50" class="editable"></textarea>
				<br>
				 <input type="submit" value="Enviar" name="send" id="send" class="button"/>
			 
			 </td>
		</tr>
	</table>
	</form>
	</div>
	</div>	
</body>
</html>