<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String correo_electronico=request.getParameter("correo_electronico");

int check=0;

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select * from storetic.clientes where correo_electronico='" + correo_electronico + "' and estado='activo'";
	ResultSet rs=stmt.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="update storetic.clientes set estado='inactivo' where correo_electronico='" + correo_electronico + "'";
		stmt.executeUpdate(sql);
		response.sendRedirect("DarBaja.jsp?msg=delete");
	}
	
	if (check==0){
		response.sendRedirect("DarBaja.jsp?msg=invalid");
	}
	rs.close();
	stmt.close();
}catch(Exception e){
	System.out.println(e);
}
%>

