<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/include/signUp-header.jsp" %>
<title>회원 정보 수정 페이지</title>
<!-- 달력 API -->
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>

<script type="text/javascript">
/*[ Fixed Header ]*/
var headerDesktop = $('.container-menu-desktop');
var wrapMenu = $('.wrap-menu-desktop');
$(headerDesktop).addClass('fix-menu-desktop');
$(window).on('scroll', function() {
	if (true) {
		$(headerDesktop).addClass('fix-menu-desktop');
		$(wrapMenu).css('top', 0);
	}
});

</script>
<style type="text/css">
.signup-pages{
  margin-top: 170px;
}

</style>
</head>

<body class="signup-pages">
	<h1>회원 정보 수정</h1>
	<div class="signup-box-body">
		<p class="box-msg">회원 정보 수정</p>
	
            <!-- 수정 폼 양식 -->
            <form:form role="form" name="modifyForm" modelAttribute="modifyRequest" action="${pageContext.request.contextPath }/modifyMyinfo" 
            	method="post" onsubmit="return validate()">
                
                <!-- 아이디 -->
                <div class="form-group has-feedback">
                    <label>아이디</label>
                    <form:input type="text" class="form-control" 
                    	path="id" value="${userInfo.member_id}" readonly="true"/>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                
                <!-- 비밀번호 수정-->
                <div id="old_pw_form">
                	<label>비밀번호 변경</label>
	                <div class="form-group has-feedback">
	                    <input type="password" id="rawPw" class="form-control" placeholder="기존 비밀번호 입력해주세요"/>
	                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	                    <input type="button" class="btn btn-danger" onclick="rawPwCheck()" value="비번체크"/><br/>
	                    <div class="signup-errors" id="raw_pw_check"></div>
	                </div>
                </div>
                
                <div id="new_pw_form" style="display:none">
	                <div class="form-group has-feedback">
	                	<label>새 비밀번호</label>
	                    <form:input type="password" class="form-control" placeholder="영문자,숫자,특수문자를 하나이상 포함하여 8~16자" 
	                    	path="pw" onkeyup="checkpw()" value="${sessionScope.rawPw }" readonly="true" />
	                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	                    <div class="signup-errors" id="pw_rule_check"></div>
	                    <form:errors path="pw" id="pwError" class="signup-errors"/>
	                </div>
	                
	                <!-- 비밀번호 확인 -->
	                <div class="form-group has-feedback">
	                    <form:input type="password" class="form-control" placeholder="비밀번호 확인" 
	                    	path="checkPw" onkeyup="checkpw2()" value="${sessionScope.rawPw }" readonly="true"  />
	                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	                    <div class="signup-errors" id="pw_check"></div>
	                    <form:errors path="checkPw" id="checkPwError" class="signup-errors"/>
	                </div>
                </div>
                
                <!-- 이름 -->
                <div class="form-group has-feedback">
                	<label>이름</label>
                    <form:input type="text" class="form-control" placeholder="이름(필수)" path="name" value="${userInfo.member_name}" readonly="true"/>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                
                <!-- 이메일 -->
                <div class="form-group has-feedback">
                	<label>이메일</label>
  					<form:input type="text" class="form-control" placeholder="이름(필수)" path="email" value="${userInfo.member_email}" readonly="true"/>
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                
                <!-- 생일 -->
                <div class="form-group has-feedback">
	                <label>생년월일</label>
	                <input type="text" name="birth" id="datepicker" placeholder="생년월일(필수)" class="form-control" value="${userInfo.member_birth }" readonly/>
	                <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                </div>
                          
                
                <!-- 주소(카카오API) -->
                <label>우편번호</label>
                <div class="form-group has-feedback">
                	<input type="text" id="postcode" name="postcode" placeholder="우편번호(필수)" class="form-control" style="float:left" value="${userInfo.postcode }">
                	<input type="button" id="postBtn" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btn-danger">
                	<br/>
                	<form:errors path="postcode" id="postcodeError" class="signup-errors"/><br/>
                	<label>주소</label>
                	<input type="text" id="address" name="address" placeholder="주소(필수)" class="form-control" value="${userInfo.address }">
                	<form:errors path="address" id="addrError" class="signup-errors"/><br/>
                	<label>상세주소</label>
                	<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소(필수)" class="form-control" value="${userInfo.detailAddress }">
                	<form:errors path="detailAddress" id="detailAddrError" class="signup-errors"/><br/>
                	<label>참고항목</label>
                	<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" class="form-control" value="${userInfo.extraAddress }">
                	<span class="glyphicon glyphicon-home form-control-feedback"></span>
                	<div id="wrap" style='display:none; border:1px solid; width:500px; height:300px; margin:5px 0; position:relative'>
                		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap"
                			style="cursor:pointer; position:absolute; right:0px; top:-1px; z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                	</div>
                	<div id="map" style="width:300px; height:300px; margin-top:10px; display:none"></div>
                </div>
                
                <!-- 좋아하는 장르 -->
                <form:label path="">좋아하는 장르(선택)</form:label>
                <br/>
                <form:checkboxes items="${genreList}" path="genres" style="display:inline;"/>
                
               
                <div class="row">
                    <div class="col-xs-8">
                    </div>
                    <div class="col-xs-3">
                        <button type="submit" class="btn btn-style">수정</button>
                        <a class="btn btn-danger" href="${pageContext.request.contextPath }/">취소</a>
                    </div>
                </div>
                <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
            </form:form>
               
        </div>
         
<script>	
	//에러 메시지 지우는 이벤트
	$('#pw').focus(function () {
		$('#pwError').remove();
	});
	$('#checkPw').focus(function () {
		$('#checkPwError').remove();
	});
	$('#postBtn').click(function () {
		$('#postcodeError,#addrError').remove();
	});
	$('#detailAddress').focus(function () {
		$('#detailAddrError').remove();
	});
	$('#agree').click(function () {
		$('#agreeError').remove();
	});
	
	//비밀번호 수정 기능
	
	var pwChange = false;//비밀번호 수정을 하였는지 여부
	function rawPwCheck(){
		var rawPw = $("#rawPw").val();
		var pw = $("#pw").val();
		if(rawPw == pw){
			$("#old_pw_form").hide();
			$("#new_pw_form").show();
			$("#pw").val("").removeAttr("readonly");
			$("#checkPw").val("").removeAttr("readonly");
			$("#pw").focus();
			pwChange=true;//수정 선택완료
		}else{
			$("#raw_pw_check").html("비밀번호가 일치하지 않습니다")
		}
	}
	
	
	//비밀번호 체크
	function checkpw(){
		var passwordRule = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
		var pw = $('#pw').val();
		var pw2 = $('#checkPw').val();
		var orgPw = "${sessionScope.rawPw}";
		
		if(!passwordRule.test(pw)){
			$('#pw_rule_check').html("영문자,숫자,특수문자를 하나이상 포함하여 8~16자로 입력하세요")
			if(pw=="") $('#pw_rule_check').empty();
		}else if(passwordRule.test(pw)){
			$('#pw_rule_check').empty();
		}
		if(pw==pw2){
			$('#pw_check').empty();
		}else if (pw2 != "" && pw!=pw2){
			$('#pw_check').html("비밀번호가 일치하지 않습니다.");
		}
		if(pw==orgPw){
			$('#pw_rule_check').html("기존 비밀번호와 같습니다")
		}else if(pw!=orgPw){
			$('#pw_rule_check').empty();
		}
	}
	function checkpw2(){
		var pw = $('#pw').val();
		var pw2 = $('#checkPw').val();
		if(pw==pw2){
			$('#pw_check').empty();
		}else{
			$('#pw_check').html("비밀번호가 일치하지 않습니다.");
		}
	}
	
	//유효성 검사
	function validate(){
		var passwordRule = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
		var pw = $('#pw').val();
		var pw2 = $('#checkPw').val();
		var orgPw = "${sessionScope.rawPw}";
		
		if(!passwordRule.test(pw)){
			alert("비밀번호를 확인해주세요")
			return false;
		}
		
		if (pw!=pw2){
			alert("비밀번호를 확인해주세요")
			return false;
		}
		
		if(pwChange){
			if(pw==orgPw){
				alert("기존 비밀번호와 같습니다")
				return false;
			}
		}
	}
	
 	
</script>

<script>
	var element_wrap = document.getElementById('wrap');
	//var element_wrap = $('#wrap');
	
	function foldDaumPostcode(){
		element_wrap.style.display = 'none';
	}
	
	var mapContainer = document.getElementById('map'),// 지도 표시할 div
		mapOption = {
			center: new daum.maps.LatLng(37.537187, 127.005476),//지도 중심 좌표
			level: 5 //지도 확대 레벨
		};
	
	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
		position: new daum.maps.LatLng(37.537187, 127.005476),
		map: map
	});
	
	function execDaumPostcode(){
		var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
		new daum.Postcode({
			oncomplete: function (data) {
				//검색결과 항목을 클릭했을때 실행할 코드
				
				//내려오는 변수가 값이 없는 경우엔 공백값을 가지므로, 이를 참고하여 분기
				var addr = '';//주소변수
				var extraAddr = ''; //참고항목 변수
				
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if(data.userSelectedType === 'R'){//사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				}else{//사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				
				//사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합
				if(data.userSelectedType === 'R'){
					// 법정동명이 있을 경우 추가(법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝남
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraAddr += (extraAddr !== '' ? ',' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraAddr !== ''){
						extraAddr = ' ('+extraAddr+')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					//$('#extraAddress').value(extraAddr);
					document.getElementById('extraAddress').value = extraAddr;
				}else{
					//$('#extraAddress').value('');
					document.getElementById('extraAddress').value = '';
				}
				
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				//$('#postcode').value(data.zonecode);
				document.getElementById('postcode').value = data.zonecode;
				//$('#address').value(addr);
				document.getElementById('address').value = addr;
				
				//주소로 상세 정보를 검색
				geocoder.addressSearch(data.address, function (results, status) {
					//정상적으로 검색이 완료되면
					if(status === daum.maps.services.Status.OK){
						var result = results[0]; //첫번째 결과의 값을 활용
						
						//해당 주소에 대한 좌표를 받아서
						var coords = new daum.maps.LatLng(result.y, result.x);
						//지도를 보여준다.
						mapContainer.style.display = "block";
						map.relayout();
						//지도 중심을 변경
						map.setCenter(coords);
						//마커를 결과값으로 받은 위치로 옮긴다
						marker.setPosition(coords);
					}
				})
				// 커서를 상세주소 필드로 이동한다.
				//$('#detailAddress').focus();
				document.getElementById('detailAddress').focus();
				
				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용하면 아래코드를 제거해야 화면에서 사라지지 않는다.)
				element_wrap.style.display = 'none';
				
				// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
				document.body.scrollTop = currentScroll;
			},
			// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성
			// iframe을 넣은 element의 높이값을 조정
			onresize : function(size){
				element_wrap.style.height = size.height+'px';
			},
			width : '100%',
			height : '100%'
		}).embed(element_wrap);
		
		// iframe을 넣은 element를 보이게 한다.
		element_wrap.style.display = 'block';
	}
</script>


</body>
</html>