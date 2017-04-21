/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.CDCE.DAOs;

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
 * @author Udaya
 */
public class FormDAO {
    
    public boolean InsertCancerSurveillanceForm() throws SQLException
    {
        String SQLQuery = "INSERT INTO patient_details_table (`clinic_file_no`,`hospital`,`consultant`,`date_of_registration`,`surname`,`other_names`,`date_of_birth`,`age`,`sex`,`nic`,`permanant_address`,`contact_address`,`district`,`ds_division`,`gn_division`,`telephone_no`,`mobile_no`,`occupation`,`religion`,`ethnic_group`,`marital_status`,`referred_from`,`user`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        
        System.out.println("SQLQuery " + SQLQuery);
        
       // System.out.println(patient.getClinicFileNo()+patient.getHospital()+patient.getConsultant()+patient.getDateOfRegistration()+patient.getSurname()+patient.getOtherNames()+patient.getDob()+patient.getAge()+Integer.parseInt(patient.getSex())+patient.getNic()+patient.getPermanantAddr()+patient.getContactAddr()+patient.getDistrict()+patient.getDsDivision()+patient.getGnDivision()+patient.getTelephoneNo()+patient.getMobileNo()+patient.getOccupation()+ patient.getReligion()+ patient.getEthnicGroup()+ patient.getMaritalStatus()+patient.getFamilyMember()+ patient.getReferredFrom());
 
      //  List ParametersDefined = Arrays.asList(patient.getClinicFileNo(),patient.getHospital(),patient.getConsultant(),patient.getDateOfRegistration(),patient.getSurname(),patient.getOtherNames(),patient.getDob(),patient.getAge(),patient.getSex(),patient.getNic(),patient.getPermanantAddr(),patient.getContactAddr(),patient.getDistrict(),patient.getDsDivision(),patient.getGnDivision(),patient.getTelephoneNo(),patient.getMobileNo(),patient.getOccupation(), patient.getReligion(), patient.getEthnicGroup(), patient.getMaritalStatus(), patient.getReferredFrom(), patient.getUser());
        List<String> ParameterDataType = Arrays.asList("String", "Integer", "String", "String", "String", "String", "String", "Integer", "String", "String", "String", "String", "Integer", "Integer", "Integer", "String", "String", "String", "Integer", "Integer", "Integer","Integer", "Integer");

        DatabaseHandling dbh = new DatabaseHandling();
        Connection con = dbh.DataConnection();
  //      dbh.DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);
        
        return true;
    }
    
    
    
}
