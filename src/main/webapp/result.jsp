<%@ page import="javax.management.relation.RelationSupport" %>
<%@ page import="com.rabie.aes_encryption.utils.Result" %>
<%@ page import="com.rabie.aes_encryption.utils.Util" %><%--
  Created by IntelliJ IDEA.
  User: rabie
  Date: 19/06/2022
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getAttribute("result") == null){
        response.sendRedirect("index.jsp");
        return;
    }
    Result result = (Result) request.getAttribute("result");
    Util util = null;
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>AES - Result</title>
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
<div class="container mt-6" style="margin-top: 70px;">
    <div class="row ">
        <div class="col-1">
        </div>
        <div class="col-10">
            <div>
                <% if(result.isType() == true){ %>
                    <h1 class="text-primary">Cryptage</h1>
                <% }else if(result.isType() == false) { %>
                    <h1 class="text-primary">Decyptage</h1>
                <%}%>
            </div>
            <div class="alert alert-info" role="alert">

                <form  accept-charset="utf-8" >
                    <div class="mb-3">
                        <% if(result.isType() == true){%>
                        <label>Message Clair</label>
                        <%} else if (result.isType() == false) {%>
                            <label>Message Chiffré</label>
                        <%}%>
                        <input type="text" class="form-control" readonly="readonly"   value="<%= result.getMessage()%>">
                    </div>
                    <div class="mb-3">
                        <label>La clé :</label>
                        <input type="text" class="form-control" readonly="readonly"  value="<%= (String) result.getKey()%>">
                    </div>
                    <div class="mb-3">
                        <% if(result.isType() == true){%>
                        <label>Message Chiffré (HEX):</label>
                        <input type="text" class="form-control"  readonly="readonly"  value="<%= util.bytesToHex(result.getResult())%>">
                        <%} else if (result.isType() == false) {%>
                        <label>Message Clair</label>
                        <input type="text" class="form-control"  readonly="readonly"  value="<%= (String) new String(result.getResult())%>">
                        <%}%>
                        
                    </div>
                    <div class="mb-3">
                        <label>Mode de chiffrement :</label>
                        <input type="text" class="form-control" readonly="readonly"  value="<%= result.getMode()%>">
                    </div>
                    <div class="mb-3">
                        <label>taille du clé :</label>
                        <input type="number" class="form-control" readonly="readonly"  value="<%= result.getSize()*8%>">
                    </div>
                </form>
            </div>
        </div>
        <div class="col-1">
        </div>
    </div>
</div>


</body>
</html>

