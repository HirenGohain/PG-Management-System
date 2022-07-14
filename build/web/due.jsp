

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
                background-color: #272e6fb5;
                width: 100vw;
                height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .header {
                display: block;
                z-index: 99;
            }

            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #000000ac;
                padding: 5px 20px;
            }
            .container{
                width: 100vw;
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1;
                background-image: url("images/key.jpg") ;
                background-position: center;
                background-size: cover;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 30px;

            }

            .inner-container{
                margin-top: 50px;
                width: 100vw;
                padding: 20px;
            }

            .inner-container:after{
                content: "" ;
                display: block;
                clear: both;
            }

            [class*="col-"] {
                float: left;
                width: 50%;
                height: 100px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            form h3{
                color:white;
                margin: 5px;
            }

            .ufloat, option{
                font-size: 13px;
                font-weight: 900;
                padding: 5px;
                color: #556b2f;
                outline: none;
                width: 200px;
                border: 2px solid yellowgreen;
                border-radius: 3px;
            }

            .btn{
                width: 100vw;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            #update-btn, #ok-btn{
                width: 100px;
                padding: 3px;
                font-size: 14px;
                font-weight: 900;
                color: darkmagenta;
                text-transform: uppercase;
                background-color: yellowgreen;
                border: 2px solid white;
                border-radius: 5px;
            }


            @media screen and (min-width:870px) {
                [class*="col-"] {
                    width: 25%;
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
        <div class="container">
            <form action="Due" method="post" id="due">
                <div class="inner-container">
                    <div class="col-1">
                        <h3>Select Room:</h3>
                        <select name="is-all" id="opt" class="ufloat">
                            <option value="false">A Particular Room</option>
                            <option value="true">all</option>
                        </select>
                    </div>

                    <div class="col-2">
                        <h3>Enter Room No:</h3> 
                        <input type="text" name="room-no" class="ufloat" placeholder="Room ID" id="tf" required autofocus/>
                    </div>

                    <div class="col-3">
                        <h3>Add / Deduct:</h3>
                        <select name="operator" id="operator" class="ufloat">
                            <option value="+1">add</option>
                            <option value="-1">deduct</option>
                        </select>
                    </div>

                    <div class="col-4">
                        <h3>Amount:</h3>
                        <input type="number" name="amount" class="ufloat" placeholder="amount" required/>
                    </div>
                </div>

                <div class="btn">
                    <h2 id="h"></h2>
                    <br>
                    <br>
                    <br>
                    <button type="submit" id="update-btn">Update</button>
                    <button type="reset" id="ok-btn" style="display: none;">Ok</button>
                </div>
            </form>
            <br>
            <br>
            <br>
            <br>


            <form action="dueTable.jsp" method="post">
                <p style="color: white; font-size: 20px; font-weight: 900;">show the list of all tenant whose due is more than 
                    <input type="number" name="amount" placeholder="amount" required style="width: 90px; color: green; outline: none; font-weight: 600;"/>
                    <button type="submit" style="padding: 1px 3px; background-color: greenyellow; border: 2px solid white; font-weight: 400;">show</button>
                </p>
            </form>

        </div>



        <script src="javascript/jquery.min.js"></script>

        <script>

            $(document).ready(function () {
                console.log("its working");

                $("#ok-btn").click(function () {
                    $("#h").html("");
                    $("#tf").removeAttr('disabled');
                    $("#tf").attr("value", "");
                    $("#ok-btn").hide();
                    $("#update-btn").show();
                })

                $("#opt").change(function () {
                    if ($("#opt").val() == "true") {
                        $("#tf").css("color", "yellow");
                        $("#tf").attr("value", "All rooms are select");
                        $("#tf").attr('disabled', 'disabled');
                    } else {
                        $("#tf").removeAttr('disabled');
                        $("#tf").css("color","green");
                        $("#tf").attr("value", "");

                    }
                })

                $("#due").on('submit', function (event) {
                    event.preventDefault();

                    var formData = $(this).serialize();

                    $.ajax({
                        url: "Due",
                        data: formData,
                        type: 'POST',
                        success: function (data) {
                            console.log(data);
                            if(data.trim()=="Something Error"|| data.trim()=="Room Does't Exist"){
                                $("#h").css("color","red");
                            }
                            else{
                                $("#h").css("color","#43ff00");
                            }
                            $("#h").html(data);
                            $("#update-btn").hide();
                            $("#ok-btn").show();
                        },
                        error: function () {
                            console.log(data);
                            console.log("error...")
                        }
                    })
                })

            });



        </script>

    </body>

</html>
