<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="website"> 
    <meta http-equiv="refresh" content="500">
    <meta name="revised" content="1/11/2023">
    <title>Ticket</title>
    <link rel="shortcut icon" type="image/x-icon" href="../imagenes/favicon.ico.png">
    <link rel="stylesheet" href="../css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>
    <header class="position-sticky top-0 z-1">
        <nav class="navbar navbar-expand-lg"> 
            <div class="container-fluid mx-5"> 
                <a class="navbar-brand text-light" href="#">Conf en Bs As</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse flex-row-reverse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link text-light" href="./index.html">La conferencia</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="./index.html#Losoradores">Los oradores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">El lugar y la Fecha</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="./index.html#orador">Conviértete en orador</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-success" href="#">Comprar ticket</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <div class="container mt-4 col-7">
            <div class="row"> 
                <div class="col-sm-4 mb-3 mb-sm-0">
                    <div class="card text-center borde-estudiante">
                        <div class="card-body">
                            <h4 class="card-title">Estudiante</h4>
                            <p class="card-title">Tiene un descuento</p>
                            <p class="card-text fw-bold">80%</p>
                            <p class="card-text texto-cards">*presentar documentación</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card text-center borde-Trainee">
                        <div class="card-body">
                            <h4 class="card-title">Trainee</h4>
                            <p class="card-title">Tiene un descuento</p>
                            <p class="card-text fw-bold">50%</p>
                            <p class="card-text texto-cards">*presentar documentación</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4" id="ticketJunior">
                    <div class="card text-center borde-junior">
                        <div class="card-body">
                            <h4 class="card-title">Junior</h4>
                            <p class="card-title">Tiene un descuento</p>
                            <p class="card-text fw-bold">15%</p>
                            <p class="card-text texto-cards">*presentar documentación</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <form action="update.jsp" id="formulario">
            <div class="text-center mt-3">
                <p>VENTA</p>
                <h3>VALOR DEL TICKET $200</h3>
            </div>
            <div class="container mt-2 col-7">
                <div class="row justify-content-center align-items-center g-2">
                </div>
                <div class="row my-3"> 
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Nombre" name="nombre" value="<%=request.getParameter("nombre")%>" id="nombre" aria-label="First name">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Apellido" name="apellido" value="<%=request.getParameter("apellido")%>" id="apellido" aria-label="Last name">
                    </div>
                </div>
                <div class="mb-3">
                    <input type="email" class="form-control" placeholder="name@example.com" name="mail" value="<%=request.getParameter("mail")%>" id="mail" aria-describedby="emailHelp">
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <label for="" class="ms-1 mb-1">Cantidad de tickets</label>
                        <input type="number" class="form-control" placeholder="" name="cantidad" value="<%=request.getParameter("cantidad")%>" id="cantidad" aria-label="cant">
                    </div>
                    <div class="col">
                        <label for="" class="ms-1 mb-1">Categoría</label>
                        <select class="form-select" name="categoria" id="categoria" aria-label="Default select example">
                            <option selected><%=request.getParameter("categoria")%></option>
                            <option value="Sin categoria">Sin categoría</option>
                            <option value="Estudiante">Estudiante</option>
                            <option value="Trainee">Trainee</option>
                            <option value="Junior">Junior</option>
                        </select>
                    </div>
                </div>
        
                <div class="row my-4 mx-0 p-2 totalapagar">
                    <div class="col">Total a pagar:<span id="total" class="texto-info fw-bolder"></span></div> 
                </div>
        
                <div class="row mt-3"> 
                    <div class="col">
                        <div>
                            <button type="button" class="btn btn-primary col-12 btn-formulario" id="btnDelete">Delete</button> 
                        </div>                                                                                                 
                    </div>
                    <div class="col">
                        <div>
                            <button type="submit" class="btn btn-primary col-12 btn-formulario" id="btnModificar">Modificar</button>                                                                                                         
                        </div>
                    </div>
                     <div class="col">
                        <div>
                            <button type="button" class="btn btn-primary col-12 btn-formulario" onclick="location.href='../index.html'" id="btnResumen">Confirmar</button>                                                                                                         
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </main>

   
    <footer class="container-fluid text-white mt-4">
        <div class="row text-center mx-5 pt-4">
            <div class="col">
                <p><small>Preguntas Frecuentes</p></small>
            </div>
            <div class="col">
                <p><small>Contáctanos</small></p>
            </div>
            <div class="col">
                <p><small>Prensa</small></p>
            </div>
            <div class="col">
                <p><small>Conferencias</small></p>
            </div>
            <div class="col">
                <p><small>Términos y condiciones</small></p>
            </div>
            <div class="col">
                <p><small>Privacidad</small></p>
            </div>
            <div class="col">
                <p><small>Estudiantes</small></p>
            </div>
        </div>
    </footer> 
    
    <script src="../js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="../js/main.js"></script>
</body>
</html>