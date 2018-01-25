<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- modal header -->
				       <!--  <div class="modal-header">
				          <button type="button" class="close jh_file_cancel" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">| 공모전 참가</h4>
				        </div> -->
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <form action="contestJoin" method="post" id="contestfrm" name="contestfrm" enctype="multipart/form-data">
				        
				        
				        <div class="modal-body">
				        
				        	<div class="ar_modalTop">
				        		* 등록 시 수정, 삭제가 불가한 점을 참고하여 제출하여 주십시오. <br>
				        		------------------------------------------------<br>
				        	</div>
							
							<div class="input-group input-group_modal">
								<input type="text" name="code" id="ar_contestCode">
							  <span class="input-group-addon">지점명</span>
							  <input id="ar_store" name="store" type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴사진</span>
							  <input id="ar_mphoto" name="menuphoto" type="file" class="form-control"  placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴명</span>
							  <input id="ar_menu" name="menuname" type="text" class="form-control"  placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							   <div id="area_text"><label class="jh_label" for="comment">레시피</label></div> 
							  <textarea name="recipe" id="ar_recipe"></textarea>
							</div>
							
							<div class="form-group">
						      <div id="area_text"><label class="jh_label" for="comment">메뉴에 대해 작성해주세요.</label></div> 
						      <textarea id="ar_info" name="account" class="form-control form-control_area" rows="5"></textarea>
						    </div>
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <input type="button" class="btn btn-default ar_InsertBtn"  value="올리기">
				          <button type="button" class="btn btn-default" data-dismiss="modal">초기화</button>
				        </div>
				       </form>
				      	<!-- modal footer 끝-->