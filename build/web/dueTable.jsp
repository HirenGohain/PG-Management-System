
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            table,th,tr,td{
                padding: 3px 10px;
                border: 1px solid black;
                border-collapse: collapse;
            }
            td{
                font-weight: 300;
            }
            
        </style>
    </head>
    <body>
        <%
            response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
            if (session.getAttribute("admin") == null) {
                response.sendRedirect("home.jsp");
            }
        %>
        
        
        <%
            int amount = Integer.parseInt(request.getParameter("amount"));
            String query="select room_no, floor, name, mobile, due from rooms where due > "+amount+" and available = 0" ;
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aryans","root","password") ;
                st = con.createStatement();
                rs= st.executeQuery(query) ;
            } catch (ClassNotFoundException | SQLException e) {
                out.println(e) ;
            }
        %>
        <h3>List of Tenant whose pending due is more than <%=amount%> rupees:</h3>
        
        <table>
            <tr>
                <th>Room No</th>
                <th>Floor</th>
                <th>Name</th>
                <th>Mobile</th>
                <th>Pending Due</th>
            </tr>
            <%
                int count = 0;
                while (rs.next()) {
                    count = rs.getRow();
                    out.println("<tr>");
                    out.println("<td>"+rs.getString("room_no")+"</td>");
                    out.println("<td>"+rs.getString("floor")+"</td>");
                    out.println("<td>"+rs.getString("name")+"</td>");
                    out.println("<td>"+rs.getString("mobile")+"</td>");
                    out.println("<td>"+rs.getString("due")+"</td>");
                    out.println("</tr>");
                }
                if(count==0){
                    out.println("<tr>") ;
                    out.println("<td colspan='5' align='center'>No Data Found</td>");
                    out.println("</tr>") ;
                }
            %>

        </table>
        
        
    </body>
</html>
