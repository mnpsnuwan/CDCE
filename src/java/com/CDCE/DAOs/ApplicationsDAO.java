package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.ALSubjectResult;
import com.CDCE.Model.Applications;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class ApplicationsDAO {

    private Connection con;
    private DatabaseHandling dbh;

    public ArrayList<Applications> getApplicationDetails(int id) throws SQLException {
        ArrayList<Applications> applicationDetailsList = new ArrayList<Applications>();
        try {
            dbh = new DatabaseHandling();
            con = dbh.DataConnection();

            String SQLQuery = "select * from ba_application where id='" + id + "'";

            ResultSet rs = dbh.DataReadArg(con, SQLQuery);

            while (rs.next()) {
                Applications applicationDetails = new Applications();
                applicationDetails.setId(rs.getInt("id"));
                applicationDetails.setUserId(rs.getInt("userId"));
                applicationDetails.setApplicationNo(rs.getString("applicationNo"));
                applicationDetails.setTitle(rs.getString("title"));
                applicationDetails.setNameWithInitials(rs.getString("nameWithInitials"));
                applicationDetails.setPermanentAddress(rs.getString("permanentAddress"));
                applicationDetails.setPostalAddress(rs.getString("postalAddress"));
                applicationDetails.setTelHome(rs.getString("telHome"));
                applicationDetails.setTelOffice(rs.getString("telOffice"));
                applicationDetails.setTelMobile(rs.getString("telMobile"));
                applicationDetails.setEmail(rs.getString("email"));
                applicationDetails.setDistrict(rs.getString("district"));
                applicationDetails.setProvince(rs.getString("province"));
                applicationDetails.setPostalCode(rs.getString("postalCode"));
                applicationDetails.setGender(rs.getString("gender"));
                applicationDetails.setCivilStatus(rs.getString("civilStatus"));
                applicationDetails.setDateOfBirth(rs.getString("dateOfBirth"));
                applicationDetails.setNic(rs.getString("nic"));
                applicationDetails.setNationality(rs.getString("nationality"));
                applicationDetails.setAlYear(rs.getInt("alYear"));
                applicationDetails.setAlIndex(rs.getString("alIndex"));
                applicationDetails.setAlZScore(rs.getDouble("alZScore"));
                applicationDetails.setProfessionalQualifications(rs.getString("professionalQualifications"));
                applicationDetails.setEnglishLiteracy(rs.getString("englishLiteracy"));
                applicationDetails.setItLiteracy(rs.getString("itLiteracy"));
                applicationDetails.setEmploymentStatus(rs.getString("employmentStatus"));
                applicationDetails.setDateOfPayment(rs.getString("dateOfPayment"));
                applicationDetails.setBankBranch(rs.getString("bankBranch"));
                applicationDetails.setAppliedDate(rs.getString("appliedDate"));
                applicationDetails.setStFlag(rs.getInt("stFlag"));
                applicationDetails.setiFlag(rs.getInt("iFlag"));
                applicationDetails.setrFlag(rs.getInt("rFlag"));

                applicationDetailsList.add(applicationDetails);
            }
            rs.close();
        } catch (SQLException ex) {
            //Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            //System.out.println("");
        }
        con.close();

        return applicationDetailsList;

    }

    public ArrayList<Applications> getApplicationDetailsForTables() throws SQLException {

        ArrayList<Applications> applicationDetailsList = new ArrayList<Applications>();
        try {
            DatabaseHandling dbh = new DatabaseHandling();
            con = dbh.DataConnection();

            String SQLQuery = "select * from ba_application limit 0,200;"; //I had a mistake in this line, now ok

//            String SQLQuery = "select * from ba_application;";
            
            ResultSet rs = dbh.DataReadArg(con, SQLQuery);

            while (rs.next()) {
                Applications applicationDetails = new Applications();
                applicationDetails.setId(rs.getInt("id"));
                applicationDetails.setTitle(rs.getString("title"));
                applicationDetails.setFullName(rs.getString("fullName"));
                applicationDetails.setNameWithInitials(rs.getString("nameWithInitials"));
                applicationDetails.setPermanentAddress(rs.getString("permanentAddress"));
                applicationDetails.setPostalAddress(rs.getString("postalAddress"));
                applicationDetails.setTelHome(rs.getString("telHome"));
                applicationDetails.setTelOffice(rs.getString("telOffice"));
                applicationDetails.setTelMobile(rs.getString("telMobile"));
                applicationDetails.setDistrict(rs.getString("district"));
                applicationDetails.setProvince(rs.getString("province"));
                applicationDetails.setPostalCode(rs.getString("postalCode"));
                applicationDetails.setEmail(rs.getString("email"));
                applicationDetails.setGender(rs.getString("gender"));
                applicationDetails.setDateOfBirth(rs.getString("dateOfBirth"));
                applicationDetails.setNationality(rs.getString("nationality"));
                applicationDetails.setNic(rs.getString("nic"));
                applicationDetails.setAlYear(rs.getInt("alYear"));
                applicationDetails.setAlIndex(rs.getString("alIndex"));
                applicationDetails.setAlZScore(rs.getDouble("alZScore"));
                applicationDetails.setEnglishLiteracy(rs.getString("englishLiteracy"));
                applicationDetails.setItLiteracy(rs.getString("itLiteracy"));
                applicationDetails.setDateOfPayment(rs.getString("dateOfPayment"));
                applicationDetails.setBankBranch(rs.getString("bankBranch"));
                applicationDetails.setStFlag(rs.getInt("stFlag"));
                applicationDetails.setiFlag(rs.getInt("iFlag"));
                applicationDetails.setrFlag(rs.getInt("rFlag"));

                applicationDetailsList.add(applicationDetails);

            }
            rs.close();
        } catch (SQLException ex) {
            //Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error " + ex);
        }
        con.close();
        return applicationDetailsList;

    }

    public void close() {

        if (con != null) {
            try {
                con.close();
                con = null;
            } catch (SQLException ex) {
                Logger.getLogger(ApplicationsDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    //-----Update database for application accept records started-----
    public boolean acceptApplicationDetailsForSelectionTest(int id)
            throws SQLException {
        try {
            DatabaseHandling dbh = new DatabaseHandling();
            Connection con = dbh.DataConnection();

            //String SQLQuery = "UPDATE ba_application SET stFlag='1' WHERE id='" + id + "'"; //I had a mistake in this line, now ok
            PreparedStatement ps = con.prepareStatement("UPDATE ba_application SET stFlag='1' WHERE id=?");

            ps.setInt(1, id);

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            //Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error " + ex);
            throw ex;
        }
        return true;

    }
    //-----accepted records end------

    //-----Update database for selection test reject records started-----
    public boolean rejectApplicationDetailsFromApplicationList(int id)
            throws SQLException {
        try {
            DatabaseHandling dbh = new DatabaseHandling();
            Connection con = dbh.DataConnection();

            PreparedStatement ps = con.prepareStatement("UPDATE ba_application SET stFlag='-1' WHERE id=?");

            ps.setInt(1, id);

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            //Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error " + ex);
            throw ex;
        }
        return true;
    }
    //-----rejected records end------

    //-----Update database for interviews accept records started-----
    public boolean acceptApplicationDetailsForInterviews(int id)
            throws SQLException {
        try {
            DatabaseHandling dbh = new DatabaseHandling();
            Connection con = dbh.DataConnection();

            //String SQLQuery = "UPDATE ba_application SET stFlag='1' WHERE id='" + id + "'"; //I had a mistake in this line, now ok
            PreparedStatement ps = con.prepareStatement("UPDATE ba_application SET iFlag='1' WHERE id=?");

            ps.setInt(1, id);

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            //Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error " + ex);
            throw ex;
        }
        return true;
    }
    //-----accepted records end------

    //-----Update database for interviews reject records started-----
    public boolean rejectApplicationDetailsFromSelectionTest(int id)
            throws SQLException {
        try {
            DatabaseHandling dbh = new DatabaseHandling();
            Connection con = dbh.DataConnection();

            PreparedStatement ps = con.prepareStatement("UPDATE ba_application SET iFlag='-1' WHERE id=?");

            ps.setInt(1, id);

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            //Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error " + ex);
            throw ex;
        }
        return true;
    }
    //-----rejected records end------

    //-----Update database for registration accept records started-----
    public boolean acceptApplicationDetailsForRegistration(int id)
            throws SQLException {
        try {
            DatabaseHandling dbh = new DatabaseHandling();
            Connection con = dbh.DataConnection();

            //String SQLQuery = "UPDATE ba_application SET stFlag='1' WHERE id='" + id + "'";
            PreparedStatement ps = con.prepareStatement("UPDATE ba_application SET rFlag='1' WHERE id=?");

            ps.setInt(1, id);

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            //Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error " + ex);
            throw ex;
        }
        return true;
    }
    //-----accepted records end------

    //-----Update database for registration reject records started-----
    public boolean rejectApplicationDetailsFromInterviews(int id)
            throws SQLException {
        try {
            DatabaseHandling dbh = new DatabaseHandling();
            Connection con = dbh.DataConnection();

            PreparedStatement ps = con.prepareStatement("UPDATE ba_application SET rFlag='-1' WHERE id=?");

            ps.setInt(1, id);

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            //Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error " + ex);
            throw ex;
        }
        return true;
    }
    //-----rejected records end------

    public void ApplicationDetailsUpdate(Applications application)
            throws SQLException {
        DatabaseHandling dbh = new DatabaseHandling();
        Connection con;

        //Complete that update code
        String Query = "UPDATE ba_application SET title= ?, fullName= ?,nameWithInitials= ?, "
                + "permanentAddress= ?, postalAddress= ?, telHome= ?, telOffice= ?, telMobile= ?, email= ?, district= ?, "
                + "province= ?, postalCode= ?, gender= ?, civilStatus= ?, dateOfBirth= ?, nic= ?, nationality= ?, "
                + "alYear= ?, alIndex= ?, alZScore= ?, professionalQualifications= ?, englishLiteracy= ?, itLiteracy= ?, "
                + "employmentStatus= ?, dateOfPayment= ?, bankBranch= ?, appliedDate= ? WHERE id= ?;";

        String title = application.getTitle();
        String fullName = application.getFullName();
        String nameWithInitials = application.getNameWithInitials();
        String permanentAddress = application.getPermanentAddress();
        String postalAddress = application.getPostalAddress();
        String telHome = application.getTelHome();
        String telOffice = application.getTelOffice();
        String telMobile = application.getTelMobile();
        String email = application.getEmail();
        String district = application.getDistrict();
        String province = application.getProvince();
        String postalCode = application.getPostalCode();
        String gender = application.getGender();
        String civilStatus = application.getCivilStatus();
        String dateOfBirth = application.getDateOfBirth();
        String nic = application.getNic();
        String nationality = application.getNationality();

        int nalYear = application.getAlYear();
        String alYear = Integer.toString(nalYear);

        String alIndex = application.getAlIndex();

        double nalZScore = application.getAlZScore();
        String alZScore = Double.toString(nalZScore);

        String professionalQualifications = application.getProfessionalQualifications();
        String englishLiteracy = application.getEnglishLiteracy();
        String itLiteracy = application.getItLiteracy();
        String employmentStatus = application.getEmploymentStatus();
        String dateOfPayment = application.getDateOfPayment();
        String bankBranch = application.getBankBranch();
        String appliedDate = application.getAppliedDate();

        int nid = application.getId();
        String id = Integer.toString(nid);

//        int nstFlag = application.getId();
//        String stFlag = Integer.toString(nstFlag);
//        
//        int niFlag = application.getId();
//        String iFlag = Integer.toString(niFlag);
//        
//        int nrFlag = application.getId();
//        String rFlag = Integer.toString(nrFlag);
        List<String> ParametersDefined
                = Arrays.asList(title, fullName, nameWithInitials, permanentAddress, postalAddress, telHome, telOffice, telMobile, email,
                        district, province, postalCode, gender, civilStatus, dateOfBirth, nic, nationality, alYear, alIndex, alZScore,
                        professionalQualifications, englishLiteracy, itLiteracy, employmentStatus, dateOfPayment, bankBranch, appliedDate, id);
        List<String> ParameterDataType
                = Arrays.asList("String", "String", "String", "String", "String", "String", "String", "String", "String", "String", "String",
                        "String", "String", "String", "String", "String", "String", "String", "String", "String", "String", "String", "String",
                        "String", "String", "String", "String", "String");
        con = dbh.DataConnection();

        dbh.DataAddUpdateDelete(con, Query, ParametersDefined, ParameterDataType);

    }

}
