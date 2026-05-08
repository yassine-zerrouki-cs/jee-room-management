package utils;
import java.sql.Connection;

public class TestConnection {
    public static void main(String[] args) {
        
        Connection conn = DBConnection.getConnection();
        
        if (conn != null) {
            System.out.println("Connexion réussie!! ");
        } else {
            System.out.println("Connexion échouée??");	
        }
    }
}