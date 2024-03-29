<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<script src="libs/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />

<script src="js/bootstrap-datepicker.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/bootstrap-datepicker.css">


<title>uyTube | Sign In</title>

</head>


<body>

	<!-- Barra Principal -->
	<div class="container-fluid" id="navBarPrincipal">
		<jsp:include page="nav.jsp" />
	</div>

	<!-- Resto de la pag -->
	<h2>${mensaje}</h2>
	<h1 class="container">Registro</h1>
	<form action="AltaUsuario" method="post" name="AltaUsuario" id="altaUsuario">
		<div class="container">
			<div class="form-group row">
				<input type="text" name="nickname"
					class="form-control col-xs-12 col-sm-8 col-md-8" id="nickname"
					aria-describedby="emailHelp" placeholder="Usuario" required>
			</div>
			<div class="form-group row">
				<input type="email" name="email"
					class="form-control col-xs-12 col-sm-8 col-md-8" id="email"
					aria-describedby="emailHelp" placeholder=Email	required>
			</div>
			<div class="form-group row">
				<input type="text" name="nombre"
					class="form-control col-xs-12 col-sm-8 col-md-8" id="nombre"
					aria-describedby="emailHelp" placeholder="Nombre" required>
			</div>
			<div class="form-group row">
				<input type="text" name="apellido"
					class="form-control col-xs-12 col-sm-8 col-md-8" id="apellido"
					aria-describedby="emailHelp" placeholder="Apellido" required>
			</div>

			<div class="form-group row">
				<input type="password" name="contrasena"
					class="form-control col-xs-12 col-sm-8 col-md-8" id="contrasena"
					 placeholder="Contrasena" required onchange="passWarning()">
			</div>

			<div class="form-group row">
				<input type="password" name="confcontrasena"
					class="form-control col-xs-12 col-sm-8 col-md-8"
					id="confcontrasena" placeholder="Confirmar contrasena" required onchange="passWarning()">
			</div>


<!-- 			    <input type="password" class="form-control" name="password" id="contrasena"/> -->
<!-- 			    <input type="password" class="form-control" name="cfmPassword" id="confContrasena"/> -->



			<div class="form-group row">
				<div class="input-group date sg-fecha">
					<input type="text" name="fechaNacimiento"
						class="form-control col-xs-12 col-sm-8 col-md-8 "
						id="fechaNacimiento" placeholder="Fecha de nacimiento" required><span
						class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
				</div>
			</div>

			<div class="form-group row">
				<input type="text" name="canal"
					class="form-control col-xs-12 col-sm-8 col-md-8" id="canal"
					aria-describedby="emailHelp" placeholder="Canal">
			</div>

			<div class="form-group row">
				<input type="text" name="descripcion"
					class="form-control col-xs-12 col-sm-8 col-md-8" id="descripcion"
					aria-describedby="emailHelp" placeholder="Descripcion del canal">
			</div>

			<div class="form-group row">
			  <select class="custom-select col-xs-12 col-sm-8 col-md-8" id="privado" name="categoria" >
			    <option selected>El canal es privado?</option>
			    <option value="Si">Si</option>
			    <option value="No">No</option>
			  </select>			
			</div>
			

						
<!-- 			<div class="form-check"> -->
<!-- 			    <input type="checkbox" class="form-check-input" id="privado" name="privado"> -->
<!-- 			    <label class="form-check-label" for="materialUnchecked">Es Privado?</label> -->
<!-- 			</div> -->




			<div class="form-group row">
				<h3>Imagen de Usuario</h2>
				<input id="img" name="img" type="file" class="file"
					data-browse-on-zone-click="true">
			</div>

			<div id="passAlert" class="alert alert-danger" style="display: none" role="alert">Las contraseñas deben coincidir o ser de al menos 6 caracteres!</div>
			<div class="form-group row">
				<button type="submit" id="btnAceptar"
					class="btn btn-primary col-xs-12 col-sm-4 col-md-4" value="submit">Aceptar</button>
			</div>




		</div>
	</form>
	
	<script>
		function passWarning() {
			var pass = document.getElementById("contrasena").value;
			var pass2 = document.getElementById("confcontrasena").value;
			var alert = document.getElementById("passAlert");
			var x = document.getElementById("btnAceptar");
			var changed = false;
			if (pass != pass2 || pass.length < 6) {
				x.classList.remove('btn-primary');
				x.classList.add('disabled');
				x.classList.add('btn-secondary');
				x.setAttribute("disabled", "true");
				alert.removeAttribute("style")
			} else {
				x.classList.add('btn-primary');
				x.classList.remove('disabled');
				x.classList.remove('btn-secondary');
				x.removeAttribute("disabled");
				alert.setAttribute("style", 'display: none');
			}
		}
	</script>
	
	
	<script src="js/confCont.js" charset="utf-8"></script>
	<script src="js/app.js" charset="utf-8"></script>
	
	
<!-- 	<script src="js/canal.js" charset="utf-8"></script> -->

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>