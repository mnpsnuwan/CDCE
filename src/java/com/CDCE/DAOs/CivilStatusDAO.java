package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.CivilStatus;
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
public class CivilStatusDAO {

       private DatabaseHandling dbh = new DatabaseHandling();
       private Connection con = dbh.DataConnection();
    

    public ArrayList<CivilStatus> csList() throws SQLException {
        ArrayList<CivilStatus> csList = new ArrayList<CivilStatus>();

        String SQLQuery = "SELECT id, label FROM civil_status "
                + "ORDER BY label ASC";

        ResultSet rs = dbh.DataReadArg(con, SQLQuery);

        while (rs.next()) {
            CivilStatus cs = new CivilStatus();
            //System.out.println(rs.getInt("id"));
            cs.setId(rs.getInt("id"));
            cs.setLabel(rs.getString("label"));

            csList.add(cs);
        }
        return csList;
    }
    
    public void close() {

        if (con != null) {
            try {
                con.close();
                con = null;
            } catch (SQLException ex) {
                Logger.getLogger(CivilStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
