<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String codigo_producto=request.getParameter("codigo_producto");
String cantidad=request.getParameter("cantidad");

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
		
		if(id_carrito.equals("0")){
			String query2="insert into storetic.carrito(cedula,subtotal,valor_iva,valor_total,estado) values ("+cedula+",0,0,0,1)";
			PreparedStatement st2 = con.prepareStatement(query2,  Statement.RETURN_GENERATED_KEYS);
			int arows = st2.executeUpdate();
			if(arows > 0){
				ResultSet rs2 = st2.getGeneratedKeys();
				if(rs2.next()){
					id_carrito = rs2.getString(1);
				}
			}
		}
		
		String query3="select p.precio_compra as precio_compra, i.porcentaje_iva as porcentaje_iva from storetic.productos p, storetic.iva i where i.id_iva = p.id_iva and p.codigo_producto= " + codigo_producto;
		ResultSet rs3 = stmt.executeQuery(query3);		
		double granTotal = 0;
		
		if(rs3.next()){
			int cant = Integer.parseInt(cantidad);		
			double valor_iva = (rs3.getInt("precio_compra")*rs3.getDouble("porcentaje_iva"));			
			long precioVenta = Math.round(rs3.getInt("precio_compra")+valor_iva);			
			double valor_total = cant*precioVenta;
			
			String query4 = "select * from storetic.detallecarrito where codigo_producto = "+codigo_producto+" and id_carrito = "+id_carrito;
			ResultSet rs4 = stmt.executeQuery(query4);
			if(rs4.next()){
				cant += rs4.getInt("cantidad");
				valor_total = cant * precioVenta;
				String query5="update storetic.detallecarrito set cantidad = "+Integer.toString(cant)+", valor_unitario = "+Long.toString(precioVenta)+", valor_total = "+Double.toString(valor_total)+" where id_carrito = "+id_carrito+" and codigo_producto= " + codigo_producto;
				PreparedStatement st5 = con.prepareStatement(query5);
				int arows5 = st5.executeUpdate();
				st5.close();
			}else{
				String query5="insert into storetic.detallecarrito (cantidad,valor_unitario,valor_total,id_carrito,codigo_producto) values ("+Integer.toString(cant)+", "+Long.toString(precioVenta)+", "+Double.toString(valor_total)+", "+id_carrito+", " + codigo_producto+")";
				PreparedStatement st5 = con.prepareStatement(query5);
				int arows5 = st5.executeUpdate();
				st5.close();
			}
			rs4.close();
			
			String query6 = "select d.valor_total as valor_total, i.porcentaje_iva as porcentaje_iva from storetic.detallecarrito d, storetic.productos p, storetic.iva i where d.codigo_producto = p.codigo_producto and p.id_iva = i.id_iva and d.id_carrito = "+id_carrito;
			ResultSet rs6 = stmt.executeQuery(query6);
			long subtotal = 0;
			long valorIva = 0;
			long total = 0;
			while(rs6.next()){
			 	long iva2 = Math.round(rs6.getInt("valor_total")*rs6.getDouble("porcentaje_iva"));
			 	long subtotal2 = rs6.getInt("valor_total")-iva2;
			 	valorIva += iva2;
			 	subtotal += subtotal2;
			 	total += rs6.getInt("valor_total");
			}
			String query7 = "update storetic.carrito set valor_total = "+Long.toString(total)+", valor_iva = "+Long.toString(valorIva)+", subtotal = "+Long.toString(subtotal)+" where id_carrito = "+id_carrito;
			PreparedStatement st7 = con.prepareStatement(query7);
			int arows7 = st7.executeUpdate();
			st7.close();		
		}
		
		rs3.close();
		rs.close();
		stmt.close();
		check = 1;
	}catch(Exception e){
		e.printStackTrace();
		check = 0;
	}
	if (check==0){
		response.sendRedirect("NuestrosProductos.jsp?msg=invalid");
	}else{
		response.sendRedirect("NuestrosProductos.jsp?msg=valid");
	}
%>