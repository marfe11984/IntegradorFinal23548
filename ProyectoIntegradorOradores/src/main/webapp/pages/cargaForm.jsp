<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "pf.integrador.java.MySqlConexion" %> 
<%@ page import = "java.sql.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--HAGO LA CONSULTA EN LA BASE DE DATOS--%>

<%//1-agrego un request.getParameter("nombre de l dato que quiero traer desde el form ticket.html")

	String nombre = request.getParameter("nombre");
	String apellido = request.getParameter("apellido");
	String mail = request.getParameter("mail");
	String cantidad = request.getParameter("cantidad");
	String categoria = request.getParameter("categoria");

	//1-2-Uso un out.print para ver si se está trayendo los datos del formulario Ticket.html.
		//out.print(nombre+apellido+mail+cantidad+categoria);
		//1-3-Hago una prueba. Cargo datos en el formulario de ticket, le doy al botón comprar y cheqeo que se haya cargado. x ultimo anulo el out print.
	
	String sql = "INSERT INTO ticket (`nombre`, `apellido`, `mail`, `cantidad`, `categoria`) VALUES('"+nombre+"','"+apellido+"','"+mail+"','"+cantidad+"','"+categoria+"')";
	

	//2-Conecto con la base de datos
	MySqlConexion conexion = new MySqlConexion(); //2-1-Genero el objeto conexion
													  //2-2-Agrego libreria %@ page import = pf.integrador.java.MySqlConexion
	Connection cn = conexion.conectar(); //2-3-Genero la conexión con la base de datos, con el método conectar(), de la clase MySqlConexion.java (archivo que se copió  y pego en el punto 1º). Este nos hace la conexión con (conexión = DriverManager.getConnection(URL,  USEER, PASS), de la base de datos.
	
	try{
		Statement stm = cn.createStatement(); 
		stm.executeUpdate(sql);
										//2- - Agrego libreria %@ page import = java.sql. 
	}catch(Exception e){
		out.println("No se enviaron los datos");
		e.printStackTrace();
	}				
%>

<%--PROCESO PARA QUE VUELVA A CARGAR NUEVAMEnte TICKET.HTML, luego de haber cargado un ticket.
En este caso voy a hacer que me lleve a una nueva pagina donde va a mostrar la misma (ticket.html), 
pero con distintos botones, que me permita hacer el crud(altabajamodificaciones) --%>

<jsp:include page = "ticket.jsp"></jsp:include>

</body>
</html>