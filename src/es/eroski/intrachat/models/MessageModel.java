package es.eroski.intrachat.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import es.eroski.intrachat.classes.Message;
import es.eroski.intrachat.models.conector.Conector;


public class MessageModel extends Conector {


		public ArrayList<Message> selectAllMessages() {
			ArrayList<Message> messages = new ArrayList<Message>();
			try {
				Statement st = this.conexion.createStatement();
				ResultSet rs = st.executeQuery("select * from messages");
				while (rs.next()) {
					Message message = new Message();
					message.setId_message(rs.getInt("id_message"));
					message.setId_sender(rs.getInt("id_sender"));
					message.setId_receiver(rs.getInt("id_receiver"));
					message.setSubject(rs.getString("subject"));
					message.setText(rs.getString("text"));
					message.setDate(rs.getDate("date"));
					messages.add(message);
				}
				return messages;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
	}

