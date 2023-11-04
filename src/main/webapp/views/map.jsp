<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="includes/homeNav.jsp" /> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Google Maps Chart</title>
    
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Include jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Include Google Charts JS -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javascript">
        google.charts.load("current", {
            "packages": ["map"],
            "mapsApiKey": "AIzaSyDGnonPwlfmLTDRaERnMzk5aqnjJHYyzCA"
        });
        
        google.charts.setOnLoadCallback(drawChart);
        
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Lat', 'Long', 'Name'],
                [16.5062, 80.6480, 'Vijayawada'],
                [16.3067, 80.4365, 'Guntur'],
                [16.4419, 80.6226, 'KLU']
            ]);
            
            var map = new google.visualization.Map(document.getElementById('map_div'));
            map.draw(data, {
                showTooltip: true,
                showInfoWindow: true
            });
        }
    </script>
</head>
<body>
   

    <div id="map_div" style="width: 800px; height: 700px; margin: auto;"></div>
</body>
</html>
