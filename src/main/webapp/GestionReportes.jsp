<%@page contentType="application/pdf"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.storetic.ConnectionProvider"%>

<% 

try{
	Connection con=ConnectionProvider.getCon();
	
	String jrxmlFile = session.getServletContext().getRealPath("Coffee.jrxml");
	InputStream input = new FileInputStream(new File(jrxmlFile));
	
	JasperReport jasperReport= JasperCompileManager.compileReport(input);
	JasperPrint jasperPrint= JasperFillManager.fillReport(jasperReport, null, con);
	
	JasperExportManager.exportReportToPdfStream(jasperPrint,response.getOutputStream());
	
	response.getOutputStream().flush();
	response.getOutputStream().close();
	
}catch(Exception e){
	e.printStackTrace();
}
%>