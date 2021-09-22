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
String telefono_celular= request.getParameter("telefono_celular");
String telefono_fijo= request.getParameter("telefono_fijo");
String direccion= request.getParameter("direccion");
String comentarios_cliente= request.getParameter("comentarios_cliente");
String respuesta_admin= request.getParameter("respuesta_admin");

try{
	Connection con=ConnectionProvider.getCon();
	String sql="insert into storetic.contactanos values (?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(sql);
	
	ps.setString(1, cedula);
	ps.setString(2, nombre_completo);
	ps.setString(3, correo_electronico);
	ps.setString(4, usuario);
	ps.setString(5, estado);
	ps.setString(6, telefono_celular);
	ps.setString(7, telefono_fijo);
	ps.setString(8, direccion);
	ps.setString(9, comentarios_cliente);
	ps.setString(10, respuesta_admin);
	ps.executeUpdate();
	request.getRequestDispatcher("ContactoUser.jsp?msg=valid").forward(request, response);
	ps.close();
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("ContactoUser.jsp?msg=invalid");
	
}
%>