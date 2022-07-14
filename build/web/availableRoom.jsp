<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>home</title>

        <style>
            *{
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body{
                background-image: url("images/brb.jpg");
                background-size: cover;
                background-position: center;
                display: flex;
                flex-direction: column;
            }

            .header{
                display: block;
                width: 100vw;
                height: 80px;
            }

            header{
                position: fixed;
                top: 0;
                display: flex;
                width: 100vw;
                justify-content: space-between;
                align-items: center;
                background-color: #000000ac;
                padding: 5px 20px;
                border-bottom: 2px solid white;
            }

            .container{
                padding: 30px;
            }

            [class*="col-"] {
                float: left;
                width: 100%;
                display: flex;
                justify-content: center;
            }
            .book input[type=text]{
                padding: 3px 10px;
            }

            table{
                background-color: #613c81b0;
            }
            table,tr{
                width: 100%;
                border: 1px solid white;
                margin-top: 5px;
                border-collapse: collapse;
            }

            td{
                padding: 5px;
            }

            .room-no{
                background:none;
                width: 100px;
                padding: 5px 20px;
                font-size: 14px;
                font-weight: 900;
                outline: none;
                border: none;
                text-align: center;
                color: white;
                text-shadow: 3px 1px 1px green;
            }
            .floor{
                background:none;
                width: 200px;
                padding: 5px 20px;
                font-size: 14px;
                font-weight: 900;
                outline: none;
                border: none;
                text-align: center;
                color: white;
                text-shadow: 3px 1px 1px green;

            }
            .pick-room{
                color: green;
                padding: 3px 10px;
                font-weight: 900;
                border: none;
                border-radius: 30px;
            }
        </style>

    </head>
    <body>
        <div class="header">
            <header>
                <div class="logo">
                    <a href="home.jsp">
                        <img src="images/new logo.png" alt="logo" width="180px">
                    </a>
                </div>
            </header>
        </div>

        <div class="container">
            <%!
                String url = "jdbc:mysql://localhost:3306/aryans";
                String user = "root";
                String pass = "password";
                Connection co = null;
                Statement st = null;
                ResultSet rs = null;
                String sqlQuery = "select room_no,floor from rooms where available = 1";
                String roomNo = null;
                String floor = null;
                int roomCount = 0;
            %>

            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    co = DriverManager.getConnection(url, user, pass);
                    st = co.createStatement();
                    rs = st.executeQuery(sqlQuery);
                } catch (ClassNotFoundException | SQLException e) {
                    out.println(e);
                }
            %>
            <div class="tabel col-1">
                <table>
                    <%
                        try {
                            while (rs.next()) {
                                roomCount = rs.getRow();
                                roomNo = rs.getString("room_no");
                                floor = rs.getString("floor");
                                out.println("<tr>");
                                out.println("<form class='set-room' action = 'SetRoom' method='post'> ");
                                out.println("<td><input type ='text' name='room-no' value='" + roomNo + "' class='room-no' readonly/></td>");
                                out.println("<td><input type ='text' name='floor' value='" + floor + "' class='floor' readonly/></td>");
                                out.println("<td align='right'><button type='submit' class='pick-room' style='cursor:pointer; margin-right: 40px;'>Book Now</button></td>");
                                out.println("</form>");
                                out.println("</tr>");
                            }

                        } catch (Exception e) {
                            out.println(e);
                        }
                        if (roomCount == 0) {
                            out.println("<tr>");
                            out.println("<td colspan='3' align='center' style='font-weight: 900;'>NO ROOM AVAILABLE AT THIS TIME</td>");
                            out.println("</tr>");
                        }
                    %>
                </table>
            </div>
    </body>
</html>

