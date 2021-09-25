<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>

<%

String codigo_producto=request.getParameter("codigo_producto");
String nombre_producto=request.getParameter("nombre_producto");
String id_categoria=request.getParameter("id_categoria");
String nit_proveedor=request.getParameter("nit_proveedor");
String precio_compra=request.getParameter("precio_compra");
String id_iva=request.getParameter("id_iva");
String inventario_inicial=request.getParameter("inventario_inicial");
String unidades_vendidas=request.getParameter("unidades_vendidas");
String id_estado=request.getParameter("id_estado");



try{
	Connection con=ConnectionProvider.getCon();
	String sql="insert into storetic.productos values (?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(sql);
	
	
	ps.setInt (1,Integer.parseInt(codigo_producto));
	ps.setString(2, (nombre_producto));
	ps.setInt(3, Integer.parseInt(id_categoria));
	ps.setInt(4, Integer.parseInt(nit_proveedor));
	ps.setInt(5, Integer.parseInt(precio_compra));
	ps.setInt(6, Integer.parseInt(id_iva));
	ps.setInt(7, Integer.parseInt(inventario_inicial));
	ps.setInt(8, Integer.parseInt(unidades_vendidas));
	ps.setInt (9, Integer.parseInt(id_estado));
	ps.executeUpdate();
	
	response.sendRedirect("AgregarProducto.jsp?msg=valid");
	ps.close();
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("AgregarProducto.jsp?msg=invalid");
}
%>