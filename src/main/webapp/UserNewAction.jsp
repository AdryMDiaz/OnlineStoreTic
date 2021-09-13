<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>

<%
String cedula=request.getParameter("cedula");
String nombre_completo=request.getParameter("nombre_completo");
String correo_electronico=request.getParameter("correo_electronico");
String usuario=request.getParameter("usuario");
String clave=request.getParameter("clave");
String estado = "Activo";
String direccion="";
String ciudad="";
String departamento="";
String pais="";

try{
	Connection con=ConnectionProvider.getCon();
	String sql="insert into storetic.usuarios values (?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(sql);
	
	ps.setInt(1, Integer.parseInt(cedula));
	ps.setString(2, nombre_completo);
	ps.setString(3, correo_electronico);
	ps.setString(4, usuario);
	ps.setString(5, clave);
	ps.setString(6, estado);
	ps.setString(7, direccion);
	ps.setString(8, ciudad);
	ps.setString(9, departamento);
	ps.setString(10, pais);
	ps.executeUpdate();
	response.sendRedirect("UserNew.jsp?msg=valid");
	ps.close();
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("UserNew.jsp?msg=invalid");
}
%>