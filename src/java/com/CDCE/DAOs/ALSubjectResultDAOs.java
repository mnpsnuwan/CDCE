package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.ALSubjectResult;
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
public class ALSubjectResultDAOs {
    
    private Connection con;
    private DatabaseHandling dbh;

    public ALSubjectResultDAOs() throws SQLException {
        dbh = new DatabaseHandling();
        con = dbh.DataConnection();
    }

    public ArrayList<ALSubjectResult> alSubjectList(int applicationId) throws SQLException {
        ArrayList<ALSubjectResult> alSubjectList = new ArrayList<ALSubjectResult>();

        try {

            dbh = new DatabaseHandling();
            con = dbh.DataConnection();

            String SQLQuery = "select * from ba_application_result where applicationId='" + applicationId + "'";

            ResultSet rs = dbh.DataReadArg(con, SQLQuery);

            while (rs.next()) {
                ALSubjectResult alResult = new ALSubjectResult();
                alResult.setId(rs.getInt("id"));
                alResult.setSubject(rs.getString("subjects"));
                alResult.setGrade(rs.getString("grade"));

                alSubjectList.add(alResult);
            }
            rs.close();
        } 
        catch (SQLException ex) {
//            Logger.getLogger(AttachmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        con.close();
        
        return alSubjectList;

    }
    
    
    public void ApplicationResultsUpdate(ALSubjectResult alsubject)
            throws SQLException {
        DatabaseHandling dbh = new DatabaseHandling();
        Connection con;

        String Query = "UPDATE ba_application_result SET subjects= ?, grade= ? WHERE id= ?";
        
        System.out.println(Query);
        
        String subject = alsubject.getSubject();
        String grade = alsubject.getGrade();
        
        int nid = alsubject.getId();
        String id = Integer.toString(nid);
       
 
        List<String> ParametersDefined
                = Arrays.asList(subject, grade, id);
        List<String> ParameterDataType
                = Arrays.asList("String", "String", "String");
        System.out.println(ParametersDefined);
        
        con = dbh.DataConnection();

        dbh.DataAddUpdateDelete(con, Query, ParametersDefined, ParameterDataType);

    }
    
    
    public void close() {

        if (con != null) {
            try {
                con.close();
                con = null;
            } catch (SQLException ex) {
                Logger.getLogger(ALSubjectResultDAOs.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
    
}
