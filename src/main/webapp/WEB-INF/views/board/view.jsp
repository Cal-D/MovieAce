<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!--  상단메뉴바 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
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
	
	/* 스프링시큐리티 보안에 관한 토큰 */
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	
	$(document).ready(function(){
			listReply2();

    $("#btnComments").click(function(){
    	var mreply_content = $("#mreply_content").val();
    	var member_no = "${userInfo.member_no}";
    	var mboard_no="${dto.mboard_no}"
    	var param="mreply_content="+mreply_content+"&mboard_no="+mboard_no+"&member_no="+member_no;
    	
    	$.ajax({
    		type: "post",
    		beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
    		url: "${path}/reply/insertReply",
    		data: param,
    		success: function(){
    			$("#mreply_content").val("");
    			listReply2();
    		}
    	});
    });
    
  	
    $(".changego").click(function(){
      location.href="${path}/change?mboard_no=${dto.mboard_no}";
    });
    
  });
	
	

	//좋아요
	$(document).ready(function(){
			var mboard_like_cnt = "${dto.mboard_like_cnt}";
	$(".like_btn").click(function like(){
		<% long current_time = System.currentTimeMillis(); %>
		<% session.setAttribute("like_update_time", current_time); %>
		/* alert("${sessionScope.like_current_time}");
		var result = "${sessionScope.like_update_time}" - "${sessionScope.like_current_time}";
		alert(result); */
		
		if("${userInfo.member_no}" == ''){
			alert("로그인후에 가능합니다.");
		}else if("${sessionScope.like_update_time}"-"${sessionScope.like_current_time}">360*1000){
			var mboard_no="${dto.mboard_no}";
			var param="&mboard_no="+mboard_no;
			$.ajax({
	    		type: "post",
	    		beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
	    		url: "${path}/reply/mboard_like",
	    		data: param,
	    		success: function(){ 
	    			mboard_like_cnt = Number(mboard_like_cnt) +1;
	    			$("#like_btn").text(mboard_like_cnt);
	    		}
	    	});
		}else{ 
			alert("추천은 한시간에 한번밖에 안돼");
		 }
    	});
	});
    	
    
    function listReply(){
    	$.ajax({
    		type: "get",
    		url: "${path}/reply/list?mboard_no=${dto.mboard_no}",
    		success: function(result){
    			$("#listReply").html(result);
    		}
    	});	
    }
    function listReply2(){
    	$.ajax({
    		type: "get",
    		url: "${path}/reply/listreplyJson?mboard_no=${dto.mboard_no}",
    		success: function(result){
    			var output = "<table border='1' class='reply'>";
    			for(var i in result){
    				output += "<tr>";
    				output += "<td width='150' height='70' style='background-color: #D4F4FA;'>"+result[i].member_id+"</td>";
    				output += "<td width='650' height='70'>"+result[i].mreply_content+"</td>";
    				output += "<td width='150' height='70'>&ensp;<img class='like' src='resources/img/like.png' onclick='#'>&ensp;"+result[i].mreply_like_cnt+ "&ensp;|&ensp;&ensp;<img class='dislike' src='resources/img/dislike.png' onclick='#'>&ensp;"+result[i].mreply_dislike_cnt+"&ensp;&ensp;<img width='20' height='20' src='resources/img/siren.png' onclick='#'><br>"+result[i].mreply_reg_date+"</td>";
    				output += "</tr>";
    				/* output += "<tr>";
   					output += "<td colspan='3'>&ensp;&ensp;------------------------------------------------------------------------------------------------------------------------------------------------------------------------</td></tr>"; */
    			}

    			output += "</table>";
    			 $("#listReply").html(output);
    		}				
    		
    	})
    }
    function delete2(){
    	var t = confirm("정말 삭제하시겠습니까");
    	if(t){
    		location.href="${path}/delete?mboard_no=${dto.mboard_no}";
    	}
    	
    };
    
    
    $(document).ready(function(){
    	$(".siren").click(function like(){
    	var header = "${dto.mboard_header}";
    	var member_no = "${userInfo.member_no}";
    	if(header == "공지"){
    		alert("공지는 신고 안돼 ㅡㅡ");
    	}else if(member_no == ''){
    		alert("로그인이 필요한 서비스입니다.");
    	}else{
    		var t = confirm("정말 신고하시겠습니까");
    		if(t){
    			var mboard_no="${dto.mboard_no}"
    			var param="&mboard_no="+mboard_no;
    			$.ajax({
    	    		type: "post",
    	    		beforeSend: function(xhr){
    					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    				},
    	    		url: "${path}/reply/mboard_report",
    	    		data: param,
    	    		success: function(){
    	    			location.href="${path}/view?mboard_no=${dto.mboard_no}";
    	    		}
    	    	});
    			}
    		}
        	});
    	});
    

    //날짜 변환 함수

    function changeDate(date){
    	date= new Date(parseInt(date));
    	year = date.getFullYear();
    	month = date.getMonth();
    	day = date.getDate();
    	hour = date.getHours();
    	minute = date.getMinutes();
    	second = date.getSeconds();
    	strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
    	return strDate;
    }
    
    
</script>

<style>
body {
  background-color: white;
}

.movietitle{
 background-color: #D6E6F5;
}
.view {
  margin-top: 70px;
  padding-top: 10px;
}

.maintable {
  margin: 0 auto;
}
.maintable input{
  cursor: pointer;
}

.delete{
  float: left;
  background-color: red;
}
.changego {
  float: left;
}

.listgo {
  float: right;
}

.boardTable>tbody {
  cursor: pointer;
}

.nav_main {
  color: crimson;
  font-size: 20px;
}

.main_title {
  font-size: 30px;
}

a:hover {
  text-decoration: none;
}

.memo {
  font-size: 35px;
  max-width: 900px;
}

#listReply {
  float: left;
}
#listReply img{
  cursor: pointer;
}
.likeselect{
  margin: 0 auto;
  align: center;
  text-align: center;
  font-size: 40px;
  size: 30px;
}
.like_btn{
  cursor: pointer;
   size: 20px;
   font-size: 15px;
}
.dislike_btn{
  cursor: pointer;
   size: 20px;
   font-size: 15px;
}
.reply td:nth-child( 3 ){
  font-size: 15px;
}
.comments {
  margin-top: 30px;
  margin: 0 auto;
  align: center;
  width: 900px;
  border: 1px solid blue;
  background-color: #F7F7F7;
}

.siren{
  cursor: pointer;
}
.like, .dislike{
  width: 20px;
  height: 20px;
}
</style>
</head>
<body>

	<div class="view">
		<form name="form2" method="post">
			<table border="1" class="maintable">
				<tr class="movietitle">
					<td width="900" colspan="2" height="30" >&ensp;글번호: ${dto.mboard_no} &ensp;&emsp;&emsp;<strong>|</strong>&emsp;&emsp;&emsp; <strong>${dto.mboard_title}</strong></td>
				</tr>
				<tr>
					<td width="700" colspan="1">작성자: ${dto.member_id} <strong>|</strong> <fmt:formatDate value="${dto.mboard_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td width="200">조회수 : ${dto.mboard_hit_cnt} &ensp;&ensp;<strong>|</strong>&ensp;&ensp; <div style="display: inline;" class="siren"><img width="20" height="20" src="resources/img/siren.png">&ensp;신고</div></td>
				</tr>

				<tr>
					<td class="memo" width="407" colspan="2" height="200">${dto.mboard_content}</td>
				</tr>

				<tr align="center">
					<c:if test="${userInfo.member_no == dto.member_no || userInfo.authority eq 'ROLE_ADMIN'}">
					<td colspan="2" width="399"><input type=button class="btn btn-primary changego" value="수정" Onclick="location.href='${path}/change?mboard_no=${dto.mboard_no}'"> 
        			<input type=button class="btn delete" value="삭제" Onclick="delete2()">
					<input type=button class="btn btn-primary listgo" value="목록" OnClick="location.href='Movieboard'"> 
      				</c:if>
      				<c:if test="${userInfo.member_no == null}">
					<td colspan="2" width="399"><input type=hidden class="btn btn-primary changego" value="수정" Onclick="location.href='${path}/change?mboard_no=${dto.mboard_no}'">
        			<input type=hidden class="btn delete" value="삭제" Onclick="delete2()">
					<input type=button class="btn btn-primary listgo" value="목록" OnClick="location.href='Movieboard'"> 
      				</c:if>
      				<c:if test="${userInfo.authority eq 'ROLE_MEMBER' and userInfo.member_no != dto.member_no}">
					<td colspan="2" width="399"><input type=hidden class="btn btn-primary changego" value="수정" Onclick="location.href='${path}/change?mboard_no=${dto.mboard_no}'">
        			<input type=hidden class="btn delete" value="삭제" Onclick="delete2()">
					<input type=button class="btn btn-primary listgo" value="목록" OnClick="location.href='Movieboard'"> 
      				</c:if>
					<%-- <c:if test="${dto.userId == sessionScope.userId}">
        			<input type=button class="btn btn-primary Rbtnmargin" value="수정" Onclick="location.href='${path}/change?bno=${dto.bno}'">
      						</c:if> --%>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr height="1" bgcolor="#82B5DF">
					<td colspan="4" width="407"></td>
				</tr>
			</table>
		</form>
		<div  class="likeselect">
			<div class="btn btn-primary like_btn"><label id="like_btn" style="display: inline;">${dto.mboard_like_cnt}</label><br>추천</div>
			<div class="btn btn-warning dislike_btn" onclick="dislike()">${dto.mboard_dislike_cnt}<br>비추</div>
		</div>
		<div class=comments align="center">
			<div id="listReply"></div>
			<div style="width: 850px; padding-top: 30;">
				<c:if test="${userInfo.member_no == null}">
    				<textarea style="width: 100%;" rows="5 cols="80" name="replytext" id="replylogin" placeholder="로그인이 필요합니다." readonly></textarea>
    			</c:if>
    			<c:if test="${userInfo.authority eq 'ROLE_MEMBER' || userInfo.authority eq 'ROLE_ADMIN'}">
    				<textarea style="width: 100%;" rows="5 cols="80" name="mreply_content" id="mreply_content" placeholder="댓글을 입력하세요" ></textarea>
      				<br>
    				<button type="button" id="btnComments" class="btn btn-info">댓글 작성</button>
    			</c:if>
			</div>
		</div>
	</div>
	
</body>
</html>
