package es.eroski.intrachat.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import es.eroski.intrachat.classes.User;
import es.eroski.intrachat.models.conector.Conector;

public class UserModel extends Conector {

	public ArrayList<User> selectAllUsers() {
		ArrayList<User> users = new ArrayList<User>();
		try {
			Statement st = this.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from users");
			while (rs.next()) {
				User user = new User();

				user.setId_user(rs.getInt("id_user"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setLast_name(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setId_department(rs.getInt("id_department"));
				users.add(user);
			}
			return users;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
//	public ArrayList<User> selectUsersFromDepartment(String department) {
//		ArrayList<User> users = new ArrayList<User>();
//		try {
//			Statement st = this.conexion.createStatement();
//			
//			ResultSet rs = st.executeQuery("select users.* from department join users on department.id_department = users.id_department where department.name ='" + department + "'");
//			while (rs.next()) {
//				User user = new User();
//
//				user.setId_user(rs.getInt("id_user"));
//				user.setPassword(rs.getString("password"));
//				user.setName(rs.getString("name"));
//				user.setLast_name(rs.getString("last_name"));
//				user.setEmail(rs.getString("email"));
//				user.setId_department(rs.getInt("id_department"));
//				users.add(user);
//			}
//			return users;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return null;
//	}
	
	public User selectUserLogin(String userlogin, String password) {
		int id_user = Integer.parseInt(userlogin);
		String email = userlogin;

		try {
			Statement st = this.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from users where (id_user='" + id_user + 
										   "' or email='" + email + "') and password='" + password + "'");
			rs.next();
			User user = new User();
			user.setId_user(rs.getInt("id_user"));
			user.setPassword(rs.getString("password"));
			user.setName(rs.getString("name"));
			user.setLast_name(rs.getString("last_name"));
			user.setEmail(rs.getString("email"));
			user.setId_department(rs.getInt("id_department"));
			return user;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public void insertUser(User user) {
		Statement st;
		try {
			st = super.getConexion().createStatement();
			st.execute("INSERT INTO users (password,name,last_name,email,id_department) " + "VALUES ('"
					+ user.getPassword() + "','" + user.getName() + "','" + user.getLast_name() + "','"
					+ user.getEmail() + "','" + user.getId_department() + "')");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
