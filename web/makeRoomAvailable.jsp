<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>home</title>

        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                background-image: url("images/key.jpg") ;
                background-position: center;
                background-size: cover;
                width: 100vw;
                height: 100vh;
                display: flex;
                flex-direction: column;
                /*overflow: scroll;*/
            }

            .header {
                position: fixed;
                top: 0;
                left: 0;
                width:  100vw;
                display: block;
                z-index: 1;
            }

            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #000000ac;
                padding: 5px 20px;
                border-bottom: 2px solid white;
            }

            .container{
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: auto;
                padding: 20px;
                overflow: auto;
            }

            [class*="col-"] {
                float: left;
                width:  100%;
                margin-top:100px;

            }

            .make-available{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;

            }

            .available-room{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            table,th,tr,td{
                border: 2px solid white;
                border-collapse: collapse;
            }
            th{
                color: black;
                background-color: white;
                padding :5px 80px;
                font-weight: 900;
            }

            td{
                color: white;
                padding :5px 60px;
                text-align: center;
                background-color: #556b2fa1;
            }

            input[type=text] {
                padding: 3px 10px;
                font-size: 20px;
                font-weight: 900;
                color: green;
                outline: none;
                width: 200px;
                text-align: center;
                border-radius: 50px 0px 0px 50px;
                border: none;

            }

            #update{
                position: relative;
                left: -4px;
                padding: 3px 10px;
                font-size: 20px;
                font-weight: 900;
                color: white;
                outline: none;
                width: 100px;
                border-radius: 0px 50px 50px 0px;
                background-color: green;
                border: none;
                cursor: pointer;
            }

            #ok{
                padding: 3px 10px;
                font-size: 20px;
                font-weight: 900;
                color: white;
                outline: none;
                width: 100px;
                border-radius: 50px;
                background-color: green;
                border: none;
                cursor: pointer;
                display: none;
            }

            p{
                font-size: 20px;
                font-weight: 900;
                color: white;
            }
            
            #av-table{
                display: none;
            }

            @media screen and (min-width:750px) {
                [class*="col-"] {
                    width:  50%;
                }

                .make-available{
                    align-items: baseline;
                    padding-left: 80px;

                }
                
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
        
        <div class="header">
            <header>
                <div class="logo">
                    <a href="admin.jsp">
                        <img src="images/new logo.png" alt="logo" width="180px">
                    </a>
                </div>
            </header>
        </div>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            boolean noRoomAvailable = true;

            String query = "select room_no,floor from rooms where available = 1";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aryans", "root", "password");
                st = con.createStatement();
                rs = st.executeQuery(query);
            } catch (ClassNotFoundException | SQLException e) {
                out.println(e);
            }
        %>
        <div class="container">
            <div class="make-available col-1">
                <h1 id="message" style="color: white;"></h1><br><br>

                <form action="MakeRoomAvailable" method="post" id="mra-form">
                    <input type="text" name="room-no" class="hide" placeholder="Enter Room ID" required/>
                    <button type="submit" class="hide" id="update">Update</button>
                    <button type="reset" id="ok">OK</button>
                </form><br><br><br>

                <p id="st"><span  id="show-table" style="color: greenyellow; cursor: pointer;">click here</span> to show all available rooms</p>
                <p id="ht" style="display:none;"><span  id="hide-table" style="color: greenyellow; cursor: pointer;">click here</span> to hide table</p>
            </div>
            <div class="available-room col-2">
                <table id="av-table">
                    <tr>
                        <th>Room No</th>
                        <th>Floor</th>
                    </tr>
                    <%
                        while (rs.next()) {
                            noRoomAvailable = false;
                            out.println("<tr>");
                            out.println("<td>" + rs.getString("room_no") + "</td>");
                            out.println("<td>" + rs.getString("floor") + "</td>");
                            out.println("</tr>");
                        }

                        if (noRoomAvailable) {
                            out.println("<tr>");
                            out.println("<td colspan='2' align = 'center'> No rooms are available at this time</td>");
                            out.println("</tr>");
                        }
                    %>
                </table>
            </div>
        </div>

        <script src="javascript/jquery.min.js"></script>
        
        <script>
            $(document).ready(function(){
                console.log("jquery is running") ;
                
                $("#show-table").on('click',function(){
                    $("#st").hide() ;
                    $("#av-table").show() ;
                    $("#ht").show() ;
                })
                
                $("#hide-table").on('click',function(){
                    $("#ht").hide() ;
                    $("#av-table").hide() ;
                    $("#st").show() ;
                })
                
                
                $("#mra-form").on('submit',function(event){
                    event.preventDefault() ;
                    
                    var fromData = $(this).serialize();
                    
                    $.ajax({
                        url: "MakeRoomAvailable" ,
                        data: fromData,
                        type: 'POST' ,
                        success: function(data) {
                            $(".hide").hide() ;
                            $("#message").html(data) ;
                            $("#ok").show() ;
                        },
                        error: function() {
                            console.log("error") ;
                        }
                    })
                })
                
                $("#ok").click(function(){
                            location.reload();
                            $("#message").html("") ;
                            $("#ok").hide() ;
                            $(".hide").show() ;
                })
                
                
                
            })
        </script>
    </body>

</html>
