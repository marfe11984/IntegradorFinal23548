//1-ARCHIVO PARA CONECTAR CON LA BASE DE DATOS
/*La conexion con la base de datos con el entorno de eclipse se hace conector raiz JDBC
 *1--> se carga el archivo  (MySQL-connector-j-8.2.0.jar), que es el controlador del driver en nuestro proyeecto del MySQL 
 *2--> SE CARGA EL CONTROLADOR en este programa y se lo agrega dentro de un TryCatch, para que avise que se cargo el controlador correctamente
 *3--> Se realiza la conexion la Base de datos, dentro de un TryCatch, y le paso como parametros la (URL, USER, PASSWORD) 
 */

package pf.integrador.java;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class MySqlConexion { //1-se crea una clase privada para que nadie mas fuera de esta clase pueda acceder a las variables (CONTROLADOR, URL...)
						//static: para q forme parte delo que es la definicion de la clase
						//final: es porque estoy x definir una constante  
	private static final String CONTROLADOR = "com.mysql.cj.jdbc.Driver";  //1-2) Indico el controlador con el q voy a trabajar. Almaceno a CONTROLADOR DENTRO DE UNA VARIABLE. Esto esta dentro de las librerias que cargue de la conexion con mySQL.
	private static final String URL = "jdbc:mysql://localhost:3306/trabajo_integrador"; //1-3) cargo la url que conectar con la base de datos + el nombre nameBD: "conexion_usuario"
	private static final String USEER = "root";
	private static final String PASS = "";
	
	//2-SE CARGA EL CONTROLADOR en este programa
	static {  //2-Indico el driver con el q voy a trabajar.Se define una variable static, para cargar el controlador	
			try {
				Class.forName(CONTROLADOR); //2-1) se agrega una nueva clase con la variable controlador. 
											//2-2) la clase sola va a tirar error, porque va a pedir un try catch, para que avise que se cargo el controlador correctamente. Asi que lo agrego desde el mensaje de error
				System.out.println("Se cargo el controlador correctamente");
			} catch (ClassNotFoundException e) {
				System.out.println("Error al cargar el controlador");
				e.printStackTrace();
			}   
	}
	
	//3-GENERO LA CONEXION CON LA BASE DE DATOS.
	public static Connection conectar() { // Se define el metodo "conectar", generando una conexion (Connection) que debe devolver algo
		
		Connection conexion = null;  //3-1-genero un metodo para que cuando haga la llamada,me genere la conexion y que contenga al bloque try-catch
                                     //para ello defino la variable conexion dentro del metodo (Connection) y le asigno un null  		
		try {
			conexion = DriverManager.getConnection(URL, USEER, PASS); //3-1) genero el objeto conection (donde se carga y verifica  la url, useer, pass) generando la conexion 
			System.out.println("conexion con la BD exitosa"+"\n");
		} catch (SQLException e) {
			System.out.println("Error al establecer la conexion");
			e.printStackTrace();
		}
		return conexion;  //se coloca return, porque no hay un void, es decir, no es una funcion vacia y por lo tanto debe devolver algo
	}
	
	
	/*
	//4-SE CREA UN OBJETO DEL TIPO CONEXION (Sirve para probar/verificar la conexión)
	public static void main (String arg []) { 
		Conexion c = new Conexion();		//en este caso lo que hace la funcion es verificar la conexion, imprimir en pantalla, pero sin devolver nada
		System.out.println(c.conectar());
		
	/* ESTO NO SE HACE DESDE ESTE ARCHIVO, que es la clase conexion de origen, SINO Q SE TRABAJA Y SE LLAMA DESDE OTRAS CLASES ("ClassConexion") 
	}
	 */
}	


/*
//1-2) Indico el controlador con el q voy a trabajar. Almaceno a CONTROLADOR DENTRO DE UNA VARIABLE. 
  	   Esto esta dentro de las librerias que cargue de la conexion con mySQL.
       
       PROCESO PARA AGREGAR EL CONTROLADOR:
       
        1-Descomprimo el zip que descargo de MySQL, corto el archivo mysqlconnector-j-8.2.0.jar y lo coloco en la carpeta general 
          donde tengo los archivos java BACKEND
       
        2-click derecho sobre el proyecto (clase30) --> properties --> Java Buil Path --> Libraries --> Classpath--> add External JARs
         -->selecciono el archivo "mysqlconnector-j-8.2.0.jar".
         
        
*/
