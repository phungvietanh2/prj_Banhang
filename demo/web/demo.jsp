<%-- 
    Document   : demo
    Created on : Oct 8, 2022, 8:27:58 PM
    Author     : phung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="width: 20%">
            <canvas id="myChart1"></canvas>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>

        const data = {
            labels: [
                'Red',
                'Blue',
                'Yellow'
            ],
            datasets: [{
                    label: 'My First Dataset',
                    data: [300, 50, 100],
                    backgroundColor: [
                        'rgb(255, 99, 132)',
                        'rgb(54, 162, 235)',
                        'rgb(255, 205, 86)'
                    ],
                    hoverOffset: 4
                }]
        };
// </block:setup>

// <block:config:0>
        const config = {
            type: 'doughnut',
            data: data,
        };
// </block:config>

        module.exports = {
            actions: [],
            config: config,
        };
    </script>
    <script>
        const myChart = new Chart(
                document.getElementById('myChart1'),
                config
                );
    </script>
</html>
