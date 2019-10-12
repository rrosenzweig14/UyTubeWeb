package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import antlr.Parser;
import datatypes.DtLista;
import datatypes.DtVideo;
import interfaces.Fabrica;
import interfaces.IControlador;

/**
 * Servlet implementation class ConsultaLista
 */
@WebServlet("/ConsultaLista")
public class ConsultaLista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsultaLista() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		String idString = (String) request.getParameter("IDLISTA");		
		int id = Integer.parseInt(idString);
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("nickname");		
		if (idString != null && id != 0) {
		DtLista datosLista = icon.findLista(id);
		String duenio = null;		
		if (datosLista != null) {
			if (username != null) {
				duenio = icon.findDuenioLista(id);
				if (duenio.equals(username)) {
					request.setAttribute("esDuenio", true);
					HashMap<Integer,String> videosPrivados = icon.listarVideosPrivados(username);
					if (videosPrivados != null) request.setAttribute("videosPrivados", videosPrivados);		
				}
			}
			request.setAttribute("datosLista", datosLista);
			ArrayList<DtVideo> videos = icon.videosEnListaPublica(datosLista);
			if (videos != null) request.setAttribute("videos", videos);
			request.setAttribute("error", false);
		}
		else {
			request.setAttribute("error", true);
		}
		RequestDispatcher view = request.getRequestDispatcher("consultaLista.jsp");
		view.forward(request, response);
		}
		else {
			response.sendError(403);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
