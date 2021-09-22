<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String cedula=request.getParameter("cedula");

int check=0;

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select * from storetic.clientes where cedula='" + cedula + "'";
	ResultSet rs=stmt.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="delete from storetic.clientes where cedula='" + cedula + "'";
		stmt.executeUpdate(sql);
		response.sendRedirect("EliminarCliente.jsp?msg=delete");
	}
	
	if (check==0){
		response.sendRedirect("EliminarCliente.jsp?msg=invalid");
	}
	rs.close();
	stmt.close();
}catch(Exception e){
	System.out.println(e);
}
%>