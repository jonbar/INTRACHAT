package es.eroski.intrachat.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import es.eroski.intrachat.classes.Contact;
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

}
