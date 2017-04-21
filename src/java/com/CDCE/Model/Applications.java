package com.CDCE.Model;

import com.CDCE.DataLayer.DatabaseHandling;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author nuwan
 */
public class Applications {

    private int id;
    private int userId;
    private String applicationNo;
    private String title;
    private String fullName;
    private String nameWithInitials;
    private String permanentAddress;
    private String postalAddress;
    private String telHome;
    private String telOffice;
    private String telMobile;
    private String email;
    private String district;
    private String province;
    private String postalCode;
    private String gender;
    private String civilStatus;
    private String dateOfBirth;
    private String nic;
    private String nationality;
    private int alYear;
    private String alIndex;
    private double alZScore;
    private String professionalQualifications;
    private String englishLiteracy;
    private String itLiteracy;
    private String employmentStatus;
    private String dateOfPayment;
    private String bankBranch;
    private String appliedDate;
    private int stFlag;
    private int iFlag;
    private int rFlag;

    Connection con;
    DatabaseHandling dbh;

    public Applications(int id) throws SQLException {
        this();
        dbh = new DatabaseHandling();
        con = dbh.DataConnection();
        this.id = id;

        this.read();
        con.close();
    }

    public void read() throws SQLException {
        try {
            String SQLQuery = "select * from ba_application where id='" + id + "'";

            ResultSet rs = dbh.DataReadArg(con, SQLQuery);

            while (rs.next()) {

                id = rs.getInt("id");
                userId = rs.getInt("userId");
                applicationNo = rs.getString("applicationNo");
                title = rs.getString("title");
                fullName = rs.getString("fullName");
                nameWithInitials = rs.getString("nameWithInitials");
                permanentAddress = rs.getString("permanentAddress");
                postalAddress = rs.getString("postalAddress");
                telHome = rs.getString("telHome");
                telOffice = rs.getString("telOffice");
                telMobile = rs.getString("telMobile");
                email = rs.getString("email");
                district = rs.getString("district");
                province = rs.getString("province");
                postalCode = rs.getString("postalCode");
                gender = rs.getString("gender");
                civilStatus = rs.getString("civilStatus");
                dateOfBirth = rs.getString("dateOfBirth");
                nic = rs.getString("nic");
                nationality = rs.getString("nationality");
                alYear = rs.getInt("alYear");
                alIndex = rs.getString("alIndex");
                alZScore = rs.getDouble("alZScore");
                professionalQualifications = rs.getString("professionalQualifications");
                englishLiteracy = rs.getString("englishLiteracy");
                itLiteracy = rs.getString("itLiteracy");
                employmentStatus = rs.getString("employmentStatus");
                dateOfPayment = rs.getString("dateOfPayment");
                bankBranch = rs.getString("bankBranch");
                appliedDate = rs.getString("appliedDate");

            }
            rs.close();
        } catch (SQLException ex) {
            //Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error " + ex);
        }
        con.close();
    }

    public Applications() throws SQLException {
        dbh = new DatabaseHandling();
        con = dbh.DataConnection();

        this.id = 0;
        con.close();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getApplicationNo() {
        return applicationNo;
    }

    public void setApplicationNo(String applicationNo) {
        this.applicationNo = applicationNo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getNameWithInitials() {
        return nameWithInitials;
    }

    public void setNameWithInitials(String nameWithInitials) {
        this.nameWithInitials = nameWithInitials;
    }

    public String getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(String permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    public String getPostalAddress() {
        return postalAddress;
    }

    public void setPostalAddress(String postalAddress) {
        this.postalAddress = postalAddress;
    }

    public String getTelHome() {
        return telHome;
    }

    public void setTelHome(String telHome) {
        this.telHome = telHome;
    }

    public String getTelOffice() {
        return telOffice;
    }

    public void setTelOffice(String telOffice) {
        this.telOffice = telOffice;
    }

    public String getTelMobile() {
        return telMobile;
    }

    public void setTelMobile(String telMobile) {
        this.telMobile = telMobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCivilStatus() {
        return civilStatus;
    }

    public void setCivilStatus(String civilStatus) {
        this.civilStatus = civilStatus;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public int getAlYear() {
        return alYear;
    }

    public void setAlYear(int alYear) {
        this.alYear = alYear;
    }

    public String getAlIndex() {
        return alIndex;
    }

    public void setAlIndex(String alIndex) {
        this.alIndex = alIndex;
    }

    public double getAlZScore() {
        return alZScore;
    }

    public void setAlZScore(double alZScore) {
        this.alZScore = alZScore;
    }

    public String getProfessionalQualifications() {
        return professionalQualifications;
    }

    public void setProfessionalQualifications(String professionalQualifications) {
        this.professionalQualifications = professionalQualifications;
    }

    public String getEnglishLiteracy() {
        return englishLiteracy;
    }

    public void setEnglishLiteracy(String englishLiteracy) {
        this.englishLiteracy = englishLiteracy;
    }

    public String getItLiteracy() {
        return itLiteracy;
    }

    public void setItLiteracy(String itLiteracy) {
        this.itLiteracy = itLiteracy;
    }

    public String getEmploymentStatus() {
        return employmentStatus;
    }

    public void setEmploymentStatus(String employmentStatus) {
        this.employmentStatus = employmentStatus;
    }

    public String getDateOfPayment() {
        return dateOfPayment;
    }

    public void setDateOfPayment(String dateOfPayment) {
        this.dateOfPayment = dateOfPayment;
    }

    public String getBankBranch() {
        return bankBranch;
    }

    public void setBankBranch(String branchBranch) {
        this.bankBranch = branchBranch;
    }

    public String getAppliedDate() {
        return appliedDate;
    }

    public void setAppliedDate(String appliedDate) {
        this.appliedDate = appliedDate;
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

    public int getStFlag() {
        return stFlag;
    }

    public void setStFlag(int stFlag) {
        this.stFlag = stFlag;
    }
    public int getiFlag() {
        return iFlag;
    }

    public void setiFlag(int iFlag) {
        this.iFlag = iFlag;
    }
    
    public int getrFlag() {
        return rFlag;
    }

    public void setrFlag(int rFlag) {
        this.rFlag = rFlag;
    }

}
