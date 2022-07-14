<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                background-image: url("images/blbr.jpg");
                background-image: linear-gradient(45deg,black,blue,green,yellow) ;
                background-size: cover;
                background-position:top;
                width: 100vw;
                height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .header{
                display: block;
            }

            header{
                width: 100vw;
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #000000ac;
                padding: 5px 20px;
                border-bottom: 2px solid white;
            }

            #nav-item{
                background: none;
                border: none;
                cursor: pointer;
            }

            nav{
                position: fixed;
                top:63px;
                right: 3px;
                display: none;
            }

            nav ul{
                list-style: none;
            }

            nav li{
                background-color: #000000ac;
                margin-top: 3px;
                border-top-left-radius: 30px;
                border-bottom-right-radius: 30px;
                text-align: center;
                padding:7px 30px;
                color: white;
                cursor: pointer;
            }

            nav li:hover{
                border-bottom: 2px solid white;
            }

            nav li:active{
                background-color: blueviolet;
            }






            footer{
                position: fixed;
                bottom: 0;
                background-color: #000000ac;
                width: 100vw;
                padding: 20px;
                color: white;
                /*text-align: center;*/
                display: flex;
                justify-content: space-around;
                border-top: 2px solid white;
            }

            .floting-div{
                place-self: center;
                background-color: #000000b2;
                padding: 30px;
                position: fixed;
                top: 150px;
                border: 2px solid white;
                border-radius: 80px 0px 80px 0px;
            }

            .due,.query,.change-password{
                display: none;
            }

            .change-password td{
                color: white;
                display: inline-block;
                margin: 10px;
            }

            td label{
                display: inline-block;
                width: 100px;
                font-size: 15px;
            }

            .logout-btn{
                width: 50px;
                background-color: greenyellow;
                padding: 3px;
                border-radius: 20px;
                position: relative;
                right: -70px;
                cursor: pointer;
                font-weight: 900;
            }

            .container{
                width: 100vw;
                padding: 20px;
            }

            .acount-dia{
                display: none;
            }

        </style>

    </head>

    <body>
        <%
            response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
            if (session.getAttribute("room_no") == null || session.getAttribute("password") == null) {
                response.sendRedirect("home.jsp");
            }
            String name = (String) session.getAttribute("name");
            try {
                name = name.toUpperCase();
            } catch (Exception e) {
                System.out.println(e);
            }


        %>

        <div class="header">
            <header>
                <div class="logo">
                    <span id="logo">
                        <img src="images/new logo.png" alt="logo" width="180px">
                    </span>
                </div>
                <div class="nav-btn">
                    <button id="nav-item"> 
                        <img src="images/navitemh.png" alt="nav item" style="width: 40px;">
                    </button>
                </div>
            </header>

            <nav>
                <ul>
                    <li id="due">
                        <a href="CheckDue" id="check-due" style="color:white;text-decoration: none;">
                            Check Due
                        </a>
                    </li>
                    <li id="query">
                        Add Query
                    </li>
                    <li id="change-password">
                        Change Password
                    </li>
                    <li id="logout">
                        Logout
                    </li>
                </ul>
            </nav>
        </div>

        <div class="container">

            <h1 style="color: white;text-shadow: 1px 1px black;">HELLO <%=name%>, WHATS UP!!!</h1>
            <br>
            <h3 style="color: red;">Hope your day going smoothly....</h3>

        </div>

        <footer>
            <p>Contact: 9876543210</p>
            <p>Email: abcdef@gmail.com</p>
        </footer>

        <!-- floting div -->

        <div class="floting-div due">
            <span id="close-due" style="color: white; padding:3px 7px; background-color:#ff0000;border:2px solid white;position: absolute;top:-2px;right: -2px; cursor: pointer;">X</span>
            <div style="width:300px;height: 200px;display: flex;flex-direction: column; align-items: center; justify-content: space-between;">
                <h3 class="display-dia" style="color: red; text-align:center;">DUE !!</h3>
                <p id="due-message" class="display-dia" style="color: white;"></p>
                <p class="acount-dia" style="color: white;"><span style="color: red; font-size: 16px; font-weight: 600;">Online payment is not availabel at this moment!!</span><br><br> You can transfer the money in the following acount number and send the screen shot to whatsapp number: <span style="color:yellowgreen">8796xxxxxxx</span></p><br>
                <pre class="acount-dia" style="color: yellowgreen;">
Name: Aryans PG
Acount No: 102XXXXXXXX
IFSC: SBINXXXXXXX
                    
                </pre>
                <button id="pay-button" class="display-dia" style="padding: 5px; background-color: greenyellow;">pay now</button>
                <button id="ok-button" class="acount-dia" style="padding: 5px 20px; background-color: greenyellow; border: 2px solid white; border-radius: 50px; cursor: pointer; position: relative; top: -20px;">OK</button>
            </div>
        </div>



        <div class="floting-div query">
            <span id="close-query" style="color: white; padding:3px 7px; background-color:#ff0000;border:2px solid white;position: absolute;top:-2px;right: -2px; cursor: pointer;">X</span>
            <form action="AddQuery" method="post" id="add-query">
                <table>
                    <tr>
                        <td>
                            <textarea name="query" id="query-field" cols="30" rows="5" placeholder="Enter Your Query..." required
                                      style="border-radius:30px 0px 30px 0px;padding: 5px 30px; font-size:12px; font-weight:600; color: red;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4 id="query-message" style="color: greenyellow;"></h4>
                        </td>
                    </tr>
                    <tr>
                        <td style="display:flex; justify-content:center; margin-top: 10px;">
                            <input type="submit" value="Submit" id="submit-query" style="padding:3px 7px; font-weight:900; border-radius: 7px; background-color: greenyellow;">
                            <button type="reset" id="ok" style="padding: 3px 7px; font-weight: 900; border-radius: 7px;background-color: greenyellow; display: none;">Ok</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>


        <div class="floting-div change-password">
            <span id="close-change-password" style="color: white; padding:3px 7px; background-color:#ff0000;border:2px solid white;position: absolute;top:-2px;right: -2px; cursor: pointer;">X</span>
            <form action="ChangePassword" method="post" id="change-pass-form">
                <table>
                    <tr>
                        <td>
                            <label>Old Password</label>
                        </td>
                        <td>
                            <input type="password" name="old-password" placeholder="Password" required autofocus>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>New Password</label>
                        </td>
                        <td>
                            <input type="password" name="new-password" placeholder="New Password"   required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Conf. Password</label>
                        </td>
                        <td>
                            <input type="password" name="conform-password" placeholder="Conform Password"   required>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h4 id="change-message" style="color:greenyellow;"></h4>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="display:flex; justify-content:center;">
                            <input type="submit" value="Change" id="change" style="padding:3px; font-weight:900; background-color:greenyellow;">
                            <button type="reset" id="reset" style="padding: 3px 10px;margin-left: 20px; font-weight:900; background-color:greenYellow; display: none;">Ok</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <div class="conf-message" style="background-color:#212331; display: none; width: 200px; height: auto;padding: 10px; border:2px solid white; border-radius: 100px 0px 0px 100px; position: fixed; top:65px;right: 5px;">
            <h3 align="right" style="color:red; margin-bottom: 5px;">Are you sure !?</h3>
            <div class="btn">
                <button class="logout-btn" id="yes">yes</button>
                <button class="logout-btn" id="no">no</button>
            </div>
        </div>


        <script src="javascript/user1.js"></script>
        <script src ="javascript/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("page is ready..... ");


                $("#pay-button").click(function () {
                    $(".display-dia").hide();
                    $(".acount-dia").show();
                })
                $("#ok-button").click(function () {
                    $(".acount-dia").hide();
                    $(".display-dia").show();
                    $(".due").hide();
                })


                $("#logo").click(function () {
                    $(".conf-message").show();
                    $("nav").hide();
                    $("#nav-item").css("transform", "rotateZ(0deg)");
                })

                $("#check-due").click(function (event) {
                    event.preventDefault();

                    $.get("CheckDue", function (data, status) {
                        console.log("Data: " + data + "\nStatus: " + status);
                        $("#due-message").html(data);

                    });
                })


                $("#add-query").on('submit', function (event) {
                    event.preventDefault()
                    console.log("prevent function work");

                    var aq = $(this).serialize();
                    console.log(aq);

                    $.ajax({
                        url: "AddQuery",
                        data: aq,
                        methods: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            $("#query-message").html(data);
                            console.log("success...")
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            console.log("error...")
                        }
                    })
                })


                $("#change-pass-form").on('submit', function (event) {
                    event.preventDefault()
                    console.log("prevent function work");

                    var cp = $(this).serialize();
                    console.log(cp);

                    $.ajax({
                        url: "ChangePassword",
                        data: cp,
                        methods: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            $("#change-message").html(data);
                            console.log("success...")
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            console.log("error...")
                        }
                    })
                })

                // change password 
                $("#change").click(function () {
                    $("#change").hide();
                    $("#reset").show();
                })

                $("#reset").click(function () {
                    $("#change-message").html("");
                    $("#reset").hide();
                    $("#change").show();
                })

                // add query
                $("#submit-query").click(function () {
                    var query = $("#query-field").val();
                    if (query == "" || query == null) {
                        alert("insert query !!");
                        return;
                    } else {
                        $("#submit-query").hide();
                        $("#ok").show();
                    }
                })

                $("#ok").click(function () {
                    $("#ok").hide();
                    $("#query-message").html("");
                    $("#submit-query").show();
                })

                // logout 
                $("#yes").click(function (event) {
                    event.preventDefault();

                    $(".conf-message").hide();
                    $.get("Logout", function (data, status) {
                        console.log("Data: " + data + "\nStatus: " + status);
                        console.log(data);
                    });

                    window.open("home.jsp", "_self");
                })

                $("#no").click(function () {
                    $(".conf-message").hide();
                })

            })

        </script>

    </body>
</html>
