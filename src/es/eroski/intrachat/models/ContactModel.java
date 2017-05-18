package es.eroski.intrachat.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import es.eroski.intrachat.classes.Contact;
import es.eroski.intrachat.classes.Department;
import es.eroski.intrachat.classes.User;
import es.eroski.intrachat.models.conector.Conector;


public class ContactModel extends Conector {


	public ArrayList<Contact> selectAllContacts() {
		ArrayList<Contact> contacts = new ArrayList<Contact>();
		try {
			Statement st = this.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from contacts");
			while (rs.next()) {
				Contact contact = new Contact();
				contact.setId_user(rs.getInt("id_user"));
				contact.setId_contact(rs.getInt("id_contact"));
				contacts.add(contact);
			}
			return contacts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<User> selectContactsFromUser(int id_user) {
		ArrayList<User> contacts = new ArrayList<User>();
		try {
			Statement st = this.conexion.createStatement();
			ResultSet rs = st.executeQuery("SELECT contacts.*, users.*, departments.* from (contacts join users on contacts.id_contact = users.id_user ) join departments on users.id_department = departments.id_department where contacts.id_user=1");
			while (rs.next()) {
				
				//contactua sortu
				User contact = new User();
				contact.setId_user(rs.getInt("contacts.id_contact"));
				contact.setPassword(rs.getString("user.password"));
				contact.setName(rs.getString("user.name"));
				contact.setLast_name(rs.getString("user.last_name"));
				contact.setEmail(rs.getString("user.email"));
				contact.setWorkstation(rs.getString("user.workstation"));
				//departamentua sortu
				Department department = new Department();
				department.setId_department(rs.getInt("department.id_department"));
				department.setName(rs.getString("department.name"));
				department.setFloor(rs.getInt("department.floor"));
				//contacti depart
				contact.setDepartment(department);
				
				//contact in arraylist of contacts
				contacts.add(contact);
				
			}
			return contacts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
