<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		.chartContainer{
		padding-top: 50px;
		padding-left: 50px;
		padding-right: 50px;
		
	}
	
	.card {
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	.pageTitle{
		margin-top: 30px;
		margin-left: 30px;
	}

</style>
</head>
<body>
	<div class="chartContainer">
		<div class="pageTitle">
			<h1>창고 재고 변화 추이</h1>
		</div>
		<div class="card">
			<div id="curve_chart" style="width: 900px; height: 500px"></div>
		</div>
		
	</div>
</body>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ]);

        var options = {
          title: '일별 창고 재고 추이',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
</script>
</html>