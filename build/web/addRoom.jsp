
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
                background-image: linear-gradient(45deg, black, #001fff29);
                width: 100vw;
                height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .header {
                display: block;
                border-bottom: 2px solid white;
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
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            table{
                padding: 20px;
            }

            td{
                color: white;
                font-size: 20px;
                font-weight: 900;
                padding: 5px 10px;
            }

            input,select,option{
                width: 200px;
                padding: 3px 10px;
                font-size: 14px;
                font-weight: 900;
                outline: none;
                border: 2px solid #2a3faf9c;
                color: #2a3faf;
            }

            #add-btn,#ok-btn{
                font-size: 20px;
                font-weight: 900;
                width: 100%;
                color: white;
                background-color: #2a3faf9c;
                border: 2px solid white;
                border-radius: 50px;
                padding: 3px 20px;
            }
            #ok-btn{
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
            <h1 id="message" style="color: yellow;"></h1>
            <form action="AddRoom" method="post" id="add-room">
                <table>
                    <tr>
                        <td>Add Room No:</td>
                        <td>
                            <input type="text" name="room-no" placeholder="Room No" required autofocus/>
                        </td>
                    </tr>
                    <tr>
                        <td>Floor:</td>
                        <td>
                            <select id="id" name="floor" >
                                <option value="Ground Floor">Ground Floor</option>
                                <option value="First Floor">First Floor</option>
                                <option value="Second Floor">Second Floor</option>
                                <option value="Third Floor">Third Floor</option>
                            </select>
                        </td>
                    </tr>
                    <tr>

                    </tr>
                    <td>Availablity:</td>
                    <td>
                        <select name="available">
                            <option value="1">Room Available</option>
                            <option value="0">Room Not-available</option>
                        </select>

                    </td>
                    <tr>
                        <td colspan="2" align="center">
                            <button type="submit" id="add-btn">ADD</button>
                            <button type="reset" id="ok-btn">OK</button>

                        </td>
                    </tr>

                </table>
            </form>


        </div>

        <script src="javascript/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("jQuery is working");

                $("#add-room").on('submit', function (event) {
                    event.preventDefault();

                    var formData = $(this).serialize();

                    $.ajax({
                        url: "AddRoom",
                        data: formData,
                        type: 'POST',
                        success: function (data) {
                            $("#add-btn").hide();
                            $("#message").html(data);
                            $("#ok-btn").show();
                        },
                        error: function () {
                            window.alert("something wrongs");
                        }
                    })
                })

                $("#ok-btn").click(function () {
                    $("#ok-btn").hide();
                    $("#message").html("");
                    $("#add-btn").show();
                })


            })
        </script>

    </body>

</html>
