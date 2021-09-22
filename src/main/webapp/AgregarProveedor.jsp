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

<title>Agregar Proveedor</title>
<link rel="shortcut icon" href="icon/BannerStoreTIC2.png">
</head>
<body>
	<div class="container mt-6 col-lg-6">
		<div class="card col-sm-12">
			<div class="card-body">
				<form class="form-sign" action="AgregarProveedorAction.jsp" method="POST">
				<div class="form-group text-center">
					<figure class="text-center">
								<h2></h2>
						<figure class="text-center">
								<h5 style="color:#198754">Bienvenido al Módulo de Adición de Proveedores</h5>
								<h5 style="color:#198754">Por favor digite la información y presione "Agregar" al finalizar</h5>
					<div class="row">
							<div class="col-md-6 mb-3">
    						<label for="nit_proveedor" class="form-label">NIT del Proveedor</label>
    						<input type="text" name="nit_proveedor" class="form-control" id="formGroupExampleInput" placeholder="Digite el Nit del Proveedor" required>
    					</div>
  						<div class="col-md-6 mb-3">
    						<label for="nombre_proveedor" class="form-label">Nombre del Proveedor</label>
    						<input type="text" name="nombre_proveedor" class="form-control"	id="formGroupExampleInput" placeholder="Digite el nombre del Proveedor" required>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-md-6 mb-3">
    						<label for="direccion" class="form-label">Dirección del Proveedor</label>
    						<input type="text" name="direccion" class="form-control" id="formGroupExampleInput" placeholder="Digite dirección del Proveedor" required>
  						</div>
  						<div class="col-md-6 mb-3">
    						<label for="telefono" class="form-label">Teléfono</label>
    						<input type="text" name="telefono" class="form-control" id="formGroupExampleInput" placeholder="Digite el teléfono del Proveedor" required>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-md-6 mb-3">
    						<label for="contacto_proveedor" class="form-label">Contacto del Proveedor</label>
    						<input type="text" name="contacto_proveedor" class="form-control" id="formGroupExampleInput" placeholder="Digite contacto del Proveedor" required>
  						</div>
  						<div class="col-md-6 mb-3">
    						<label for="correo_electronico" class="form-label">Dirección de Correo Electrónico</label>
    						<input type="email" name="correo_electronico" class="form-control" id="formGroupExampleInput" placeholder="Digite el correo electrónico del Proveedor" required>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-md-4 mb-3">
  							<%
  							try{
  								Connection cn=ConnectionProvider.getCon();
  								Statement st=cn.createStatement();
  								String sql="select id_municipio, nom_municipio from storetic.municipio order by nom_municipio";
  								ResultSet rst = st.executeQuery(sql);
  								%>
    								<label for="nom_municipio" class="form-label">Ciudad / Municipio</label>
    								<select name="nom_municipio" class="form-select" required>
    									<option></option>
    									<% while (rst.next()){%>
    									<option value=<%=rst.getString(2)%>><%=rst.getString(2)%></option>
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
  								String sql="select id_departamento, nom_departamento from storetic.departamento order by nom_departamento";
  								ResultSet rst = st.executeQuery(sql);
  							%>
    							<label for="nom_departamento" class="form-label">Departamento</label>
    							<select name="nom_departamento" class="form-select" required>
    								<option selected></option>
    							<% while (rst.next()){
    							%>
    								<option value=<%=rst.getString(2)%>><%=rst.getString(2)%></option>
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
  								String sql="select pais_abreviado, nom_pais from storetic.paises order by nom_pais";
  								ResultSet rst = st.executeQuery(sql);
  							%>
    							<label for="nom_pais" class="form-label">País</label>
    							<select name="nom_pais" class="form-select" required>
      								<option selected></option>
      								<% while (rst.next()){
    								%>
    								<option value=<%=rst.getString(2)%>><%=rst.getString(2)%></option>
      								<%}%>
    							</select>
    							<%
									} catch (Exception e){
										System.out.println(e);
								}
								%>
  						</div>
  					</div>
 					<div class="mb-3">
    					<div class="col" >
      						<button style="background-color:#198754;color:#FFFFFF;border:#198754 1px solid" type="submit" name="accion" value="Agregar" class="btn btn-primary btn">Agregar Proveedor</button>
    					</div>
  					</div>
  					<div class="row row-cols-lg-7 g-1">
    				<div class="col" >
      					<div><h6 class="text-center"><a style="color:#dc3545"  href="GestionProveedores.jsp">Volver a Gestión de Proveedores</a></h6></div>
    			</div>
  				</div>
				</form>
			
		<% 
					String msg=request.getParameter("msg");

					if ("valid".equals(msg)){
					%>
						<figure class="text-center">
						<strong class="text-center" style="color:#198754">Registro Adicionado Exitosamente</strong>
					<% } %>
					<%
					if ("invalid".equals(msg)){
					%>
						<figure class="text-center">
						<strong class="text-center" style="color:#dc3545">Proveedor no se adicionó o ya se encuentra registrado</strong>
				<% } %>		
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