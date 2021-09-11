<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>

<%
String usuario = request.getParameter("usuario");
String clave = request.getParameter("clave");

if ("admininicial".equals(usuario) && "admin123456".equals(clave)){
	session.setAttribute("usuario", usuario);
	response.sendRedirect("AdminHome.jsp");
} else {
	int z=0;
	try{
		Connection con=ConnectionProvider.getCon();
		Statement stmt=con.createStatement();
		String query="select * from storetic.usuarios where usuario='" + usuario + "' and clave='" + clave + "'" + "and estado ='activo'";
		ResultSet rs = stmt.executeQuery(query);
		
		while (rs.next()){
			z=1;
			session.setAttribute("usuario", usuario);
			response.sendRedirect("HomeUser.jsp");
		}
		
		if (z==0){
			response.sendRedirect("ModuloLogin.jsp?msg=notexist");
		}
		rs.close();
		stmt.close();
	}catch (Exception e){
		System.out.println(e);
		response.sendRedirect("ModuloLogin.jsp?msg=invalid");
	}
}
%>
