package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

public class ChangePassword extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String room_no = (String) session.getAttribute("room_no") ;
            String password = (String) session.getAttribute("password") ;
//            out.println(room_no+" and "+password) ;
            
            String pass = request.getParameter("old-password") ;
            String newPass = request.getParameter("new-password") ;
            String confPass = request.getParameter("conform-password") ;
            
            boolean canChange=false;
            
            String url = "jdbc:mysql://localhost:3306/aryans" ;
            String user = "root" ;
            String sqlPassword = "password" ;
            
            if(pass.equals(password)) {
                if(newPass.equals(confPass)) {
                    canChange=true;
                }
                else{
                    out.println("new password not match with conform password");
                }
            }
            else{
                out.println("password is incorrect");
            }
            
            if(canChange) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver") ;
                    
                    Connection con = DriverManager.getConnection(url,user,sqlPassword) ;
                    PreparedStatement st = con.prepareStatement("update rooms set password = ? where room_no = ?") ;
                    
                    st.setString(1, newPass);
                    st.setString(2, room_no);
                    st.executeUpdate();
                    password = newPass;
                    session.removeAttribute("password"); 
                    session.setAttribute("password", password);
                    out.println("password uploaded successfully"); 
                    
                } catch (ClassNotFoundException | SQLException e) {
                    out.println(e) ;
                }
            }
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
        processRequest(request, response);
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
