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

	public User selectUserLogin(String userlogin, String password) {
		User user = null;
		try {
			Statement st = this.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from users where id_user='" + Integer.parseInt(userlogin) + 
										   "' or email='" + userlogin + "' and password='" + password + "'");
			rs.next();
			user = new User();
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
		return user;
	}

}
