package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class Due extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            boolean all = Boolean.parseBoolean(request.getParameter("is-all"));

            String roomNo = request.getParameter("room-no");
            int operator = Integer.parseInt(request.getParameter("operator"));
            int amount = Integer.parseInt(request.getParameter("amount"));

            int opAmount = operator*amount;
            int affectedRow = 0;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aryans", "root", "password");

                if (all) {
                    PreparedStatement st = con.prepareStatement("update rooms set due=due+ ? where available = 0");
                    st.setInt(1, opAmount);
                    affectedRow = st.executeUpdate();
                    if (affectedRow != 0) {
                        out.println("Due Update Successfully");
                    } else {
                        out.println("Something Error");
                    }
                } else {
                    PreparedStatement st = con.prepareStatement("update rooms set due=due+ ? where room_no = ?");
                    st.setInt(1, opAmount);
                    st.setString(2, roomNo);
                    affectedRow = st.executeUpdate();

                    if (affectedRow != 0) {
                        out.println("Updated Due in Room No.: " + roomNo);
                    } else {
                        out.println("Room Does't Exist");
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.println(e);
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
