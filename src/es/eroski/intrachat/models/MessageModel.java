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
					
					Message message = new Message();
					message.setId_message(rs.getInt("messages.id_message"));
					message.setId_sender(rs.getInt("messages.id_sender"));
					message.setId_receiver(rs.getInt("messages.id_receiver"));
					message.setSubject(rs.getString("messages.subject"));
					message.setText(rs.getString("messages.text"));
					message.setDate(rs.getDate("messages.date"));
					
					User receiver = new User();
					receiver.setId_user(rs.getInt("users.id_user"));
					receiver.setPassword(rs.getString("users.password"));
					receiver.setName(rs.getString("users.name"));
					receiver.setLast_name(rs.getString("users.last_name"));
					receiver.setEmail(rs.getString("users.email"));
					receiver.setWorkstation(rs.getString("users.workstation"));
					
					Department department = new Department();
					department.setId_department(rs.getInt("departments.id_department"));
					department.setName(rs.getString("departments.name"));
					department.setFloor(rs.getInt("departments.floor"));
					
					receiver.setDepartment(department);
					message.setReceiver(receiver);
					sended_messages.add(message);
					
					
					
					
					
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
					
					
					Message message = new Message();
					message.setId_message(rs.getInt("messages.id_message"));
					message.setId_sender(rs.getInt("messages.id_sender"));
					message.setId_receiver(rs.getInt("messages.id_receiver"));
					message.setSubject(rs.getString("messages.subject"));
					message.setText(rs.getString("messages.text"));
					message.setDate(rs.getDate("messages.date"));
					

					User sender = new User();
					sender.setId_user(rs.getInt("users.id_user"));
					sender.setPassword(rs.getString("users.password"));
					sender.setName(rs.getString("users.name"));
					sender.setLast_name(rs.getString("users.last_name"));
					sender.setEmail(rs.getString("users.email"));
					sender.setWorkstation(rs.getString("users.workstation"));
					
					Department department = new Department();
					department.setId_department(rs.getInt("departments.id_department"));
					department.setName(rs.getString("departments.name"));
					department.setFloor(rs.getInt("departments.floor"));
					
					sender.setDepartment(department);
					message.setSender(sender);
					
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

