package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
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
public class SubjectsDAO {

    private final DatabaseHandling databaseHandling;
    private Connection connection;

    public SubjectsDAO() throws SQLException {

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

    public ArrayList<Subject> listSubjects100_0() {

        ArrayList<Subject> results = new ArrayList<Subject>();

        ResultSet resultSet = databaseHandling.DataReadArg(connection, "SELECT `id`, `code`, `name` FROM subjects_100_0 ORDER BY `id`");

        try {

            while (resultSet.next()) {
                Subject subject = new Subject();
                subject.setId(resultSet.getInt("id"));
                subject.setCode(resultSet.getString("code"));
                subject.setName(resultSet.getString("name"));
                results.add(subject);
            }

            resultSet.close();

        } catch (SQLException ex) {
            Logger.getLogger(SubjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return results;

    }

    public ArrayList<Subject> listSubjects100_1() {

        ArrayList<Subject> results = new ArrayList<Subject>();

        ResultSet resultSet = databaseHandling.DataReadArg(connection, "SELECT `id`, `code`, `name` FROM subjects_100_1 ORDER BY `id`");

        try {

            while (resultSet.next()) {
                Subject subject = new Subject();
                subject.setId(resultSet.getInt("id"));
                subject.setCode(resultSet.getString("code"));
                subject.setName(resultSet.getString("name"));
                results.add(subject);
            }

            resultSet.close();

        } catch (SQLException ex) {
            Logger.getLogger(SubjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return results;

    }

    public ArrayList<Subject> listSubjects100_2() {

        ArrayList<Subject> results = new ArrayList<Subject>();

        ResultSet resultSet = databaseHandling.DataReadArg(connection, "SELECT `id`, `code`, `name` FROM subjects_100_2 ORDER BY `id`");

        try {

            while (resultSet.next()) {
                Subject subject = new Subject();
                subject.setId(resultSet.getInt("id"));
                subject.setCode(resultSet.getString("code"));
                subject.setName(resultSet.getString("name"));
                results.add(subject);
            }

            resultSet.close();

        } catch (SQLException ex) {
            Logger.getLogger(SubjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return results;

    }

    public Subject getSubjects100_0(int id) {

        Subject result = null;

        ResultSet resultSet = databaseHandling.DataReadArg(connection, "SELECT `id`, `code`, `name` FROM subjects_100_0 WHERE `id` = ?", Arrays.asList(Integer.toString(id)), Arrays.asList("Integer"));

        try {

            if (resultSet.next()) {
                result = new Subject();
                result.setId(resultSet.getInt("id"));
                result.setCode(resultSet.getString("code"));
                result.setName(resultSet.getString("name"));
            }

            resultSet.close();

        } catch (SQLException ex) {
            Logger.getLogger(SubjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    public Subject getSubjects100_1(int id) {

        Subject result = null;

        ResultSet resultSet = databaseHandling.DataReadArg(connection, "SELECT `id`, `code`, `name` FROM subjects_100_1 WHERE `id` = ?", Arrays.asList(Integer.toString(id)), Arrays.asList("Integer"));

        try {

            if (resultSet.next()) {
                result = new Subject();
                result.setId(resultSet.getInt("id"));
                result.setCode(resultSet.getString("code"));
                result.setName(resultSet.getString("name"));
            }

            resultSet.close();

        } catch (SQLException ex) {
            Logger.getLogger(SubjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    public Subject getSubjects100_2(int id) {

        Subject result = null;

        ResultSet resultSet = databaseHandling.DataReadArg(connection, "SELECT `id`, `code`, `name` FROM subjects_100_2 WHERE `id` = ?", Arrays.asList(Integer.toString(id)), Arrays.asList("Integer"));

        try {

            if (resultSet.next()) {
                result = new Subject();
                result.setId(resultSet.getInt("id"));
                result.setCode(resultSet.getString("code"));
                result.setName(resultSet.getString("name"));
            }

            resultSet.close();

        } catch (SQLException ex) {
            Logger.getLogger(SubjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }
    
        public Subject getSubjects(int id) {

        Subject result = null;

        ResultSet resultSet = databaseHandling.DataReadArg(connection, "SELECT `id`, `code`, `name`, `category`, `medium` FROM subjects WHERE `id` = ?", Arrays.asList(Integer.toString(id)), Arrays.asList("Integer"));

//        ResultSet resultSet = databaseHandling.DataReadArg(connection, "SELECT `id`, `code`, `name`, `category` FROM subjects");
        try {

            if (resultSet.next()) {
                result = new Subject();
                result.setId(resultSet.getInt("id"));
                result.setCode(resultSet.getString("code"));
                result.setName(resultSet.getString("name"));
                result.setCategory(resultSet.getString("category"));
                result.setMedium(resultSet.getString("medium"));
            }

            resultSet.close();

        } catch (SQLException ex) {
            Logger.getLogger(SubjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

}
