<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
	
	<style type="text/css">
		.ej_product_table td:NTH-CHILD(2n-1){
			text-align: right;
		}
		
		.ej_product_table td:NTH-CHILD(2n) {
			text-align: left;	
		}
		
	</style>
</head>
<body>

		<table class="table ej_product_table">
			<tr>
				<td>품목코드</td>
				
				<td>
					<input type="text" name="code">
				</td>
				
				<td>품목명</td>
				
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			
			<tr>
				<td>규격</td>
				
				<td>
					<input type="text" name="standard">
				</td>
				
				<td>가격</td>
				
				<td>
					<input type="text" name="price">
				</td>
			</tr>
			
			<tr>
				<td colspan="1">개요</td>
				
				<td colspan="3">
					<input type="text" name="memo">
				</td>
			</tr>
			
			<tr>
				<td colspan="1">사진</td>
				
				<td colspan="3">
					<input type="file" name="file">
				</td>
			</tr>
		</table>

</body>
</html>