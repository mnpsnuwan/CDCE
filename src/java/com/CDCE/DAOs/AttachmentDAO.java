
package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.Attachment;
import com.CDCE.Model.Subject;
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
public class AttachmentDAO {
    
    private final DatabaseHandling databaseHandling;
    private Connection connection;

    public AttachmentDAO() throws SQLException {

        databaseHandling = new DatabaseHandling();
        connection = databaseHandling.DataConnection();

    }

    public void close() {

        if (connection != null) {
            try {
                connection.close();
                connection = null;
            } catch (SQLException ex) {
                Logger.getLogger(SubjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public ArrayList<Attachment> listAttachment() {

        ArrayList<Attachment> results = new ArrayList<Attachment>();

        ResultSet resultSet = databaseHandling.DataReadArg(connection, "SELECT `id`, `attachmentName` FROM attachment");

        try {

            while (resultSet.next()) {
                Attachment attachment = new Attachment();
                attachment.setId(resultSet.getInt("id"));
                attachment.setAttachmentName(resultSet.getString("attachmentName"));
                results.add(attachment);
            }

            resultSet.close();

        } catch (SQLException ex) {
            Logger.getLogger(SubjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return results;

    }
    
    public Attachment getAttachmentName(int id) {

        Attachment result = null;

        ResultSet resultSet = databaseHandling.DataReadArg(connection, "SELECT `attachmentName` FROM attachment WHERE `id` = ?", Arrays.asList(Integer.toString(id)), Arrays.asList("Integer"));

        try {

            if (resultSet.next()) {
                result = new Attachment();
                result.setAttachmentName(resultSet.getString("attachmentName"));
            }

            resultSet.close();

        } catch (SQLException ex) {
            Logger.getLogger(SubjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }
    
}
