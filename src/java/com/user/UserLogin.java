package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class UserLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            // getting user input from forms
            String room = request.getParameter("room_no");
            String pass = request.getParameter("password");

            // variable for storing values from database
            String room_no = null;
            String password = null;
            String name = null;

            // variable for checking user and password are match or not
            boolean match = false;

            String url = "jdbc:mysql://localhost:3306/aryans";
            String user = "root";
            String pa = "password";
            String query = "select room_no,name,password from rooms";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con = DriverManager.getConnection(url, user, pa);
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(query);

                while (rs.next()) {
                    room_no = rs.getString("room_no");
                    name = rs.getString("name");
                    password = rs.getString("password");

                    if (room.equals(room_no) && pass.equals(password)) {
                        match = true;
                        break;
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.println(e);
            }

            if (match) {
                HttpSession session = request.getSession();
                session.setAttribute("room_no", room_no); 
                session.setAttribute("password", password);
                session.setAttribute("name", name);
                out.println("match");
            } else {
                out.println("wrong password");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
