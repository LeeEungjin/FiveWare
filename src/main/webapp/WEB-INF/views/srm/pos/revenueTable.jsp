<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/srm/pos/revenueTable.css" rel="stylesheet">

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
	
$(function(){
	console.log(${todayMoney});
});

	if(${kind=="today"}){
		
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	
	   function drawChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['Task', 'Hours per Day'],
	          ${todayMoney}
	          
	        ]);

	        var options = {
	          is3D: true,
	          fontSize: 15,
	          width : 520,
	          height : 400,
	          pieSliceTest : 'label',
	          'chartArea': {'width': '80%', 'height': '80%'},
	          'legend': {'position': 'bottom'}
	          
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('ar_graphWrap'));
	        chart.draw(data, options);
	      }
	      
	}else if(${kind=="week"}){
		 google.charts.load('current', {'packages':['line']});
	      google.charts.setOnLoadCallback(drawChart);

	    function drawChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('number', '일주일 전 매출');
	      data.addColumn('number', 'date');

	      data.addRows([
	      
	      ]);

	      var options = {
	        chart: {
	          title: 'Box Office Earnings in First Two Weeks of Opening',
	          subtitle: 'in millions of dollars (USD)'
	        },
	        width: 900,
	        height: 500
	      };

	      var chart = new google.charts.Line(document.getElementById('ar_graphWrap'));

	      chart.draw(data, google.charts.Line.convertOptions(options));
	    }
	}else if(${kind=="month"}){
		
	}

</script> 
</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

<div id="fw_container">
	<!-- submenu -->
	

	<div id="fw_mainwrap">
			<div id="fw_main">
				main Title
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">매출현황</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
				
			<form action="revenueTable" method="GET">
				<div class="ar_plusSearch">
					날짜  <input type="date" name="regdate" id="ar_psearch" value="${todayd }">
					<input type="submit" value="검색" id="ar_psearchBtn">
				</div>
			</form>
			</div>
			
			<div id="ar_graphWrap">
			
			</div>
			
			<div id="ar_graphdate">
				<a href="./revenueTable?kind=week&regdate=${todayd }">일주일 전</a>
				<a href="./revenueTable?kind=month&regdate=${todayd }">한달 전</a>
			</div>
			
			<div class="ar_plusDivWrap">
				<table class="table">
						   
						<thead id="eb_table_head" class="eb_table_head" >
						    <tr>
						     <th>지점명</th>
						     <th>날짜</th>
						     <th>상품명</th>
						     <th>판매개수</th>	
						     <th>상품당 매출</th>					   
						    </tr>
						 </thead>
						    
					    <tbody id="eb_result">
						   <c:forEach items="${list }" var="i">
							   	<tr>
								     <th>${i.store }</th>
								     <th>${i.regdate }</th>
								     <th>${i.product }</th>
								     <th>${i.salesAmount }</th>	
								     <th>${i.productSales }</th>					   
							    </tr>
						   </c:forEach>
						   </tbody> 
					 </table>
			</div>
			
			<div class="ar_plusButtonWrap">
			</div>
			
			
	</div>
</div>

</body>
</html>