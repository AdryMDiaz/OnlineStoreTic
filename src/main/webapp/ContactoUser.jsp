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
<title>Contactanos</title>
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
				<form class="form-sign" action="ContactoUserAction.jsp" method="POST">
					<div class="row">
						<div class="col-md-6 mb-3">
    						<label for="cedula" class="form-label">Número de Identificación</label>
    						<input type="text" name="cedula" class="form-control" id="formGroupExampleInput" placeholder="Digite documento de identidad" value= "<%=rs.getString(1)%>" readonly="readonly" required>
  						</div>
  						<div class="col-md-6 mb-3">
    						<label for="newnombre_completo" class="form-label">Nombres y Apellidos</label>
    						<input type="text" name="nombre_completo" class="form-control"	id="formGroupExampleInput" placeholder="Digite nombres y apellidos completos" value= "<%=rs.getString(2)%>" readonly="readonly" required>
  						</div>
  					</div>
  					<div class="row">
						<div class="col-md-6 mb-3">
    						<label for="correo_electronico" class="form-label">Dirección de Correo Electrónico</label>
    						<input type="email" name="correo_electronico" class="form-control" id="formGroupExampleInput" placeholder="Digite dirección de correo electrónico" value= "<%=rs.getString(3)%>" readonly="readonly" required>
  						</div>
  						<div class="col-md-3 mb-3">
    						<label for="usuario" class="form-label">Usuario</label>
    						<input type="text" name="usuario" class="form-control"	id="formGroupExampleInput" placeholder="Digite usuario" value= "<%=rs.getString(4)%>" readonly="readonly" required>
  						</div>
  						<div class="col-md-3 mb-3">
    						<label for="estado" class="form-label">Estado cliente</label>
    						<input type="text" name="estado" class="form-control" id="formGroupExampleInput" placeholder="estado del cliente" value= "<%=rs.getString(6)%>" readonly="readonly" required>
  						</div>
  					</div>
  					 <div class="row">
  						<div class="col-5 mb-3">
    						<label for="telefono_celular" class="form-label">Teléfono Celular</label>
    						<input type="text" name="telefono_celular" class="form-control" id="formGroupExampleInput" placeholder="Digite número de teléfono celular" value= "<%=rs.getString(11)%>" readonly="readonly" required>
  						</div>
  						<div class="col-md-5 mb-3">
    						<label for="telefono_fijo" class="form-label">Teléfono Fijo</label>
    						<input type="text" name="telefono_fijo" class="form-control" id="formGroupExampleInput" placeholder="Digite número de teléfono fijo" value= "<%=rs.getString(12)%>" readonly="readonly" required>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-12 mb-3">
    						<label for="direccion" class="form-label">Dirección de envío</label>
    						<input type="text" name="direccion" class="form-control" id="formGroupExampleInput" placeholder="Digite dirección de envío" value= "<%=rs.getString(7)%>" readonly="readonly" required>
  						</div>
  					</div>
  					<div class="row">
  						<div class="form-floating">
  							<textarea name="comentarios" class="form-control" id="floatingTextarea2" placeholder="Deja tus comentarios aquí" style="height: 100px" required></textarea>
  							<label for="floatingTextarea2">Escribe tus comentarios aquí</label>
						</div>
					</div>
					<div class="row">
					<p></p>
  						<div>
							<input style="background-color:#0dcaf0;color:#FFFFFF;border:#0dcaf0 1px solid" type="submit" name="accion" value="Enviar a Admin" class="btn btn-primary btn">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
		<% 
					String msg=request.getParameter("msg");

					if ("done".equals(msg)){
					%>
						<figure class="text-center">
						<strong class="text-center" style="color:#198754">El administrador se pondrá en contacto contigo!</strong>
					<% } %>
					<%
					if ("invalid".equals(msg)){
					%>
						<figure class="text-center">
						<strong class="text-center" style="color:#dc3545">Escribe tus comentarios</strong>
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