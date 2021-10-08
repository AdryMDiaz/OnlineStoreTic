<%@include file="HomeUser.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.storetic.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrito de Compras</title>
</head>
<body>
	<div class="container">
	
		<div class="row my-2">
			<div class="col-12 text-center">
				<h3></h3>
			</div>
		</div>
		<div class="row">
			<%
			String cedula = session.getAttribute("cedula").toString();
			Connection con=ConnectionProvider.getCon();
			Statement stmt=con.createStatement();		
			String query="select * from storetic.carrito where cedula= "+cedula+" and estado = 1";
			ResultSet rs = stmt.executeQuery(query);
			int valido = 0;
			if(rs.next()){
				valido = 1;
				int subtotal = rs.getInt("subtotal");
				int valor_iva = rs.getInt("valor_iva");
				int valor_total = rs.getInt("valor_total");
				int id_carrito = rs.getInt("id_carrito");
			%>
			<div class="col-6 col-sm-9 table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th><b>Acción</b></th>
							<th><b>Código</b></th>
							<th><b>Nombre</b></th>
							<th><b>Vlr. Unitario</b></th>
							<th><b>Vlr. IVA</b></th>
							<th><b>Cant.</b></th>
							<th><b>Total</b></th>
						</tr>
					</thead>
					<% 
					String msg=request.getParameter("msg");

					if ("delete".equals(msg)){
					%>
						<strong style="color:#198754" class="text-center"> El Producto ha sido eliminado satisfactoriamente del Carrito de Compras</strong>
					<% } %>
					<%
					if ("invalid".equals(msg)){
					%>
						<strong style="color:#dc3545" class="text-center">El Producto no se eliminó o no existe en este Carrito de Compras</strong>
					<% } %>
					<tbody>						
					<%
					String query2 = "select d.*,p.*,i.* from storetic.detallecarrito d, storetic.productos p, storetic.iva i where i.id_iva = p.id_iva and d.codigo_producto = p.codigo_producto and d.id_carrito = "+rs.getString("id_carrito");
					ResultSet rs2 = stmt.executeQuery(query2);
					valido = 0;
					while(rs2.next()){
						valido = 1;
						long valor_iva2 = Math.round(rs2.getInt("precio_compra")*rs2.getDouble("porcentaje_iva"));
					%>
						<tr>
							<div class="btn-group" role="group" aria-label="Basic outlined example">
										  <td><a type="button" class="btn btn-outline-danger" href="EliminarProductoCarro.jsp?codigo_producto=<%=rs2.getString(3)%>">Eliminar</a></td>
							</div>		
							<td>
								<%=rs2.getString("codigo_producto")%>
							</td>
							<td>
								<%=rs2.getString("nombre_producto")%>
							</td>							
							<td>
								<%=rs2.getString("valor_unitario")%>
							</td>
							<td>
								<%=valor_iva2%>
							</td>
							<td>
								<%=rs2.getString("cantidad")%>
							</td>
							<td>
								<%=rs2.getString("valor_total")%>
							</td>							
						</tr>
					<% } rs2.close(); %>
					</tbody>
				</table>
			</div>
			<div class="col-6 col-sm-3">
				<div class="row my-2">
					<div class="col-8"><p><b>Subtotal:</b></p></div>
					<div class="col-4"><%=subtotal %></div>
				</div>
				<div class="row my-2">
					<div class="col-8"><p><b>Iva:</b></p></div>
					<div class="col-4"><%=valor_iva %></div>
				</div>
				<div class="row my-2">
					<div class="col-8"><p><b>Total:</b></p></div>
					<div class="col-4"><%=valor_total %></div>
				</div>
				<div class="row">
					<div class="col-12 my-2">
						<a class="btn btn-success w-100" href="FinalizarCompra.jsp">Confirmar Compra</a>
					</div>
					<div class="col-12 my-2">
						<a class="btn btn-outline-success w-100" href="NuestrosProductos.jsp">Continuar Comprando</a>
					</div>
				</div>
			</div>
			<% }
			rs.close();
			con.close();
			%>
			<% if(valido==0){ %>
			<div class="col-12 text-center">
				<h3 class="text-warning">Carrito de compras vacío<a class="btn btn-outline-success" href="NuestrosProductos.jsp">Añade un producto</a></h3>
			</div>
			<% } %>
		</div>
	</div>
</body>
<%@include file="Footer.jsp"%>
</html>