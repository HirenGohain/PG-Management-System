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
                background-color: #272e6fb5;
                background-image: url("images/key.jpg");
                background-size: cover;
                background-position: center;
                width: 100vw;
                height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .header{
                display: block;
            }

            header{
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #000000ac;
                padding: 5px 20px;
                border-bottom: 2px solid white;
            }

            [class*="col"] {
                float: left;
                width: 100%;
            }

            [class*="out-"]{
                float: left;
                width: 50%;
                padding: 30px;
            }
            .out-1{
                padding: 40px 20px 20px 40px;
            }
            .out-2{
                padding: 40px 40px 20px 20px;
            }
            .out-3{
                padding: 20px 20px 40px 40px;
            }
            .out-4{
                padding: 20px 40px 40px 20px;
            }
            [class*="inn-"]{
                width: 100%;
                height: 100px;
                color: white;
                background-color: #0000008f;
                display: flex;
                justify-content: center;
                align-items: center;
                border: 2px solid white;
                border-radius: 10px;
                cursor: pointer;
                transition: .5s;
            }

            [class*="inn-"]:hover{
                color: greenyellow;
                background-color: #0e217a73;
                box-shadow: 1px 1px 10px white;
                transition: .5s;
            }

            .col-2{
                /* background-color: peachpuff; */
                padding: 0px 40px 40px 40px;
            }
            .add{
                background-color: #0000008f;
                margin-bottom: 40px;
                padding: 10px;
                border: 2px solid white;
                border-radius: 20px;
                color: white;
                display: flex;
                flex-direction: column;
                /* justify-content: center; */
                align-items: center;
            }

            .query,.room-req{
                background-color: white;
                color: black;
                width: 100%;
                min-height: 105px;
                padding: 10px;
                border: 2px solid gray;
                border-radius: 10px;
                margin: 10px;
            }


            @media screen and (min-width:750px) {
                [class*="col-"]{
                    /* width: 50%; */
                }
                .col-1{
                    width: 65%;
                }
                .col-2{
                    width: 35%;
                    /* border-left: 2px solid white; */
                    padding: 40px;
                }

                [class*="inn-"]{
                    height: 195px;
                }

                .add{
                    border-radius: 10px;
                }

            }

        </style>

    </head>
    <body>
        <%!
//
        %>


        <%
            response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
            if (session.getAttribute("admin") == null) {
                response.sendRedirect("home.jsp");
            }

            response.setIntHeader("Refresh", 60);
        %>
        <div class="header">
            <header>
                <div class="logo">
                    <a href="admin.jsp">
                        <img src="images/new logo.png" alt="logo" width="180px">
                    </a>
                </div>
                <div class="logout">
                    <button id="logout" style="position: relative; right: 20px; padding: 10px 20px; font-size: 12px; font-weight: 900;border-radius: 30px;cursor: pointer;">LOGOUT</button>
                </div>
            </header>
        </div>

        <div class="container" style="padding:10px; width: 100%; display: block;">
            <div class="content col-1">
                <div class="out-1">
                    <div class="register inn-1">
                        <h4>Register Tenant</h4>
                    </div>
                </div>
                <div class="out-2">
                    <div class="room inn-2">
                        <h4>Make Room Available</h4>
                    </div>
                </div>
                <div class="out-3">
                    <div class="due inn-3">
                        <h4>Add Due</h4>
                    </div>
                </div>
                <div class="out-4">
                    <div class="add-room inn-4">
                        <h4>Add Room</h4>
                    </div>
                </div>
            </div>
            <div class="details col-2">
                <div class="add">
                    <h4>QUERY</h4>
                    <div class="query">

                        <%!                            
                            String url = "jdbc:mysql://localhost:3306/aryans";
                            String user = "root";
                            String pass = "password";
                            Connection co = null;
                            Statement st1 = null;
                            Statement st2 = null;
                            ResultSet rs1 = null;
                            ResultSet rs2 = null;
                            String sqlQuery1 = "select * from query";
                            String sqlQuery2 = "select * from room_book" ;
                            int queryId = 0;
                            String roomNo = null;
                            String query = null;
                            
                            String name = null;
                            String mobile = null;
                            String requestRoom =  null;
                        %>


                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                co = DriverManager.getConnection(url, user, pass);
                                st1 = co.createStatement();
                                st2 = co.createStatement();
                                rs1 = st1.executeQuery(sqlQuery1);
                                rs2 = st2.executeQuery(sqlQuery2);
                            } catch (ClassNotFoundException | SQLException e) {
                                out.println(e);
                            }
                        %>


                        <%
                            try {
                                int queryCount = rs1.getRow();
                                while (rs1.next()) {
                                    queryId = rs1.getInt("q_id");
                                    roomNo = rs1.getString("room_no");
                                    query = rs1.getString("query");
                                    out.println("<p style='color: blue;'><b>query_id: " + queryId + "&nbsp;&nbsp;&nbsp;&nbsp; room_no: " + roomNo + "</b></p>");
                                    out.println("<p> <b>query:</b> " + query + "</p><br>");
                                    queryCount = rs1.getRow();
                                }
                                if (queryCount == 0) {
                                    out.println("<h4>NO QUERY AVAILABLE<h4>");
                                }
                            } catch (Exception e) {
                                out.println(e);
                            }

                        %>

                    </div>

                    <div class="q-del" style="width:100%;display: none;">
                        <div style="display:flex; justify-content: space-between">
                            <form action="DeleteQuery" method="post" id="delete-query">
                                <input type="text" name="query-id" style="font-size:15px;color: red;width: 80px; padding: 3px 15px;"> 
                                <button type="submit" id="" style="cursor: pointer;background-color:red;color: white;border:none;font-size: 15px;padding:5px 15px; border-radius: 3px;">Delete</button>
                            </form>
                            <button id="q-back" style="cursor: pointer;background-color:yellowgreen;color: white;border:none;font-size: 15px;padding:5px 15px; border-radius: 3px;">Back</button>
                        </div>
                    </div>
                    <button id="q-del" style="cursor: pointer;padding:5px 10px; border: none; border-radius: 5px; font-weight: 900; color: #0000008e;">DELETE</button>
                </div>
                <div class="add">
                    <h4>ROOM REQUEST</h4>
                    <div class="room-req">
                        <%
                            try {
                                int requestCount = rs2.getRow();
                                while (rs2.next()) {
                                    name = rs2.getString("name");
                                    requestRoom = rs2.getString("room_no");
                                    mobile = rs2.getString("mobile");
                                    out.println("<p style='color: blue;'><b>" + name + "</b> requested for room_no: <b>" + requestRoom + "</b><br><b>Mobile: </b> " +mobile+ "</p><br>");
                                    requestCount = rs2.getRow();
                                }
                                if (requestCount == 0) {
                                    out.println("<h4>NO NEW REQUEST FOUND<h4>");
                                }
                            } catch (Exception e) {
                                out.println(e);
                            }

                        %>
                    </div>

                    <button id="r-del" style="cursor: pointer;padding:5px 10px; border: none; border-radius: 5px; font-weight: 900; color: #0000008e;">DELETE</button>
                </div>
            </div>
        </div>

        <script src="javascript/jquery.min.js"></script>

        <script>
            $(document).ready(function () {
                console.log("page is working....");

                $("#q-del").click(function () {
                    console.log("clicked...")
                    $("#q-del").hide();
                    $(".q-del").show();
                })


                $("#r-del").click(function () {
                    console.log("clicked...")
                    
                    $.get("DeleteRoomRequest", function (data, status) {
                        console.log("Data: " + data + "\nStatus: " + status);
                        location.reload();
                        console.log(data);
                    });
                    
                })

                $("#q-back").click(function () {
                    $("#q-del").show();
                    $(".q-del").hide();
                })

                $("#r-back").click(function () {
                    $("#r-del").show();
                    $(".r-del").hide();
                })


                $("#delete-query").on('submit', function (event) {
                    event.preventDefault();

                    var dq = $(this).serialize();
                    console.log(dq);

                    $.ajax({
                        url: "DeleteQuery",
                        data: dq,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("success...")
                            location.reload();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            console.log("error...")
                        }
                    })
                })


                $(".register").click(function () {
                    window.open("registerTenant.jsp", "_self");
                })
                $(".room").click(function () {
                    window.open("makeRoomAvailable.jsp", "_self");
                })
                $(".due").click(function () {
                    window.open("due.jsp", "_self");
                })
                $(".add-room").click(function () {
                    window.open("addRoom.jsp", "_self");
                })


                 $("#logout").click(function (event) {
                    event.preventDefault();

                    $.get("AdminLogout", function (data, status) {
                        console.log("Data: " + data + "\nStatus: " + status);
                        console.log(data);
                    });

                    window.open("home.jsp", "_self");
                })



            })
        </script>

    </body>
</html>

