<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Agregar postre</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link href="/css/agregarPostre.css" rel="stylesheet"/>
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
		<div class="contenedor-general">
			<div class="row">
				<h2> Agregar postre </h2>
			</div>
			<form:form class="formulario-registro" action="/procesa/postre" method="POST" modelAttribute="postre">
				<div>
					<form:label class="form-label" path="nombre"> Nombre </form:label>
					<form:input class="form-control" path="nombre" />
					<form:errors path="nombre" cssClass="form-error" />
				</div>
				<div>
					<form:label class="form-label" path="ingredientes"> Ingredientes </form:label>
					<form:textarea class="form-control" path="ingredientes" rows="3" />
					<form:errors path="ingredientes" cssClass="form-error" />
				</div>
				<div>
					<form:label class="form-label" path="instrucciones"> Instrucciones </form:label>
					<form:textarea class="form-control" path="instrucciones" rows="3" />
					<form:errors path="instrucciones" cssClass="form-error" />
				</div>
				<div>
					<form:label class="form-label" path="urlImagen"> URL de la Imagen </form:label>
					<form:input class="form-control" path="urlImagen" />
					<form:errors path="urlImagen" cssClass="form-error" />
				</div>
				<div>
					<form:label class="form-label" path="tiempoPreparacion"> Tiempo de Preparación </form:label>
					<form:input class="form-control" path="tiempoPreparacion" type="number" />
					<form:errors path="tiempoPreparacion" cssClass="form-error" />
				</div>
				<button class="btn btn-primary">
					Agregar
				</button>
			</form:form>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</body>
</html>
