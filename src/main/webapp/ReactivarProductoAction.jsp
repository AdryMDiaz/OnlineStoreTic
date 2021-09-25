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
	String query="select * from storetic.productos where codigo_producto='" + codigo_producto + "' and id_estado=2";
	ResultSet rs=stmt.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="update storetic.productos set id_estado=1 where codigo_producto='" + codigo_producto + "'";
		stmt.executeUpdate(sql);
		request.getRequestDispatcher("ReactivarProducto.jsp?msg=valid").forward(request, response);
	}
	
	if (check==0){
		response.sendRedirect("ReactivarProducto.jsp?msg=invalid");
	}
	rs.close();
	stmt.close();
}catch(Exception e){
	System.out.println(e);
}
%>