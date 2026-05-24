package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.Time;
import utils.DBConnection;

public class ReservationDAO {

    public static boolean addReservation(Date date,
                                         Time heureDebut,
                                         Time heureFin,
                                         String statut,
                                         int utilisateurId,
                                         int salleId) {
    	String sql="INSERT INTO reservation (date, heure_debut,heure_fin, statut,utilisateur_id,salle_id) VALUES(?,?,?,?,?,?)";
    	try {
    		Connection conn=DBConnection.getConnection();
    		PreparedStatement ps=conn.prepareStatement(sql);
    		
    		ps.setDate(1,date);
    		ps.setTime(2, heureDebut);
    		ps.setTime(3, heureFin);
    		ps.setString(4, statut);
    		ps.setInt(5, utilisateurId);
    		ps.setInt(6, salleId);
    		
    		int rows=ps.executeUpdate();
    		return rows>0;
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return false;
		
    }	
    public static boolean isSalleDisponible(Date date,Time heureDebut,Time heureFin,int salleId) {
    	try {
    	Connection conn=DBConnection.getConnection();
    	String sql="SELECT * FROM reservation WHERE date=? AND salle_id=? AND (heure_debut < ? AND heure_fin > ?)";
    	PreparedStatement ps=conn.prepareStatement(sql);
    	ps.setDate(1, date);
    	ps.setInt(2, salleId);
    	ps.setTime(3, heureFin);
    	ps.setTime(4, heureDebut);
    	ResultSet rs =ps.executeQuery();	
    	if (rs.next()) {
        	return false;
        	
        }else {
        	return true;
        }
    }catch(Exception e) {
    	e.printStackTrace();
    	System.out.println(e.getMessage());
    }
    
    	return false;
    }
    	
}