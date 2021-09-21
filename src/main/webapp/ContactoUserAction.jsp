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
String estado = request.getParameter("estado");
String telefono_celular=request.getParameter("telefono_celular");
String telefono_fijo=request.getParameter("telefono_fijo");
String direccion=request.getParameter("direccion");
String comentarios=request.getParameter("comentarios");

try{
	Connection con=ConnectionProvider.getCon();
	String sql="insert into storetic.contactanos values (?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(sql);
	
	ps.setInt(1, Integer.parseInt(cedula));
	ps.setString(2, nombre_completo);
	ps.setString(3, correo_electronico);
	ps.setString(4, usuario);
	ps.setString(5, estado);
	ps.setString(6, direccion);
	ps.setInt(7, Integer.parseInt(telefono_celular));
	ps.setInt(8, Integer.parseInt(telefono_fijo));
	ps.setString(9, comentarios);
	ps.executeUpdate();
	response.sendRedirect("ContactoUser.jsp?msg=done");
	ps.close();
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("ContactoUser.jsp?msg=invalid");
	
}
%>