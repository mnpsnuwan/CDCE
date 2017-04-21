package com.CDCE.Model;

import com.CDCE.DataLayer.DatabaseHandling;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author nuwan
 */
public class SystemUser {
    
    private String userName;
    private String password;
    private int userRoleId;
    private int systemUserId;
    
    private Connection con;
    private DatabaseHandling dbh;

    public SystemUser() throws SQLException {
        dbh = new DatabaseHandling();
        con = dbh.DataConnection();        
        password = null;
        userRoleId = 0;
    }
    

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(int userRoleId) {
        this.userRoleId = userRoleId;
    }

    public int getSystemUserId() {
        return systemUserId;
    }

    public void setSystemUserId(int systemUserId) {
        this.systemUserId = systemUserId;
    }
    
    public boolean authenticate(String username, String password){
        Connection newConnection = null;
        ResultSet newRst = null;
        boolean flag = false; //return value which determines whether logged in or not
        String SqlString = "SELECT * FROM system_user_table"
                + " WHERE userName=? AND password =?";

        String UserName = username;
        String Password = password;
        
        String CheckUserName;
        String CheckPassword;

        List<String> ParametersDefined =
                Arrays.asList(UserName, Password);
        List<String> ParametersNames =  Arrays.asList("userName", "password");
        List<String> ParameterDataType =
                Arrays.asList("String", "String");

        DatabaseHandling newData = new DatabaseHandling();
        try {

            newConnection = newData.DataConnection();// creating the connrvtion
            newRst = newData.DataReadArg(newConnection, SqlString,
                    ParametersDefined, ParametersNames, ParameterDataType);
            //check whether one row or more 

            int RowCount = 0; // to find the row count
            while (newRst.next()) {
                //checking whether we are getting right row
                System.out.println("this is " + newRst.getString(2));

                RowCount++;
            }
            //if the Row count is one then it check    
            if (RowCount == 1) {
                newRst.first();
                CheckUserName = newRst.getString("userName");
                CheckPassword = newRst.getString("password");
                  
                if ((username.equals(CheckUserName))
                        && password.equals(CheckPassword)) {
                    //id = newRst.getString("id");
                    userRoleId = newRst.getInt("userRoleId");
                    System.out.println("role = " + userRoleId);
                    flag = true;
                }
            }

        } catch (Exception e) {

            System.out.println("Error" + e.getMessage());
            flag = false;

        }

        return flag;
    }
    
}
