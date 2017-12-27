<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		var menu = true;
		$("#ej_menu").click(function(){
			if(menu) {
				menu = false;
				$("#ej_sidebar").css("width", "3.05%");
				$("#fw_container").css("width", "95.95%");
				$("#ej_icon_contents").hide();
			} else {
				menu = true;
				$("#ej_sidebar").css("width", "10%");
				$("#fw_container").css("width", "89%");
				$("#ej_icon_contents").show();
			}
		});
	});
	
</script>

<style type="text/css">
	* {
		margin: 0;
		padding: 0;
	}
</style>

<title>Insert title here</title>
	<style type="text/css">
		#ej_sidebar {
			width: 10%;
			overflow: hidden;
			background-color: black;
			border: 1px solid black;
		}
		
		.ej_sidebar_contents {
			height: 100%;
		}
		
		.ej_home {
			display: block;
			padding-left: 8px;
		    height: 56px;
		    text-indent: -9999px;
		    background: url(../images/sidebar/quick_bg.png) no-repeat right 19px;
		}
		
		#ej_menu {
			padding-left: 8px; 
		}
		
		.ej_icon {
		    display: inline-block;
		    height: 15px;
		    width: 47px;
		    vertical-align: -2px;
		    background: url(../images/sidebar/quick_bg.png) no-repeat right -51px;
		}
		
		.ej_sidebar_contents p{
			background-color: white;
			border: none;
			padding: 10px 5px;
		}
		
		/* 로그아웃 */
		
		/* 메뉴리스트 */
		.ej_sidebar_nav {
			overflow: hidden;
		    padding-top: 50px;
		}
		
		.ej_sidebar_nav ul {
			margin: 0;
			padding: 8px 0 8px 8px;
		}
		
		/* 메뉴리스트 - images */
		
		.ej_sidebar_menu {
			display: block;
		    height: 40px;
		    margin-top: 4px;
		    line-height: 40px;
		    padding-left: 50px;
		    white-space: nowrap;
		    color: #fff;
		    background-image: url(../images/sidebar/quick_product.png);
		    background-repeat: no-repeat;
		}
		
		.ej_notice {
	        background-position: 0 -80px;
		}
		
		.ej_account {
		    background-position: 0 -400px;
		}
		
		.ej_sales {
		    background-position: 0 -720px;
		}
		
		.ej_resource {
		    background-position: 0 -320px;
		}
		
		.ej_calendar {
			background-position: 0 -120px;
		}
		
		.ej_facing {
		    background-position: 0 -840px;
		}
		
		.ej_address {
		    background-position: 0 -280px;
		}
		
		.ej_organization {
		    background-position: 0 -240px;
		}
	</style>

</head>
<body>

	<!-- header -->
	<div id="ej_sidebar" style="float: left;">
		<div class="ej_sidebar_contents">
			<p>
				<a href="#" title="home">
					<span class="ej_home"></span>
				</a>
			</p>	
			
			<p>
				<a id="ej_menu">
					<span class="ej_icon"></span> <span id="ej_icon_contents">전체메뉴</span>
				</a>
			</p>
		</div>
		
		<div class="ej_info_logout">
            <ul class="ej_user_info">
                <li id="ej_userImg" class="ej_per"></li>
            </ul>
        </div>
		
		
		<div class="ej_sidebar_nav">
			<ul id="ej_menuList">
				<li class="productMenu menuTooltip" title="공지">
					<a href="#">
						<span class="ej_sidebar_menu ej_notice">공지</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="회계">
					<a href="#">
						<span class="ej_sidebar_menu ej_account">회계</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="영업/구매">
					<a href="#">
						<span class="ej_sidebar_menu ej_sales">영업/구매</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="인사">
					<a href="#">
						<span class="ej_sidebar_menu ej_resource">인사</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="일정">
					<a href="#">
						<span class="ej_sidebar_menu ej_calendar">일정</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="쪽지">
					<a href="#">
						<span class="ej_sidebar_menu ej_facing">쪽지</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="주소록">
					<a href="#">
						<span class="ej_sidebar_menu ej_address">주소록</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="조직도">
					<a href="#">
						<span class="ej_sidebar_menu ej_organization">조직도</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- header -->
	<div id="fw_container" style="float: left; width :89%; height:500px; background-color: lightblue;">
		
	</div>

</body>
</html>