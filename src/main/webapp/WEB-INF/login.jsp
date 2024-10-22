<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> Aplicación de login y registro </title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link href="/css/login.css" rel="stylesheet"/>
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
	                        <a class="nav-link" href="#">Login</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="/registro">Registro</a>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </nav>
		<div class="contenedor-general">
			<div class="row login">
				<h2> Login </h2>
			</div>
			<div class="container row">
				<form:form class="col-6 formulario-login" action="/procesa/login" method="POST" modelAttribute="loginUsuario">
					<div>
						<form:label class="form-label" path="correo"> Correo </form:label>
						<form:input class="form-control" path="correo" />
						<form:errors path="correo" cssClass="form-error"/> 
					</div>
					<div>
						<form:label class="form-label" path="contrasenia"> Constraseña </form:label>
						<form:input class="form-control" path="contrasenia" type="password"/>
						<form:errors path="contrasenia" cssClass="form-error"/> 
					</div>
					<button class="btn btn-primary">
						Login
					</button>
				</form:form>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</body>
</html>