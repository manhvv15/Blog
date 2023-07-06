<%-- 
    Document   : post
    Created on : Mar 13, 2023, 9:23:53 PM
    Author     : dmngh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Post</title>
        <link rel="stylesheet" href="CSS/post.css"/>
    </head>
    <body>
        <div class="all">
            <div class="top-menu-bar">
                <a href="home"><div>Home</div></a>
                <label id="category" onclick="showDropItems(event)"><div>Category</div></label>
                <a href="contact.jsp"><div>Contact</div></a>
            </div>
            <div id="drop-items">
                <a href="drink" style="color: white; font-size: 1em;"><div>Drink</div></a>
                <a href="food" style="color: white; font-size: 1em;"><div>Food</div></a>
            </div>

            <div class="book">
                <form action="modifyPost" method="POST">

                    <div class="cover">
                        <h1>Update Post</h1>
                        <input style="display: none;" type="text" readonly="" name="id" value="${id}">
                        <input class="info" style="font-size: 1.5em; width: 70%;" type="text" placeholder="Title" value="${title}" name="title" required=""><br>
                        <input class="info" type="text" placeholder="Image" value="${image}" name="image" required=""><br>
                        <input class="info" type="number" placeholder="Vote" value="${vote}" name="vote" required=""><br>
                        <input type="radio" name="op" value="drink" checked=""}><label style="color: grey;"> Drink</label> <input type="radio" name="op" value="food"><label style="color: grey;"> Food</label>
                    </div>
                    <h3>${err}</h3>
                    <div class="page">
                        <textarea placeholder="Write Copntent" name="content" value="${content}" required="">${param.content}</textarea>
                    </div>
                    <button type="submit">Post</button>
                </form>
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
                dropItems.style.display = "block";
                dropItems.style.width = categoryWidth + "px";
            }
        </script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
