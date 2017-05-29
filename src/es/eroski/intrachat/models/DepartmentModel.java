package es.eroski.intrachat.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import es.eroski.intrachat.classes.Department;
import es.eroski.intrachat.models.conector.Conector;

public class DepartmentModel extends Conector {

	public ArrayList<Department> selectAllDepartments() {
		ArrayList<Department> departments = new ArrayList<Department>();
		try {
			Statement st = this.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from departments");
			while (rs.next()) {
				Department department = new Department();
				department.setId_department(rs.getInt("id_department"));
				department.setName(rs.getString("name"));
				department.setFloor(rs.getInt("floor"));
				departments.add(department);
			}
			return departments;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public Department selectDepartmentId(int id_department) {
		Department department = null;
		try {
			Statement st = this.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from departments WHERE id_department ='" + id_department + "'");
			while (rs.next()) {
				department = new Department();
				department.setId_department(rs.getInt("id_department"));
				department.setName(rs.getString("name"));
				department.setFloor(rs.getInt("floor"));

				return department;
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
