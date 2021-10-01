<%@include file="AdminHome.jsp"%>
<%@page import="java.sql.*"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Módulo Productos</title>
</head>
<body>
	<div class="table mt-12">
		<table class="table table-responsive table-striped table-hover">
			<style>
			 table { table-layout: fixed; }
			 table th, table td { overflow: hidden; }
			</style>
			<thead>
				<tr>
					<th>CÓDIGO</th>
					<th>PRODUCTO</th>
					<th>CATEGORIA</th>
					<th>NIT PROVEEDOR</th>
					<th>PRECIO ANTES DE IVA</th>
					<th>IVA</th>
					<th>PRECIO VENTA</th>
					<th>INVENTARIO INICIAL</th>
					<th>UNIDADES VENDIDAS</th>
					<th>UNIDADES DISPONIBLES</th>
					<th>ESTADO</th>
				</tr>
			</thead>
			<tbody>
				<%
try{
				Connection con=ConnectionProvider.getCon();
				Statement stmt=con.createStatement();
				String query="select p.*,c.categoria,i.porcentaje_iva,e.estado from storetic.productos p, storetic.categorias c, storetic.iva i, storetic.estado e where p.id_categoria=c.id_categoria and p.id_iva=i.id_iva and e.id_estado = p.id_estado order by codigo_producto, nombre_producto";
				ResultSet rs = stmt.executeQuery(query);
				
				while (rs.next()){	
					String precioVenta = Long.toString(Math.round(rs.getInt(5)+(rs.getInt(5)*rs.getFloat(11))));
					String unidadesDisponibles = Integer.toString(rs.getInt(7)-rs.getInt(8));
			%>
			
			<tr>
				
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(10)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(11)%></td>
				<td><%=precioVenta%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=unidadesDisponibles%></td>
				<td><%=rs.getString(12)%></td>
				
				<div class="btn-group" role="group" aria-label="Basic outlined example">
				  <td><a type="button" class="btn btn-outline-success" href="EditarProducto.jsp?codigo_producto=<%=rs.getString(1)%>">Editar</a></td>
				  <td><a type="button" class="btn btn-outline-dark" href="InactivarProducto.jsp">Desactivar</a></td>
				  <td><a type="button" class="btn btn-outline-danger" href="ReactivarProducto.jsp">Reactivar</a></td>
				</div>			
    		</tr>
			<% }
				
			}catch(Exception e){
				System.out.println(e);
			}
			%>
			</tbody>
				<div align="center">
					<div class="container">
						<div class="mb-3">
							<a type="button" class="btn btn-outline-success" href="AgregarProducto.jsp">Crear Nuevo Producto</a>
					</div>
				</div>
				<div class="container col-5">
					<div class="input-group mb-6 g-3">
						<form action="Import.jsp" method="post" enctype="multipart/form-data">
							<input class= "form-control" type="file" name="file" size="50" accept=".csv" />					
							<input type="submit" value="Importar Archivo" />
						</form>
					</div>
				</div>
				<div class="container col-5">
					<div class="input-group mb-6 g-3">
						<form action="BuscarProducto.jsp">
							<input type="text" name="txtbuscar" class="form-control" placeholder="Buscar un producto por el nombre de su categoría">
							<input class="btn btn-outline-secondary" type="submit" value="Buscar">
						</form>
					</div>
					<p></p>
				</div>
							<% 
								String msg=request.getParameter("msg");

								if ("valid".equals(msg)){
							%>
								<figure class="text-center">
									<strong class="text-center" style="color:#198754">Archivo Cargado Existosamente!</strong>
							<% } %>
							<%
								if ("invalid".equals(msg)){
							%>
								<figure class="text-center">
									<strong class="text-center" style="color:#dc3545">Error: No se seleccionó archivo para cargar</strong>
							<% } %>
		</table>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
		integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
		integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
		crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
<%@include file="Footer.jsp"%>
</html>