<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.storetic.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
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
<title>Actualizar Producto</title>
<link rel="shortcut icon" href="icon/BannerStoreTIC2.png">
</head>
<body>
<%
String codigo_producto=request.getParameter("codigo_producto");

try{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	String query="select * from storetic.productos where codigo_producto='"+ codigo_producto +"'";
	ResultSet rs = stmt.executeQuery(query);
	
	while (rs.next()){
%>
	<div class="container mt-5 col-lg-6">
		<div class="card col-sm-14">
			<div class="card-body">
				<form class="form-sign" action="EditarProductoAction.jsp" method="POST">
				<figure class="text-center">
					<h2></h2>
					<figure class="text-center">
					<h5 style="color:#dc3545">Bienvenido al Módulo de Edición de Productos</h5>
					<h5 style="color:#dc3545">Por favor modifique la información y presione "Modificar" al finalizar</h5>
					<p></p>
					<div class="row">
						<div class="col-md-3 mb-3">
    						<label for="codigo_producto" class="form-label">Codigo producto</label>
    						<input type="text" name="codigo_producto" class="form-control" id="codigo_producto" placeholder="Digite codigo del producto" value= "<%=rs.getString("codigo_producto")%>" readonly="readonly" required>
  						</div>
  						<div class="col-md-9 mb-3">
    						<label for="nombre_producto" class="form-label">Nombre del producto</label>
    						<input type="text" name="nombre_producto" class="form-control" id="nombre_producto" placeholder="Digite nombre producto" value= "<%=rs.getString("nombre_producto")%>" required>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-md-4 mb-3">
    						<label for="precio_compra" class="form-label">Precio antes de IVA</label>
    						<input type="text" name="precio_compra" class="form-control" id="precio_compra" placeholder="Digite precio de compra" value= "<%=rs.getString("precio_compra")%>" required>
  						</div>
  						<div class="col-md-4 mb-3">
  							<%
  							long precio_venta = 0;
							int unidades_disponibles = (rs.getInt("inventario_inicial")-rs.getInt("unidades_vendidas"));
  							try{  								
  								Connection cn=ConnectionProvider.getCon();
  								Statement st=cn.createStatement();
  								String sql="select id_iva, porcentaje_iva from storetic.iva order by porcentaje_iva";
  								ResultSet rst = st.executeQuery(sql);
  								%>
    								<label for="id_iva" class="form-label">% IVA</label>
    								<select name="id_iva" class="form-select" required>
    									<option></option>
    									<% while (rst.next()){%>
    									<option <% if(rst.getInt("id_iva") == rs.getInt("id_iva")){ precio_venta = Math.round(rs.getInt("precio_compra")+(rst.getDouble("porcentaje_iva")*rs.getInt("precio_compra"))); %> selected <% } %> value=<%=rst.getString("id_iva")%>><%=rst.getString("porcentaje_iva")%></option>
    									<%}%>
   									</select>
									<%
									} catch (Exception e){
										System.out.println(e);
									}
								%>
  						</div>	
  						<div class="col-md-4 mb-3">
    						<label for="precio_venta" class="form-label">Precio Venta</label>
    						<input type="text" name="precio_venta" readonly class="form-control" id="precio_venta" placeholder="Digite precio de venta" value= "<%=precio_venta%>" required>    						
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-md-4 mb-3">
    						<label for="inventario_inicial" class="form-label">Inventario inicial</label>
    						<input type="text" name="inventario_inicial" class="form-control" id="formGroupExampleInput" placeholder="Digite inventario inicial" value= "<%=rs.getString("inventario_inicial")%>" required>
  						</div>
  						
  					<!--  	
    						<label for="IVA" class="form-label">IVA del producto</label>
    						<input type="text" name="IVA" class="form-control" id="formGroupExampleInput" placeholder="Digite IVA del producto" value= "<%=rs.getString(6)%>" required>
  						</div>
  					</div>
  					-->
  										
  						<div class="col-md-4 mb-3">
    						<label for="unidades_vendidas" class="form-label">Unidades vendidas</label>
    						<input type="text" name="unidades_vendidas" class="form-control" id="unidades_vendidas" placeholder="Digite unidades_vendidas" value= "<%=rs.getString("unidades_vendidas")%>" required>
  						</div>
  						<div class="col-md-4 mb-3">
    						<label for="unidades_disponibles" class="form-label">Unidades disponibles</label>
    						<input type="text" name="unidades_disponibles" readonly class="form-control" id="unidades_disponibles" placeholder="Digite unidades disponibles" value= "<%=unidades_disponibles%>" required>
  						</div> 						
  					 </div>	
  					<div class="row">
  						<div class="col-md-4 mb-3">
  							<%
  								try{
  								Connection cn=ConnectionProvider.getCon();
  								Statement st=cn.createStatement();
  								String sql="select id_estado, estado from storetic.estado order by estado";
  								ResultSet rst = st.executeQuery(sql);
  								%>
    								<label for="id_estado" class="form-label">Estado del producto</label>
    								<select name="id_estado" class="form-select" required>
    									<option></option>
    									<% while (rst.next()){%>
    									<option <% if(rst.getInt("id_estado") == rs.getInt("id_estado")){ %> selected <% } %> value=<%=rst.getString("id_estado")%>><%=rst.getString("estado")%></option>
    									<%}%>
   									</select>
									<%
									} catch (Exception e){
										System.out.println(e);
									}
							%>
						</div>
						<div class="col-md-4 mb-3">
							<%
							try{
  								Connection cn=ConnectionProvider.getCon();
  								Statement st=cn.createStatement();
  								String sql="select id_categoria, categoria from storetic.categorias order by categoria";
  								ResultSet rst = st.executeQuery(sql);
  								%>
    								<label for="id_categoria" class="form-label">Categoría</label>
    								<select name="id_categoria" class="form-select" id="id_categoria" required>
    									<option></option>
    									<% while (rst.next()){%>
    									<option <% if(rst.getInt("id_categoria") == rs.getInt("id_categoria")){ %> selected <% } %> value=<%=rst.getString("id_categoria")%>><%=rst.getString("categoria")%></option>
    									<%}%>
   									</select>
									<%
									} catch (Exception e){
										System.out.println(e);
									}
								%>
  						</div>	
  						<div class="col-md-4 mb-3">
  						  	<%
  								try{
  								Connection cn=ConnectionProvider.getCon();
  								Statement st=cn.createStatement();
  								String sql="select nit_proveedor, nombre_proveedor from storetic.proveedores order by nombre_proveedor";
  								ResultSet rst = st.executeQuery(sql);
  							%>
    							<label for="nit_proveedor" class="form-label">Proveedor</label>
    							<select name="nit_proveedor" class="form-select" required>
    								<option selected></option>
    							<% while (rst.next()){
    							%>
    								<option <% if(rst.getInt("nit_proveedor") == rs.getInt("nit_proveedor")){ %> selected <% } %> value=<%=rst.getString("nit_proveedor")%>><%=rst.getString("nombre_proveedor")%></option>
      							<%}%>
    							</select>
    							<%
									} catch (Exception e){
										System.out.println(e);
								}
								%>
  						</div>
  					</div>
  					<div>
						<input style="background-color:#dc3545;color:#FFFFFF;border:#dc3545 1px solid" type="submit" name="accion" value="Actualizar Producto" class="btn btn-primary btn">
					</div>
				</form>
    				<div>
    					<p></p>
      					<div><h6 class="text-center"><a style="color:#dc3545"  href="GestionProductos.jsp">Volver a Gestión Productos</a></h6></div>
    			</div>
			</div>
		<% 
					String msg=request.getParameter("msg");

					if ("valid".equals(msg)){
					%>
						<figure class="text-center">
						<strong class="text-center" style="color:#198754">Producto actualizado correctamente!</strong>
					<% } %>
					<%
					if ("invalid".equals(msg)){
					%>
						<figure class="text-center">
						<strong class="text-center" style="color:#dc3545">Producto no se modificó o no existe en la base de datos, intentalo de nuevo!</strong>
				<% } %>
		
	</div>
	<%
	}
	
} catch (Exception e){
	System.out.println(e);
}
%>
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