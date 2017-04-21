package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.ApplicationSubject;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nuwan
 */
public class ApplicationSubjectDAO {
    
    private Connection con;
    private DatabaseHandling dbh;

    public ApplicationSubjectDAO() throws SQLException {
        dbh = new DatabaseHandling();
        con = dbh.DataConnection();
    }

    public ArrayList<ApplicationSubject> subjectList(int applicationId) throws SQLException {
        ArrayList<ApplicationSubject> subjectList = new ArrayList<ApplicationSubject>();
        
        ResultSet rs = dbh.DataReadArg(con, "SELECT `id`, `applicationId`, `subjectId`, `subcategory` FROM ba_application_subject WHERE `applicationId` = ?", Arrays.asList(Integer.toString(applicationId)), Arrays.asList("Integer"));

        try {
            while (rs.next()) {
                ApplicationSubject subject = new ApplicationSubject();
                subject.setId(rs.getInt("id"));
                subject.setApplicationId(rs.getInt("applicationId"));
                subject.setSubjectId(rs.getInt("subjectId"));
                subject.setSubcategory(rs.getString("subcategory"));

                subjectList.add(subject);
            }
            rs.close();
        } 
        catch (SQLException ex) {
//            Logger.getLogger(AttachmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        con.close();
        
        return subjectList;

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
