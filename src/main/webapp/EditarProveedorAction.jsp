<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String nit_proveedor=request.getParameter("nit_proveedor");
String nombre_proveedor=request.getParameter("nombre_proveedor");
String direccion=request.getParameter("direccion");
String nom_municipio=request.getParameter("nom_municipio");
String nom_departamento=request.getParameter("nom_departamento");
String nom_pais=request.getParameter("nom_pais");
String contacto_proveedor=request.getParameter("contacto_proveedor");
String telefono=request.getParameter("telefono");
String correo_electronico=request.getParameter("correo_electronico");
String estado_proveedor=request.getParameter("estado_proveedor");

int check=0;

	try{
		Connection con=ConnectionProvider.getCon();
		Statement stmt=con.createStatement();
		String query="select * from storetic.proveedores where nit_proveedor='" + nit_proveedor + "'";
		ResultSet rs = stmt.executeQuery(query);
		
		while (rs.next()){
			check=1;
			String sql="update storetic.proveedores set nombre_proveedor='" + nombre_proveedor + "', direccion='" + direccion + "',nom_municipio='" + nom_municipio + "',nom_departamento='" + nom_departamento + "',nom_pais='" + nom_pais + "',contacto_proveedor='"+ contacto_proveedor+"', telefono='" + telefono + "',correo_electronico='" + correo_electronico + "' where nit_proveedor='" + nit_proveedor + "'";
			stmt.executeUpdate(sql);
			response.sendRedirect("EditarProveedor.jsp?msg=valid");
		}
		
		if (check==0){
			response.sendRedirect("EditarProveedor.jsp?msg=invalid");
		}
		rs.close();
		stmt.close();
	}catch(Exception e){
		System.out.println(e);
	}
%>