 package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Salle;
import utils.DBConnection;

public class SalleDAO {

    public static List<Salle> getSallesByBloc(int bloc) {

        List<Salle> salles = new ArrayList<>();

        String sql = "SELECT * FROM salle WHERE bloc = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bloc);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    salles.add(mapSalle(rs));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return salles;
    }

    public static List<Salle> getAllSalles() {

        List<Salle> salles = new ArrayList<>();

        String sql = "SELECT * FROM salle";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                salles.add(mapSalle(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return salles;
    }


    private static Salle mapSalle(ResultSet rs) throws SQLException {
        Salle s = new Salle();
        s.setId(rs.getInt("id"));
        s.setNom(rs.getString("nom"));
        s.setCapacite(rs.getInt("capacite"));
        s.setBloc(rs.getInt("bloc"));
        return s;
    }
}