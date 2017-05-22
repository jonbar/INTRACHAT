package es.eroski.intrachat.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import es.eroski.intrachat.classes.Department;
import es.eroski.intrachat.classes.Message;
import es.eroski.intrachat.classes.User;
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
		
		
		public ArrayList<Message> selectSendedMessagesFromUser(int id_user) {
			ArrayList<Message> sended_messages = new ArrayList<Message>();
			try {
				Statement st = this.conexion.createStatement();
				ResultSet rs = st.executeQuery("SELECT messages.*, users.*, departments.* from (messages join users on messages.id_sender = users.id_user ) join departments on users.id_department = departments.id_department where messages.id_sender='" +  id_user + "'");
				while (rs.next()) {
					
					//Mensajea sortu
					Message message = new Message();
					message.setId_message(rs.getInt("messages.id_message"));
					message.setId_sender(rs.getInt("messages.id_sender"));
					message.setId_receiver(rs.getInt("messages.id_receiver"));
					message.setSubject(rs.getString("messages.subject"));
					message.setText(rs.getString("messages.text"));
					message.setDate(rs.getDate("messages.date"));
					sended_messages.add(message);
					
					User receiver = new User();
					
					
					
					
				}
				return sended_messages;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		
		public ArrayList<Message> selectReceivedMessagesFromUser(int id_user) {
			ArrayList<Message> received_messages = new ArrayList<Message>();
			try {
				Statement st = this.conexion.createStatement();
				ResultSet rs = st.executeQuery("SELECT messages.*, users.*, departments.* from (messages join users on messages.id_receiver = users.id_user ) join departments on users.id_department = departments.id_department where messages.id_receiver='" +  id_user + "'");
				while (rs.next()) {
					
					//Mensajea sortu
					Message message = new Message();
					message.setId_message(rs.getInt("messages.id_message"));
					message.setId_sender(rs.getInt("messages.id_sender"));
					message.setId_receiver(rs.getInt("messages.id_receiver"));
					message.setSubject(rs.getString("messages.subject"));
					message.setText(rs.getString("messages.text"));
					message.setDate(rs.getDate("messages.date"));
					received_messages.add(message);
					
				}
				return received_messages;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
	}

