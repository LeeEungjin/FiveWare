<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				        
				        <!-- modal contents -->
				        <form action="contestJoin" method="post" id="contestfrm" name="contestfrm" enctype="multipart/form-data">
				        
				        
				        <div class="modal-body1">
							<div class="ar_Viewphoto">
								<img src="D:/arin_1/FiveWare_ar/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/FiveWare/resources/contest/${one.photo}">
							 
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">지점명</span>
							  <input id="ar_store" name="store" type="text" class="form-control" readonly="readonly" value="${one.store }">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴명</span>
							  <input id="ar_menu" name="menuname" type="text" class="form-control" readonly="readonly" value="${one.menuname }">
							</div>
							
							<div class="input-group input-group_modal ar_area" >
							   <div id="area_text"><label class="jh_label" for="comment">레시피</label></div> 
							  <textarea name="recipe" id="ar_recipe" class="form-control form-control_area" readonly="readonly" >${one.recipe }</textarea>
							</div>
							
							<div class="form-group  ar_area">
						      <div id="area_text"><label class="jh_label" for="comment">메뉴설명</label></div> 
						      <textarea id="ar_info" name="account" class="form-control form-control_area"  readonly="readonly">${one.account}</textarea>
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
				      
				      </div>
				    </div>