package com.CDCE.Model;

import com.CDCE.DataLayer.DatabaseHandling;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nuwan
 */
public class User {

    private String userId;
    private String username;
    private String password;
    private String userRole;
    private String employee;

    private UserRole roleName;

    private Connection con;
    private DatabaseHandling dbh;

    public User(String id) throws SQLException {
        this();
        userId = id;

        read();
    }

    public User() throws SQLException {
        dbh = new DatabaseHandling();
        con = dbh.DataConnection();
        username = null;
        password = null;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public String getEmployee() {
        return employee;
    }

    public void setEmployee(String employee) {
        this.employee = employee;
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public DatabaseHandling getDbh() {
        return dbh;
    }

    public void setDbh(DatabaseHandling dbh) {
        this.dbh = dbh;
    }

    public UserRole getRoleName() {
        return roleName;
    }

    public void setRoleName(UserRole roleName) {
        this.roleName = roleName;

        this.userRole = roleName.getRoleId();
//        System.out.println(roleName);
    }

    public String getDesignation() {
        return userRole;
    }

    public void setDesignation(String userRole) {
        this.userRole = userRole;
    }

    /*2017-01-17*/
    public boolean authenticate(String username, String password) {
        Connection newConnection = null;
        ResultSet newRst = null;
        boolean flag = false; //return value which determines whether logged in or not
        String SqlString = "SELECT * FROM user WHERE username=? AND password =?";

        String UserName = username;
        String Password = password;

        String CheckUserName;
        String CheckPassword;

        List<String> ParametersDefined
                = Arrays.asList(UserName, Password);
        List<String> ParametersNames = Arrays.asList(username, password);
        List<String> ParameterDataType
                = Arrays.asList("String", "String");

        DatabaseHandling newData = new DatabaseHandling();
        try {

            newConnection = newData.DataConnection();// creating the connection
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
                CheckUserName = newRst.getString("username");
                CheckPassword = newRst.getString("password");

                if ((username.equals(CheckUserName))
                        && password.equals(CheckPassword)) {
                    //id = newRst.getString("id");
                    userRole = newRst.getString("userRole");
                    System.out.println("role = " + userRole);
                    flag = true;
                }
            }

        } catch (Exception e) {

            System.out.println("Error" + e.getMessage());
            flag = false;

        }

        return flag;
    }

    private String maxUserId() {
        String max = "0";

        String sql = "SELECT max(userId) as mid FROM user";

        ResultSet rs = dbh.DataReadArg(con, sql);
        //username, password, userRole, empNo, userId
        //System.out.println("xxx2"+userId);
        if (rs != null) {
            //System.out.println("xxx2");
            try {
                while (rs.next()) {
                    max = rs.getString("mid");
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }

        return max;
    }

    public void save() {
        if (username == null) {
            String SQLQuery = "INSERT INTO user (userId, username, password, userRole, employee) VALUES (?,?,?,?,?)";
            userId = String.valueOf(maxUserId() + 1);

            List ParametersDefined = Arrays.asList(userId, username, password, userRole, employee);
            List<String> ParameterDataType = Arrays.asList("String", "String", "String", "String", "String");

            //passing this to Database Layer
            dbh.DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);

            //userId = String.valueOf(dbh.getLastInsertId());
        } else {
           //userRole = "1";

            String SQLQuery = "UPDATE user SET username = ?, userRole = ?, employee = ? WHERE userId = ?";

            List ParametersDefined = Arrays.asList(username, userRole, employee, userId);
            List<String> ParameterDataType = Arrays.asList("String", "String", "String", "String");

            dbh.DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);
        }
    }

    public void changePassword() {
        String SQLQuery = "UPDATE user SET password = ? WHERE userId = ?";

        List ParametersDefined = Arrays.asList(password, userId);
        List<String> ParameterDataType = Arrays.asList("String", "String");

        dbh.DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);
    }

    private void read() {
        String sql = "SELECT * FROM user WHERE userId = '" + userId + "'";

        ResultSet rs = dbh.DataReadArg(con, sql);
        //username, password, userRole, empNo, userId
        //System.out.println("xxx2"+userId);
        if (rs != null) {
            System.out.println("xxx2");
            try {
                while (rs.next()) {
                    username = rs.getString("username");
                    userRole = rs.getString("userRole");
                    employee = rs.getString("employee");

//                    roleName       = new UserRole(rs.getString("userRole"));
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    /*Old*/
    /*
     public boolean authenticate(String email, String password) {
     //        Connection newConnection = null;
     ResultSet newRst = null;
     boolean flag = false; //return value which determines whether logged in or not
     String SqlString = "SELECT * FROM user"
     + " WHERE username=? AND password = SHA1(?)";

     List<String> ParametersDefined
     = Arrays.asList(email, password);
     List<String> ParametersNames = Arrays.asList("username", "password");
     List<String> ParameterDataType
     = Arrays.asList("String", "String");

     try {

     //            newConnection = newData.DataConnection();// creating the connrvtion
     newRst = dbh.DataReadArg(con, SqlString,
     ParametersDefined, ParametersNames, ParameterDataType);
     //check whether one row or more 

     int RowCount = 0; // to find the row count
     while (newRst.next()) {
     //checking whether we are getting right row
     //System.out.println("this is" + newRst.getString(2));

     RowCount++;
     }
     //if the Row count is one then it check    
     if (RowCount == 1) {
     newRst.first();
     //CheckUserName = newRst.getString("email");
     //CheckPassword = newRst.getString("password");

     //                if ((email.equals(CheckUserName))
     //                        && password.equals(CheckPassword)) {
     userId = newRst.getInt("userId");
     //                userRole = newRst.getString("user_role");
     username = newRst.getString("usename");
     //   System.out.println("role = "+userRole);
     flag = true;
     //                }
     newRst.close();
     }

     } catch (Exception e) {

     flag = false;

     }

     return flag;
     }

     public boolean checkAlreadyExist(String email) {
     //        Connection newConnection = null;
     ResultSet newRst = null;
     boolean flag = false; //return value which determines whether logged in or not
     String SqlString = "SELECT * FROM user"
     + " WHERE email=?";

     List<String> ParametersDefined
     = Arrays.asList(email);
     List<String> ParametersNames = Arrays.asList("username");
     List<String> ParameterDataType
     = Arrays.asList("String");

     //        DatabaseHandling newData = new DatabaseHandling();
     try {

     //            newConnection = newData.DataConnection();// creating the connrvtion
     newRst = dbh.DataReadArg(con, SqlString,
     ParametersDefined, ParametersNames, ParameterDataType);
     //check whether one row or more 

     int RowCount = 0; // to find the row count
     while (newRst.next()) {

     RowCount++;
     }
     //if the Row count is one then it check    
     if (RowCount == 1) {
     newRst.first();

     userId = newRst.getInt("userId");
     username = newRst.getString("username");
     flag = true;
     newRst.close();
     }

     } catch (Exception e) {

     //System.out.println("Error" + e.getMessage());
     flag = false;

     }

     return flag;
     }

     public boolean checkAlreadySubmitted(String nic_number) {
     //        Connection newConnection = null;
     ResultSet newRst = null;
     boolean flag = false; //return value which determines whether logged in or not
     String SqlString = "SELECT * FROM ba_application"
     + " WHERE nic_number=?";

     List<String> ParametersDefined
     = Arrays.asList(nic_number);
     List<String> ParametersNames = Arrays.asList("nic_number");
     List<String> ParameterDataType
     = Arrays.asList("String");

     //        DatabaseHandling newData = new DatabaseHandling();
     try {

     //            newConnection = newData.DataConnection();// creating the connrvtion
     newRst = dbh.DataReadArg(con, SqlString,
     ParametersDefined, ParametersNames, ParameterDataType);
     //check whether one row or more 

     int RowCount = 0; // to find the row count
     while (newRst.next()) {

     RowCount++;
     }
     //if the Row count is one then it check    
     if (RowCount == 1) {
     newRst.first();

     flag = true;
     newRst.close();
     }

     } catch (Exception e) {

     //System.out.println("Error" + e.getMessage());
     flag = false;

     }

     return flag;
     }

     public void read() {
     try {
     String SQLQuery = "select * from user where id='" + this.userId + "'";

     ResultSet rs = dbh.DataReadArg(con, SQLQuery);

     while (rs.next()) {

     username = rs.getString("username");
     password = rs.getString("password");
     userRole = rs.getInt("userRole");
     employee = rs.getInt("employee");

     }
     rs.close();
     } catch (SQLException ex) {
     Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
     }
     }

     public void save() {
     if (username == null) {
     //Insert user
     String SQLQuery = "INSERT INTO user (`full_name`,`password`,`user_role`,`email`,`date_of_birth`, `added_date`) VALUES (?,SHA1(?),?,?,?, NOW())";

     //  System.out.println("SQLQuery " + SQLQuery);
     List ParametersDefined = Arrays.asList(username, password, userRole, employee);
     List<String> ParameterDataType = Arrays.asList("String", "String", "String", "String");

     dbh.DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);

     userId = dbh.getLastInsertId();
     } else {
     String SQLQuery = "UPDATE user SET `user_role` = ?, `email` = ?, `date_of_birth` = ? WHERE `id`=?";

     System.out.println("SQLQuery " + SQLQuery);

     List ParametersDefined = Arrays.asList(userRole, userId);
     List<String> ParameterDataType = Arrays.asList("String", "String");

     dbh.DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);
     }
     }

     public int delete() {

     //        Connection myCon;
     String SQLQuery = "delete from user where id = ?;";

     List ParametersDefined = Arrays.asList(userId);
     List<String> ParameterDataType = Arrays.asList("String");

     //passing this to Database Layer
     dbh.DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);
     return 0;
     }
     */
}
