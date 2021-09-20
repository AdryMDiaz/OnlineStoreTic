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
<center>
<img align="middle" alt="" width="600" src="img/BannerStoreTIC3.jpeg"/>
</center>
<nav class="nav nav-pills flex-column flex-sm-row">
<%String usuario=session.getAttribute("usuario").toString();%>
  <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="UpdateUser.jsp" style="background-color:#0dcaf0" aria-disabled="true">Actualiza tu información</a>
  <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="#" style="background-color:#0d6efd" aria-disabled="true">Productos</a>
  <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="#" style="background-color:#0dcaf0" aria-disabled="true">Aliados</a>
  <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="#" style="background-color:#0d6efd" aria-disabled="true">Contactanos</a>
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