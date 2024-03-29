<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%> 
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="WS.WebClient"%>
<%@ page import="WS.WebServices"%>
<%@ page import="WS.WebServicesServiceLocator"%>
<%@ page import="WS.DtUsuario"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		
		<script src="libs/jquery-3.4.1.min.js" charset="utf-8"></script>
		<!-- Bootstrap CSS -->
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
			integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
			crossorigin="anonymous"/>
			
		<script src="js/bootstrap-datepicker.js" charset="utf-8"></script>
		<script>
			function button(){
				document.getElementById("btnAceptar").disabled = false;
			}
        </script>
		<link rel="stylesheet" href="css/bootstrap-datepicker.css">	
			
			
		<title>uyTube | Seguir Usuario</title>
	
	</head>

	
	<body>
		<!-- Barra Principal -->
		<div class="container" id="navBarPrincipal">
		<jsp:include page="nav.jsp" />
	</div>
		<!-- Resto de la pag -->
		<h1 class="container">Seguir Usuario</h1>
		<form action="SeguirUsuario" method="post">
			<div class="container">
						<div class="form-group row">
							<select name="users" class="form-control col-xs-12 col-sm-8 col-md-8" id="users" onchange="button()">
								<option  disabled="disabled" selected="selected">--Seleccionar Usuario--</option>
								<% 
								HttpSession se = request.getSession();
								String user = (String) se.getAttribute("nickname");
								//IControlador icon = Fabrica.getInstancia().getIControlador();
								WebServices ws = (new WebServicesServiceLocator()).getWebServicesPort();
								String[] users = ws.listarUsuarios();
								DtUsuario dtu = ws.seleccionarUsuario(user);
								for(String s: users){
									if(!user.equals(s)){
										boolean b = true;
										for(String seg: WebClient.getSeguidos(dtu).keySet()) {	//no pueda seguir a alguien que ya siga
											if(seg.equals(s)) {
												b = false;
											}
										}
										if(b) {
											%><option value="<%=s%>"><%=s%></option><%
										}
									}
								}%>								
							</select>					
						</div>
						<div class="form-group row">
							<button type="submit" id="btnAceptar" class="btn btn-primary col-xs-12 col-sm-4 col-md-4" disabled>Aceptar</button>
						</div>
					</div>
			</div>
		</form>
		
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