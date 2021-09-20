<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>

<%
String usuario=session.getAttribute("usuario").toString();
String cedula=request.getParameter("cedula");
String nombre_completo=request.getParameter("nombre_completo");
String correo_electronico=request.getParameter("correo_electronico");
String clave=request.getParameter("clave");
String estado = request.getParameter("estado");
String direccion=request.getParameter("direccion");
String ciudad=request.getParameter("ciudad");
String departamento=request.getParameter("departamento");
String pais=request.getParameter("pais");
String telefono_celular=request.getParameter("telefono_celular");
String telefono_fijo=request.getParameter("telefono_fijo");

int check=0;

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select * from storetic.clientes where usuario='" + usuario + "' and clave='" + clave + "'";
	ResultSet rs=stmt.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="update storetic.clientes set nombre_completo='" + nombre_completo + "',direccion='" + direccion + "',ciudad='" + ciudad + "',departamento='" + departamento + "',pais='" + pais + "',telefono_celular='" + telefono_celular + "',telefono_fijo='" + telefono_fijo + "' where usuario ='" + usuario + "' and clave='" + clave + "'";
		stmt.executeUpdate(sql);
		response.sendRedirect("UpdateUser.jsp?msg=done");
	}
	
	if (check==0){
		response.sendRedirect("UpdateUser.jsp?msg=invalid");
	}
	rs.close();
	stmt.close();
}catch(Exception e){
	System.out.println(e);
}
%>