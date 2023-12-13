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
 
 <%//1-agrego un request.getParameter("nombre de l dato que quiero traer desde el form ticket.html")

	String nombre = request.getParameter("nombre");
	String apellido = request.getParameter("apellido");
	String mail = request.getParameter("mail");
	String cantidad = request.getParameter("cantidad");
	String categoria = request.getParameter("categoria");

	//1-2-Uso un out.print para ver si se está trayendo los datos del formulario Ticket.html.
		//out.print(nombre+apellido+mail+cantidad+categoria);
		//1-3-Hago una prueba. Cargo datos en el formulario de ticket, le doy al botón comprar y cheqeo que se haya cargado. x ultimo anulo el out print.
	
	//String sql = "INSERT INTO ticket VALUES (null,'"+nombre+"','"+apellido+"','"+mail+"','"+cantidad+"','"+categoria+"')";
	

	Connection cn =null; //1-2-defino un objeto del tipo connection, llamado cn y le asigno un valor null. 
	Statement stm = null; //1-3-defino un objeto del tipo Statement, llamado stm y le asigno un valor null. ESTE SIRVE PARA GENERAR LA CONEXION y permite utilizar la clase createStatement
	ResultSet rsId =null;
		
	//2-Conecto con la base de datos
	MySqlConexion conexion = new MySqlConexion(); //2-1-Genero el objeto conexion
													  //2-2-Agrego libreria %@ page import = pf.integrador.java.MySqlConexion
	cn = conexion.conectar(); //2-3-Genero la conexión con la base de datos, con el método conectar(), de la clase MySqlConexion.java (archivo que se copió  y pego en el punto 1º). Este nos hace la conexión con (conexión = DriverManager.getConnection(URL,  USEER, PASS), de la base de datos.
	
	
	try{
		stm = cn.createStatement();
		
		rsId = stm.executeQuery("SELECT MAX(id) FROM ticket");

		while(rsId.next()){
			
			int idMax = rsId.getInt(1);
			
			String query = "UPDATE ticket SET nombre='"+nombre+"', apellido='"+apellido+"', mail='"+mail+"', cantidad='"+cantidad+"', categoria='"+categoria+"' WHERE id= "+idMax+"";
			
			stm.executeUpdate(query);
			
			out.print("Se actualizó correctamente la BD");
			
		}
		
		//Statement stm = cn.createStatement(); 
		
		
										//2- - Agrego libreria %@ page import = java.sql. 
	}catch(Exception e){
		out.println("No se enviaron los datos");
		e.printStackTrace();
	}			
	
	//3-hago un tryCatch en caso de que llegue a ocurrir un error al cierre de la conexion
	try {  
		if(rsId != null) {
			rsId.close();
		}
		if(rsId != null) {
			stm.close();
		}
		if(rsId != null) {
			cn.close();
		}
		
	}catch(SQLException e) {
		e.printStackTrace();
	}
%>
 

 <jsp:include page = "ticket.jsp"></jsp:include>


</body>
</html>