package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

import dao.ReservationDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException{
		
		Date date=Date.valueOf(request.getParameter("date"));
		
		Time heureDebut=Time.valueOf(request.getParameter("heureDebut") + ":00");
		
		Time heureFin=Time.valueOf(request.getParameter("heureFin")+ ":00");
		
		
		int salleId =Integer.valueOf(request.getParameter("salleId"));
		
		
		int utilisateurId = Integer.parseInt(request.getParameter("utilisateurId"));
		
		
		boolean dispo = ReservationDAO.isSalleDisponible(date,
				heureDebut,
				 heureFin,
				salleId);
		
		String statut;
		
		boolean succes=false;
		
		
		if(dispo) {
			statut="ACCEPTEE";
			succes=ReservationDAO.addReservation(date,heureDebut,heureFin,statut,utilisateurId,salleId);
		}else {
			statut="REFUSEE";
			succes=false;
		}
		
		String message;

        if (succes) {
            message = "Réservation réussie";
        } else {
            message = "Réservation refusée";
        }
        
        
        request.setAttribute("message", message);
        request.getRequestDispatcher("result.jsp").forward(request, response);
        
        
		
	}
	
	

}
