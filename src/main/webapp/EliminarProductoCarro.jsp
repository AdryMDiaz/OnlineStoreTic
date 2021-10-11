<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String codigo_producto=request.getParameter("codigo_producto");

int check=0;

try{
	String cedula = session.getAttribute("cedula").toString();
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();		
	String query="select * from storetic.carrito where cedula= "+cedula+" and estado = 1";
	ResultSet rs = stmt.executeQuery(query);		
	String id_carrito = "0";
	
	if(rs.next()){
		id_carrito = rs.getString("id_carrito");			
	}
	
	String query2="select * from storetic.detallecarrito where codigo_producto = '"+codigo_producto+"'";
	ResultSet rs2=stmt.executeQuery(query2);
	
	while (rs2.next()){
		check=1;
		String sql="delete from storetic.detallecarrito where codigo_producto = '"+codigo_producto+"'";
		stmt.executeUpdate(sql);
		
		String query3 = "select sum(p.precio_compra*d.cantidad) as subtotal, sum(round((p.precio_compra*i.porcentaje_iva*d.cantidad))) as total_iva, sum(d.valor_total) as valor_total2 from storetic.detallecarrito d inner join storetic.productos p on d.codigo_producto = p.codigo_producto inner join storetic.iva i on p.id_iva = i.id_iva and d.id_carrito = '" + id_carrito + "'group by d.id_carrito";
		ResultSet rs3 = stmt.executeQuery(query3);
		long subtotal = 0;
		long valorIva = 0;
		long total = 0;
		while(rs3.next()){
		 	/*long iva2 = Math.round(rs6.getInt("precio_compra")*rs6.getDouble("porcentaje_iva"));*/
		 	long iva2 = rs3.getInt("total_iva");
		 	/*long subtotal2 = rs6.getInt("valor_total")-iva2;*/
		 	long subtotal2 = rs3.getInt("subtotal");
		 	valorIva += iva2;
		 	subtotal += subtotal2;
		 	total += rs3.getInt("valor_total2");
		}
		String query4 = "update storetic.carrito set valor_total = "+Long.toString(total)+", valor_iva = "+Long.toString(valorIva)+", subtotal = "+Long.toString(subtotal)+" where id_carrito = "+id_carrito;
		PreparedStatement st = con.prepareStatement(query4);
		int arows7 = st.executeUpdate();
		st.close();
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