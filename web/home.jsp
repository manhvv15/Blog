<%-- 
    Document   : home
    Created on : Feb 16, 2023, 10:29:18 AM
    Author     : dmngh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="CSS/home.css"/>
        <script>
        </script>
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
                        <form action="search">
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
            <center>
                <div style="" class="content">
                    <p>Chia sẻ về những đồ ăn, thức uống ngon</p>
                    <c:if test="${checkAdminAccount}">
                        <a style="color: white;" href="${(account!=null) ? "newPost":"login"}"><button id="newPost-button">
                                <span class="text">New Post</span>
                            </button></a>
                        </c:if>
                </div>
            </center>
            <div class="list">
                <c:forEach var="i" items="${data}">
                    <c:if test="${i.isDrink()}">
                        <a href="drink?id=${i.getId()}">
                            <div class="list-item">
                                <img src="${i.getImage()}" alt=""/>
                                <h4>${i.getTitle()}</h4>
                            </div>
                        </a>
                    </c:if>
                    <c:if test="${i.isFood()}">
                        <a href="food?id=${i.getId()}">
                            <div class="list-item">
                                <img src="${i.getImage()}" alt=""/>
                                <h4>${i.getTitle()}</h4>
                            </div>
                        </a>
                    </c:if>
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
                dropItems.style.width = categoryWidth + "px";
            }
        </script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
