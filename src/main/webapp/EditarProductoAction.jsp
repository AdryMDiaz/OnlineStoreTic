<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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

int check=0;

	try{
		Connection con=ConnectionProvider.getCon();
		Statement stmt=con.createStatement();
		String query="select * from storetic.productos where codigo_producto='" + codigo_producto + "'";
		ResultSet rs = stmt.executeQuery(query);
		
		while (rs.next()){
			check=1;
			String sql="update storetic.productos set codigo_producto='" + codigo_producto + "', nombre_producto='" + nombre_producto + "',id_categoria='" + id_categoria + "', nit_proveedor='" + nit_proveedor + "', precio_compra='" + precio_compra + "',id_iva='" + id_iva + "', inventario_inicial='" + inventario_inicial + "',unidades_vendidas='" + unidades_vendidas + "', id_estado='" + id_estado + "' where codigo_producto='" + codigo_producto + "'";
			stmt.executeUpdate(sql);
			request.getRequestDispatcher("EditarProducto.jsp?msg=valid").forward(request, response);
			//response.sendRedirect("EditarProveedor.jsp?msg=valid");
		}
		
		if (check==0){
			response.sendRedirect("EditarProducto.jsp?msg=invalid");
		}
		rs.close();
		stmt.close();
	}catch(Exception e){
		System.out.println(e);
	}
%>