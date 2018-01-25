// 프로젝트 생성 폼
function insertProjectForm() {
	$("#insertProjectForm").modal();
}
// 프로젝트 생성
function insertProject() {
	var prj_name = $('#prj_name').val();
	var prj_start = $('#prj_start').val();
	var prj_last = $('#prj_last').val();
	var start = new Date(prj_start);
	var last = new Date(prj_last);
	if(prj_name == ''){
		swal('프로젝트명', '입력해주세요');
		return false;
	}else if(prj_name.indexOf(" ") != -1){
		swal('프로젝트명', '공백을 포함 할 수 없습니다');
		return false;
	}else if(prj_name.length > 33){
		swal('프로젝트명', '길이 제한을 벗어났습니다');
		return false;
	}else if(prj_start == ''){
		swal('시작일', '입력해주세요');
		return false;
	}else if(prj_last == ''){
		swal('종료일', '입력해주세요');
		return false;
	}else if(last.getTime()-start.getTime() < 0){
		swal('프로젝트 기간', '시작일이 종료일보다 늦습니다');
		return false;
	}else if((((last.getTime()-start.getTime())/(1000*60*60*24)))+1 > 4000){
		swal('프로젝트 기간', '4000일 초과입니다.');
		return false;
	}
	$('#frmInsertProjcet').submit();
}
// 전체체크
function checkAllDel(bool) {
	var chkVal = document.getElementsByName("chkVal");
	for (var i = 0; i < chkVal.length; i++) {
		chkVal[i].checked = bool;
	}
}
// 프로젝트 삭제
function updateDelProject() {
	var chkVal = document.getElementsByName("chkVal");
	var chk = false;
	for (var i = 0; i < chkVal.length; i++) {
		if(chkVal[i].checked == true){
			chk = true;
			break;
		}
	}
	if(chk){
		$('#frmUpdateDelProject').submit();
	}else {
		swal("프로젝트 삭제", '선택해주세요');
	}
}
// 프로젝트일정 상세 이동
function projectSchdule(prj_no) {
	$("#prj_no").attr('value', prj_no);
	$('#projectSchedule').submit();
}