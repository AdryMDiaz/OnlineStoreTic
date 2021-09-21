<%@include file="HomeUser.jsp"%>
<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrito de Compras</title>
</head>
<%
String nit_proveedor=request.getParameter("nit_proveedor");

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select * from storetic.proveedores";
	ResultSet rs = stmt.executeQuery(query);
	
	while (rs.next()){
%>

<div class="container mt-5 col-2-lg-6">
	<div class="card mb-3 text-white bg-secondary border-info">
  		<img src="img/BannerAliado.jpg" class="card-img-top" alt="...">
  		<div class="card-body">
    		<h5 class="card-title"><%=rs.getString(2)%></h5>
    		<p class="card-text">Dirección Aliado: <%=rs.getString(3)%></p>
    		<p class="card-text">Ubicación Aliado: <%=rs.getString(4)%>, <%=rs.getString(5)%>, <%=rs.getString(6)%></p>
    		<p class="card-text">Teléfono de Contacto Aliado: <%=rs.getString(8)%></p>
    		<p class="card-text"><small class="text-muted"></small></p>
  		</div>
	</div>
</div>

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
</html>