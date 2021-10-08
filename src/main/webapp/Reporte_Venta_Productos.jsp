<%@page contentType="application/pdf"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.storetic.ConnectionProvider"%>

<% 

try{
	//Conectando a la base de datos
	Connection con=ConnectionProvider.getCon();
	
	//Cargamos Archivo Jasper Report creado con JasperStudio 
	String jrxmlFile = session.getServletContext().getRealPath("reportes/Reporte_Ventas_Productos.jrxml");
	InputStream input = new FileInputStream(new File(jrxmlFile));
	
	//Generamos reporte en PDF
	JasperReport jasperReport= JasperCompileManager.compileReport(input); //Compilar reporte
	JasperPrint jasperPrint= JasperFillManager.fillReport(jasperReport, null, con); //Llenar reporte
	JasperExportManager.exportReportToPdfStream(jasperPrint,response.getOutputStream()); //Exportar reporte en pdf
	
	response.getOutputStream().flush();//Almacenar en buffer temporal
	response.getOutputStream().close();//cerrar conexión
	
}catch(Exception e){
	e.printStackTrace();
}
%>