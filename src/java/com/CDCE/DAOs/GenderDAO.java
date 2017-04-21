package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.Gender;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nuwan
 */
public class GenderDAO {
    
    private DatabaseHandling dbh = new DatabaseHandling();
    private Connection con = dbh.DataConnection();

    public ArrayList<Gender> gList() throws SQLException {
        
        ArrayList<Gender> gList = new ArrayList<Gender>();

        String SQLQuery = "SELECT id, label FROM gender "
                + "ORDER BY label ASC";

        ResultSet rs = dbh.DataReadArg(con, SQLQuery);

        while (rs.next()) {
            Gender gen = new Gender();
            //System.out.println(rs.getInt("id"));
            gen.setId(rs.getInt("id"));
            gen.setLabel(rs.getString("label"));

            gList.add(gen);
        }
        return gList;
    }
    
    public void close() {

        if (con != null) {
            try {
                con.close();
                con = null;
            } catch (SQLException ex) {
                Logger.getLogger(LiteracyDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
    
}
