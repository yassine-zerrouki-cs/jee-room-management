package servlet;
import jakarta.servlet.http.HttpSession;
import model.User;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import dao.SalleDAO;
import model.Salle;
import java.util.List;

import dao.ReservationDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {

    @Override

 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("DOGET EXECUTED");

        List<Salle> sallesBloc5 = SalleDAO.getSallesByBloc(5);
        List<Salle> sallesBloc6 = SalleDAO.getSallesByBloc(6);
        
        
        System.out.println(sallesBloc5.size());
      
        
        
        System.out.println("Bloc5 = " + sallesBloc5.size());
        System.out.println("Bloc6 = " + sallesBloc6.size());

        

        request.setAttribute("sallesBloc5", sallesBloc5);
        request.setAttribute("sallesBloc6", sallesBloc6);

        request.getRequestDispatcher("reservation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Date date = Date.valueOf(request.getParameter("date"));
        Time heureDebut = Time.valueOf(request.getParameter("heureDebut") + ":00");
        Time heureFin = Time.valueOf(request.getParameter("heureFin") + ":00");

        int salleId = Integer.parseInt(request.getParameter("salleId"));
        int utilisateurId = user.getId();

        boolean dispo = ReservationDAO.isSalleDisponible(date, heureDebut, heureFin, salleId);

        String statut;
        boolean succes;

        if (dispo) {
            statut = "ACCEPTEE";
            succes = ReservationDAO.addReservation(date, heureDebut, heureFin, statut, utilisateurId, salleId);
        } else {
            statut = "REFUSEE";
            succes = false;
        }

        String message = succes ? "Réservation réussie" : "Réservation refusée";

        request.setAttribute("message", message);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
    
}