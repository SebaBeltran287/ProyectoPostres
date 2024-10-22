<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="es">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Detalles del Postre</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link rel="stylesheet" href="/css/detallePostre.css">
	</head>
	<body>
		<nav class="navbar navbar-expand-lg">
	        <div class="container-fluid">
	            <h1>Postres</h1> 
	            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	                <span class="navbar-toggler-icon"></span>
	            </button>
	            <div class="collapse navbar-collapse" id="navbarNav">
	                <ul class="navbar-nav ms-auto">
	                    <li class="nav-item">
	                        <a class="nav-link" href="/inicio">Postres</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="/misPostres">Mis postres</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="/formulario/agregarPostre">Agregar postre</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="/cerrar_sesion">Logout</a>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </nav>
        <h1 class="nombre-postre">${postre.nombre}</h1>
        <div class="contenedor-postre">
	        <div class="row contenedor-principal">
	            <div class="col-md-6">
	                <img src="${postre.urlImagen}" class="img-fluid" alt="${postre.nombre}">
                    <form action="/eliminarPostre/${postre.id}" method="POST">
                    <input type="hidden" name="_method" value="DELETE" />
                    <button type="submit" class="btn btn-danger mt-3">Eliminar</button>
                    </form>
	            </div>
	            <div class="col-md-6">
	                <div class="card-body">
	                    <h3 class="card-title">Autor</h3>
	                    <p class="card-text">${postre.usuario.nombre} ${postre.usuario.apellido}</p>
	                    <h4>Ingredientes</h4>
	                    <p class="card-text">${postre.ingredientes}</p>
	                    <h4>Instrucciones</h4>
	                    <p class="card-text">${postre.instrucciones}</p>
	                    <h4>Tiempo de preparación</h4>
	                    <p class="card-text">${postre.tiempoPreparacion} minutos</p>
	                </div>
	            </div>
			</div>
		</div>
	</body>
</html>
