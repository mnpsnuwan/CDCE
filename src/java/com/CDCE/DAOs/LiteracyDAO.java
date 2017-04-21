/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.Literacy;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ucsc
 */
public class LiteracyDAO {
    private DatabaseHandling dbh = new DatabaseHandling();
    private Connection con = dbh.DataConnection();
    
    public ArrayList<Literacy> lList() throws SQLException{
        ArrayList<Literacy> lList = new ArrayList<Literacy>();

            String SQLQuery = "SELECT id, label FROM literacy "
                    + "ORDER BY label ASC";

            ResultSet rs = dbh.DataReadArg(con, SQLQuery);

            while (rs.next()) {
                Literacy lit = new Literacy();
                //System.out.println(rs.getInt("id"));
                lit.setId(rs.getInt("id"));
                lit.setLabel(rs.getString("label"));
                
                lList.add(lit);
            }
            return lList;
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
