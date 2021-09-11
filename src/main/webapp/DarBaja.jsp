<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Store TIC - Darme de Baja</title>
</head>
<body>
	<div class="container mt-4 col-lg-4">
		<div class="card col-sm-10">
			<div class="card-body" style="border:#6610f2 1px solid">
				<form class="form-sign" action="DarBajaAction.jsp" method="POST">
					<div class="form-group text-center">
					<img alt="70" width="370" src="img/BannerStoreTIC.jpeg"/>
						<figure class="text-center">
							<h2></h2>
						<figure class="text-center">
							<h5 style="color:#6610f2">Sistema de Compras Online</h5>
						<div class="mb-3" >
							<input type="email" name="correo_electronico" class="form-control"	id="formGroupExampleInput" placeholder="Digite dirección de correo electrónico registrada" required>
						</div>
						<input style="background-color:#6610f2;color:#FFFFFF;border:#6610f2 1px solid" type="submit" name="accion" value="Darme de Baja" class="btn btn-warning btn" >
					</div>
				</form>
				<div class="row row-cols-lg-7 g-1">
    				<div class="col" >
      					<div><h6 class="text-center"><a style="color:#6610f2"  href="ModuloLogin.jsp">Volver al Inicio</a></h6></div>
    				</div>
					<% 
					String msg=request.getParameter("msg");

					if ("delete".equals(msg)){
					%>
						<strong style="color:#198754" class="text-center">Usuario eliminado satisfactoriamente</strong>
					<% } %>
					<%
					if ("invalid".equals(msg)){
					%>
						<strong style="color:#dc3545" class="text-center">Correo electrónico no registrado</strong>
					<% } %>
					</div>
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