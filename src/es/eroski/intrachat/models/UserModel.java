package es.eroski.intrachat.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import es.eroski.intrachat.classes.Department;
import es.eroski.intrachat.classes.User;
import es.eroski.intrachat.models.conector.Conector;

public class UserModel extends Conector {


	public ArrayList<User> selectAllUsers() {
		ArrayList<User> users = new ArrayList<User>();
		try {
			Statement st = this.conexion.createStatement();
			ResultSet rs = st.executeQuery(
					"SELECT users.*, departments.* FROM departments JOIN users ON users.id_department = departments.id_department");
			while (rs.next()) {

				User user = new User();

				user.setId_user(rs.getInt("users.id_user"));
				user.setPassword(rs.getString("users.password"));
				user.setName(rs.getString("users.name"));
				user.setLast_name(rs.getString("users.last_name"));
				user.setEmail(rs.getString("users.email"));
				user.setWorkstation(rs.getString("users.workstation"));
				// Department
				Department department = new Department();
				department.setId_department(rs.getInt("departments.id_department"));
				department.setName(rs.getString("departments.name"));
				department.setFloor(rs.getInt("departments.floor"));

				user.setDepartment(department);

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
		String email = userlogin;

		try {
			Statement st = this.conexion.createStatement();
			ResultSet rs = st.executeQuery(
					"SELECT users.*, departments.* FROM users JOIN departments ON users.id_department = departments.id_department WHERE users.email='" + email + "' AND users.password='" + password + "'");
			rs.next();
			User user = new User();
			user.setId_user(rs.getInt("id_user"));
			user.setPassword(rs.getString("password"));
			user.setName(rs.getString("name"));
			user.setLast_name(rs.getString("last_name"));
			user.setEmail(rs.getString("email"));
			user.setWorkstation(rs.getString("workstation"));

			// departamentua sortu
			Department department = new Department();
			department.setId_department(rs.getInt("departments.id_department"));
			department.setName(rs.getString("departments.name"));
			department.setFloor(rs.getInt("departments.floor"));

			user.setDepartment(department);

			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public User selectUserFromId(int id_user) {

		User user = null;
		try {
			Statement st = this.conexion.createStatement();
			ResultSet rs = st.executeQuery(
					"SELECT users.*, departments.* FROM departments JOIN users ON users.id_department = departments.id_department WHERE users.id_user ='"
							+ id_user + "'");
			rs.next();
			user = new User();
			user.setId_user(rs.getInt("id_user"));
			user.setPassword(rs.getString("password"));
			user.setName(rs.getString("name"));
			user.setLast_name(rs.getString("last_name"));
			user.setEmail(rs.getString("email"));
			user.setWorkstation(rs.getString("workstation"));

			// departamentua sortu
			Department department = new Department();
			department.setId_department(rs.getInt("departments.id_department"));
			department.setName(rs.getString("departments.name"));
			department.setFloor(rs.getInt("departments.floor"));

			user.setDepartment(department);

			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

//	public void insertUser(User user) {
//		Statement st;
//		try {
//			st = super.getConexion().createStatement();
//			st.execute("INSERT INTO users (password,name,last_name,email,id_department) " + "VALUES ('"
//					+ user.getPassword() + "','" + user.getName() + "','" + user.getLast_name() + "','"
//					+ user.getEmail() + "','" + "')");
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	}

}
