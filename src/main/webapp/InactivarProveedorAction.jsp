<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String nit_proveedor=request.getParameter("nit_proveedor");

int check=0;

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select * from storetic.proveedores where nit_proveedor='" + nit_proveedor + "' and estado_proveedor='activo'";
	ResultSet rs=stmt.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="update storetic.Proveedores set estado_proveedor='inactivo' where nit_proveedor='" + nit_proveedor + "'";
		stmt.executeUpdate(sql);
		response.sendRedirect("InactivarProveedor.jsp?msg=delete");
	}
	
	if (check==0){
		response.sendRedirect("InactivarProveedor.jsp?msg=invalid");
	}
	rs.close();
	stmt.close();
}catch(Exception e){
	System.out.println(e);
}
%>