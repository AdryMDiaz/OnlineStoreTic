<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String codigo_producto=request.getParameter("codigo_producto");

int check=0;

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select * from storetic.detallecarrito where codigo_producto = '"+codigo_producto+"'";
	ResultSet rs=stmt.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="delete from storetic.detallecarrito where codigo_producto = '"+codigo_producto+"'";
		stmt.executeUpdate(sql);
		//response.sendRedirect("CarritoComprasUser.jsp?msg=delete");
		request.getRequestDispatcher("CarritoComprasUser.jsp?msg=delete").forward(request, response);
	}
	
	if (check==0){
		response.sendRedirect("CarritoComprasUser.jsp?msg=invalid");
	}
	rs.close();
	stmt.close();
}catch(Exception e){
	System.out.println(e);
}
%>