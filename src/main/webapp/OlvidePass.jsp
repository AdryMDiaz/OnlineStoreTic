<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Store TIC - Olvido Contraseña</title>
</head>
<body>
	<div class="container mt-4 col-lg-4">
		<div class="card col-sm-10">
			<div class="card-body">
				<form class="form-sign" action="OlvidePassAction.jsp" method="POST">
					<div class="form-group text-center">
					<img alt="70" width="370" src="img/BannerStoreTIC.jpeg"/>
						<figure class="text-center">
								<h2></h2>
						<figure class="text-center">
							<h5 style="color:#6610f2">Sistema de Compras Online</h5>
						<div class="mb-3">
							<input type="text" name="cedula" class="form-control" id="formGroupExampleInput" placeholder="Digite documento de identidad" required>
						</div>
						<div class="mb-3">
							<input type="text" name="nombre_completo" class="form-control"	id="formGroupExampleInput" placeholder="Digite nombres y apellidos completos" required>
						</div>
						<div class="mb-3">
							<input type="email" name="correo_electronico" class="form-control" id="formGroupExampleInput" placeholder="Digite dirección de correo electrónico" required>
						</div>
						<div class="mb-3">
							<input type="text" name="usuario" class="form-control"	id="formGroupExampleInput" placeholder="Digite usuario" required>
						</div>
						<div class="mb-3">
							<input type="password" name="newclave" class="form-control" id="formGroupExampleInput" placeholder="Digite contraseña" required>
						</div>
						<input style="background-color:#6610f2;color:#FFFFFF;border:#6610f2 1px solid" type="submit" name="accion" value="Guardar" class="btn btn-primary btn">
					</div>
				</form>
				<p></p>
				<figure class="text-center">
						<h6><a style="color:#6610f2" href="ModuloLogin.jsp" class="link-primary">Ya estoy registrado</a></h6>
				<%
				String msg=request.getParameter("msg");
				if ("done".equals(msg)){
				%>
					<strong style="color:#198754" class="text-center">Contraseña modificada satisfactoriamente!</strong>
				<% } %>
				<%
				if ("invalid".equals(msg)){
				%>
					<strong style="color:#dc3545" class="text-center">Los datos ingresados no coinciden o el usuario no esta registrado, por favor valide e intente nuevamente</Strong>
				<% } %>
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