<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%

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
			int subtotal = rs.getInt("subtotal");
			int valor_iva = rs.getInt("valor_iva");
			int valor_total = rs.getInt("valor_total");
			
			//actualizamos el estado del carrito a 0, para que desaparezca
			String query2 = "update storetic.carrito set estado = 0 where id_carrito = "+id_carrito;
			PreparedStatement st2 = con.prepareStatement(query2);
			int arows2 = st2.executeUpdate();
			st2.close();
			
			//insertamos los datos del carrito a la tabla de ventas que va a llevar los pedidos realizados
			String query3 = "insert into storetic.ventas (id_carrito,cedula,subtotal,valor_iva,valor_total,id_estado) values("+id_carrito+","+cedula+","+subtotal+","+valor_iva+","+valor_total+","+3+")";
			PreparedStatement st3 = con.prepareStatement(query3,  Statement.RETURN_GENERATED_KEYS);
			int arows3 = st3.executeUpdate();
			String id_venta = "";
			
			if(arows2 > 0){
				ResultSet rs3 = st3.getGeneratedKeys();
				if(rs3.next()){
					id_venta = rs3.getString(1);//id de la nueva venta					
					String query4="select d.*,p.* from storetic.detallecarrito d, storetic.productos p where d.codigo_producto = p.codigo_producto and d.id_carrito= "+id_carrito;
					ResultSet rs4 = stmt.executeQuery(query4);
					while(rs4.next()){
						check = 1;
						int codigo_producto = rs4.getInt("codigo_producto");
						String valor_unitario = rs4.getString("valor_unitario");
						int cantidad = rs4.getInt("cantidad");
						String total = rs4.getString("valor_total");
						
						int unidades_vendidas = rs4.getInt("unidades_vendidas");
						int nuevas_unidades_vendidas = cantidad + unidades_vendidas;//sumo las cantidades pedidas con las que ya se vendieron anteriormente
						
						//añade el producto del carrito al detalle de la venta
						String query5 = "insert into storetic.detalleventas (id_venta,codigo_producto,cantidad,valor_unitario,valor_total) values("+id_venta+","+codigo_producto+","+Integer.toString(cantidad)+","+valor_unitario+","+total+")";
						PreparedStatement st5 = con.prepareStatement(query5);
						int arows5 = st5.executeUpdate();
						
						//agrega las cantidades de cada producto a las unidades vendidas
						String query6 = "update storetic.productos set unidades_vendidas = "+nuevas_unidades_vendidas+" where codigo_producto = "+codigo_producto;
						PreparedStatement st6 = con.prepareStatement(query6);
						int arows6 = st6.executeUpdate();
						
					}
					
				}else{
					check = 0;
				}
			}else{
				check = 0;
			}
			st3.close();			
		}else{
			check = 0;
		}
		rs.close();
		stmt.close();		
	}catch(Exception e){
		e.printStackTrace();
		check = 0;
	}
	if (check==0){
		response.sendRedirect("PedidosUser.jsp?msg=invalid");
	}else{
		response.sendRedirect("PedidosUser.jsp?msg=valid");
	}
%>