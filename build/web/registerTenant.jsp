

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
                background-image: url("images/key.jpg");
                background-size: cover;
                background-position: center;
                width: 100vw;
                height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .header {
                display: block;
                position: fixed;
                top: 0;
                left: 0;
            }

            header {
                width: 100vw;
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #000000ac;
                padding: 5px 20px;
            }

            .container{
                width: 100vw;
                height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            table tr td{
                padding: 5px 10px;
                color: white;
                font-size: 16px;
                font-weight: 900;
                text-shadow: 2px 2px 2px #0c12a1;
            }

            input[type=text]{
                color: green;
                width: 200px;
                font-size: 16px;
                font-weight: 600;
                border: 2px solid gray;
                border-radius: 5px;
                outline: none;
                padding: 3px 5px;
            }

            button{
                width: 80px;
                padding: 5px;
                color: green;
                font-size: 13px;
                font-weight: 900;
                background-color: #ecf3f5;
                border: 2px solid #a5bcdc;
                border-radius: 50px;
                cursor: pointer;
            }
            ::placeholder{
                color: darkgrey;
                font-weight: 600;
            }

            #ok{
                display: none;
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
            <h1 id="message" style="color: greenyellow;text-shadow: 2px 2px 5px blue; text-align: center;"></h1>
            <div>
                <form action="AddMember" method="post" id="addMember"> 
                    <table>
                        <tr>
                            <td>
                                <label class="hide">Room ID</label>
                            </td>
                            <td>
                                <input type="text" name="room-no" placeholder="Enter Room ID" class="hide" autofocus required/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="hide">Tenant Name</label>
                            </td>
                            <td>
                                <input type="text" name="name" placeholder="Enter Tenant Name" class="hide"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="hide">Mobile Number</label>
                            </td>
                            <td>
                                <input type="text" name="mobile" placeholder="Enter Mobile Number" class="hide"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" >
                                <button type="submit" id="update" style="position: relative; top:10px; width: 100%;">Update</button>
                                <button type="reset"  id="ok">Ok</button>
                            </td>
                        </tr>
                    </table>
                </form>

            </div>
        </div>



        <script src ="javascript/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("ajax is ready... ");

                $("#addMember").submit(function (event) {
                    event.preventDefault();

                    var tenantData = $(this).serialize();
//                    console.log(tenantData);

                    $.ajax({
                        url: "AddMember",
                        data: tenantData,
                        methods: 'POST',
                        success: function (data) {
                            $(".hide").hide();
                            $("#update").hide();
                            $("#message").html(data);
                            $("#ok").show();
                        },
                        error: function () {
                            console.log(data);
                            console.log("error");
                        }
                    })
                })

                $("#ok").click(function () {
                    $("#message").html("");
                    $("#ok").hide();
                    $(".hide").show();
                    $("#update").show();

                })



            })
        </script>


    </body>

</html>
