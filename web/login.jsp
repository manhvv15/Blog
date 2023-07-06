<%-- 
    Document   : login
    Created on : Mar 13, 2023, 9:11:47 PM
    Author     : dmngh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/login.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,600,0,0" />
        <title>Login</title>
    </head>

    <body>

        <div class="login-card-container">
            <div class="login-card">
                <div class="login-card-logo">
                    <img src="Image/logo.png" alt="logo">
                </div>
                <div class="login-card-header">
                    <h1>Sign In</h1>
                    <div>Please login to to post new articles</div>
                </div>
                <form action="login" method="POST" class="login-card-form">
                    <div class="form-item">
                        <span class="form-item-icon material-symbols-rounded">mail</span>
                        <input type="text" name="username" placeholder="Enter Username" id="emailForm" 
                               autofocus required>
                    </div>
                    <div class="form-item">
                        <span class="form-item-icon material-symbols-rounded">lock</span>
                        <input type="password" name="password" placeholder="Enter Password" id="passwordForm"
                               required>
                    </div>
                    <button type="submit">Sign In</button>
                </form>
                <h4>${err}</h4>
            </div>
        </div>
    </body>
</html>
