<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>

<%
int id_comentario=0;
String cedula=request.getParameter("cedula");
String nombre_completo=request.getParameter("nombre_completo");
String correo_electronico=request.getParameter("correo_electronico");
String usuario=request.getParameter("usuario");
String estado = request.getParameter("estado");
String telefono_celular= request.getParameter("telefono_celular");
String telefono_fijo= request.getParameter("telefono_fijo");
String direccion= request.getParameter("direccion");
String asunto_comunicacion= request.getParameter("asunto_comunicacion");
String comentarios_cliente= request.getParameter("comentarios_cliente");

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select max(id_comentario) from storetic.contactanos";
	ResultSet rs = stmt.executeQuery(query);
	
	while (rs.next()){
		id_comentario = rs.getInt(1);
		id_comentario = id_comentario + 1;
		String sql="insert into storetic.contactanos (id_comentario, cedula, nombre_completo, correo_electronico, usuario, estado, telefono_celular, telefono_fijo, direccion, asunto_comunicacion, comentarios_cliente) values (?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
	
		ps.setInt(1, id_comentario);
		ps.setString(2, cedula);
		ps.setString(3, nombre_completo);
		ps.setString(4, correo_electronico);
		ps.setString(5, usuario);
		ps.setString(6, estado);
		ps.setString(7, telefono_celular);
		ps.setString(8, telefono_fijo);
		ps.setString(9, direccion);
		ps.setString(10, asunto_comunicacion);
		ps.setString(11, comentarios_cliente);
		ps.executeUpdate();
		request.getRequestDispatcher("ContactoUser.jsp?msg=valid").forward(request, response);
		ps.close();
	}
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("ContactoUser.jsp?msg=invalid");
	
}
%>