package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.User;
import com.CDCE.Model.UserRole;
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
public class UserDAO {
    
  //  User user = new User();
    private Connection con;
    private DatabaseHandling dbh;
    
    ArrayList UserArrayList = new ArrayList();

    public UserDAO() throws SQLException {
        dbh = new DatabaseHandling();
        con = dbh.DataConnection();
    }
    
    /*2017-01-17*/
    
    public User get(String username, String password) {
        User user = null;

        try {

            String sql = "SELECT * FROM user WHERE username =? AND password =?;";
            
            System.out.println(sql);
            
            List<String> parameters = Arrays.asList(username, password);
            List<String> parameterDataTypes = Arrays.asList("String", "String");
            ResultSet rs = dbh.DataReadArg(con, sql, parameters, parameterDataTypes);

            while (rs.next()) {

                user = new User();

                user.setUserId(rs.getString("userId"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setDesignation(rs.getString("userRole"));
                user.setEmployee(rs.getString("employee"));
               
            }

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            /*try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            }*/
        }
        
        return user;
    }
    
    public List<User> getAllUsers(){
        List<User> users = new ArrayList<User>();
        
        try {

            String sql = "SELECT * FROM user";
            
            System.out.println(sql);
            ResultSet rs = dbh.DataReadArg(con, sql);

            while (rs.next()) {

                User user = new User();

                user.setUserId(rs.getString("userId"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRoleName(new UserRole(rs.getString("userRole")));
                user.setEmployee(rs.getString("employee"));
                
                users.add(user);

            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
        return users;
    }
    
    public User editUserDetails(String userId) throws SQLException {

        User userDetails = null;

        DatabaseHandling dbh = new DatabaseHandling();
        Connection con = dbh.DataConnection();
        String SQLQuery = "SELECT * FROM user WHERE userId='"+userId+"' ";

        ResultSet rs = dbh.DataReadArg(con, SQLQuery);

        if (rs != null && rs.next()) {

            userDetails = new User();
            userDetails.setUserId(rs.getString("userId"));
            userDetails.setUsername(rs.getString("username"));
            userDetails.setPassword(rs.getString("password"));
            userDetails.setDesignation(rs.getString("userRole"));
            userDetails.setEmployee(rs.getString("employee"));
        }
        return userDetails;

    }
    
    public ArrayList UserDetails(String username) throws SQLException {
        DatabaseHandling dbh = new DatabaseHandling();
        Connection con = dbh.DataConnection();

        String SQLQuery = "SELECT * FROM user WHERE userId='"+username+"' ";

        List<String> ParametersDefined = Arrays.asList(username);
        List<String> ParameterDataType = Arrays.asList("String");

        ResultSet rs = dbh.DataReadArg(con, SQLQuery, ParametersDefined, ParameterDataType);

        while (rs.next()) {
            User UserModel = new User();

            UserModel.setUserId(rs.getString("userId"));
            UserModel.setUsername(rs.getString("username"));
            UserModel.setPassword(rs.getString("password"));
            UserModel.setEmployee(rs.getString("employee"));
            UserModel.setDesignation(rs.getString("userRole"));

            UserArrayList.add(UserModel);
        }

        con.close();
        return UserArrayList;
    }
    
/*Old*/
    /*
    public boolean verifyLogin(User user) {
//        Connection newConnection = null;
        ResultSet newRst = null;
        boolean flag = false; //return value which determines whether logged in or not
        String SqlString = "SELECT * FROM user"
                + " WHERE username=? AND password =?";

        String UserName = user.getUsername();
        String Password = user.getPassword();
        
        String CheckUserName;
        String CheckPassword;

        List<String> ParametersDefined =
                Arrays.asList(UserName, Password);
        List<String> ParametersNames =  Arrays.asList("username", "password");
        List<String> ParameterDataType =
                Arrays.asList("String", "String");

//        DatabaseHandling newData = new DatabaseHandling();
        try {

//            newConnection = newData.DataConnection();// creating the connrvtion
            newRst = dbh.DataReadArg(con, SqlString,
                    ParametersDefined, ParametersNames, ParameterDataType);
            //check whether one row or more 

            int RowCount = 0; // to find the row count
            while (newRst.next()) {
                //checking whether we are getting right row
                System.out.println("this is" + newRst.getString(2));

                RowCount++;
            }
            //if the Row count is one then it check    
            if (RowCount == 1) {
                newRst.first();
                CheckUserName = newRst.getString(1);
                CheckPassword = newRst.getString(2);
                  
                if ((user.getUsername().equals(CheckUserName))
                        && user.getPassword().equals(CheckPassword)) {
 
                    user.setUserRole(newRst.getInt(3));
                    flag = true;
                }
            }
             newRst.close();

        } catch (Exception e) {

            System.out.println("Error" + e.getMessage());
            flag = false;
           
        }
       
        return flag;
    }
    */
}
