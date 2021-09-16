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
	<img alt="" width="100" src="img/BannerStoreTIC2.png" />
	<nav class="nav nav-pills flex-column flex-sm-row">
		<a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="#" style="background-color: #0dcaf0">Actualiza tu información</a>
		<a class="flex-sm-fill text-sm-center nav-link disabled" href="#" aria-disabled="true">Productos</a>
		<a class="flex-sm-fill text-sm-center nav-link disabled" href="#" aria-disabled="true">Síguenos</a>
		<a class="flex-sm-fill text-sm-center nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Contactanos</a>
	</nav>
	<div class="container mt-5 col-lg-6">
		<div class="card col-sm-14">
			<div class="card-body">
				<form class="form-sign" action="" method="POST">
					<div class="row">
						<div class="col-md-6 mb-3">
    						<label for="inputcedula" class="form-label">Número de Identificación</label>
    						<input type="text" class="form-control" id="inputcedula" placeholder="Número de Identificación" required>
  						</div>
  						<div class="col-md-6 mb-3">
    						<label for="inputnombre_completo" class="form-label">Nombres y Apellidos</label>
    						<input type="text" class="form-control" id="inputnombre_completo" placeholder="Nombres y Apellidos completos" required>
  						</div>
  					</div>
  					<div class="row">
						<div class="col-md-6 mb-3">
    						<label for="inputcorreo_electronico" class="form-label">Dirección de Correo Electrónico</label>
    						<input type="email" class="form-control" id="inputcorreo_electronico" placeholder="Dirección de correo eletrónico" required>
  						</div>
  						<div class="col-md-3 mb-3">
    						<label for="inputusuario" class="form-label">Usuario</label>
    						<input type="text" class="form-control" id="inputusuario" placeholder="Usuario" required>
  						</div>
  						<div class="col-md-3 mb-3">
    						<label for="inputclave" class="form-label">Password</label>
    						<input type="password" class="form-control" id="inputclave" placeholder="Contraseña" required>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-7 mb-3">
    						<label for="inputdireccion" class="form-label">Dirección</label>
    						<input type="text" class="form-control" id="inputdireccion" placeholder="Dirección de envío" required>
  						</div>
  						<div class="col-md-5 mb-3">
    						<label for="inputbarrio" class="form-label">Barrio</label>
    						<input type="text" class="form-control" id="inputbarrio" placeholder="Nombre Barrio" required>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-4 mb-3">
    						<label for="inputciudad" class="form-label">Ciudad</label>
    						<select id="inputciudad" class="form-select" required>
      							<option selected>Seleccione...</option>
      						<option>...</option>
    						</select>
  						</div>
  						<div class="col-md-4 mb-3">
    						<label for="inputdepartamento" class="form-label">Departamento</label>
    						<select id="inputdepartamento" class="form-select" required>
      							<option selected>Seleccione...</option>
      						<option>...</option>
    						</select>
  						</div>
  						<div class="col-md-4 mb-3">
    						<label for="inputpais" class="form-label">País</label>
    						<select id="inputpais" class="form-select" required>
      							<option selected>Seleccione...</option>
      						<option>...</option>
    						</select>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-4 mb-3">
    						<label for="inputtelefonocelular" class="form-label">Teléfono Celular</label>
    						<input type="text" class="form-control" id="inputtelefonocelular" placeholder="Número de teléfono celular" required>
  						</div>
  						<div class="col-md-4 mb-3">
    						<label for="inputtelefonofijo" class="form-label">Teléfono Fijo</label>
    						<input type="text" class="form-control" id="inputtelefonofijo" placeholder="Número de teléfono fijo" required>
  						</div>
  						<div class="col-md-4 mb-3">
    						<label for="inputestado" class="form-label">Estado cliente</label>
    						<input type="text" class="form-control" id="inputestado" placeholder="Estado actual del cliente" required>
  						</div>
  					</div>
  					<div class="mb-3">
    				<div class="col" >
      					<button style="background-color:#0dcaf0;color:#FFFFFF;border:#0dcaf0 1px solid" type="submit" name="accion" value="Registrar" class="btn btn-primary btn">Actualizar Datos</button>
    				</div>
    					
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
</html>
</body>
</html>