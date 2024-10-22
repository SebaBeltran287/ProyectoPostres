<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> Postres registro </title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link href="/css/registro.css" rel="stylesheet"/>
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
		                       <a class="nav-link" href="/">Login</a>
		                   </li>
		                   <li class="nav-item">
		                       <a class="nav-link" href="#">Registro</a>
		                   </li>
		               </ul>
		           </div>
		       </div>
		   </nav>
			<div class="contenedor-general">
				<div class="row registro">
					<h2> Registro </h2>
				</div>
				<form:form class="col-6 formulario-registro" action="/procesa/registro" method="POST" modelAttribute="usuario">
					<div>
						<form:label class="form-label" path="nombre"> Nombre </form:label>
						<form:input class="form-control" path="nombre" />
						<form:errors class="form-error" path="nombre" />
					</div>
					<div>
						<form:label class="form-label" path="apellido"> Apellido </form:label>
						<form:input class="form-control" path="apellido" />
						<form:errors class="form-error" path="apellido" />
					</div>
					<div>
						<form:label class="form-label" path="correo"> Correo </form:label>
						<form:input class="form-control" path="correo" />
						<form:errors class="form-error" path="correo" />
					</div>
					<div>
						<form:label class="form-label" path="contrasenia"> Constraseña </form:label>
						<form:input class="form-control" path="contrasenia" type="password"/>
						<form:errors class="form-error" path="contrasenia" />
					</div>
					<div>
						<form:label class="form-label" path="confirmarContrasenia"> Confirmar Contraseña </form:label>
						<form:input class="form-control" path="confirmarContrasenia" type="password"/>
						<form:errors class="form-error" path="confirmarContrasenia" />
					</div>
					<button class="btn btn-primary">
						Registrarse
					</button>
				</form:form>
			</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"></script>
	</body>
</html>
