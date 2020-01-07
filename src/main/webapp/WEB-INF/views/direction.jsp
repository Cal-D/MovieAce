<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>

<style>
.nav_main {
  color: crimson;
  font-size: 20px;
}

a:hover {
  text-decoration: none;
}

#map {
  margin: 0 auto;
}

#roadview {
  margin: 0 auto;
}

.overlay_info {
  border-radius: 6px;
  margin-bottom: 12px;
  float: left;
  position: relative;
  border: 1px solid #ccc;
  border-bottom: 2px solid #ddd;
  background-color: #fff;
}

.overlay_info:nth-of-type(n) {
  border: 0;
  box-shadow: 0px 1px 2px #888;
}

.overlay_info a {
  display: block;
  background: #d95050;
  background: #d95050
    url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
    no-repeat right 14px center;
  text-decoration: none;
  color: #fff;
  padding: 12px 36px 12px 14px;
  font-size: 14px;
  border-radius: 6px 6px 0 0
}

.overlay_info .desc {
  padding: 14px;
  position: relative;
  min-width: 190px;
  height: 56px
}

.overlay_info .address {
  font-size: 12px;
  color: #333;
  position: absolute;
  white-space: normal
}

.overlay_info:after {
  content: '';
  position: absolute;
  margin-left: -11px;
  left: 50%;
  bottom: -12px;
  width: 22px;
  height: 12px;
  background:
    url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png)
    no-repeat 0 bottom;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default bg-dark">
		<div class="navbar-header nav_main">
			<a class="main_title"><b>방문 안내</b></a>
		</div>
	</nav>
	<div id="map" style="width: 900px; height: 300px"></div>
	<!-- 지도를 표시할 div 입니다 -->
	<div id="roadview" style="width: 900px; height: 350px"></div>
	<!-- 로드뷰를 표시할 div 입니다 -->

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6775cb6eb8dccc54d9a9623f2d4982a0"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapCenter = new kakao.maps.LatLng(37.569438, 126.986143), // 지도의 중심좌표
		mapOption = {
			center : mapCenter, // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 커스텀 오버레이에 표시할 내용입니다
		// HTML 문자열 또는 Dom Element 입니다
		var content = '<div class="overlay_info">';
		content += '    <a href="https://place.map.kakao.com/17812094" target="_blank"><strong>솔데스크</strong></a>';
		content += '    <div class="desc">';
		content += '        <span class="address">서울특별시 종로구 종로12길 15 (관철동 13-13)</span>';
		content += '    </div>';
		content += '</div>';

		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new kakao.maps.LatLng(37.569438, 126.986143);

		//마커가 표시될 위치
		var markerPosition = new kakao.maps.LatLng(37.569438, 126.986143);

		//마커생성하기
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		marker.setMap(map);

		// 커스텀 오버레이를 생성합니다
		var mapCustomOverlay = new kakao.maps.CustomOverlay({
			position : position,
			content : content,
			xAnchor : 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
			yAnchor : 1.2
		// 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
		});

		// 커스텀 오버레이를 지도에 표시합니다
		mapCustomOverlay.setMap(map);

		var rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
		var rv = new kakao.maps.Roadview(rvContainer); //로드뷰 객체
		var rvClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

		//지도의 중심좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
		rvClient.getNearestPanoId(mapCenter, 50, function(panoId) {
			rv.setPanoId(panoId, mapCenter); //panoId와 중심좌표를 통해 로드뷰 실행
		});

		kakao.maps.event.addListener(rv, 'init', function() {

			// 커스텀 오버레이를 생성합니다
			var rvCustomOverlay = new kakao.maps.CustomOverlay({
				position : position,
				content : content,
				xAnchor : 2.4, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
				yAnchor : 2.0
			// 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
			});

			//rvCustomOverlay.setAltitude(2); //커스텀 오버레이의 고도값을 설정합니다.(로드뷰 화면 중앙이 0입니다)
			rvCustomOverlay.setMap(rv);

			var projection = rv.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져옵니다.

			// 커스텀오버레이의 position과 altitude값을 통해 viewpoint값(화면좌표)를 추출합니다.
			var viewpoint = projection.viewpointFromCoords(rvCustomOverlay
					.getPosition(), rvCustomOverlay.getAltitude());

			rv.setViewpoint(viewpoint); //커스텀 오버레이를 로드뷰의 가운데에 오도록 로드뷰의 시점을 변화 시킵니다.
		});
	</script>

</body>

</html>
