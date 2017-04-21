/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.CDCE.DAOs;

import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.Payment;
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
 * @author dinusha
 */
public class PaymentDAO {
    private Connection con;
    private DatabaseHandling dbh;
    
    public PaymentDAO () throws SQLException{
        dbh = new DatabaseHandling();
        con = dbh.DataConnection();
    }
    
    public void savePayment(Payment payment){
         String SQLQuery = "INSERT INTO payment_amounts (`payment_type`,`year`,`amount`,`added_date`) VALUES (?,?,?,NOW());";
        
        System.out.println("SQLQuery " + SQLQuery);
        
       
 
        List ParametersDefined = Arrays.asList(String.valueOf(payment.getPaymentType()), payment.getPaymentYear(), String.valueOf(payment.getPaymentAmount()));
        List<String> ParameterDataType = Arrays.asList("String", "String", "String");

        DatabaseHandling dbh = new DatabaseHandling();
        Connection con = dbh.DataConnection();
        dbh.DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);
    }
    
    public void updatePayment(Payment payment){
         String SQLQuery = "UPDATE payment_amounts SET `payment_type` = ?,`year` = ?,`amount` = ? WHERE id = ?;";
        
        System.out.println("SQLQuery " + SQLQuery);
        
       
 
        List ParametersDefined = Arrays.asList(String.valueOf(payment.getPaymentType()), payment.getPaymentYear(), String.valueOf(payment.getPaymentAmount()), payment.getId());
        List<String> ParameterDataType = Arrays.asList("String", "String", "String", "String");

        DatabaseHandling dbh = new DatabaseHandling();
        Connection con = dbh.DataConnection();
        dbh.DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);
    }
    
    public void deletePayment(String id){
         String SQLQuery = "DELETE FROM payment_amounts WHERE id = ?;";
        
        System.out.println("SQLQuery " + SQLQuery);
        
       
 
        List ParametersDefined = Arrays.asList(id);
        List<String> ParameterDataType = Arrays.asList("String");

        DatabaseHandling dbh = new DatabaseHandling();
        Connection con = dbh.DataConnection();
        dbh.DataAddUpdateDelete(con, SQLQuery, ParametersDefined, ParameterDataType);
    }
    
    public Payment getOnePayment(String id) throws SQLException{
        String SQLQuery = "SELECT * FROM payment_amounts WHERE id='"+id+"' ";

        //List<String> ParametersDefined = Arrays.asList(username);
        //List<String> ParameterDataType = Arrays.asList("String");

        ResultSet rs = dbh.DataReadArg(con, SQLQuery);

        Payment payment = null;
        
        while (rs.next()) {
            payment = new Payment();

            payment.setId(rs.getString("id"));
            payment.setPaymentType(Integer.parseInt(rs.getString("payment_type")));
            payment.setPaymentAmount(Double.parseDouble(rs.getString("amount")));
            payment.setPaymentYear(rs.getString("year"));
            payment.setAddedDate(rs.getString("added_date"));
        }

        con.close();
        return payment;
    }
    
    public List<Payment> getPaymentsList(){
        List<Payment> list = new ArrayList<Payment>();
        try {

            String sql = "SELECT * FROM payment_amounts";
            
            System.out.println(sql);
            ResultSet rs = dbh.DataReadArg(con, sql);

            while (rs.next()) {

                Payment payment = new Payment();
                payment.setId(rs.getString("id"));
                payment.setPaymentType(Integer.parseInt(rs.getString("payment_type")));
                payment.setPaymentAmount(Double.parseDouble(rs.getString("amount")));
                payment.setPaymentYear(rs.getString("year"));
                payment.setAddedDate(rs.getString("added_date"));
                
                list.add(payment);

            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
