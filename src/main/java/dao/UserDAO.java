package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import utils.DBConnection;

public class UserDAO {

public static User login(String email, String password) {

    User user = null;

    try {

        Connection conn = DBConnection.getConnection();

        String sql = "SELECT * FROM utilisateur WHERE email=? AND password=?";

        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            user = new User();

            user.setId(rs.getInt("id"));
            user.setNom(rs.getString("nom"));
            user.setPrenom(rs.getString("prenom"));
            user.setRole(rs.getString("role"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return user;
}


}
