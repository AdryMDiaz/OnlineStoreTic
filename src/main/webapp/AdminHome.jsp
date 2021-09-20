<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Store TIC - Perfil Administrador</title>
<link rel="shortcut icon" href="icon/BannerStoreTIC2.png">
</head>
<body>
<center>
<div align="center">
	<img alt="200" width="1000" src="img/BannerStoreTIC3.jpeg"/>
</div>
<h3></h3>
</center>
<nav class="nav nav-pills flex-column flex-sm-row">
<%String usuario=session.getAttribute("usuario").toString();%>
  <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="GestionUsuarios.jsp" style="background-color:#fd7e14">Gestion de Clientes</a>
  <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="GestionProveedores.jsp" style="background-color:#dc3545">Gestión de Proveedores</a>
  <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="GestionProductos.jsp" style="background-color:#fd7e14">Gestión de Productos</a>
  <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="GestionVentas.jsp" style="background-color:#dc3545">Gestión de Ventas</a>
  <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="GestionReportes.jsp" style="background-color:#fd7e14">Consultas y Reportes</a>
  <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="LogoutAdmin.jsp" style="background-color:#000">Salir del Sistema</a>
</nav>
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