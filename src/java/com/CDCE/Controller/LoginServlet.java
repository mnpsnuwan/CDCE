package com.CDCE.Controller;

import com.CDCE.DAOs.UserDAO;
import com.CDCE.Model.SystemUser;
import com.CDCE.Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nuwan
 */
public class LoginServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /*try {
            
         String username; //username and Password
         String password;

         username = request.getParameter("inputUsername");
         password = request.getParameter("inputPassword");
            
           
         HttpSession session = request.getSession(true);
  
         SystemUser user = new SystemUser();
             
         //validation failed <<<not validated completely...
             
         user.setUserName(username); 
         user.setPassword(password);
             
         //             if(session != null){
         //                     session.invalidate();
         //             }
             
         try {
                 
         if( user.authenticate(username,password)== true)
         {
         //session.setAttribute("UserName",username); //Passing of User 
         //Name and User Role   
         //session.setAttribute("UserRole",user.getUserRoleId());
         //System.out.println(session.getAttribute("UserRole"));
         request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);  
                  
         } else {
                  
         request.getRequestDispatcher("login.jsp").forward(request, response);
                  
         }
         //                 if(username == null || password == null) {
         //                  
         //                  request.getRequestDispatcher("login.jsp").forward(request, response);
         //                  
         //              }
         //              else
         //              {
         //                  
         //                  
         //                  
         //                  session.setAttribute("UserName",username); //Passing of User
         //                  session.setAttribute("UserId",user.getId()); //Passing of User
         //                  //Name and User Role   
         //                  session.setAttribute("UserRole",user.getUserRole());
         //                  session.setAttribute("FullName",user.getFullName());
         //                  System.out.println(user.getId());
         //                  System.out.println(user.getFullName());
         //                  //request.getRequestDispatcher("ba_registration_form.jsp?action=insert").forward(request, response);
         //                  request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
         //                 
         // 
         //              }  
         } catch (Exception e) {
                 
                 
         }
             
         } finally {            
         out.close();
         }*/

        try {

            /*
             * TODO output your page here. You may use following sample code.
             */
            String username; //username and Password
            String password;

            username = request.getParameter("inputUsername");
            password = request.getParameter("inputPassword");

            HttpSession session = request.getSession(true);

            User user = new User();
            //UserDAO userDao = new UserDAO();

            user.setUsername(username);
            user.setPassword(password);

            try {

                if (user.authenticate(username, password) == true) {
                    UserDAO userDao = new UserDAO();
                    user = userDao.get(username, password);
                    if (user == null) {
                        return;
                    }
                    session.setAttribute("UserName", username); //Passing of UserName and User Role   
                    session.setAttribute("Designation", user.getDesignation());
                    if (user.getDesignation().equals("1")) {
                        request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
                    } else if (user.getDesignation().equals("2")) {
                        request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
                    } else if (user.getDesignation().equals("3")) {
                        request.getRequestDispatcher("sar_dashboard.jsp").forward(request, response);
                    } else if (user.getDesignation().equals("4")) {
                        request.getRequestDispatcher("coursecoor_dashboard.jsp").forward(request, response);
                    } else if (user.getDesignation().equals("5")) {
                        request.getRequestDispatcher("student_dashboard.jsp").forward(request, response);
                    } else if (user.getDesignation().equals("8")) {
                        request.getRequestDispatcher("shroff_dashboard.jsp").forward(request, response);
                    } else if (user.getDesignation().equals("9")) {
                        request.getRequestDispatcher("sysadmin_dashboard.jsp").forward(request, response);
                    }
                } else {
                    //System.out.println("Please check your credentials.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);

                }
            } catch (Exception e) {

            }

        } finally {
            out.close();
        }

    
//        try {
//
//            String username; //username and Password
//        String password;
//
//        username = request.getParameter("inputUsername");
//        password = request.getParameter("inputPassword");
//
//        HttpSession session = request.getSession(true);
//
//        User user = new User();
//        //UserDAO userDao = new UserDAO();
//
//        user.setUsername(username);
//        user.setPassword(password);
//
//        try {
//            if (username == null || password == null) {
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//            } else {
//
//                if (user.authenticate(username, password) == true) {
//                    System.out.println(username);
//                    System.out.println(password);
//                    UserDAO userDao = new UserDAO();
//                    user = userDao.get(username, password);
//                    if (user == null) {
//                        return;
//                    }
////                        request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
//                    session.setAttribute("username", username); //Passing of UserName and User Role   
//                    session.setAttribute("Designation", user.getDesignation());
//
//                    if (user.getDesignation().equals("1")) {
//                        request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
//                    } else if (user.getDesignation().equals("2")) {
//                        request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
//                    } else if (user.getDesignation().equals("3")) {
//                        request.getRequestDispatcher("sar_dashboard.jsp").forward(request, response);
//                    } else if (user.getDesignation().equals("4")) {
//                        request.getRequestDispatcher("coursecoor_dashboard.jsp").forward(request, response);
//                    } else if (user.getDesignation().equals("8")) {
//                        request.getRequestDispatcher("shroff_dashboard.jsp").forward(request, response);
//                    } else if (user.getDesignation().equals("9")) {
//                        request.getRequestDispatcher("sysadmin_dashboard.jsp").forward(request, response);
//                    }
//                }
//            }
//        } catch (Exception e) {
//
//        }
//
//    }
//
//    
//        finally {
//            out.close();
//    }

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
//        try {
//            processRequest(request, response);
//        } catch (SQLException ex) {
//            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
