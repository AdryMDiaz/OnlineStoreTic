<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Store TIC - Login</title>
</head>
<body>
	<div class="container mt-4 col-lg-4">
		<div class="card col-sm-10">
			<div class="card-body">
				<form class="form-sign" action="ModuloLoginAction.jsp" method="POST">
					<div class="form-group text-center">
						<figure class="text-center">
  							<blockquote class="blockquote">
								<h2>Bienvenido a Store TIC</h2>
							</blockquote>
						<figure class="text-center">
  							<blockquote class="blockquote">
								<p>Store TIC es un sistema de compras online que permite a los usuarios comprar en línea sin tener que ir a las tiendas físicas</p>
							</blockquote>
					</div>
					<div class="form-group">
						<label>Usuario </label> <input type="text" name="usuario" class="form-control" placeholder="Digite usuario" required>
						<p></p>
					</div>
					<div class="form-group" id="show_hide_password">
						<label>Password</label> <input type="password" name="clave" class="form-control" placeholder="Digite su contraseña" required>
						<p></p>
					</div>
						<input type="submit" name="accion" value="Ingresar" class="btn btn-primary btn">
					<div>
					<p></p>
					<figure class="text-center">
  						<blockquote class="blockquote">
							<h6><a href="UserNew.jsp">Registrese con nosotros</a></h6>
						</blockquote>
					<figure class="text-center">
  						<blockquote class="blockquote">
							<h6><a href="OlvidePass.jsp">Olvidé mi contraseña</a></h6>
						</blockquote>
					<% 
					String msg=request.getParameter("msg");

					if ("notexist".equals(msg)){
					%>
					<figure class="text-center">
  					<blockquote class="blockquote">
  						<div class="alert-danger">
							<strong>Usuario o Contraseña Incorrecta</strong>
						</div>
					</blockquote>
					<% } %>
					<%
					if ("invalid".equals(msg)){
					%>
					<h6>Algo salió mal! Intentalo de nuevo!</h6>
					<% } %>
					</div>
				</form>
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