<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title> N LadderGame</title>
	<style>
	.line{
		border-style:solid;
		border-width:2px;
		border-color:black;
	}

	//가로줄
	.bridge{
		border-style:solid;
		border-width:2px;
		border-color:white white black white;

	}
	</style>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script>

	var gamer; //게임인원
	var gamerList = [];
	var gamerListTemp = [];
	var size;

	$(document).ready(function(){
		/* 게임조건 세팅 */
		while (gamer === undefined || gamer < 2) {
			gamer = window.prompt("몇명?", "");
		}

		gamer = parseInt(gamer);
		size = 80/gamer;

		var inputArea = $("<div style='width:100%;' align='center' valign='center'></div>")
		for (var i=0; i<gamer; i++) {
			inputArea.append((i + 1) + "번 <input type='text' name='gamer'/><br/>");
		}
		inputArea.append("<button id='resetName' style='width:100px;'>모두지우기</button>");
		inputArea.append("<button id='enterName' style='width:100px;'>입력완료</button>");
		inputArea.appendTo("body");

		$("#resetName").bind("click", resetName);
		$("#enterName").bind("click", enterName);
	});

	function resetName () {
		$("[name=gamer]").val("");
	}

	function enterName () {
		$("[name=gamer]").each(function(){
			gamerList.push($(this).val());
		});

		setLadder();
	}

	function setLadder() {
		/* body 초기화 */
		$("body").html("");

		/* 폭탄세팅 */
		var bomb = $("<div style='width:100%;' align='center' valign='center'></div>");

		for (var i=1; i<=gamer; i++) {
			var button = $("<span style='display:inline-block; width:" + size + "%; padding:0px; margin:0px;'><button value='" + i + "'>폭탄</button></span>");
			button.appendTo(bomb);
		}
		bomb.appendTo("body");
		$("button").bind("click", choiceBomb);

		/* 사다리 그리기 */
		var ladder = $("<div style='width:100%;' align='center' valign='center'></div>");

		for (var i=0; i<gamer; i++) {
			var line = $("<div style='display:inline-block; padding:0px; margin:0px;' id='line" + i + "'></div>");		
			
			for (var j=0; j<gamer+5; j++) {
				line.append("<div style='width:0px; height:60px;' class='line'></div>");
			}
			line.appendTo(ladder);

			var bridge = $("<div style='display:inline-block; width:" + size + "%; padding:0px; margin:0px;' id='bridge" + i + "'></div>");

			if (i<gamer-1) {
				for (var j=0; j<gamer+5; j++) {
					bridge.append("<div style='width:100%; height:60px;'></div>");
				}
				bridge.appendTo(ladder);
			}
		}
		ladder.appendTo("body");

		/* 이름세팅 */
		var gamerArea = $("<div style='width:100%;' align='center' valign='center'></div>");

		for (var i=0; i<gamer; i++) {
			var targetNumber = Math.floor(Math.random() *  gamerList.length);
			var remain = gamerList.length;

			for (var j=0; j<remain; j++) {
				if (j === targetNumber) {
					gamerArea.append("<span style='display:inline-block; width:" + size + "%; padding:0px; margin:0px;'>" + gamerList.pop() + "</span>");
				} else {
					gamerListTemp.push(gamerList.pop());
				}
			}

			while (true) {
				var temp = gamerListTemp.pop();
				if(temp === undefined) {
					break;
				}
				gamerList.push(temp);
			}
		}
		gamerArea.appendTo("body");
	}

	function choiceBomb () {
		var choiceNumber = $(this).attr("value");

		$("button").each(function(){
			if (parseInt($(this).attr("value")) === parseInt(choiceNumber)) {
				return true;
			}
			$(this).css("display", "none");
		});

		setBridge ();
	}

	function setBridge () {
		var tempArray = [];
		var randomNumber;

		for (var i=0; i<gamer-1; i++) {
			for (var j=0; j<gamer+5; j++) {
				randomNumber = Math.floor(Math.random() *  2);

				$("#bridge" + i + " > div:eq(" + j + ")").attr("value", randomNumber);

				if (i === 0) {
					if (j === gamer+4) {
						randomNumber = 0;
					}
					tempArray.push(randomNumber);
				} else {
					if (tempArray[j] === 1 || j === gamer+4) {
						randomNumber = 0;
					}
					tempArray[j] = randomNumber;
				}

				if (randomNumber === 1) {
					$("#bridge" + i + " > div:eq(" + j + ")").addClass("bridge");
				}
			}
		}
	}
	</script>
</head>
<body>

</body>
</html>