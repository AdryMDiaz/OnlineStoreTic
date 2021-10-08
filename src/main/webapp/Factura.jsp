<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="HomeUser.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Factura de Venta</title>
<link rel="shortcut icon" href="icon/BannerStoreTIC2.png">
</head>
<body>
<%
try{
	String cedula = session.getAttribute("cedula").toString();
	String id_venta=request.getParameter("id_venta");
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select v.cedula, c.nombre_completo, v.id_venta, v.fecha, c.correo_electronico, c.telefono_celular, c.telefono_fijo, c.direccion from storetic.ventas v inner join storetic.clientes c on c.cedula = v.cedula where v.cedula= '" + cedula + "' and v.id_venta='" + id_venta + "'";
	ResultSet rs = stmt.executeQuery(query);
	
	while (rs.next()){
%>
<section class="row mt-4">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">Factura de Ventas Online - StoreTic</h3>
				<form class="form-sign" action="ContactoUserAction.jsp" method="POST">
					<div class="row">
						<div class="col-md-4 mb-3">
    						<label for="cedula" class="form-label">Documento Cliente</label>
    						<input type="text" name="cedula" class="form-control" id="formGroupExampleInput" value= "<%=rs.getString(1)%>" readonly="readonly" required>
  						</div>
  						<div class="col-md-4 mb-3">
    						<label for="nombre_completo" class="form-label">Nombre Cliente</label>
    						<input type="text" name="nombre_completo" class="form-control"	id="formGroupExampleInput" value= "<%=rs.getString(2)%>" readonly="readonly" required>
  						</div>
  						<div class="col-md-2 mb-3">
    						<label for="factura" class="form-label">Nro. de Factura</label>
    						<input type="text" name="factural" class="form-control" id="formGroupExampleInput" value= "<%=rs.getString(3)%>" readonly="readonly" required>
  						</div>
  						<div class="col-md-2 mb-3">
    						<label for="fechafactura" class="form-label">Fecha de Factura</label>
    						<input type="date" name="fechafactura" class="form-control" id="formGroupExampleInput" value= "<%=rs.getString(4)%>" required>
  						</div>
  					</div>
  					<div class="row">
						<div class="col-md-4 mb-3">
    						<label for="correo_electronico" class="form-label">Dirección de Correo Electrónico</label>
    						<input type="email" name="correo_electronico" class="form-control" id="formGroupExampleInput" value= "<%=rs.getString(5)%>" readonly="readonly" required>
  						</div>
  						<div class="col-md-2 mb-3">
    						<label for="telefono_celular" class="form-label">Teléfono Celular</label>
    						<input type="text" name="telefono_celular" class="form-control" id="formGroupExampleInput" value= "<%=rs.getString(6)%>" readonly="readonly" required>
  						</div>
  						<div class="col-md-2 mb-3">
    						<label for="telefono_fijo" class="form-label">Teléfono Fijo</label>
    						<input type="text" name="telefono_fijo" class="form-control" id="formGroupExampleInput" value= "<%=rs.getString(7)%>" readonly="readonly" required>
  						</div>
  						<div class="col-md-4 mb-3">
    						<label for="direccion" class="form-label">Dirección de Cliente</label>
    						<input type="text" name="direccion" class="form-control" id="formGroupExampleInput" value= "<%=rs.getString(8)%>" readonly="readonly" required>
  						</div>
  					</div>
  					<div class="btn-group" role="group" aria-label="Basic outlined example">
							<td><a type="button" class="btn btn-outline-dark" onclick="window.print();">Imprimir</a></td>
					</div>
				</form>
			</div>
			<div class="card-body">
				<h3>Detalle de la Factura</h3>
 					<table class="table text-center" class="table table-responsive table-striped table-hover">
					<style>
					 table { table-layout: fixed; }
					 table th, table td { overflow: hidden; }
					</style>
					<thead>
						<tr>
							<th>Descripcion</th>
							<th>Cantidad</th>
							<th>Precio Unitario</th>
							<th>IVA</th>
							<th>Precio Total</th>
						</tr>
					</thead>
				<tbody>
				<%
				try{
					Connection cn=ConnectionProvider.getCon();
					Statement stm=cn.createStatement();
					String sql = ("select p.nombre_producto, d.cantidad, d.valor_unitario, v.valor_iva, d.valor_total, v.id_venta, v.fecha from storetic.detalleventas d inner join storetic.ventas v on d.id_venta = v.id_venta inner join storetic.productos p on d.codigo_producto = p.codigo_producto where v.cedula= '" + cedula + "' and v.id_venta='" + id_venta + "'");
					ResultSet rs1 = stm.executeQuery(sql);
				 	while(rs1.next())
				 	{
				 		
				%>
				<tr>
				    <td><%=rs1.getString(1)%></td>
				    <td><%=rs1.getString(2)%></td>
				    <td><%=rs1.getString(3)%></td>
				    <td><%=rs1.getString(4)%></td>
				    <td><%=rs1.getString(5)%></td>
				</tr>
				<%}
				
				}catch(Exception e){
					System.out.println(e);
				}%>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</section>	

<%
	}
	
} catch (Exception e){
	System.out.println(e);
}
%>		
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
<%@include file="Footer.jsp"%>
</html>