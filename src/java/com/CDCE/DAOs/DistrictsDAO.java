package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.Districts;
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
public class DistrictsDAO {

    private DatabaseHandling dbh = new DatabaseHandling();
    private Connection con = dbh.DataConnection();

    public ArrayList<Districts> dList() throws SQLException {
        ArrayList<Districts> dList = new ArrayList<Districts>();

        String SQLQuery = "SELECT districtId, districtName FROM `districts` "
                + "ORDER BY districtName ASC";

        ResultSet rs = dbh.DataReadArg(con, SQLQuery);

        while (rs.next()) {
            Districts dis = new Districts();
            //System.out.println(rs.getInt("id"));
            dis.setDistrictId(rs.getInt("districtId"));
            dis.setDistrictName(rs.getString("districtName"));

            dList.add(dis);
        }
        return dList;
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
