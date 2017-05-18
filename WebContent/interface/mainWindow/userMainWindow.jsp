<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ventana principal</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<form action="seeFriends/seeContactsForm.jsp" method="post">
					<input type="submit" value="Ver amigos" name="see_friends" id="see_friends"/>
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<form action="seeMessages/seeMenssages.jsp" method="post">
					<input type="submit" value="Ver mensajes" name="ver_mensajes" id="ver_mensajes"/>
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<form action="writteMessage/writteMessage.jsp" method="post">
					<input type="submit" value="Escribir mensaje" name="Escribir_mensaje" id="Escribir_mensaje"/>
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<form action="modifyData/modifyData.jsp" method="post">
					<input type="submit" value="Modificar datos" name="Modificar_datos" id="Modificar_datos"/>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>