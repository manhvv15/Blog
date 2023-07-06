<%-- 
    Document   : showDrink
    Created on : Mar 13, 2023, 8:55:36 PM
    Author     : dmngh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/home.css"/>
    </head>
    <body>
        <div class="all">
            <div class="top-menu-bar">
                <div class="menu-bar-left">
                    <a href="home"><div class="menu-item">Home</div></a>
                    <label id="category" onclick="showDropItems(event)"><div class="menu-item">Category</div></label>
                    <a href="contact.jsp"><div class="menu-item">Contact</div></a>
                </div>
                <div class="menu-bar-right">
                    <div>
                        <form action="search?category=food">
                            <input id="input-search" type="text" placeholder="Search.." name="search">
                            <button id="search-button" type="submit"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                    <c:if test="${sessionScope.account == null}">
                        <a href="login"><div class="menu-item">Login</div></a>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                        <a href="logout"><div class="menu-item">Logout</div></a>
                    </c:if>
                </div>
            </div>
            <div id="drop-items">
                <a href="drink" style="color: white; font-size: 1em;"><div>Drink</div></a>
                <a href="food" style="color: white; font-size: 1em;"><div>Food</div></a>
            </div>
            <div class="list">
                <c:forEach var="i" items="${data}">
                    <a href="food?id=${i.getId()}">
                        <div class="list-item">
                            <img src="${i.getImage()}" alt=""/>
                            <h4>${i.getTitle()}</h4>
                        </div>
                    </a>
                </c:forEach>
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
