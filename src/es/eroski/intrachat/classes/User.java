package es.eroski.intrachat.classes;

import java.util.ArrayList;

public class User {

	private int id_user;
	private String password;
	private String name;
	private String last_name;
	private String email;
	private String workstation;
	private Department department;
	private ArrayList<User> contacts;
	private ArrayList<Message> messages;

	public User() {
		super();
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getWorkstation() {
		return workstation;
	}

	public void setWorkstation(String workstation) {
		this.workstation = workstation;
	}


	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public ArrayList<User> getContacts() {
		return contacts;
	}

	public void setContacts(ArrayList<User> contacts) {
		this.contacts = contacts;
	}

	public ArrayList<Message> getMessages() {
		return messages;
	}

	public void setMessages(ArrayList<Message> messages) {
		this.messages = messages;
	}

}
