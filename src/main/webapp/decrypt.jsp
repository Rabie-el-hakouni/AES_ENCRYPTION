<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AES - Decrypt</title>
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
        <div class="col-2">
        </div>
        <div class="col-8">
            <form class="mt-6" method="post" accept-charset="utf-8" action="aes-decryption">
                <div class="mb-3">
                    <label class="form-label">Message (HEX):</label>
                    <textarea class="form-control" required="required"  name="message" placeholder="Entrer le message" rows="3"></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Clé :</label>
                    <input type="text"  required="required" class="form-control" name="key" placeholder="Entrer la clé">
                </div>
                <div class="mb-3">
                    <label class="form-label">La taille de clé:</label>
                    <select class="form-select" required="required" name="size" aria-label="size of key">
                        <option value="128">128</option>
                        <option value="192">192</option>
                        <option value="256">256</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Mode :</label>
                    <select class="form-select" required="required" name="mode" aria-label="Mode de cryptage">
                        <option value="ECB">ECB</option>
                        <option value="CBC">CBC</option>
                    </select>
                </div>
                <div class="col-auto text-center">
                    <button type="submit" class="btn btn-primary mb-3">Decrypt</button>
                </div>
            </form>
        </div>
        <div class="col-2">
        </div>
    </div>
</div>
</body>
</html>