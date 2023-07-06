<%-- 
    Document   : showPost
    Created on : Mar 13, 2023, 2:23:16 PM
    Author     : dmngh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/showPost.css"/>
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

            <div class="content">
                <div class="content-img">
                    <img src="${d.getImage()}" alt="alt"/>
                </div>
                <div class="content-title">
                    <h2>${d.getTitle()}</h2>
                    <c:choose >
                        <c:when test="${d.getVote() == 1}">
                            <h2><ion-icon name="star-outline"></ion-icon></ion-icon></h2>
                                </c:when>
                                <c:when test="${d.getVote() == 2}">
                            <h2><ion-icon name="star-outline"></ion-icon><ion-icon name="star-outline"></ion-icon></h2>
                                </c:when>
                                <c:when test="${d.getVote() == 3}">
                            <h2><ion-icon name="star-outline"></ion-icon><ion-icon name="star-outline"></ion-icon><ion-icon name="star-outline"></ion-icon></h2>
                                </c:when>
                                <c:when test="${d.getVote() == 4}">
                            <h2><ion-icon name="star-outline"></ion-icon><ion-icon name="star-outline"></ion-icon><ion-icon name="star-outline"></ion-icon><ion-icon name="star-outline"></ion-icon></h2>
                                </c:when>
                                <c:when test="${d.getVote() == 5}">
                            <h2><ion-icon name="star-outline"></ion-icon><ion-icon name="star-outline"></ion-icon><ion-icon name="star-outline"></ion-icon><ion-icon name="star-outline"></ion-icon><ion-icon name="star-outline"></ion-icon></h2>
                                </c:when>
                            </c:choose>
                </div>
                <div class="content-info">
                    <p>${d.getContent()}</p>
                </div>
                <c:if test="${checkAdminAccount}">
                    <a href="modifyPost?mod=delete&id=${d.getId()}"><button>Delete</button></a>
                    <a href="modifyPost?mod=update&id=${d.getId()}"><button>Update</button></a>
                </c:if>
                <h2 style="color: blue">Feed back</h2>
                <hr style="height: 3px; background-color: blue">
                <div style="margin-top: 20px; margin-bottom: 20px;">
                    <form action="feedback" method="POST">
                        <input style="display: none;" type="text" name="id" value="${param.id}">
                        <input style="display: none;" type="text" name="category" value="food">
                        <input type="text" placeholder="Your feedback..." name="feedback">
                        <input type="submit" value="Send">
                    </form>
                    <h4 style="red">${err}</h4>
                </div>
                <div class="">
                    <c:if test="${checkAdminAccount}">
                        <h2 style="color: blue">Feedback waiting for censorship</h2>
                        <hr style="height: 3px; background-color: blue;margin-bottom: 20px">
                    </c:if>
                    <c:forEach var="i" items="${listFeedback}">
                        <c:if test="${checkAdminAccount}">
                            <c:if test="${!(i.isStatus())}">
                                <div style="margin-bottom: 20px; box-shadow: 0px 0px 10px #A4A9A9;border-radius: 10px;padding: 10px;">
                                    <div>
                                        <h4><i class="fa fa-user"></i> ${i.getName()}</h4>
                                        <p>${i.getDate()}</p>
                                        <p>${i.getContent()}</p>
                                    </div>
                                    <div style="margin-top: 5px;">
                                        <a style="font-size: 1em;" href="feedback?mod=accept&id=${i.getId()}&pid=${param.id}&url=drink"><button style="margin-left: 10px;height: 30px;width: 80px;font-size: 1em;">Accept</button></a>
                                        <a style="font-size: 1em;" href="feedback?mod=denine&id=${i.getId()}&pid=${param.id}&url=drink"><button style="margin-left: 10px;height: 30px;width: 80px;font-size: 1em;">Denine</button></a>
                                    </div>
                                </div>
                            </c:if>
                        </c:if>
                    </c:forEach>
                    <c:if test="${checkAdminAccount}">
                        <hr style="height: 3px; background-color: blue;margin-bottom: 20px"><br>
                    </c:if>
                </div>
                <div style="margin-top: 20px;" class="">
                    <c:forEach var="i" items="${listFeedback}">
                        <c:if test="${i.isStatus()}">
                            <div style="margin-bottom: 20px; box-shadow: 0px 0px 10px #A4A9A9;border-radius: 10px;padding: 10px;">
                                <div>
                                    <h4><i class="fa fa-user"></i> ${i.getName()}</h4>
                                    <p>${i.getDate()}</p>
                                    <p>${i.getContent()}</p>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
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
