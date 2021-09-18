<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="HomeUser.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Store TIC</title>
<link rel="shortcut icon" href="icon/BannerStoreTIC2.png">
</head>
<body>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select * from storetic.clientes where usuario='" + usuario + "'";
	ResultSet rs = stmt.executeQuery(query);
	
	while (rs.next()){
%>
	<div class="container mt-5 col-lg-6">
		<div class="card col-sm-14">
			<div class="card-body">
				<form class="form-sign" action="UpdateUserAction.jsp" method="POST">
					<div class="row">
						<div class="col-md-6 mb-3">
    						<label for="cedula" class="form-label">Número de Identificación</label>
    						<input type="text" class="form-control" id="cedula" value="<%=rs.getString(1)%>" placeholder="Número de documento de identidad" readonly="readonly" required>
  						</div>
  						<div class="col-md-6 mb-3">
    						<label for="newnombre_completo" class="form-label">Nombres y Apellidos</label>
    						<input type="text" class="form-control" id="newnombre_completo" value="<%=rs.getString(2)%>" placeholder="Nombres y Apellidos completos" required>
  						</div>
  					</div>
  					<div class="row">
						<div class="col-md-6 mb-3">
    						<label for="newcorreo_electronico" class="form-label">Dirección de Correo Electrónico</label>
    						<input type="email" class="form-control" id="newcorreo_electronico" value="<%=rs.getString(3)%>" placeholder="Dirección de correo eletrónico" required>
  						</div>
  						<div class="col-md-3 mb-3">
    						<label for="newusuario" class="form-label">Usuario</label>
    						<input type="text" class="form-control" id="newusuario" value="<%=rs.getString(4)%>" placeholder="Usuario" required>
  						</div>
  						<div class="col-md-3 mb-3">
    						<label for="newclave" class="form-label">Password</label>
    						<input type="password" class="form-control" id="newclave" value="<%=rs.getString(5)%>" placeholder="Contraseña" required>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-9 mb-3">
    						<label for="newdireccion" class="form-label">Dirección</label>
    						<input type="text" class="form-control" id="newdireccion" value="<%=rs.getString(8)%>" placeholder="Dirección de envío" required>
  						</div>
  						<div class="col-md-3 mb-3">
    						<label for="estado" class="form-label">Estado cliente</label>
    						<input type="text" class="form-control" id="estado" value="<%=rs.getString(6)%>" placeholder="Estado actual del cliente" readonly="readonly">
  						</div>
  					</div>				
  					<div class="row">
  						<div class="col-md-4 mb-3">
  						<%
  						try{
  							Connection cn=ConnectionProvider.getCon();
  							Statement st=con.createStatement();
  							String sql="select id_municipio, nom_municipio from storetic.municipio order by nom_municipio";
  							ResultSet rst = stmt.executeQuery(sql);
  							%>
    							<label for="newciudad" class="form-label">Ciudad / Municipio</label>
    							<select id="newciudad" class="form-select" required>
    							<option selected>Seleccione...</option>
    								<% while (rst.next()){%>
    									<option value="0"><%=rst.getString(2)%></option>
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
  							Statement st=con.createStatement();
  							String sql="select nom_departamento, cod_pais from storetic.departamento order by nom_departamento";
  							ResultSet rst = stmt.executeQuery(sql);
  							%>
    						<label for="newdepartamento" class="form-label">Departamento</label>
    						<select id="newdepartamento" class="form-select" required>
    						<option selected>Seleccione...</option>
    						<% while (rst.next()){
    							%>
    							<option value="0"><%=rst.getString(1)%></option>
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
  							Statement st=con.createStatement();
  							String sql="select pais_abreviado, nom_pais from storetic.paises order by nom_pais";
  							ResultSet rst = stmt.executeQuery(sql);
  							%>
    						<label for="newpais" class="form-label">País</label>
    						<select id="newpais" class="form-select" required>
      							<option selected>Seleccione...</option>
      							<% while (rst.next()){
    							%>
    							<option value="0"><%=rst.getString(2)%></option>
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
  						<div class="col-4 mb-3">
    						<label for="newtelefono_celular" class="form-label">Teléfono Celular</label>
    						<input type="text" class="form-control" id="newtelefono_celular" placeholder="Número de teléfono celular" required>
  						</div>
  						<div class="col-md-4 mb-3">
    						<label for="newtelefono_fijo" class="form-label">Teléfono Fijo</label>
    						<input type="text" class="form-control" id="newtelefono_fijo" placeholder="Número de teléfono fijo" required>
  						</div>
  					</div>
  					<div class="mb-3">
    					<div class="col" >
      						<button style="background-color:#0dcaf0;color:#FFFFFF;border:#0dcaf0 1px solid" type="submit" name="accion" value="Actualizar" class="btn btn-primary btn">Actualizar Datos</button>
    					</div>
  					</div>
				</form>
			</div>
		</div>
		<% 
					String msg=request.getParameter("msg");

					if ("done".equals(msg)){
					%>
						<figure class="text-center">
						<strong class="text-center" style="color:#dc3545">Información actualizada correctamente</strong>
					<% } %>
					<%
					if ("invalid".equals(msg)){
					%>
						<figure class="text-center">
						<strong class="text-center" style="color:#dc3545">Algo salió mal! Intentalo de nuevo!</strong>
				<% } %>
		
	</div>
	<%
	}
	
} catch (Exception e){
	System.out.println(e);
}
%>
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
</html>
</body>
</html>