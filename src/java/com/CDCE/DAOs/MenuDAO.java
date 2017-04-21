package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.SideMenu;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nuwan
 */
public class MenuDAO {

    private Connection con;
    private DatabaseHandling dbh;

    public MenuDAO() throws SQLException {
        dbh = new DatabaseHandling();
        con = dbh.DataConnection();
    }

    // Get hospital list from the `master_hospitals` table for the hospital dropdown of cacer surveillance form 
    public ArrayList<SideMenu> menuItemList(String roleId) {
        ArrayList<SideMenu> menuItemList = new ArrayList<SideMenu>();
        try {
//            DatabaseHandling dbh = new DatabaseHandling();
//            Connection con = dbh.DataConnection();
            //   System.out.println("User Role "+roleId);
            String SQLQuery = "select * from menu where fld_user_role=? order by fld_order";
            List ParametersDefined
                    = Arrays.asList(roleId);
            List<String> ParameterDataType
                    = Arrays.asList("String");
            ResultSet rs = dbh.DataReadArg(con, SQLQuery, ParametersDefined, ParameterDataType);

            while (rs.next()) {
                SideMenu menuItem = new SideMenu();

                menuItem.setButtonName(rs.getString("fld_button_name"));
                menuItem.setUrl(rs.getString("fld_url"));
                menuItemList.add(menuItem);
                //         System.out.println(rs.getString("fld_url"));
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return menuItemList;

    }

}
