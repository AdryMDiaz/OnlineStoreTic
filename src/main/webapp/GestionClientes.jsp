<%@include file="AdminHome.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
	<div class="table mt-12"> 
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">CEDULA</th>
					<th scope="col">NOMBRE COMPLETO</th>
					<th scope="col">CORREO ELECTRONICO</th>
					<th scope="col">USUARIO INGRESO</th>
					<th scope="col">CLAVE INGRESO</th>
					<th scope="col">ESTADO</th>
					<th scope="col">DIRECCION</th>
					<th scope="col">CIUDAD</th>
					<th scope="col">DEPARTAMENTO</th>
					<th scope="col">PAÍS</th>
					<th scope="col">NÚMERO CELULAR</th>
					<th scope="col">NÚMERO FIJO</th>
				</tr>
			</thead>
			<tbody>
			<%
			try{
				Connection con=ConnectionProvider.getCon();
				Statement stmt=con.createStatement();
				String query="select * from storetic.clientes";
				ResultSet rs = stmt.executeQuery(query);
				
				while (rs.next()){
			%>
			
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(10)%></td>
				<td><%=rs.getString(11)%></td>
				<td><%=rs.getString(12)%></td>
				<div class="btn-group" role="group" aria-label="Basic outlined example">
				  <td><a type="button" class="btn btn-outline-danger" href="EliminarCliente.jsp">Eliminar</a></td>
				</div>
			</tr>
			<% }
				
			}catch(Exception e){
				System.out.println(e);
			}
			%>
			</tbody>
			<div align="center">
				<div class="container col-4">
					<div class="input-group mb-6 g-3">
						<form action="BuscarCliente.jsp">
							<input type="text" name="txtbuscar" class="form-control" placeholder="Qué buscas?">
							<input class="btn btn-outline-secondary" type="submit" value="Buscar">
						</form>
					</div>
				</div>
			<p></p>
			</div>
		</table>
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