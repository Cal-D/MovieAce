

function clicke (thumnail, plot, movieNm, dirNm, genres, actors, type, runtime,opendt){

	$("#thumnail").attr("src", thumnail);	
	$(".modal-head-movieNm").text(movieNm);
	$(".modal-plot").text(plot);
	$(".modal-director").text("감독: "+dirNm);
	$(".modal-genre").text("장르: "+genres);
	$(".modal-actor").text("출연 배우: "+actors);
	$(".modal-runtime").text("상영시간: "+runtime+"분");
	$(".modal-openDT").text("개봉일 : "+opendt);
}	
