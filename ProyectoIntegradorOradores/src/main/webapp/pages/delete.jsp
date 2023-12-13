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
 
 <%
    
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
			
			String query = "UPDATE ticket SET activo ='0' WHERE id= "+idMax+"";
			
			stm.executeUpdate(query);
			
			out.print("Se actualizó correctamente la Base de Datos");
			
		}
		
		
		
		
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
 

 <jsp:include page="./ticket.html"></jsp:include>


</body>
</html>