package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.ApplicationAttachment;
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
public class ApplicationAttachmentDAO {
    
    private final DatabaseHandling databaseHandling;
    private Connection connection;

    public ApplicationAttachmentDAO() throws SQLException {

        databaseHandling = new DatabaseHandling();
        connection = databaseHandling.DataConnection();

    }
    
    public ArrayList<ApplicationAttachment> getAttachmentList(int id) {
 
        ArrayList<ApplicationAttachment> resultList = new ArrayList<ApplicationAttachment>();

        ResultSet resultSet = databaseHandling.DataReadArg(connection, "SELECT `id`, `applicationId`, `attachmentId` FROM ba_application_attachment WHERE `applicationId` = ?", Arrays.asList(Integer.toString(id)), Arrays.asList("Integer"));

        try {

            while (resultSet.next()) {
                ApplicationAttachment result = new ApplicationAttachment();
                result.setId(resultSet.getInt("id"));
                result.setApplicationId(resultSet.getInt("applicationId"));
                result.setAttachmentId(resultSet.getInt("attachmentId"));
                
                resultList.add(result);
            }

            resultSet.close();

        } catch (SQLException ex) {
            Logger.getLogger(SubjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return resultList;
    }
    
}
