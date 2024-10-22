<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Inicio</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link rel="stylesheet" href="/css/postres.css"/>
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
	                        <a class="nav-link" href="#">Postres</a>
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
	    <div class="container">
	    	<h1>Bienvenido de vuelta, ${nombre_usuario}</h1>
	    	<div class="row">
	    		<c:forEach var="postre" items="${postres}">
	    			<div class="col-12">
	    				<div class="card">
	    					<div class="d-flex">
	    						<img src="${postre.urlImagen}" class="card-img-left" alt="${postre.nombre}">
	    						<div class="card-body">
	    							<h5 class="card-title">${postre.nombre}</h5>
								    <p class="card-text">
								        <small>Autor:</small>
								        <span>${postre.usuario.nombre} ${postre.usuario.apellido}</span>
								    </p>
								    <div class="d-flex justify-content-between">
									    <p class="card-text mb-0">
									        <small>Tiempo de preparación:</small>
									        <span class="tiempo-preparacion">${postre.tiempoPreparacion} minutos</span>
									    </p>
											<a href="/formulario/editar/postre/${postre.id}" class="icono-editar">
											<img src="/img/icono-editar.png" alt="Editar" style="width: 20px;">
										</a>
								    </div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    		</c:forEach>
	    	</div>
	    </div>
	 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</body>
</html>
