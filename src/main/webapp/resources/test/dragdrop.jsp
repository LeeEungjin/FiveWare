<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript">
	$(function () {
	     var obj = $("#dropzone");

	     obj.on('dragenter', function (e) {
	          e.stopPropagation();
	          e.preventDefault();
	          $(this).css('border', '2px solid #5272A0');
	     });

	     obj.on('dragleave', function (e) {
	          e.stopPropagation();
	          e.preventDefault();
	          $(this).css('border', '2px dotted #8296C2');
	     });

	     obj.on('dragover', function (e) {
	          e.stopPropagation();
	          e.preventDefault();
	     });

	     obj.on('drop', function (e) {
	          e.preventDefault();
	          $(this).css('border', '2px dotted #8296C2');

	          var files = e.originalEvent.dataTransfer.files;
	          
	          console.log(files);
	          
	          if(files.length < 1)
	               return;

	          F_FileMultiUpload(files, obj);
	     });

	});
	
	function F_FileMultiUpload(files, obj) {
	     if(confirm(files.length + "개의 파일을 업로드 하시겠습니까?") ) {
	         var data = new FormData();
	         for (var i = 0; i < files.length; i++) {
	            data.append('file', files[i]);
	         }

	         var url = "../../ajax/drapAndDrop";
	         $.ajax({
	            url: url,
	            method: 'post',
	            data: data,
	            //dataType: 'json',
	            processData: false,
	            contentType: false,
	            success: function(data) {
	            	alert("success!!");
	            	console.log(data);
	            	F_FileMultiUpload_Callback(data);
	            	
	            },
	            error: function() {
	            	alert("error");
	            }
	         });
	     }
	}

	// 파일 멀티 업로드 Callback
	function F_FileMultiUpload_Callback(files) {
	    var result = document.getElementById('result');
	    alert(result);
		for(var i=0; i < files.length; i++){
		    var img = document.createElement('img');
		    img.setAttribute("src", "../product/"+files[i]);
		    img.setAttribute("width", "200px");
		    img.setAttribute("height", "200px");
		    result.appendChild(img);
		}
	}

	</script>

<title>Insert title here</title>
<style>
    #dropzone
    {
        border:2px dotted #3292A2;
        width:90%;
        height:50px;
        color:#92AAB0;
        text-align:center;
        font-size:24px;
        padding-top:12px;
        margin-top:10px;
    }
</style>

</head>
<body>

	<div id="dropzone">Drag & Drop Files Here</div> 
	<div id="result"></div>

</body>
</html>