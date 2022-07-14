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
                width: 100vw;
                height: 100vh;
                background-image: url("images/brw.jpg");
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
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
                width: 100vw;
                height: 100vh;
                padding: 30px 50px;
            }

            label{
                display: inline-block;
                width: 180px;
                color: #7f5e58;
                font-size: 20px;
                font-weight: 900;
                text-shadow: 1px 1px 2px white;
            }

            input[type=text]{
                outline: none;
                font-size: 20px;
                font-weight: 600;
                color:#2e00ff7d;
                padding: 3px 10px ;
                background-color: #fcfcfc;
                border: 2px solid #7f5e58;
            }

            ::placeholder{
                color: #7f5e58;
            }

            button{
                padding: 5px 30px;
                background-color: #7f5e58;
                outline: none;
                font-size: 14px;
                font-weight: 900;
                color: white;
                border: 2px solid white;
                border-radius: 10px;

            }

            .hide{
                display: none;
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
            <div class="book col-2">

                <h1 class="hide" style="color: green; text-shadow: 2px 2px 10px white;">Your request is under processing...</h1><br>
                <p class="hide" style="color: red; font-size: 16px; font-weight: 900; text-transform: uppercase;">our supervisour will contact you within 24 hour.</p><br><br>
                <form action="Booking" method="post" id="booking">
                    <label>Name:</label><br>
                    <input type="text" name="name" placeholder="Enter Your Name" required autofocus/><br><br>
                    <label>Mobile Number:</label><br>
                    <input type="text" name="mobile" placeholder="Enter Your Mobile Number" required /><br><br>
                    <button type="submit" id="request">Send Request</button>
                    <button class="hide" id="ok" type="reset">OK</button>
                </form>
            </div>

        </div>

        <script src="javascript/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("its working")


                $("#booking").on('submit', function (event) {
                    event.preventDefault();

                    var d = $(this).serialize();
                    console.log(d);

                    $.ajax({
                        url: "Booking",
                        data: d,
                        type: 'POST',
                        success: function (data) {
                            console.log(data);
                            $("#request").hide();
                            $(".hide").show();
                        },
                        error: function () {
                            console.log("error");
                        }
                    })
                })

                $("#ok").click(function () {
                    $(".hide").hide();
                    $("#request").show();
                })

            })
        </script>
    </body>
</html>

