<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
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
String estado_proveedor = "activo";


try{
	Connection con=ConnectionProvider.getCon();
	String sql="insert into storetic.proveedores values (?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(sql);

	ps.setInt(1, Integer.parseInt(nit_proveedor));
	ps.setString(2, nombre_proveedor);
	ps.setString(3, direccion);
	ps.setString(4, nom_municipio);
	ps.setString(5, nom_departamento);
	ps.setString(6, nom_pais);
	ps.setString(7, contacto_proveedor);
	ps.setString(8, telefono);
	ps.setString(9, correo_electronico);
	ps.setString(10, estado_proveedor);
	
	ps.executeUpdate();
	response.sendRedirect("AgregarProveedor.jsp?msg=valid");
	ps.close();
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("AgregarProveedor.jsp?msg=invalid");
}
%>