<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String cedula=request.getParameter("cedula");
String nombre_completo=request.getParameter("nombre_completo");
String correo_electronico=request.getParameter("correo_electronico");
String usuario=request.getParameter("usuario");
String newclave=request.getParameter("newclave");

int check=0;

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select * from storetic.usuarios where cedula='" + cedula + "' and nombre_completo='" + nombre_completo + "' and correo_electronico='" + correo_electronico + "' and usuario='" + usuario + "'";
	ResultSet rs=stmt.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="update storetic.usuarios set clave='" + newclave + "' where cedula='" + cedula + "' and nombre_completo='" + nombre_completo + "' and correo_electronico='" + correo_electronico + "' and usuario='" + usuario + "'";
		stmt.executeUpdate(sql);
		response.sendRedirect("OlvidePass.jsp?msg=done");
	}
	
	if (check==0){
		response.sendRedirect("OlvidePass.jsp?msg=invalid");
	}
	rs.close();
	stmt.close();
}catch(Exception e){
	System.out.println(e);
}
%>
