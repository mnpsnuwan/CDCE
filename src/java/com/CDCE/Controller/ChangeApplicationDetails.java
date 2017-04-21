package com.CDCE.Controller;

import com.CDCE.DAOs.ALSubjectResultDAOs;
import com.CDCE.DAOs.ApplicationsDAO;
import com.CDCE.DataLayer.DatabaseHandling;
import com.CDCE.Model.ALSubjectResult;
import com.CDCE.Model.Applications;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nuwan
 */
public class ChangeApplicationDetails extends HttpServlet {

    private Connection con;
    private DatabaseHandling dbh;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeApplicationDetails</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeApplicationDetails at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
//        processRequest(request, response);

            dbh = new DatabaseHandling();
            con = dbh.DataConnection();

            String title = request.getParameter("title");
            String fullName = request.getParameter("fullName");
            String nameWithInitials = request.getParameter("nameWithInitials");
            String permanentAddress = request.getParameter("permanentAddress");
            String postalAddress = request.getParameter("postalAddress");
            String telHome = request.getParameter("telHome");
            String telOffice = request.getParameter("telOffice");
            String telMobile = request.getParameter("telMobile");
            String email = request.getParameter("email");
            String district = request.getParameter("district");
            String province = request.getParameter("province");
            String postalCode = request.getParameter("postalCode");
            String gender = request.getParameter("gender");
            String civilStatus = request.getParameter("civilStatus");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String nic = request.getParameter("nic");
            String nationality = request.getParameter("nationality");

            String nalYear = request.getParameter("alYear");
            int alYear = Integer.parseInt(nalYear);

            String alIndex = request.getParameter("alIndex");
            
            String alSubject = request.getParameter("alSubject");
            String alGrade = request.getParameter("alGrade");
            String alid = request.getParameter("alreid");
            int alreid = Integer.parseInt(alid);

            String nalZScore = request.getParameter("alZScore");
            double alZScore = Double.parseDouble(nalZScore);

            String professionalQualifications = request.getParameter("professionalQualifications");
            String englishLiteracy = request.getParameter("englishLiteracy");
            String itLiteracy = request.getParameter("itLiteracy");
            String employmentStatus = request.getParameter("employmentStatus");
            String dateOfPayment = request.getParameter("dateOfPayment");
            String bankBranch = request.getParameter("bankBranch");
            String appliedDate = request.getParameter("appliedDate");

            String nid = request.getParameter("id");
            int id = Integer.parseInt(nid);

//        String nstFlag = request.getParameter("stFlag");
//        int stFlag = Integer.parseInt(nstFlag);
//        
//        String niFlag = request.getParameter("iFlag");
//        int iFlag = Integer.parseInt(niFlag);
//        
//        String nrFlag = request.getParameter("rFlag");
//        int rFlag = Integer.parseInt(nrFlag);
            Applications application = new Applications();
            ALSubjectResult alsub = new ALSubjectResult();

            application.setTitle(title);
            application.setFullName(fullName);
            application.setNameWithInitials(nameWithInitials);
            application.setPermanentAddress(permanentAddress);
            application.setPostalAddress(postalAddress);
            application.setTelHome(telHome);
            application.setTelOffice(telOffice);
            application.setTelMobile(telMobile);
            application.setEmail(email);
            application.setDistrict(district);
            application.setProvince(province);
            application.setPostalCode(postalCode);
            application.setGender(gender);
            application.setCivilStatus(civilStatus);
            application.setDateOfBirth(dateOfBirth);
            application.setNic(nic);
            application.setNationality(nationality);
            application.setAlYear(alYear);
            application.setAlIndex(alIndex);
            
            alsub.setSubject(alSubject);
            alsub.setGrade(alGrade);
            alsub.setId(alreid);
           
            application.setAlZScore(alZScore);
            application.setProfessionalQualifications(professionalQualifications);
            application.setEnglishLiteracy(englishLiteracy);
            application.setItLiteracy(itLiteracy);
            application.setEmploymentStatus(employmentStatus);
            application.setDateOfPayment(dateOfPayment);
            application.setBankBranch(bankBranch);
            application.setAppliedDate(appliedDate);
            application.setId(id);
//        application.setStFlag(stFlag);
//        application.setiFlag(iFlag);
//        application.setrFlag(rFlag);

            ApplicationsDAO appdoa = new ApplicationsDAO();
            ALSubjectResultDAOs alsubdao = new ALSubjectResultDAOs();
            
            try {

                appdoa.ApplicationDetailsUpdate(application);
                alsubdao.ApplicationResultsUpdate(alsub);
                request.getRequestDispatcher("application_view.jsp?action=edit&id=" + id).forward(request, response);

//            if(stFlag == 0 && iFlag == 0 && rFlag == 0){
//                request.getRequestDispatcher("application_view.jsp?action=edit&id=" + id).forward(request, response);
//            }
//            else if(stFlag == 1 && iFlag == 0 && rFlag == 0){
//                request.getRequestDispatcher("selection_test_view.jsp?action=edit&id=" + id).forward(request, response);
//            }
//            else if(stFlag == 1 && iFlag == 1 && rFlag == 0){
//                request.getRequestDispatcher("interview_view.jsp?action=edit&id=" + id).forward(request, response);
//            }
//            else if(stFlag == 1 && iFlag == 1 && rFlag == 1){
//                request.getRequestDispatcher("registration_view.jsp?action=edit&id=" + id).forward(request, response);
//            }
            } catch (SQLException ex) {
                Logger.getLogger(ChangeApplicationDetails.class.getName()).log(Level.SEVERE, null, ex);
            }

            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ChangeApplicationDetails.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
