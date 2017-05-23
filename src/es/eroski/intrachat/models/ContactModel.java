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
			ResultSet rs = st.executeQuery("SELECT contacts.*, users.*, departments.* from (contacts join users on contacts.id_contact = users.id_user ) join departments on users.id_department = departments.id_department where contacts.id_user='" +  id_user + "'");
			while (rs.next()) {
				
				//contaktua sortu
				User contact = new User();
				contact.setId_user(rs.getInt("contacts.id_contact"));
				contact.setPassword(rs.getString("users.password"));
				contact.setName(rs.getString("users.name"));
				contact.setLast_name(rs.getString("users.last_name"));
				contact.setEmail(rs.getString("users.email"));
				contact.setWorkstation(rs.getString("users.workstation"));
				//departamentua sortu
				Department department = new Department();
				department.setId_department(rs.getInt("departments.id_department"));
				department.setName(rs.getString("departments.name"));
				department.setFloor(rs.getInt("departments.floor"));
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
	
	public void insertContact(int id_user, int id_contact) {
		Statement st;
		try {
			st = super.getConexion().createStatement();
			st.execute("INSERT INTO contacts (id_user,id_contact) " + "VALUES ('" + id_user + "','" + id_contact + "')");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	public void deleteContact(int id_user, int id_contact){
		try {
			Statement st = super.getConexion().createStatement();
			st.execute("DELETE FROM contacts " + "WHERE id_user='" + id_user + "' and id_contact='" + id_contact + "'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
