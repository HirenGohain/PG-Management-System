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
                background-image: linear-gradient(70deg,black,green,blue) ;
                width: 100vw;
                height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .header{
                display: block;
                width: 100vw;
                height: 62px;

            }

            header{
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #000000ac;
                padding: 5px 20px;
                border-bottom: 2px solid white;
            }

            #user{
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
                text-align: center;
                border-top: 2px solid white;
            }

            .login{
                place-self: center;
                background-color: #000000b2;
                padding: 30px;
                position: fixed;
                top: 150px;
                border: 2px solid white;
                border-radius: 80px 0px 80px 0px;
            }

            .tenant,.admin{
                display: none;
            }

            .login td{
                color: white;
                display: inline-block;
                margin: 10px;
            }

            td label{
                display: inline-block;
                width: 80px;
                font-weight: 900;
                font-size: 18px;
                color: yellow;
            }

            input[type=text],input[type=password] {
                outline: none;
                font-size: 14px;
                font-weight: 900;
                padding: 3px 7px;
                color: green;
            }

            .container{
                width: 100vw;
                padding: 30px;
                margin-top: 20px;
            }
            .main{
                width: 100%;
                height: 465px;
            }
            [class*="col-"] {
                float: left;
                width: 100%;
                /*height: 233px;*/
                padding: 10px;
            }

            .col-1{
                height: 233px;
            }

            .images{
                width: 100%;
                height: 100%;
                background-image: url("images/hostel.jpg") ;
                background-size: cover;
                background-position: center;
                border: 2px solid white;
                border-radius: 10px;
                animation: bg-images 15s linear infinite;
            }

            #check-btn{
                display: inline-block;
                padding: 3px 10px;
                text-decoration: none;
                color: white;
                border: 1px solid white;
                border-radius: 5px ;
                margin-top: 50px;
            }

            @keyframes bg-images{
                0%{
                    background-image: url("images/hostel.jpg") ;
                }
                33%{
                    background-image: url("images/door.png") ;
                }
                66%{
                    background-image: url("images/room.png") ;
                }
                100%{
                    background-image: url("images/hostel.jpg") ;
                }
            }

            @media screen and (min-width:750px) {
                [class*="col-"] {
                    width: 50%;
                    height: 233px;
                }

                .container{
                    margin-top: 0;
                }
            }

        </style>

    </head>
    <body>
        <div class="header">
            <header>
                <div class="logo">
                    <a href="#">
                        <img src="images/new logo.png" alt="logo" width="180px">
                    </a>
                </div>
                <div class="nav-btn">
                    <button id="user"> 
                        <img src="images/user.png" alt="nav item" style="width: 40px;">
                    </button>
                </div>
            </header>

            <nav>
                <ul>
                    <li id="tenant">
                        Login as Tenant
                    </li>
                    <li id="admin">
                        Admin
                    </li>
                </ul>
            </nav>
        </div>

        <div class="container">
            <div class="main">
                <div class="col-1">
                    <div class="images"></div>
                </div>
                <div class="col-2">
                    <div style="width: 100%; height: 100%; display: flex; justify-content: flex-start; align-items: center; flex-direction: column;">
                        <h1  align="center" style="color: White; text-shadow: 1px 1px 1px black;">Are you looking for a PG in Rajpura !!</h1>
                        <br>
                        <p style="font-size: 14px; font-weight: 900; text-align: center; color: white; text-shadow: 1px 1px 1px black;">Aryans PG provides you the  best accomodation at budget price.
                            It provides 24X7 water and electricity, free wifi, pure water faciality and servent for housekeeping.</p>
                        <br>
                        <p style="font-size: 14px; font-weight: 900; text-align: center; color: white; text-shadow: 1px 1px 1px black;">If you are interested then you can check the availability of rooms and also can 
                            apply for rooms by clicking the check availability buttom.</p>
                        <a id="check-btn" href="availableRoom.jsp">check availability</a>
                    </div>
                </div>
                <div class="col-3">

                </div>
                <div class="col-4">
                    <div class="location col-4" style="width: 100%; hiegth:100%; display: flex; align-items: flex-end; justify-content: flex-end">
                        <div style="margin-right: 3px;">
                            <p align="right" style="font-size: 14px; font-weight: 900; color: white; text-shadow: 1px 1px 1px black;">Village Nepra, PO & TEH. Rajpura</p>
                            <p align="right" style="font-size: 14px; font-weight: 900; color: white; text-shadow: 1px 1px 1px black;">DISTT, Punjab 140401</p>
                        </div>
                        <button id="map-btn" style="background: none; border: none; cursor: pointer;">
                            <img src="images/map.png" alt="" width="40px" id="maplogo">
                        </button>


                    </div>
                </div>
            </div>

        </div>

        <footer>
            <span style="color: white; font-weight: 900;">Contact: 9876543210</span>
            <span style="color: white; font-weight: 900; margin-left: 50px;">Email: admin@gmail.com</span>
        </footer>

        <!-- floting div -->

        <div class="login tenant">
            <span id="close_tenant" style="color: white; padding:3px 7px; background-color:#ff0000;border:2px solid white;position: absolute;top:-2px;right: -2px; cursor: pointer;">X</span>
            <form action="UserLogin" method="post" id="login">
                <table>
                    <tr>
                        <td>
                            <label>Room No</label>
                        </td>
                        <td>
                            <input type="text" name="room_no" placeholder="Enter your room no" required autofocus>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Password</label>
                        </td>
                        <td>
                            <input type="password" name="password" placeholder="Password"   required>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3 id="login-message" style="color:red;"></h3>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="display:flex; justify-content:center;">
                            <input type="submit" value="LOGIN" style="padding:3px 20px; font-weight:900; background-color:greenyellow; border-radius: 50px;">
                        </td>
                    </tr>
                </table>
            </form>
        </div>



        <div class="login admin">
            <span id="close_admin" style="color: white; padding:3px 7px; background-color:#ff0000;border:2px solid white;position: absolute;top:-2px;right: -2px; cursor: pointer;">X</span>
            <form action="AdminLogin" method="post" id="adminLogin">
                <table>
                    <tr>
                        <td>
                            <label>ID</label>
                        </td>
                        <td>
                            <input type="text" name="admin-id" placeholder="Enter Admin ID" required autofocus>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Password</label>
                        </td>
                        <td>
                            <input type="password" name="password" placeholder="Password"   required>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3 id="admin-message" style="color:red;"></h3>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="display:flex; justify-content:center;">
                            <input type="submit" value="LOGIN" style="padding:3px 20px; font-weight:900; background-color:greenyellow; border-radius: 50px;">
                        </td>
                    </tr>
                </table>
            </form>
        </div>


        <script src="javascript/home.js"></script>
        <script src ="javascript/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("page is ready..... ");

                $("#map-btn").click(function () {
                    window.open("https://g.page/aryansgroup?share", '_blank');
                })

                $("#login").on('submit', function (event) {
                    event.preventDefault();

                    var f = $(this).serialize();
                    console.log(f);
                    //
                    $.ajax({
                        url: "UserLogin",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("success...")
                            //                            
                            if (data.trim() === "match") {
                                window.open("user.jsp", "_self");
                            } else {
                                $("#login-message").html(data);
                                console.log(data)
                            }
                            //                            
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            //                            $("#msg").html(data);
                            console.log("error...")
                        }
                    })
                })

                $("#adminLogin").on('submit', function (event) {
                    event.preventDefault();

                    var af = $(this).serialize();
                    console.log(af);
                    //
                    $.ajax({
                        url: "AdminLogin",
                        data: af,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("success...")
                            //                            
                            if (data.trim() === "match") {
                                window.open("admin.jsp", "_self");
                            } else {
                                $("#admin-message").html(data);
                                console.log(data)
                            }
                            //                            
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            //                            $("#msg").html(data);
                            console.log("error...")
                        }
                    })
                })
            })
        </script>


    </body>
</html>
