<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Author Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</head>
<body>
	<script type="text/javascript">
		$(function() {
			if(${check}) {
				swal({
				   title: "접근에러",
				   text: "지점사람들은 이용이 불가능합니다.",
				   type: "error",
				   showCancelButton: false,
				   confirmButtonClass: "btn-primary",
				   confirmButtonText: "확인",
				   closeOnConfirm: false
				 },
				 function(){
					location.href="${pageContext.request.contextPath}/erp";
				 });
			}
		});
	</script>
</body>
</html>