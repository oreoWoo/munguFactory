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
		var createMemb = msg.createMemb;//최상위멤버
		var relationMember = msg.groupRelationMember;//리스트

    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Name');//하위그룹
    data.addColumn('string', 'Manager');//상위그룹
    data.addColumn('string', 'ToolTip');//툴팁

    data.addRow([{v:createMemb , f: '<p>'+createMemb+'</p>'+'<div style=" color:#5D5D5D; font-style:bold">그룹장</div>'},'','그룹장']);
    data.addRow([{v:relationMember[0].memberId , f: '<p>'+relationMember[0].memberName+'</p>'+'<div style=" color:#5D5D5D; font-style:bold">그룹원</div>'},createMemb,'']);
    data.addRow([{v:relationMember[1].memberId , f: '<p>'+relationMember[1].memberName+'</p>'+'<div style=" color:#5D5D5D; font-style:bold">그룹원</div>'},createMemb,'']);
     for(var i=2; i < relationMember.length; i++){
    	 data.addRow([{v:relationMember[i].memberId, f: '<p>'+relationMember[i].memberName+'</p>'+'<div style=" color:#5D5D5D; font-style:bold">그룹원</div>'},relationMember[i-1].memberId,'']);
    	 data.addRow([{v:relationMember[1].memberId , f: '<p>'+relationMember[1].memberName+'</p>'+'<div style=" color:#5D5D5D; font-style:bold">그룹원</div>'},relationMember[i-2].memberId,'']);
 	} //v: 연결되는 아이디 값. f: 화면에 보여지는 부분, ['하위그룹','상위그룹Id','']
 	console.log(data);
	
    // Create the chart.
    var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
    // Draw the chart, setting the allowHtml option to true for the tooltips.
    chart.draw(data, {allowHtml:true,nodeClass:'maman'});
	}
	});

	request.fail(function( jqXHR, textStatus ) {
		  alert( "Request failed: " + textStatus );
		});
	
	
	
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
	
	function stockChart() {
		
		$.ajax({
			
			url: "${pageContext.request.contextPath }/user/stocktaking/selectItemStockCnt",
			data: { item_no },
			dataType: "json",
			success: function(result){
				
				drawChart(result);
				
			}
			
		});
		
	}
</script>
</html>