<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String cedula = session.getAttribute("cedula").toString();
String codigo_producto=request.getParameter("codigo_producto");
String incdec=request.getParameter("cantidad");
int cantidad=0;
int valor_unitario=0;
int valor_iva=0;
int valor_total=0;

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();		
	String query="select * from storetic.carrito where cedula= "+cedula+" and estado = 1";
	ResultSet rs = stmt.executeQuery(query);		
	String id_carrito = "0";
	
	if(rs.next()){
		id_carrito = rs.getString("id_carrito");			
	}		
	
	String query2="select * from storetic.detallecarrito where codigo_producto = "+codigo_producto+" and id_carrito = "+id_carrito;
	ResultSet rs2 = stmt.executeQuery(query2);	
	
	while(rs2.next()){
		valor_unitario=rs2.getInt(5);
		cantidad=rs2.getInt(4);
		valor_total=rs2.getInt(6);
	}
	
	if(cantidad==1 && incdec.equals("dec"))
		response.sendRedirect("CarritoComprasUser.jsp?msg=invalid");
	
	else if(cantidad !=1 && incdec.equals("dec"))
	{
		valor_total=valor_total-valor_unitario;
		cantidad=cantidad-1;
		valor_iva=valor_total*
		stmt.executeUpdate("update detallecarrito set valor_total='"+valor_total+"', cantidad='"+cantidad+"' where codigo_producto = "+codigo_producto+" ");
		String query3 = "select sum(p.precio_compra*d.cantidad) as subtotal, sum(round((p.precio_compra*i.porcentaje_iva*d.cantidad))) as total_iva, sum(d.valor_total) as valor_total2 from storetic.detallecarrito d inner join storetic.productos p on d.codigo_producto = p.codigo_producto inner join storetic.iva i on p.id_iva = i.id_iva and d.id_carrito = '" + id_carrito + "'group by d.id_carrito";
		ResultSet rs3 = stmt.executeQuery(query3);
		long subtotal = 0;
		long valorIva = 0;
		long total = 0;
		while(rs3.next()){
		 	long iva2 = rs3.getInt("total_iva");
		 	long subtotal2 = rs3.getInt("subtotal");
		 	valorIva += iva2;
		 	subtotal += subtotal2;
		 	total += rs3.getInt("valor_total2");
		}
		String query4 = "update storetic.carrito set valor_total = "+Long.toString(total)+", valor_iva = "+Long.toString(valorIva)+", subtotal = "+Long.toString(subtotal)+" where id_carrito = "+id_carrito;
		PreparedStatement st4 = con.prepareStatement(query4);
		int arows7 = st4.executeUpdate();
		response.sendRedirect("CarritoComprasUser.jsp?msg=decrementado");
		st4.close();	
	}
	
	else
	{
		valor_total=valor_total+valor_unitario;
		cantidad=cantidad+1;
		stmt.executeUpdate("update detallecarrito set valor_total='"+valor_total+"', cantidad='"+cantidad+"' where codigo_producto = "+codigo_producto+" ");
		String query3 = "select sum(p.precio_compra*d.cantidad) as subtotal, sum(round((p.precio_compra*i.porcentaje_iva*d.cantidad))) as total_iva, sum(d.valor_total) as valor_total2 from storetic.detallecarrito d inner join storetic.productos p on d.codigo_producto = p.codigo_producto inner join storetic.iva i on p.id_iva = i.id_iva and d.id_carrito = '" + id_carrito + "'group by d.id_carrito";
		ResultSet rs3 = stmt.executeQuery(query3);
		long subtotal = 0;
		long valorIva = 0;
		long total = 0;
		
		while(rs3.next()){
		 	long iva2 = rs3.getInt("total_iva");
		 	long subtotal2 = rs3.getInt("subtotal");
		 	valorIva += iva2;
		 	subtotal += subtotal2;
		 	total += rs3.getInt("valor_total2");
		}
		String query4 = "update storetic.carrito set valor_total = "+Long.toString(total)+", valor_iva = "+Long.toString(valorIva)+", subtotal = "+Long.toString(subtotal)+" where id_carrito = "+id_carrito;
		PreparedStatement st4 = con.prepareStatement(query4);
		int arows7 = st4.executeUpdate();
		response.sendRedirect("CarritoComprasUser.jsp?msg=incrementado");
		st4.close();	
	}
}catch(Exception e){
	System.out.println(e);
}
%>