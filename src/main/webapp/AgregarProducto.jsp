<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="AdminHome.jsp"%>

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

<title>Agregar Producto</title>
<link rel="shortcut icon" href="icon/BannerStoreTIC2.png">
</head>
<body>
	<div class="container mt-6 col-lg-6">
		<div class="card col-sm-12">
			<div class="card-body">

				<!-- Adición del Autoincremento ----------------------------------------------------------->

				<%
				int codigo_producto = 1;
				try {
					Connection cn = ConnectionProvider.getCon();
					Statement st = cn.createStatement();
					String sql = "select max(codigo_producto) from storetic.productos";
					ResultSet rst = st.executeQuery(sql);
					while (rst.next()) {
						codigo_producto = rst.getInt(1);
						codigo_producto = codigo_producto + 1;

					}
				} catch (Exception e) {
				}
				%>
				<!-- FIN Adición del Autoincremento ----------------------------------------------------------->


				<form class="form-sign" action="AgregarProductoAction.jsp" method="POST">
					<div class="form-group text-center">
						<figure class="text-center">
							<h2></h2>
						<figure class="text-center">
							<h5 style="color: #198754">Bienvenido al Módulo de Adición de Productos</h5>
							<h5 style="color: #198754">Por favor digite la información y presione "Agregar" al finalizar</h5>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label for="codigo_producto" class="form-label" >Código Producto</label>
							<input type="text" name="codigo_producto" class="form-control" value="<%out.println(codigo_producto);%>" readonly="readonly" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="nombre_producto" class="form-label">Nombre del Producto</label> 
							<input type="text" name="nombre_producto"class="form-control" id="formGroupExampleInput" placeholder="Digite el Nombre del producto" required>
						</div>
						<div class="col-md-4 mb-3">
								<%
									try{
									Connection cn=ConnectionProvider.getCon();
									Statement st=cn.createStatement();
									String sql="select id_estado, estado from storetic.estado order by estado";
									ResultSet rst = st.executeQuery(sql);
								%>
									<label for="id_estado" class="form-label">Estado del Producto</label>
									<select name="id_estado" class="form-select" required>
										<option selected></option>
											<% while (rst.next()){
											%>
										<option value=<%=rst.getInt(1)%>><%=rst.getString(2)%></option>
			  							<%}%>
										</select>
										<%
										} catch (Exception e){
											System.out.println(e);
										}
										%>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4 mb-3">
								<%
									try{
									Connection cn=ConnectionProvider.getCon();
									Statement st=cn.createStatement();
									String sql="select id_categoria, categoria from storetic.categorias order by categoria";
									ResultSet rst = st.executeQuery(sql);
								%>
										<label for="id_categoria" class="form-label">Categoría del Producto</label>
										<select name="id_categoria" class="form-select" required>
											<option selected></option>
										<% while (rst.next()){
										%>
											<option value=<%=rst.getInt(1)%>><%=rst.getString(2)%></option>
			  							<%}%>
										</select>
										<%
											} catch (Exception e){
												System.out.println(e);
											}
										%>
							</div>
							<div class="col-md-4 mb-3">
								<%
									try{
									Connection cn=ConnectionProvider.getCon();
									Statement st=cn.createStatement();
									String sql="select nit_proveedor, nombre_proveedor from storetic.proveedores order by nombre_proveedor";
									ResultSet rst = st.executeQuery(sql);
								%>
									<label for="nit_proveedor" class="form-label">Razón Social Proveedor</label>
									<select name="nit_proveedor" class="form-select" required>
										<option selected></option>
											<% while (rst.next()){
											%>
										<option value=<%=rst.getInt(1)%>><%=rst.getString(2)%></option>
			  							<%}%>
										</select>
										<%
										} catch (Exception e){
											System.out.println(e);
										}
										%>
							</div>
							<div class="col-md-4 mb-3">
								<label for="precio_compra" class="form-label">Precio de Compra</label> 
								<input type="number" name="precio_compra" class="form-control" id="formGroupExampleInput" placeholder="Digite el precio de compra" required>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4 mb-3">
							<%
								try{
								Connection cn=ConnectionProvider.getCon();
								Statement st=cn.createStatement();
								String sql="select id_iva, porcentaje_iva from storetic.iva order by id_iva";
								ResultSet rst = st.executeQuery(sql);
							%>
								<label for="id_iva" class="form-label"> Porcentaje de IVA</label>
								<select name="id_iva" class="form-select" required>
									<option selected></option>
										<% while (rst.next()){
										%>
									<option value=<%=rst.getInt(1)%>><%=rst.getString(2)%></option>
		  							<%}%>
									</select>
									<%
									} catch (Exception e){
										System.out.println(e);
									}
									%>
						</div>
						<div class="col-md-4 mb-3">
							<label for="inventario_inicial" class="form-label">Inventario inicial</label> 
							<input type="number" name="inventario_inicial" class="form-control" id="formGroupExampleInput" placeholder="Digite el Inventario Inicial" required>
						</div>
						<div class="col-md-4 mb-3">
							<label for="unidades_vendidas" class="form-label">Unidades Vendidas</label> 
							<input type="number" name="unidades_vendidas" class="form-control" id="formGroupExampleInput" placeholder="Digite las unidades que se han Vendido" required>
						</div>
					</div>
					<div class="mb-3">
						<div class="text-center" >
							<button
								style="background-color: #198754; color: #FFFFFF; border: #198754 1px solid" type="submit" name="accion" value="Agregar" class="btn btn-primary btn">Agregar Producto</button>
						</div>
					</div>
					<div class="row row-cols-lg-7 g-1">
						<div class="col">
							<div>
								<h6 class="text-center">
									<a style="color: #dc3545" href="GestionProductos.jsp">Volver a Gestión Productos</a>
								</h6>
							</div>
						</div>
					</div>
				</form>

			<%
			String msg = request.getParameter("msg");

			if ("valid".equals(msg)) {
			%>
			<figure class="text-center">
				<strong class="text-center" style="color: #198754">Producto adicionado Exitosamente!</strong>
				<%
				}
				%>
				<%
				if ("invalid".equals(msg)) {
				%>
				<figure class="text-center">
					<strong class="text-center" style="color: #dc3545">El producto no se adicionó, por favor Intente nuevamente!</strong>
					<%
					}
					%>
			</div>
		</div>
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
</body>
</html>