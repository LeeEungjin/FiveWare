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
	console.log(${monthsum});
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
	          width : 600,
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
	      data.addColumn('string', '일별');
	      data.addColumn('number', '매출');

	      data.addRows([
	      	${sumgraph}
	      ]);

	      var options = {
	        chart: {
	          title: '지난 일주일 간 매출',
	          subtitle: '검색한 날짜를 기준 일주일 전 매출현황'
	        },
	        width : 600,
	          height : 400,
	      };

	      var chart = new google.charts.Line(document.getElementById('ar_graphWrap'));

	      chart.draw(data, google.charts.Line.convertOptions(options));
	    }
	}else if(${kind=="month"}){
		 google.charts.load('current', {'packages':['line']});
	      google.charts.setOnLoadCallback(drawChart);

	    function drawChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '주 별');
	      data.addColumn('number', '매출');

	      data.addRows([
	      	${monthsum}
	      ]);

	      var options = {
	        chart: {
	          title: '지난 한달 간 매출',
	          subtitle: '검색한 날짜 기준 5주 매출현황'
	        },
	        width : 600,
	          height : 400,
	      };

	      var chart = new google.charts.Line(document.getElementById('ar_graphWrap'));

	      chart.draw(data, google.charts.Line.convertOptions(options));
	    }
	}

</script> 
</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

<div id="fw_container">
	<!-- submenu -->
	

	<div id="fw_mainwrap">
			<div id="fw_main">
					<div id="event_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">매출현황</p>
			</div>
			
			<form action="revenueTable" method="GET">
				<div id="erp_jh_event_sub">
						<div id="event_contents">
							<p>　</p>
					날짜  <input type="date" name="regdate" id="ar_psearch" value="${todayd }">
					<input type="submit" value="검색" id="ar_psearchBtn">
					<p>　</p>
					</div>
					<div id="ar_moneyTotal">
				${state } 매출 : ${moneytotal } 
			</div>
				</div>
			</form>
			
			
			
			<div id="ar_graphWrap">
			
			</div>
			
			<div id="ar_graphdate">
				 <ul class="nav nav-pills">
				    <li><a href="./revenueTable?kind=week&regdate=${todayd }">일주일 전</a></li>
				    <li><a href="./revenueTable?kind=month&regdate=${todayd }">한달 전</a></li>
				  </ul>
				
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