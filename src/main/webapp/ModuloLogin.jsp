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
	<div class="container mt-4 col-lg-5">
		<div class="card col-sm-11">
			<div class="card-body" style="border:#6610f2 1px solid">
				<form class="form-sign" action="ModuloLoginAction.jsp" method="POST">
					<div class="form-group text-center">
					<img alt="70" width="545" src="img/BannerStoreTIC.jpeg"/>
						<figure class="text-center">
							<h2></h2>
						<figure class="text-center">
							<h5 style="color:#6610f2">Sistema de Compras Online</h5>
						<div class="mb-3" >
							<input type="text" name="usuario" class="form-control"	id="formGroupExampleInput" placeholder="Digite usuario" required>
						</div>
						<div class="mb-3">
							<input type="password" name="clave" class="form-control" id="formGroupExampleInput" placeholder="Digite contrase�a" required>
						</div>
						<input style="background-color:#6610f2;color:#FFFFFF;border:#6610f2 1px solid" type="submit" name="accion" value="Ingresar" class="btn btn-warning btn" >
					</div>
				</form>
				<div class="row row-cols-lg-7 g-1">
    				<div class="col" >
      					<div><h6 class="text-center"><a style="color:#6610f2"  href="UserNew.jsp">Reg�strate con nosotros</a></h6></div>
    				</div>
    				<div class="col">
      					<div><h6 class="text-center"><a style="color:#6610f2" href="OlvidePass.jsp">Olvid� mi contrase�a</a></h6></div>
    				</div>
    				<div class="col">
      					<div><h6 class="text-center"><a style="color:#6610f2" href="darbaja.jsp">Darme de baja</a></h6></div>
    				</div>
					<% 
					String msg=request.getParameter("msg");

					if ("notexist".equals(msg)){
					%>
						<strong style="color:#dc3545" class="text-center">Usuario o Contrase�a Incorrecta</strong>
					<% } %>
					<%
					if ("invalid".equals(msg)){
					%>
						<strong style="color:#dc3545" class="text-center">Algo sali� mal! Intentalo de nuevo!</strong>
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