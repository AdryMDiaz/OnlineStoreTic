<%@include file="AdminHome.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Eliminar Usuario</title>
</head>
<body>
	<div class="container mt-4 col-lg-4">
		<div class="card col-sm-10">
			<div class="card-body" style="border:#198754 1px solid">
				<form class="form-sign" action="EliminarUsuarioAction.jsp" method="POST">
					<div class="form-group text-center">
						<figure class="text-center">
							<h2></h2>
						<figure class="text-center">
							<h5 style="color:#198754">Digite el número de documento del Cliente a eliminar</h5>
						<div class="mb-3" >
							<input type="text" name="cedula" class="form-control"	id="formGroupExampleInput" placeholder="Digite el Nro. de Documento" required>
						</div>
						<input style="background-color:#198754;color:#FFFFFF;border:#198754 1px solid" type="submit" name="accion" value="Eliminar" class="btn btn-warning btn" >
					</div>
				</form>
				<div class="row row-cols-lg-7 g-1">
    				<div class="col" >
      					<div><h6 class="text-center"><a style="color:#198754"  href="GestionUsuarios.jsp">Volver a Gestión de Clientes</a></h6></div>
    			</div>
					<% 
					String msg=request.getParameter("msg");

					if ("delete".equals(msg)){
					%>
						<strong style="color:#198754" class="text-center"> El Cliente ha sido eliminado satisfactoriamente</strong>
					<% } %>
					<%
					if ("invalid".equals(msg)){
					%>
						<strong style="color:#dc3545" class="text-center">Cliente no se eliminó o no existe en la base de datos</strong>
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