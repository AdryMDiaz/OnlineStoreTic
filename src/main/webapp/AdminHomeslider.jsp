<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="./css/styleadmdor.css">
<link rel="stylesheet" href="./css/estiloSlider.css">
<link rel="stylesheet" href="./js/slider.js">


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	  integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	  integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>

<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
		integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
		crossorigin="anonymous"></script>


<title>StoreTIC-Perfil Administrador</title>
<link rel="shortcut icon" href="icon/BannerStoreTIC2.png">
</head>


<body> 
	<div class="container-fluid">
		<div class="card-banner">
			<img src="img/BannerStoreTIC3.jpeg"  class="w3-round" alt="img/BannerStoreTIC3.jpeg"/>
		</div>
		<div class="cont-central">
			<div class="container-slider">
				<div class="cont-img">
					<div class="slider" id="slider">
							<div class="slider-section">
								<img src="img/img_products1.png" alt="" class="slider-img">
							</div>
							<div class="slider-section">
								<img src="img/img_products2.png" alt="" class="slider-img">
							</div>
							<div class="slider-section">
								<img src="img/img_products3.png" alt="" class="slider-img">
							</div>
							<div class="slider-section">
								<img src="img/img_products4.png" alt="" class="slider-img">
							</div>
							<div class="slider-section">
								<img src="img/img_products5.png" alt="" class="slider-img">
							</div>
							<div class="slider-section">
								<img src="img/img_products6.png" alt="" class="slider-img">
							</div>
							<div class="slider-section">
								<img src="img/img_products7.png" alt="" class="slider-img">
							</div>
							<div class="slider-section">
								<img src="img/img_products8.png" alt="" class="slider-img">
							</div>
							<div class="slider-section">
								<img src="img/img_products9.png" alt="" class="slider-img">
							</div>
							<div class="slider-section">
								<img src="img/img_products10.png" alt="" class="slider-img">
							</div>
							<div class="slider-btn slider-btn-right" id="btn-right">&#62;</div>
							<div class="slider-btn slider-btn-left" id="btn-left">&#60;</div>	
					</div>
				</div>
			</div>
			<script src="js/slider.js"></script>
		</div>
		<div class="card1">
		
			<div class="nav">
					<%String usuario=session.getAttribute("usuario").toString();%>
				   	<button class="btn" type="button" style="background-color:#dc3545">
				   		<i class='fas fa-users' style='font-size:24px'></i>
				   		<a class="nav-link" href="GestionUsuarios.jsp" >Gestión de Clientes</a>
				   	</button>
				   	<button class="btn" type="button" style="background-color:#fd7e14">
					   	<i class='fas fa-truck' style='font-size:24px'></i>
					   	<a class="nav-link" href="GestionProveedores.jsp" >Gestión de Proveedores</a>
					</button>
					<button class="btn" type="button" style="background-color:#dc3545">
					   	<i class="fa fa-cubes" style="font-size:24px"></i>
					   	<a class="nav-link" href="GestionProductos.jsp" >Gestión de Productos</a>
					</button>
					<button class="btn" type="button" style="background-color:#fd7e14">
					   	<i class='fas fa-chart-bar' style='font-size:24px'></i>
					   	<a class="nav-link" href="GestionVentas.jsp" >Gestión de Ventas</a>
					</button>
					<button class="btn" type="button" style="background-color:#dc3545">
					   	<i class='fas fa-print' style='font-size:24px'></i>
					   	<a class="nav-link" href="GestionReportes.jsp" >Gestión de Reportes</a>
					</button>
					<button class="btn" type="button" style="background-color:#fd7e14">
					   	<i class='fas fa-address-card' style='font-size:24px'></i>
					   	<a class="nav-link" href="GestionContactanos.jsp" >Contáctanos</a>
					</button>
					<button class="btn" type="button" style="background-color:#dc3545">
					   	<i class='fas fa-home' style='font-size:24px'></i>
					   	<a class="nav-link" href="LogoutAdmin.jsp" >Página Principal</a>
					</button>
			</div>
		</div>
		<div class="footer">
		</div>
	</div>	
</body>
</html>