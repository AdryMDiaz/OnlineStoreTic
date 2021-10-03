<%@include file="AdminHome.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
			<title>Modulo Reportes</title>
	</head>
	<body>
		<h3></h3>
		<div class="d-grid gap-2 col-6 mx-auto" style="height:220px">
			<p>
				<form class="form-sign" action="Informe_Venta_Productos.jsp" method="POST">
  					<input style="background-color:#dc3545;color:#FFFFFF;border:#dc3545 1px solid" type="submit" name="accion" value="Informe de Ventas por Producto" class="btn btn-primary btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false">
				</form>
			</p>
			<div style="min-height: 120px;">
  				<div class="collapse collapse-horizontal" id="collapseWidthExample">
    				<div class="card card-body" style="width: 300px; height: 200px">
      					Este informe describe las cantidades adquiridas, valor de la inversión inicial total, ventas generadas, existencias por producto, valor total de las ventas generadas a la fecha y el valor del IVA por cada producto.
    				</div>
  				</div>
			</div>
		</div>
	</body>
<%@include file="Footer.jsp"%>
</html>