package com.storetic;

import java.sql.*;

public class ConnectionProvider {
	
	public static Connection getCon() {
		//definimos base de datos, usuario, contraseña y url para la conexión
        String BASE = "storetic";
        String USERNAME = "root";
        String PASSWORD = "*Cristo0107*";
        String URL = "jdbc:mysql://localhost:3306/" + BASE;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(URL, USERNAME, PASSWORD);
			return con;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
			return null;
		}
	}

}
