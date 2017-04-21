package com.CDCE.Model;

import com.CDCE.DataLayer.DatabaseHandling;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author nuwan
 */
public class UserRole {

    private String roleId;
    private String roleName;

    private Connection con;
    private DatabaseHandling dbh;

    public UserRole(String id) throws SQLException {
        this();
        roleId = id;

        read();

    }

    public UserRole() throws SQLException {
        dbh = new DatabaseHandling();
        con = dbh.DataConnection();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    private void read() {
        String sql = "SELECT * FROM userrole WHERE roleId = " + roleId + "";

        ResultSet rs = dbh.DataReadArg(con, sql);
//        System.out.println("aaa"+roleId);

        if (rs != null) {
//            System.out.println("zzz"+roleId);
            try {
                while (rs.next()) {

                    roleName = rs.getString("roleName");
                    roleId = rs.getString("roleId");

                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    @Override
    public String toString() {
        return roleName;
    }

}
