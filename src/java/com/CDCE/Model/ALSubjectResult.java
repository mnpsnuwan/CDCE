package com.CDCE.Model;

import com.CDCE.DataLayer.DatabaseHandling;
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
public class ALSubjectResult {

    private int id;
    private String applicationId;
    private String subject;
    private String grade;

    private Connection con;
    private DatabaseHandling dbh;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(String applicationId) {
        this.applicationId = applicationId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public Connection getCon() {
        return con;
    }

    public ALSubjectResult() throws SQLException {
        dbh = new DatabaseHandling();
        con = dbh.DataConnection();
    }
    
        public ALSubjectResult(int id) throws SQLException {
        this();
        this.id = id;

        this.read();
    }

    public ArrayList<ArrayList<String>> getSubjectList() {
        ArrayList<ArrayList<String>> sublist = new ArrayList<ArrayList<String>>();
        try {
            String SQLQuery = "select * from ba_application_result where applicationId='" + this.applicationId + "'";

            ResultSet rs = dbh.DataReadArg(con, SQLQuery);

            while (rs.next()) {
                ArrayList<String> tmp = new ArrayList<String>();

                tmp.add(rs.getString("subject"));
                tmp.add(rs.getString("grade"));

                sublist.add(tmp);

            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }

        return sublist;
    }

    public void read() {
        try {
            String SQLQuery = "select * from ba_application_result where applicationId='" + this.applicationId + "'";

            ResultSet rs = dbh.DataReadArg(con, SQLQuery);

            while (rs.next()) {

                id = Integer.parseInt(rs.getString("id"));
                applicationId = rs.getString("applicationId");
                subject = rs.getString("subject");
                grade = rs.getString("grade");

            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void save() {
        if (id == 0) {
            
            String SQLQuery = "INSERT INTO ba_application_result (`applicationId`,`subject`, `grade`) VALUES (?,?,?)";

            System.out.println("SQLQuery " + SQLQuery);

            List ParametersDefined = Arrays.asList(applicationId, subject, grade);
            List<String> ParameterDataType = Arrays.asList("String", "String", "String");

            dbh.DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);

            id = dbh.getLastInsertId();
        } else {
            String SQLQuery = "UPDATE ba_application_result SET `subject` = ? ,`grade` = ? WHERE `id`=?";

            System.out.println("SQLQuery " + SQLQuery);

            List ParametersDefined = Arrays.asList( subject, grade, id);
            List<String> ParameterDataType = Arrays.asList("String", "String", "String");


            dbh.DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);
        }
    }
}