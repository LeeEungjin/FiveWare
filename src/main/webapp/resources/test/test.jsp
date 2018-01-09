<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">

	* {
	    box-sizing: border-box;
	}
	
	.erp_ej_inputText{
	    width: 100%;
	    padding: 12px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	    resize: vertical;
	}
	
	.erp_ej_label {
	    padding: 12px 12px 12px 0;
	    display: inline-block;
	}
	
	.erp_ej_btn {
	    background-color: #4CAF50;
	    color: white;
	    padding: 12px 20px;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    float: right;
	}
	
	.erp_ej_btn:hover {
	    background-color: #45a049;
	}
	
	.erp_ej_container {
	    border-radius: 5px;
	    background-color: #f2f2f2;
	    padding: 20px;
	}
	
	.erp_ej_col-25 {
	    float: left;
	    width: 25%;
	    margin-top: 6px;
	}
	
	.erp_ej_col-75 {
	    float: left;
	    width: 75%;
	    margin-top: 6px;
	}
	
	/* Clear floats after the columns */
	.erp_ej_row:after {
	    content: "";
	    display: table;
	    clear: both;
	}
	
	/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
	@media (max-width: 600px) {
	    .erp_ej_col-25, .erp_ej_col-75, input[type=submit] {
	        width: 100%;
	        margin-top: 0;
	    }
	}

</style>
<title>Insert title here</title>
</head>
<body>

	<!-- MODAL 창!!!! 여기!!!! -->

	<div class="erp_ej_container">
	 <form action="/////////////////" method="POST">
	 
	 	<!-- 거래처 분류 Classification -->
	 	<div class="erp_ej_row">
		  <div class="erp_ej_col-25">
		    <label class="erp_ej_label" for="country">Country</label>
		  </div>
		  <div class="erp_ej_col-75">
		    <select id="country" name="classification" class="erp_ej_inputText">
		      <option value="/////">매출서</option>
		      <option value="/////">매입서</option>
		      <option value="/////">매출 및 매입서</option>
		      <option value="/////">일반 거래처</option>
		    </select>
		  </div>
		</div>
	 
	 	<!-- 거래처명 Name -->
		<div class="erp_ej_row">
		  <div class="erp_ej_col-25">
		    <label for="name">Name</label>
		  </div>
		  <div class="erp_ej_col-75">
		    <input type="text" id="name" name="name" class="erp_ej_inputText" placeholder="Supplier name..">
		  </div>
		</div>
		
		<!-- 사업자번호 Business Number -->
		<div class="erp_ej_row">
		  <div class="erp_ej_col-25">
		    <label for="business_number">Business Number</label>
		  </div>
		  <div class="erp_ej_col-75">
		    <input type="text" id="business_number" name="business_number" class="erp_ej_inputText" placeholder="Your business number..">
		  </div>
		</div>
		
		<!-- 대표자 Representative -->
		<div class="erp_ej_row">
		  <div class="erp_ej_col-25">
		    <label for="representative">Representative</label>
		  </div>
		  <div class="erp_ej_col-75">
		    <input type="text" id="representative" name="representative" class="erp_ej_inputText" placeholder="Representative name..">
		  </div>
		</div>
		
		<!--  담당자 division -->
		<div class="erp_ej_row">
		  <div class="erp_ej_col-25">
		    <label for="division">Division</label>
		  </div>
		  <div class="erp_ej_col-75">
		    <input type="text" id="division" name="division" class="erp_ej_inputText" placeholder="Division name..">
		  </div>
		</div>
		
		<!-- 담당자 메일 division_mail -->
		<div class="erp_ej_row">
		  <div class="erp_ej_col-25">
		    <label for="division_mail">Division Mail</label>
		  </div>
		  <div class="erp_ej_col-75">
		    <input type="text" id="division_mail" name="division_mail" class="erp_ej_inputText" placeholder="Division Mail..">
		  </div>
		</div>
		
		<!--  은행명 bank -->
		<div class="erp_ej_row">
		  <div class="erp_ej_col-25">
		    <label for="bank">Bank</label>
		  </div>
		  <div class="erp_ej_col-75">
		    <input type="text" id="bank" name="bank" class="erp_ej_inputText" placeholder="Bank name..">
		  </div>
		</div>
		
		<!--  계좌번호 account_number -->
		<div class="erp_ej_row">
		  <div class="erp_ej_col-25">
		    <label for="account_number">Account Number</label>
		  </div>
		  <div class="erp_ej_col-75">
		    <input type="text" id="account_number" name="account_number" class="erp_ej_inputText" placeholder="Account number..">
		  </div>
		</div>
		
		
		<div class="erp_ej_row">
		  <input type="submit" value="Write" class="erp_ej_btn">
		</div>
		
	  </form>
	</div>

</body>
</html>