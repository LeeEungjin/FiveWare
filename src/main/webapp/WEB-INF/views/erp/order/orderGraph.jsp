<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<link href="${url}/resources/css/erp/orderGraph.css" rel="stylesheet">
	<c:import url="${url}/resources/temp/ref.jsp"></c:import> 

<title>Insert title here</title>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javascript">
    
    $(function(){
    	console.log(${a});
    });
   	
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ${a}
          
        ]);

        var options = {
          is3D: true,
          fontSize: 20,
          width : 520,
          height : 600,
          pieSliceTest : 'label',
          'chartArea': {'width': '80%', 'height': '80%'},
          'legend': {'position': 'bottom'}
          
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
      
    </script>

</head>
<body>

<c:import url="${url}/resources/temp/headerExample.jsp"></c:import>


<input type="hidden" id="count" value="${count}">

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
   
      <!-- submenu banner -->
      <div id="fw_subbanner">
         자재관리
      </div>
      <!-- submenu banner end -->
      
      <!-- submenu menu -->
         <div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub1" title="sub1">
            기초정보
            <div class="fw_arrow sub1">
               ∧
            </div>
         </div>
         
         <div class="fw_subselected collapse in" id="sub1">
            <ul>
               <li><a href="../foundation/supplier">거래처 등록</a></li>
               <li><a href="../foundation/product">제품 등록</a></li>
               <li><a href="../../foundation/menuRegist">메뉴 등록</a></li>
               <li><a href="../../foundation/storageRegist">창고 등록</a></li>
            </ul>
         </div>
         
         <!-- ----------2---------- -->
            <div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
               구매관리
            <div class="fw_arrow sub2">
               ∨
            </div>
         </div>
         <div class="fw_subsub collapse"  id="sub2">
            <ul>
               <li><a href="../../order/orderRegist">주문 입력</a></li>
               <li><a href="../../erp/order/orderGraph">품목별 주문 현황</a></li>
            </ul>
         </div>
         
         <!-- ----------3---------- -->
         <div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
               자재관리
            <div class="fw_arrow sub3">
               ∨
            </div>
         </div>
         
         <div class="fw_subsub collapse"  id="sub3">
            <ul>
               <li><a href="../../mater/materRegist?materKind=enter">입고 입력</a></li>
               <li><a href="../../mater/materRegist?materKind=rele">출고 입력</a></li>
               <li><a href="../../mater/materRegist?materKind=back">반품 입력</a></li>
               <li><a href="../../mater/materRegist?materKind=confin">불출 입력</a></li>
            </ul>
         </div>
         
         <!-- ----------4---------- -->
         <div class="fw_menu" data-toggle="collapse" data-target="#sub4" title="sub4" >
               	조회
            <div class="fw_arrow sub4">
               	∨
            </div>
         </div>
         
         <div class="fw_subsub collapse"  id="sub4">
            <ul>
               <li><a href="../../erp/into/intoList">조회 및 엑셀 다운</a></li>
            </ul>
         </div>
         
      <!-- submenu menu end -->
   </div>
	<!-- submenu end -->
	
	<!-- --------------------------------------------------------------------------------------------------------------- -->
	
		<div id="fw_mainwrap">
			<div id="fw_main">

			</div>
			
			<div id="fw_main_contents">
			
				<div id="erp_graph_title">
					<div id="graph_icon">icon</div>
					<p id="graph_title">제품별 주문 현황</p>
				</div>
				<div id="erp_graph_sub">
					<div id="sum_title">제품별 주문 현황 그래프</div>
					<div id="avg_title">제품별 평균 주문 수량 및 금액</div>
				</div>
				
				<div id="erp_graph_mid">
				
					<div id="piechart_3d" class="sum_graph">
					</div>
					
					<div class="avg_graph">
					
						<table class="table graph_table">
							<thead>
								<tr>
									<th>제품 코드</th>
									<th>평균 주문 수량</th>
									<th>평균 주문 금액</th>
								</tr>
							</thead>
							
							<tbody>
								
								<c:forEach begin="0" end="${count-1}" step="1" var="i">
									<tr>
										<td>${map.code[i]}</td>
										<td>${map.amount[i]}개</td>
										<td>${map.price[i]}원</td>
									</tr>
								</c:forEach> 
								
							</tbody>
						</table>
					
					</div>	
				</div>
				
				<div id="erp_graph_bottom">
						
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>