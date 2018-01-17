<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Modal -->
				
				<div class="modal fade" id="ar_positionInsert" role="dialog">
					<form action="positionPlus" method="POST" name="positionFrm">
					    <div class="modal-dialog modal-m">
					      <div class="modal-content">
					      
					      	<!-- modal header -->
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">| 결재선 지정</h4>
					        </div>
					        <!-- modal header 끝-->
					        
					        <!-- modal contents -->
					       
					   <div id="ar_signBigWrap">
					   			<div id="ar_groupChartWrap">
					   				<div id="ar_grouptChartTitle">
					   					<span class="ar_ChartText">조직도</span>
					   				</div>
					   				
					   				<div id ="ar_groupChart">
					   					<div class="ar_diffImg" id="ar_tempDiv"></div>
					   					<div class="ar_conpany">(주)아린카페</div>
					   					<!-- 부서 for문 돌리기 -->
					   					 <div class="ar_tempWrap" id="ar_tempWrap">
					   						<!-- 	<div class="ar_tempLineDiv ar_click">
						   							<div class='ar_plusImg' id='ar_tempDiv'></div>
						   							<div class='ar_conpany'>d</div>
						   							<div class="ar_tempMem"></div>
					   							</div>  -->
					   						</div> 
					   				</div>
					   			</div>
					   			
					   		<div id="ar_signBtnWrap">
					   			<div id="ar_signBtn">
					   				<div id="ar_signok" class="ar_signBtns"><i class="fa fa-angle-right"></i></div>
					   				<div id="ar_signdelete" class="ar_signBtns"><i class="fa fa-angle-left"></i></div>
					   				<div id="ar_signformat" class="ar_signBtns"><i class="fa fa-rotate-left"></i></div>
					   			</div>
					   		</div>
					   		
					   		<div id="ar_signResult">
					   			<div id="ar_grouptChartTitle">
					   					<span class="ar_ChartText">결재선 정보</span>
					   			</div>
					   			
					   			<div id="ar_groupResultTable">
					   				<table id="ar_resultTable" >
					   					<tbody  id="ar_resultTableBody">
						   					<tr >
						   						<td id="ar_tableBlank" class="ar_tabletds ar_end"></td>
						   						<td id="ar_tabletd2" class="ar_tabletds">결재</td>
						   						<td id="ar_tabletd3" class="ar_tabletds">${member.name } 기안 ${member.temp }</td>
						   					</tr>
					   					</tbody>
					   				</table>
					   			</div>
					   			
					   		</div>
					   		
					   	</div>
					   		
					        <!-- modal contents 끝-->
					        
					        <!-- modal footer -->
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="" id="ar_signInsertBtn">등록</button>
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        </div>
					      	<!-- modal footer 끝-->
					      </div>
					    </div>
					    </form>
				  </div>
				<!-- Modal 끝 -->