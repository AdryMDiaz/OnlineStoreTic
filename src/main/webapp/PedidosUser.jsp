<%@include file="HomeUser.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.storetic.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mis Pedidos</title>
</head>
<body>
<div class="container">
		<div class="row my-2">
			<div class="col-12 text-center">
				<h3></h3>
			</div>
			<div class="col-12 text-center">
			<% 
				String msg=request.getParameter("msg");
	
				if ("valid".equals(msg)){
				%>
					<figure class="text-center">
					<strong class="text-center" style="color:#198754">
						Pedido finalizado exitosamente!
					</strong>
				<% } %>
				<%
				if ("invalid".equals(msg)){
				%>
					<figure class="text-center">
					<strong class="text-center" style="color:#dc3545">Error al finalizar Pedido. Int�ntelo de nuevo!</strong>
			<% } %>
			</div>
		</div>
		<div class="row">
			<div class="col-12 table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="row">
							 	Id Venta
							</th>
							<th scope="row">
							 	Cliente
							</th>
							<th scope="row">
							 	C�dula
							</th>
							<th scope="row">
							 	Subtotal
							</th>
							<th scope="row">
							 	Valor Iva
							</th>
							<th scope="row">
							 	Gran Total
							</th>
							<th scope="row">
							 	Fecha
							</th>
							<th scope="row">
							 	Estado Pedido
							</th>
							<th scope="row">
							 	Liquidaci�n
							</th>
						</tr>
					</thead>
					<tbody>
						<%
						String cedula = session.getAttribute("cedula").toString();
						Connection con=ConnectionProvider.getCon();
						Statement stmt=con.createStatement();		
						String query="select v.id_venta, v.cedula, v.subtotal, v.valor_iva, v.valor_total, v.id_carrito, v.id_estado, date_format(fecha,'%d - %b - %Y') as fecha,cl.*, e.* from storetic.ventas v, storetic.clientes cl, storetic.estado e where cl.cedula = v.cedula and e.id_estado = v.id_estado and v.cedula= "+cedula;
						ResultSet rs = stmt.executeQuery(query);
						int valido = 0;
						while(rs.next()){
							valido = 1;
						%>
							<tr>
								<td>
									<%=rs.getString("id_venta")%>
								</td>
								<td>
									<%=rs.getString("nombre_completo")%>
								</td>
								<td>
									<%=rs.getString("cedula")%>
								</td>
								<td>
									<%=rs.getString("subtotal")%>
								</td>
								<td>
									<%=rs.getString("valor_iva")%>
								</td>
								<td>
									<%=rs.getString("valor_total")%>
								</td>
								<td>
									<%=rs.getString("fecha")%>
								</td>
								<td>
									<%=rs.getString("e.estado")%>
								</td>
								</td>
									<td><a type="button" class="btn btn-outline-dark" href="Factura.jsp?id_venta=<%=rs.getString(1)%>">Imprimir Factura</a>
								</td>
							</tr>	
						<% }
						rs.close();
						con.close();
						%>
					</tbody>
				</table>
			</div>
			<% if(valido==0){ %>
			<div class="col-12 text-center">
				<h3 class="text-warning">No hay Pedidos Realizados.</h3>
			</div>
			<% } %>
		</div>
	</div>
</body>
<%@include file="Footer.jsp"%>
</html>