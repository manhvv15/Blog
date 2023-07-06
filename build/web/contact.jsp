<%-- 
    Document   : Contact
    Created on : Mar 14, 2023, 9:12:24 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                margin: 0;
                overflow-x: hidden;
            }
            body {
                background-color: #E2FEFE;
                background-size: cover;
                background-repeat: no-repeat;
            }
            .container{
                width: 100%;
                display: flex;
                height: 90%;
            }
            .left{
                width: 40%;
                height: 50em;
                display: grid;
                place-items: center;
            }
            .right{
                width: 60%;
                position: relative;
            }
            .pz{
                color: #f3a753;
            }
            p{
                font-size: 2em;
                margin-bottom: 1em;
            }
            .under{
                width: 30em;
                height: 30em;
                background-color: #f67100;
                border-radius: 50%;
                position: absolute;
                top: 5em;
                left: 15em;
            }
            .above{
                top: 8em;
                left: 10em;
            }
            .top-menu-bar {
                position: relative;
                top: 0;
                display: flex;
                align-items: center;
                justify-content: space-around;
                z-index: 20;
                background-color: black;
                height: 100px;
                margin-bottom: 20px;
            }

            .top-menu-bar a {
                width: 30%;
                height: 100%;
            }

            .top-menu-bar label {
                width: 30%;
                height: 100%;
            }

            .top-menu-bar div {
                width: 100%;
                height: 100%;
                align-items: center;
                justify-items: center;
                justify-content: center;
                display: flex;
            }
            .top-menu-bar div:hover {
                background-color: gray;
            }
            a {
                text-decoration: none;
                font-size: 1.5em;
                color: white;
            }

            li {
                list-style: none
            }

            label {
                font-size: 1.5em;
                color: white;
                cursor: pointer
            }

            #drop-items {
                position: absolute;
                background-color: black;
                height: 100px;
                z-index: 999;
                opacity: 0;
                visibility: hidden;
                overflow: hidden;
                transition: transform 0.3s ease, opacity 0.3s ease;
            }

            #drop-items.show {
                position: absolute;
                background-color: black;
                height: 100px;
                z-index: 999;
                transform: scaleY(1);
                opacity: 1;
                visibility: visible;
            }

            #drop-items a {
                display: inline-block;
                width: 100%;
                height: 50%;
                color: white;
            }

            #drop-items div {
                font-size: 1.5em;
                align-content: center;
                align-items: center;
            }

            #drop-items div:hover {
                width: 100%;
                height: 100%;
                background-color: gray;
            }
        </style>
    </head>
    <body>
        <div class="top-menu-bar">
            <a href="home"><div>Home</div></a>
            <label id="category" onclick="showDropItems(event)"><div>Category</div></label>
            <a href="contact.jsp"><div>Contact</div></a>
        </div>
        <div id="drop-items">
            <a href="drink" style="color: white; font-size: 1em;"><div>Drink</div></a>
            <a href="food" style="color: white; font-size: 1em;"><div>Food</div></a>
        </div>
        <div class="container">
            <div class="left">
                <div style="width: 80%;margin-left: 10em;">
                    <h1 style="font-size: 6em;margin-bottom: 0.2em;color: #f67100;font-family: inherit">About Me</h1>
                    <p style="font-weight: bold;">EMAIL</p>
                    <p class="pz">manhvvhe160603@fpt.edu.vn</p>
                    <p style="font-weight: bold">NAME</p>
                    <p class="pz">Vũ Văn Mạnh</p>
                    <p style="font-weight: bold">PHONE</p>
                    <p class="pz">0353271947</p>
                    <p style="font-weight: bold">FACEBOOK</p>
                    <a style="font-size: 1em;" href="https://www.facebook.com/profile.php?id=100030339231821"><p class="pz">Mạnh Vũ</p></a>
                </div>
            </div>
            <div class="right">
                <div class="under">
                </div>
                <div class="above" style="position: absolute;border-radius: 50%"><img src="Image/manh.jpg" width="500em" alt="alt"/></div>
            </div>
        </div>
        <script>

            function showDropItems(event) {
                var dropItems = document.getElementById("drop-items");
                dropItems.classList.toggle("show");
                var category = event.target;
                var categoryHeight = category.offsetHeight;
                var categoryTop = category.offsetTop;
                var categoryWidth = category.offsetWidth;
                var cateGoryLeft = category.offsetLeft;

                dropItems.style.top = categoryTop + categoryHeight + "px";
                dropItems.style.left = cateGoryLeft + "px";
                dropItems.style.width = categoryWidth + "px";
            }
        </script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>