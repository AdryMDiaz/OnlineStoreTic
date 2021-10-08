<%@include file="AdminHome.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
			<title>Modulo Reportes</title>
	</head>
	<body>
	<div class="accordion accordion-flush" id="accordionFlushExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        Reporte de Ventas por Categoría
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"><p>En este reporte se relaciona un resumen de ventas por categoría. Aquí encontrarás:</p>
      	<p> - El total del inventario inicial por cada categoría.</p>
      	<p> - Total de unidades vendidas por cada categoría a la fecha.</p>
      	<p> - Total de existencias (sustracción entre el inventario inicial y las unidades vendidas) actuales por cada categoría a la fecha.</p>
      	<p> - El % de ventas el cual resulta de la relación entre unidades vendidas vs inventario inicial.</p></div>
      <div><h6 class="text-center"><a style="color:#198754"  href="Reporte_Venta_Categoria.jsp"><b>Ver Reporte de Ventas por Categoría</b></a></h6></div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        Reporte de Ventas por Producto
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"><p>En este reporte se relaciona un resumen de ventas por producto. Aquí encontrarás:</p>
      	<p> - El total del inventario inicial así como el valor de la inversión inicial por cada producto.</p>
      	<p> - El total de las unidades vendidas a la fecha por cada producto.</p>
      	<p> - El total de las existencias (sustracción entre el inventario inicial y las unidades vendidas) a la fecha, por cada producto.</p>
      	<p> - El valor total de las ventas a la fecha SIN IVA por cada producto.</p>
      	<p> - El valor total de las ventas a la fecha con IVA incluido por cada producto.</p>
      	<p> - El valor total que corresponde al IVA por cada producto.</p></div>
      <div><h6 class="text-center"><a style="color:#198754"  href="Reporte_Venta_Productos.jsp"><b>Ver Reporte de Ventas por Producto</b></a></h6></div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        Reporte de Compras por Cliente
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"><p>En este reporte se relaciona un resumen de compras por cliente. Aquí encontrarás:</p>
      	<p> - Identificación, nombre, ciudad y departamento de cada cliente que haya realizado una compra en la tienda online.</p>
      	<p> - El total de compras que ha realizado cada cliente.</p>
      	<p> - El valor total que corresponde a la todas las compras realizadas por el cliente.</p>
      	<p> - El promedio de compra, el cual corresponde a la relación de entre el valor total de compras y cantidad de total de compras realizadas por el cliente.</p></div>
      	<div><h6 class="text-center"><a style="color:#198754"  href="Reporte_Compras_Cliente.jsp"><b>Ver Reporte de Compras por Cliente</b></a></h6></div>
    </div>
  </div>
  
    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
        Reporte de Clientes por Región y Departamento
      </button>
    </h2>
    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"><p>En este reporte se relaciona un resumen de clientes que se han registrado en StoreTIC por departamento agrupado por región. Aquí encontrarás:</p>
      	<p> - Cantidad de clientes que se encuentran registrados en StoreTIC por departamento.</p>
      	<p> - Los departamentos se encuentran agrupados por región establecida para Colombia y se relacionan del departamento en donde se poseen más clientes registrados al menor.</p>
      	<div><h6 class="text-center"><a style="color:#198754"  href="Reporte_Clientes_Region.jsp"><b>Ver Reporte de Clientes por Departamento y Región</b></a></h6></div>
    </div>
  </div>
  
</div>

	</body>
<%@include file="Footer.jsp"%>
</html>