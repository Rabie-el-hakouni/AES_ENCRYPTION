<%@ page import="com.rabie.aes_encryption.utils.ErrorMsg" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
    if(request.getAttribute("error") == null){
        response.sendRedirect("index.jsp");
        return;
    }

    ErrorMsg error = (ErrorMsg)request.getAttribute("error");


%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AES - Encrypt</title>
    <!-- Compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand text-dark" href="#">AES</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active text-white" aria-current="page" href="index.jsp">Encrypt</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="decrypt.jsp">Decrypt</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container mt-7">
    <div class="row mt-2 mb-3">
        <div class="alert alert-danger" role="alert">
            <h3>Message : <%= error.getMsg() %></h3>
            <% if(error.getTypeError() == "E"){%>
            <a href="index.jsp" class="alert-link">go to Encryption page</a>
            <% } %>
            <% if(error.getTypeError()== "D"){%>
            <a href="decrypt.jsp" class="alert-link">go to Decryption page</a>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>