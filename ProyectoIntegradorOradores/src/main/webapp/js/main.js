
//DEFINICION DE LA EXPRESION REGULAR PARA ADMITIR SOLO LETRAS ----> /^[a-zA-Z]+$/   o   /^[a-zA-Zñ]/g    
//DEFINICION DE LA EXPRESION REGULAR PARA ADMITIR SOLO LETRAS, LETRAS ACENTUADAS ----> /^[a-zA-ZÀ-ÿ]+$/ 
//DEFINICION DE LA EXPRESION REGULAR PARA ADMITIR SOLO LETRAS, LETRAS ACENTUADAS y espacios----> /^[a-zA-ZÀ-ÿ\s]+$/ 

//DEFINICION DE LA EXPRESION REGULAR PARA ADMITIR SOLO NUMEROS----> /^[a-zA-Z]+$/   o   /^[a-zA-Zñ]/g
//DEFINICION DE LA EXPRESION REGULAR PARA VALIDAR MAIL----> /^[^ ]+@[^ ]+\.[a-z]{2,3}$/


//1-FUNCION PARA CONTROLAR LA CARGA DE DATOS EN EL FORMULARIO (nombre, apellido, mail)

function controlForm(){  
    {
        var capNombre = document.getElementById('nombre'); 
        var validNombre = /^[a-zA-ZÀ-ÿ\s]+$/; 
        
        if(validNombre.test(capNombre.value)){   
             nombre.classList.remove('is-invalid');        
        }else{
            nombre.classList.add("is-invalid"); 
            nombre.focus(); 
        }
    }
    {
        var capApellido = document.getElementById('apellido'); 
        var validApellido = /^[a-zA-ZÀ-ÿ\s]+$/; 
        if(validApellido.test(capApellido.value)){    
            apellido.classList.remove('is-invalid'); 
            
       }else{
           apellido.classList.add("is-invalid");  
           apellido.focus(); 
       }
    }
    {
        var capMail = document.getElementById('mail'); 
        var validMail = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/; 
        
        if(validMail.test(capMail.value) ){    
            mail.classList.remove('is-invalid'); 
         
        }else{
            mail.classList.add("is-invalid"); 
            mail.focus(); 
        }
    }
    {
        if (cantidad.value <= 0) {  
            cantidad.classList.add("is-invalid"); 
            cantidad.focus();
        }
        else {
            cantidad.classList.remove('is-invalid'); 
        }
    }
}


//2-FUNCION PARA CALCULAR LOS VALORES DE LAS ENTRADAS (segun los descuentos)

function valorEntrada() {
    var capCantidad = document.getElementById('cantidad').value;
    var capCategoria = document.getElementById('categoria').value;
    const TICKET = 200;
    var resumenTotal = 0;

    switch (capCategoria) {
        case '0':
            resumenTotal = capCantidad * TICKET;
            break;
        case '1':
            resumenTotal = capCantidad * TICKET * 0.2;
            break;
        case '2':
            resumenTotal = capCantidad * TICKET * 0.5;
            break;
        case '3':
            resumenTotal = capCantidad * TICKET * 0.85;
            break;
        default:
            resumenTotal = ' -Ingrese categoría-'
    }
    document.getElementById('total').innerText = ' $' + resumenTotal;

}                                                               
                                                                    

//3-FUNCION PARA BORRAR LOS DATOS CARGADOS EN EL FORMULARIO TICKET.HTML       

function borrarPantalla(){

    formulario.reset(); 
    document.getElementById('total').innerText = ''                                                       
}


//4-VINCULACION DE LA FUNCION CON LOS BOTONES DEL HTML (Resumen y Borrar)

const BTNCLICKRESUMEN = document.getElementById('btnResumen'); 
BTNCLICKRESUMEN.addEventListener('click',controlForm);  
BTNCLICKRESUMEN.addEventListener('click',valorEntrada); 

const BTNCLICKBORRAR = document.getElementById('btnBorrar'); 
BTNCLICKBORRAR.addEventListener('click',borrarPantalla);  



