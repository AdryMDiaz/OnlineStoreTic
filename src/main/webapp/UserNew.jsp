<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Store TIC - Registro</title>
</head>
<body>
	<div class="container mt-4 col-lg-4">
		<div class="card col-sm-10">
			<div class="card-body">
				<form class="form-sign" action="UserNewAction.jsp" method="POST">
					<div class="form-group text-center">
						<figure class="text-center">
  							<blockquote class="blockquote">
								<h2>Bienvenido a Store TIC</h2>
							</blockquote>
						<figure class="text-center">
  							<blockquote class="blockquote">
								<p>Store TIC es un sistema de compras online que permite a los usuarios comprar en l�nea sin tener que ir a las tiendas f�sicas</p>
							</blockquote>
						<div class="mb-3">
							<input type="text" name="cedula" class="form-control" id="formGroupExampleInput" placeholder="Digite documento de identidad" required>
						</div>
						<div class="mb-3">
							<input type="text" name="nombre_completo" class="form-control"	id="formGroupExampleInput" placeholder="Digite nombres y apellidos completos" required>
						</div>
						<div class="mb-3">
							<input type="email" name="correo_electronico" class="form-control" id="formGroupExampleInput" placeholder="Digite direcci�n de correo electr�nico" required>
						</div>
						<div class="mb-3">
							<input type="text" name="usuario" class="form-control"	id="formGroupExampleInput" placeholder="Digite usuario" required>
						</div>
						<div class="mb-3">
							<input type="password" name="clave" class="form-control" id="formGroupExampleInput" placeholder="Digite contrase�a" required>
						</div>
						<input type="submit" name="accion" value="Registrar" class="btn btn-primary btn">
					</div>
				</form>
				<p></p>
				<figure class="text-center">
  					<blockquote class="blockquote">
						<h6><a href="ModuloLogin.jsp" class="link-primary">Ya estoy registrado</a></h6>
					</blockquote>
				<figure class="text-center">
  					<blockquote class="blockquote">
						<h6><a href="" class="link-primary">Olvid� mi contrase�a</a></h6>
					</blockquote>
				<%
				String msg=request.getParameter("msg");

				if ("valid".equals(msg)){
				%>
				<figure class="text-center">
  					<blockquote class="blockquote">
  						<div class="alert-success">
							<strong>Registro Exitoso</strong>
						</div>
					</blockquote>
				<%}%>
				<%
				if("invalid".equals(msg)){
				%>
				<figure class="text-center">
  					<blockquote class="blockquote">
  						<div class="alert-warning">
							<strong>Usuario ya registrado</Strong>
						</div>
				</blockquote>
				<%}%>
			</div>
		</div>
		<div>
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