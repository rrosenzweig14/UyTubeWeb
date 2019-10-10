<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="datatypes.DtLista"%>
<%@ page import="datatypes.DtVideo"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<script src="libs/jquery-3.4.1.min.js" charset="utf-8"></script>


<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<link href="css/created/indexLayout.css" rel="stylesheet"
	type="text/css">

<script src="js/bootstrap-datepicker.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/bootstrap-datepicker.css">

<meta charset="ISO-8859-1">
<title>Datos de Lista</title>
</head>
<body>
	<div class="container" id="navBarPrincipal">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<img src="imagenes/UyTube.png" class="img-fluid" height="50px"
				width="150px">
			<div class="md-form mt-0" style="margin-left: 40px">
				<input class="form-control" type="text" placeholder="Search"
					aria-label="Search" id="searchBarPrincipalId" style="width: 450px">
			</div>
			<%
				String login = (String) session.getAttribute("login");
				String username = (String) session.getAttribute("nickname");
				if (login == null || login.equals("Usuario y/o contrase�a inv�lida, por favor intente de nuevo.")) {
			%>
			<div class="md-form mt-0" style="margin-left: 360px">
				<button type="button" id="btnModal" class="btn btn-primary">Entrar</button>
			</div>
			<%
				} else {
			%>
			<div class="md-form mt-0" style="margin-left: 250px">
				<h3><%=username%></h3>
				<form action="LogOut" method="post">
					<button type="submit" id="btnModalLogOut" class="btn btn-primary">Salir</button>
				</form>
			</div>
			<%
				}
				;
			%>
			<!--Modal: Login / Register Form-->
			<div class="modal fade" id="modalFec" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog cascading-modal" role="document">
					<!--Content-->
					<div class="modal-content">
						<!-- Tab panels -->
						<div class="tab-content">
							<!--Panel 7-->
							<div class="tab-pane fade in show active" id="panel7"
								role="tabpanel">

								<!--Body-->
								<div class="modal-body mb-1">
									<label>Iniciar Sesion</label>

									<form action="Login" method="post">

										<div class="md-form form-sm mb-5">
											<i class="fas fa-envelope prefix"></i> <input type="nickname"
												id="nickLogin" name="nickLogin"
												class="form-control form-control-sm validate"> <label
												data-error="wrong" data-success="right" for="modalLRInput10">Usuario</label>
										</div>

										<div class="md-form form-sm mb-4">
											<i class="fas fa-lock prefix"></i> <input type="password"
												id="passLogin" name="passLogin"
												class="form-control form-control-sm validate"> <label
												data-error="wrong" data-success="right" for="modalLRInput11">Contrasena</label>
										</div>
										<div class="text-center mt-2">
											<button id="login" type="submit" class="btn btn-info">
												Iniciar <i class="fas fa-sign-in ml-1"></i>
											</button>
										</div>
									</form>
								</div>
								<!--Footer-->
								<div class="modal-footer">
									<div class="options text-center text-md-right mt-1">
										<p>
											No tiene usuario? <a href="altaUsuario.jsp" class="blue-text">Registrarse!</a>
										</p>
									</div>
									<button type="button"
										class="btn btn-outline-info waves-effect ml-auto"
										data-dismiss="modal">Cerrar</button>
								</div>

							</div>

						</div>
						<!--/.Content-->
					</div>
				</div>
			</div>
			<!--Modal: Login / Register Form-->
		</nav>

	</div>

	<!-- Resto de la pag -->
	<%
		if (username != null && username.length() > 0) {
	%>
	<div class="alert alert-primary alert-dismissible fade show"
		role="alert">
		Te logueaste exitosamente!
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
		} else if (login != null && login.length() > 0) {
	%>
	<div class="alert alert-primary alert-dismissible fade show"
		role="alert">
		Hubo un problema en el inicio de sesi�n, verifica los datos
		ingresados.
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
		}
	%>
	<h2>${mensaje}</h2>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-xs-6 col-sm-4 col-lg-2 sidenav" id="sideBar">
				<ul class="list-unstyled components">
					<li><a href="#homeSubmenu" data-toggle="collapse"
						aria-expanded="false" class="dropdown-toggle">Videos</a>
						<ul class="collapse list-unstyled" id="homeSubmenu">
							<form action="AltaVideo" method="get">
								<!--<li><a href="altaVideo.jsp">A�adir Video</a></li>-->
								<button type="submit" value="Submit" class="btn-link">Alta
									Video</button>
							</form>
							<%
								if (username != null && username.length() > 0) {
							%>
							<form action="ModificarDatosVideo" method="get">
								<li><a href="ModificarDatosVideo">Modificar Video</a></li>
							</form>
							<%
								}
								;
							%>
							<li><a href="consultarVideo.jsp">Consultar Video</a></li>
							<li><a href="#">Comentar un Video</a></li>
							<li><a href="#">Valorar Video</a></li>
						</ul></li>
					<li><a href="#pageSubmenu" data-toggle="collapse"
						aria-expanded="false" class="dropdown-toggle">Listas de
							reproduccion</a>
						<ul class="collapse list-unstyled" id="pageSubmenu">
							<form action="AltaLista" method="get">
								<li><a href="AltaLista">Crear Lista de Reproduccion
										Particular</a></li>
							</form>
							<li><a href="#">Modificar Lista de Reproduccion</a></li>
							<li><a href="#">Agregar Video a Lista de Reproduccion</a></li>
							<li><a href="#">Quitar Video de Lista de Reproduccion</a></li>
							<li><a href="#">Consulta de Lista de Reproduccion</a></li>
						</ul></li>
					<li><a href="#categoria" data-toggle="collapse"
						aria-expanded="false" class="dropdown-toggle">Categorias</a>
						<ul class="collapse list-unstyled" id="categoria">
							<li><a href="altaCategoria.jsp">Crear Categoria</a></li>
							<form action="ListarCategorias" method="get">
								<button type="submit" value="Submit" class="btn-link">Listar
									Categorias</button>
							</form>
						</ul></li>
					<li><a href="#usuario" data-toggle="collapse"
						aria-expanded="false" class="dropdown-toggle">Usuarios</a>
						<ul class="collapse list-unstyled" id="usuario">
							<li><a href="seguirUsuario.jsp">Seguir Usuario</a></li>
							<li><a href="#">Dejar de Seguir</a></li>
							<li><a href="#">Consultar Usuario</a></li>
							<li><a href="#">Modificar Usuario</a></li>
						</ul></li>
				</ul>
			</div>

			<form class="mx-auto col-sm-6">
				<%
					DtLista datosLista = (DtLista) request.getAttribute("datosLista");
				%>
				<div class="form-group row">
					<label for="lblNombreLista" class="col-sm-2 col-form-label">Nombre
						de Lista</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext"
							id="nombreLista" value="<%=datosLista.getNombre()%>">
					</div>
				</div>
				<div class="form-group row">
					<label for="lblPrivado" class="col-sm-2 col-form-label">Privado</label>
					<div class="col-sm-10">
						<input onclick="return false"
							style="width: 35px; height: 20px; margin-left: 20px; margin-top: 7px"
							type="checkbox" value="<%=datosLista.isPrivado()%>">
					</div>

				</div>
				<%
					if (datosLista.getCategoria() != null) {
				%>
				<div class="form-group row">
					<label for="lblNombreCategoria" class="col-sm-2 col-form-label">Categoria</label>
					<div class="col-sm-4 inline">
						<i class="fas fa-tags group"></i> <input type="text" readonly
							class="form-control-plaintext-group" id="nombreCategoria"
							value="<%=datosLista.getCategoria()%>">
					</div>
				</div>
				<%
					}
				%>
				<%
					ArrayList<DtVideo> videos = (ArrayList<DtVideo>) request.getAttribute("videos");
					if (videos != null && videos.size() != 0) {
				%>
				<div class="form-group row  ">
					<ul class="list-group px-md-5">
						<%
							for (DtVideo vid : videos) {
						%>
						<li class="list-group-item"><%=vid.getNombre()%></li>
						<%
							}
						%>
					</ul>
				</div>
				<%
					}
				%>
			</form>
			<div class="col-sm-2 sidenav col-sm-offset-6">
				<jsp:include page="listadoCategorias.jsp" />
			</div>
		</div>
	</div>

	<script src="js/app.js" charset="utf-8"></script>

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