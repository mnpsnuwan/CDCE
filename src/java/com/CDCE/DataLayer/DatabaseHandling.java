package com.CDCE.DataLayer;

import java.sql.*;
import java.sql.PreparedStatement;
import java.util.*;

/**
 *
 * @author nuwan
 */

public class DatabaseHandling {

    private Connection con = null; //Database connection initiated

    public Connection DataConnection(){

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();

//           con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cdce2?zeroDateTimeBehavior=convertToNull", "root", "f!RtH0V7");
           con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cdce?zeroDateTimeBehavior=convertToNull", "root", "root");
//         con = DriverManager.getConnection("jdbc:mysql://localhost/cdce2?zeroDateTimeBehavior=convertToNull","root", "admin@sdu123#");
//	   con = DriverManager.getConnection("jdbc:mysql://localhost/dbname?zeroDateTimeBehavior=convertToNull","root", "admin@sdu123#");
        } catch (Exception e) {
            e.printStackTrace();
        }
        //con.close();
        return con;
    }
    
    public ResultSet DataReadArg(Connection con, String SqlString) {
        PreparedStatement st;
        ResultSet rst = null; //Initialization of Resultset 

        try {
            st = con.prepareStatement(SqlString); //Prepare Statement

            rst = st.executeQuery();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }

        return rst;
    }
    
    public ResultSet DataReadArg(Connection con, String SqlString, List ParametersDefined, List ParameterDataType ) 
    {

        PreparedStatement st = null;;
        ResultSet rst = null; //Initialization of Resultset 

        //parameters have been defined
        List<String> iParametersDefined = new ArrayList<String>();
       // List<String> iParameterName = new ArrayList<String>();
        List<String> iParameterDataType = new ArrayList<String>();

        // Arrays are now adding into array list defined here
        iParametersDefined.addAll(ParametersDefined);
        iParameterDataType.addAll(ParameterDataType);
        try {
            st = con.prepareStatement(SqlString); //Prepare Statement

            //Preparation of SQLPreareparedstatement for Parameters
            for (int i = 0; i < iParametersDefined.size(); i++) {
                int x;
                x = i;
                if (iParameterDataType.get(i).equals("String")) {

                    st.setString(x + 1, iParametersDefined.get(i).toString());

                } else if (iParameterDataType.get(i).equals("Integer")) {

                    st.setInt(x + 1, Integer.parseInt(iParametersDefined.get(i)));

                }

            }

            rst = st.executeQuery();

        } catch (Exception e) {
            
        }

        return rst;

    }

    /*public ResultSet DataReadArg(Connection con, String SqlString, List ParametersDefined, List ParameterDataType) {
        PreparedStatement st = null;;
        ResultSet rst = null; //Initialization of Resultset 

        //parametes have been defined
        List<String> iParametersDefined = new ArrayList<String>();
        List<String> iParameterDataType = new ArrayList<String>();

        // Arrays are now adding into array list defined here
        iParametersDefined.addAll(ParametersDefined);
        iParameterDataType.addAll(ParameterDataType);

        try {
            st = con.prepareStatement(SqlString); //Prepare Statement
            //Preparation of SQLPreareparedstatement for Parameters

            for (int i = 0; i < iParametersDefined.size(); i++) {
                int x;
                x = i;

                if (iParameterDataType.get(i).equals("String")) {
                    //=-setString(x + 1,.arametersDefined.get(i).toString());
                } else if (iParameterDataType.get(i).equals("Integer")) {
                    st.setInt(x + 1, Integer.parseInt(iParametersDefined.get(i)));
                }
            }
              
            rst = st.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rst;
    }*/

    public ResultSet DataReadArg(Connection con, String SqlString, List ParametersDefined, List ParameterName, List ParameterDataType) {
        PreparedStatement st = null;;
        ResultSet rst = null; //Initialization of Resultset 

        //parametes have been defined
        List<String> iParametersDefined = new ArrayList<String>();
        List<String> iParameterName = new ArrayList<String>();
        List<String> iParameterDataType = new ArrayList<String>();

        // Arrays are now adding into array list defined here
        iParametersDefined.addAll(ParametersDefined);
        iParameterName.addAll(ParameterName);
        iParameterDataType.addAll(ParameterDataType);

        try {
            st = con.prepareStatement(SqlString); //Prepare Statement
            //Preparation of SQLPreareparedstatement for Parameters

            for (int i = 0; i < iParametersDefined.size(); i++) {
                int x;
                x = i;

                if (iParameterDataType.get(i).equals("String")) {
                    st.setString(x + 1, iParametersDefined.get(i).toString());
                } else if (iParameterDataType.get(i).equals("Integer")) {
                    st.setInt(x + 1, Integer.parseInt(iParametersDefined.get(i)));
                }
            }

            rst = st.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rst;
    }

    public int getLastInsertId() {
        Statement stmt = null;
        String query = "select last_insert_id() as last_id";
        int id = 0;

        try {
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            if (rs != null) {
                while (rs.next()) {
                    id = rs.getInt("last_id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return id;
    }

    public void DataAddUpdateDelete(Connection myCon, String SqlQuery, List ParametersDefined, List ParametersDataType) {
        PreparedStatement st;
        //Parameters defined 

        List<String> iParametersDefined = new ArrayList<String>();
        List<String> iParameterDataType = new ArrayList<String>();

        iParametersDefined.addAll(ParametersDefined);
        iParameterDataType.addAll(ParametersDataType);

        try {
            st = myCon.prepareStatement(SqlQuery);

            for (int i = 0; i < iParametersDefined.size(); i++) {
                int x;
                x = i;

                if (iParameterDataType.get(i).equals("String")) {
                    st.setString(x + 1, iParametersDefined.get(i).toString());
                } else if (iParameterDataType.get(i).equals("Integer")) {
                    st.setInt(x + 1, Integer.parseInt(iParametersDefined.get(i)));
                }
            }
            //Execute Update query
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void InsertLog(String LogID, String Action, String IPAddress, String Query, String fld_PrimaryKey) throws SQLException {

        String SQLQuery = "Insert into tbl_userlog (fld_userLogID,fld_action,fld_IPAddress,fld_DateTime,fld_query,fld_PrimaryKey) values (?,?,?,now(),?,?);";

        //parametes have been defined
        List<String> ParametersDefined = Arrays.asList(LogID, Action, IPAddress, Query, fld_PrimaryKey);
        List<String> ParameterDataType = Arrays.asList("String", "String", "String", "String", "String");

        DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);
        con.close();
    }
    //A+
}
