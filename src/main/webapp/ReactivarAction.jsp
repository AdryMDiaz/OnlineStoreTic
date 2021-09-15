<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String cedula=request.getParameter("cedula");
String correo_electronico=request.getParameter("correo_electronico");

int check=0;

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select * from storetic.usuarios where cedula='" + cedula + "' and correo_electronico='" + correo_electronico + "' and estado='inactivo'";
	ResultSet rs=stmt.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="update storetic.usuarios set estado='activo' where cedula='" + cedula + "' and correo_electronico='" + correo_electronico + "'";
		stmt.executeUpdate(sql);
		response.sendRedirect("Reactivar.jsp?msg=delete");
	}
	
	if (check==0){
		response.sendRedirect("Reactivar.jsp?msg=invalid");
	}
	rs.close();
	stmt.close();
}catch(Exception e){
	System.out.println(e);
}
%>