package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interfaces.Fabrica;
import interfaces.IControlador;

@WebServlet("/AltaVideo")
public class AltaVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AltaVideo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("nickname");
		if (username != null) {
			Fabrica fabrica = Fabrica.getInstancia();
			IControlador icon = fabrica.getIControlador();
			ArrayList<String> categorias = icon.listarCategorias();
			if (!categorias.isEmpty()) request.setAttribute("categorias", categorias);
			RequestDispatcher rd;
			request.setAttribute("loaded", true);
			rd = request.getRequestDispatcher("/altaVideo.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendError(403);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		
		String categoria = (String) request.getParameter("categoria");
		String nombre = request.getParameter("nombre");
		String duracion = request.getParameter("duracion");
		Integer dur = Integer.parseInt(duracion);
		String url = request.getParameter("url");
		String descripcion = request.getParameter("descripcion");
		Date fecha = new Date();
		//request.getParameter("fechaVideo");

		//Seleccion de Usuario y Categoria
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		System.out.print(user);
		icon.seleccionarUsuario(user);
		System.out.print("Llega Hasta Aca");
		if (categoria != null) {
			icon.seleccionarCategoria(categoria);
		}
		
		//Se ingresa el video
		String resp = "altaVideo.jsp";
		System.out.print("Llega Hasta Aca");
		System.out.print(nombre);
		System.out.print(dur);
		System.out.print(url);
		System.out.print(descripcion);
		System.out.print(fecha);
		
		if (icon.ingresarVideo(nombre, dur, url, descripcion, fecha)) {
			icon.finCasoUso();
			request.setAttribute("mensaje", "El video se subio correctamente");
			resp = "index.jsp";
		}
		else {
			request.setAttribute("mensaje", "Existe un video con el nombre ingresado.");
			request.setAttribute("error", "No se pudo ingresar el video.");
			doGet(request, response);
		}
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
	}

}
