<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Store TIC - Tienda Online</title>
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
	<a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="" style="background-color:#ffc107; color:#000" aria-disabled="false"><b><%out.println("Bienvenido a StoreTIC" + usuario);%></b></a>
  	<a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="UpdateUser.jsp" style="background-color:#0dcaf0" aria-disabled="true">Actualiza tu información</a>
  	<a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="AliadosUser.jsp" style="background-color:#0d6efd" aria-disabled="true">Nuestros Aliados</a>
  	<a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="NuestrosProductos.jsp" style="background-color:#0dcaf0" aria-disabled="true">Nuestros Productos</a>
  	<a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="CarritoComprasUser.jsp" style="background-color:#0d6efd" aria-disabled="true">Carrito de Compras</a>
  	<a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="PedidosUser.jsp" style="background-color:#0dcaf0" aria-disabled="true">Mis Pedidos</a>
  	<a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="ContactoUser.jsp" style="background-color:#0d6efd" aria-disabled="true">Contactanos</a>
  	<a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="LogoutUser.jsp" style="background-color:#000" aria-disabled="true">Salir de StoreTIC</a>
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