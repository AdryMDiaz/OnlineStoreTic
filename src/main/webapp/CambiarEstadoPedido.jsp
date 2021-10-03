<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.*"%>
<%@page import="com.storetic.ConnectionProvider"%>
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
<title>Cambiar Estado de Pedido</title>
</head>
<body>
	<div class="container mt-4 col-lg-4">
		<div class="card col-sm-10">
			<div class="card-body" style="border:#198754 1px solid">
				<form class="form-sign" action="CambiarEstadoPedidoAction.jsp" method="POST">
					<div class="form-group text-center">
						<figure class="text-center">
							<h2></h2>
						<figure class="text-center">
							<h5 style="color:#198754">Digite el Código de la Venta</h5>
						<div class="mb-3" >
							<input type="text" name="id_venta" class="form-control"	id="formGroupExampleInput" placeholder="Digite el código de la Venta" required>
							<%
  							try{
  								Connection cn=ConnectionProvider.getCon();
  								Statement st=cn.createStatement();
  								String sql="select id_estado, estado from storetic.estado where id_estado between 3 and 5 order by estado";
  								ResultSet rst = st.executeQuery(sql);
  								%>
    								<label for="estado" class="form-label">Estado</label>
    								<select name="id_estado" class="form-select" required>
    									<option></option>
    									<% while (rst.next()){%>
    									<option value=<%=rst.getString(1)%>><%=rst.getString(2)%></option>
    									<%}%>
   									</select>
									<%
									} catch (Exception e){
										System.out.println(e);
									}
								%>
						</div>
						<input style="background-color:#198754;color:#FFFFFF;border:#198754 1px solid" type="submit" name="accion" value="Cambiar Estado de Venta" class="btn btn-warning btn" >
					</div>
				</form>
				<div class="row row-cols-lg-7 g-1">
    				<div class="col" >
      					<div><h6 class="text-center"><a style="color:#dc3545"  href="GestionVentas.jsp">Volver a Gestión de Ventas</a></h6></div>
    			</div>
					<% 
					String msg=request.getParameter("msg");

					if ("updateestado".equals(msg)){
					%>
						<strong style="color:#198754" class="text-center">El Pedido ha cambiado de estado satisfactoriamente</strong>
					<% } %>
					<%
					if ("invalid".equals(msg)){
					%>
						<strong style="color:#dc3545" class="text-center">El Pedido no cambió de estado o no existe código de Venta</strong>
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