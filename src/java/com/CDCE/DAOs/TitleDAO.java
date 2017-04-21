/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.Title;
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
public class TitleDAO {

    private DatabaseHandling dbh = new DatabaseHandling();
    private Connection con = dbh.DataConnection();

    public ArrayList<Title> tList() throws SQLException {
        ArrayList<Title> tList = new ArrayList<Title>();

        String SQLQuery = "SELECT id, label FROM title "
                + "ORDER BY label ASC";

        ResultSet rs = dbh.DataReadArg(con, SQLQuery);

        while (rs.next()) {
            Title tit = new Title();
            //System.out.println(rs.getInt("id"));
            tit.setId(rs.getInt("id"));
            tit.setLabel(rs.getString("label"));

            tList.add(tit);
        }
        return tList;
    }

    public void close() {

        if (con != null) {
            try {
                con.close();
                con = null;
            } catch (SQLException ex) {
                Logger.getLogger(TitleDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
