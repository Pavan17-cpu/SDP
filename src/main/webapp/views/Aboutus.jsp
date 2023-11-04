<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .pri {
            text-align: center;
        }
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            margin: 0 auto;
            padding: 5px; /* Reduce spacing between columns */
        }
        th, td {
            width: 50%;
        }
        img {
            width: 350px; /* Increase image size */
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: black;">
    <a class="navbar-brand" href="" style="color: white;">EMS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarTogglerDemo01">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="signin" style="color: white;">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="signup" style="color: white;">Signup</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="contactus" style="color: white;">Contactus</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="aboutus" style="color: white;">Aboutus</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/map" style="color: white;">Office</a>
            </li>
        </ul>
    </div>
</nav>

<div class="pri">
    <table class="pri2">
        <tr>
            <th>NAME</th>
            <th>ID</th>
            <th>Email Id</th>
            <th>Contribution</th>
            <th>IMAGE</th>
        </tr>
        <tr>
            <td>S.FAISAL AMANULLA</td>
            <td>2100030521</td>
            <td>2100030521@kluniversity.in</td>
            <td>TEAM LEAD, FRONTEND-jsp,css</td>
            <td><img src="/assets/images/img2.jpg" alt="AMAN" /></td>
        </tr>
        <tr>
            <td>T.MANIKANTA SAI PAVAN</td>
            <td>21000030548</td>
            <td>2100030548@kluniversity.in</td>
            <td>BACKEND-SpringBoot,MySQL</td>
            <td><img src="/assets/images/img1.avif" alt="PAVAN" /></td>
        </tr>
    </table>
</div>

<!-- Include Bootstrap 5 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
