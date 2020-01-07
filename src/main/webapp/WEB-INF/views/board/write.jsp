<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!--  상단메뉴바 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<script>
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

	$(document).ready(function() {
		$('#summernote').summernote({
			height : 500, // set editor height
			lang : 'ko-KR',
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true,
			placeholder: '카테고리에 맞는 글을 작성해주세요, 주제와 말머리가 해당 게시판과 다를경우 불이익이 생길 수 있습니다.',
		// set focus to editable area after initializing summernote
		});
	});

	$(document).ready(function() {
		$('#summernote').summernote();
	});
	
	
	function goWrite(frm) {
		var title = frm.mboard_title.value;
		var content = frm.mboard_content.value;
		var header = frm.mboard_header.value;
		
		if (header.trim() == ''){
			alert("장르를 선택해주세요");
			return false;
		}
		
		if (title.trim() == ''){
			alert("제목을 입력해주세요");
			return false;
		}
		
		if (content.trim() == ''){
			alert("내용을 입력해주세요");
			return false;
		}
		
		frm.submit();
	}
	
	function header(){
		
    	var header = $("#mboard_header");
    	var target = document.getElementById("header_select");
    	var target2 = target.options[target.selectedIndex].text;
    	
    	header.val(target2);
    }
	function bbsHeader(){
		var board_sort = $("#board_sort");
    	var target = document.getElementById("bbs_select");
    	var target2 = target.options[target.selectedIndex].text;

    	board_sort.val(target2);
	}
</script>


<style>
.container {
  margin-top: 70px;
  padding-top: 10px;
}

#summernote {
  margin-top: 70px;
  padding-top: 10px;
}

#bbs_select {
  height: 25px;
  width: 200px;
  font-size: 15px;
}

#header_select {
  height: 25px;
  width: 200px;
  font-size: 15px;
}

.mboard_title {
  margin-top: 5px;
  padding: 10px;
  width: 100%; height : 30px;
  border: solid 1px;
  height: 30px;
}
</style>
</head>
<body>
	<div class="container">
		<form method="post" action="/insert">
		<input id="board_sort" name="board_sort" type="hidden"/>
		<select id="bbs_select" onchange="bbsHeader()">
			<option value="MovieBoard">영화게시판</option>
			<option value="FreeBoard">자유게시판</option>
			<option value="QnABoard">문의게시판</option>
		<%-- <c:if test="${userInfo.member_no == 0}">
			<option value="notice">공지사항</option>
		</c:if> --%>
		</select>
		<c:if test="${userInfo.member_no != 0}"> <!-- 일반 회원 세션 -->
		<input id="mboard_header" name="mboard_header" type="hidden"/> 
		<select id="header_select" onchange="header()">
			<option value="장르선택">[장르선택]</option>
			<option value="액션">[액션]</option>
			<option value="드라마">[드라마]</option>
			<option value="로멘스">[로멘스]</option>
			<option value="스릴러">[스릴러]</option>
			<option value="미스테리">[미스테리]</option>
			<option value="공포">[공포]</option>
			<option value="코메디">[코메디]</option>
			<option value="범죄">[범죄]</option>
			<option value="전쟁">[전쟁]</option>
			<option value="어드벤처">[어드벤처]</option>
			<option value="SF">[SF]</option>
			<option value="애니메이션">[애니메이션]</option>
		</select>
		</c:if>
		<c:if test="${userInfo.member_no == 0}"> <!-- 게시판 관리자 세션 들어가야함 -->
		<input id="mboard_header" name="mboard_header" type="hidden"/> 
		<select id="header_select" onchange="header()">
			<option value="장르선택">[말머리선택]</option>
			<option value="공지">공지</option>
		</select>
		</c:if>
		<input class="member_no" name="member_no" type="hidden" value="${userInfo.member_no}" />
		<input class="mboard_title" name="mboard_title" type="text" placeholder="제목을 입력해주세요" />
		<textarea id="summernote"  name="mboard_content"></textarea>
		<div style="text-align: center;">
			<button type="button" class="btn btn-primary RbtSave" id="btnSave" onclick="goWrite(this.form)">확인</button>
			<button type="reset" class="btn btn-danger RbtReset" id="btnreset" onClick="history.go(-1)">취소</button>
		</div>
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
		</form>
	</div>



</body>
</html>