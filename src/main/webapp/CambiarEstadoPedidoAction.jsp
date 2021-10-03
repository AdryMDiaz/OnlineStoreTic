<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String id_venta=request.getParameter("id_venta");
String id_estado=request.getParameter("id_estado");

int check=0;

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select v.*, e.estado from storetic.ventas v, storetic.estado e where e.id_estado = v.id_estado and id_venta='" + id_venta + "' and v.id_estado=3 or v.id_estado=4";
	ResultSet rs=stmt.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="update storetic.ventas set id_estado='" + id_estado + "' where id_venta='" + id_venta + "'";
		stmt.executeUpdate(sql);
		//request.getRequestDispatcher("CambiarEstadoPedido.jsp?msg=updateestado").forward(request, response);
		response.sendRedirect("CambiarEstadoPedido.jsp?msg=updateestado");
	}
	
	if (check==0){
		response.sendRedirect("CambiarEstadoPedido.jsp?msg=invalid");
	}
	rs.close();
	stmt.close();
}catch(Exception e){
	System.out.println(e);
}
%>
