<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>

<% 
String cedula=request.getParameter("cedula");
String newnombre_completo=request.getParameter("newnombre_completo");
String newcorreo_electronico=request.getParameter("newcorreo_electronico");
String newusuario=request.getParameter("newusuario");
String newclave=request.getParameter("newclave");
String newestado = "Activo";
String newdireccion=request.getParameter("newdireccion");
String newciudad=request.getParameter("newciudad");
String newdepartamento=request.getParameter("newdepartamento");
String newpais=request.getParameter("newpais");
String newtelefono_celular=request.getParameter("newtelefono_celular");
String newtelefono_fijo=request.getParameter("newtelefono_fijo");

int check=0;

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select * from storetic.clientes where cedula='" + cedula + "'";
	ResultSet rs=stmt.executeQuery(query);
	
	while (rs.next()){
		check=1;
		String sql="update storetic.clientes set nombre_completo ='"+ newnombre_completo + "', correo_electronico='" + newcorreo_electronico + "' where cedula ='" + cedula + "' and estado='activo'";
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