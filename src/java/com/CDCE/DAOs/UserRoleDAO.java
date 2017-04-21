package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.UserRole;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nuwan
 */
public class UserRoleDAO {
    private Connection con;
    private DatabaseHandling dbh;
    
    public UserRoleDAO() throws SQLException {
        dbh = new DatabaseHandling();
        con = dbh.DataConnection();        
    }

    
    
    public List<UserRole> getAllRoles(){
        List<UserRole> roles = new ArrayList<UserRole>();
        
        try {

            String sql = "SELECT * FROM userrole";
            
            System.out.println(sql);
            ResultSet rs = dbh.DataReadArg(con, sql);

            while (rs.next()) {

                UserRole role = new UserRole(rs.getString("roleId"));
                

                role.setRoleId(rs.getString("roleId"));
                role.setRoleName(rs.getString("roleName"));
                
                roles.add(role);

            }

        } catch (SQLException ex) {
            Logger.getLogger(UserRoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
        return roles;
    }
}
