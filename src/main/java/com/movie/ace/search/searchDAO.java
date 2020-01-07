package com.movie.ace.search;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;


@Service
public class searchDAO {


	public void search(HttpServletRequest req, HttpServletResponse res) {
		String search = req.getParameter("searchKeyword"); 
		req.getSession().setAttribute("search", search);
	}


	public void clearSearch(HttpServletRequest req, HttpServletResponse res) {
		req.getSession().setAttribute("search", null);
	}


	public void getDirSearch(HttpServletRequest req, HttpServletResponse res) {
		try {			
			String search =  (String) req.getSession().getAttribute("search");  //검색어
			String dmovie = search.replaceAll("\\p{Z}",""); //공백제거
			String ServiceKey = "fb7915ecb3c3515612b6ea4cdeccb7a8"; //통전망 인증키

			URL directorURL = new URL(
					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key="
							+ServiceKey+"&directorNm="+dmovie);

			HttpURLConnection dirHuc = (HttpURLConnection) directorURL.openConnection();
			InputStream dirIs = dirHuc.getInputStream();
			InputStreamReader dirIsr = new InputStreamReader(dirIs, "UTF-8");
			BufferedReader dirBr = new BufferedReader(dirIsr);

			String dirline = dirBr.readLine();
			System.out.println("감독검색 :"+dirline);

			JSONParser jp = new JSONParser();
			JSONObject jo = (JSONObject) jp.parse(dirline);		
			JSONObject MIR = (JSONObject) jo.get("movieListResult");	
			JSONArray ML = (JSONArray) MIR.get("movieList");

			System.out.println("감독검색영화리스트:"+ML);

			if(ML.size()!=0) { //감독검색결과가 있으면 실행
				List<SearchVO> resultList = new ArrayList<SearchVO>(); //결과 list

				//결과 추출 for문
				for(int i=0; i<ML.size(); i++) { //MovieList라는 슬라이스된 JSONObject에서 추출하기.
					SearchVO sVO = new SearchVO(); // 각 sVO 초기화
					JSONObject dirLine = (JSONObject) ML.get(i); //감독명 검색결과 슬라이스
					JSONArray dirNmArr = (JSONArray) dirLine.get("directors"); //감독명 슬라이스 array화

					if(dirNmArr.size()==1) { //단독 연출일때
						JSONObject dirNm = (JSONObject) dirNmArr.get(0); //배열에서 0번째만 가져와 담는다.
						sVO.setDirector((String) dirNm.get("peopleNm")); //json배열중 peoplenm의 value값 셋팅										
					}
					else if(dirNmArr.size() >1) { //공동감독일때
						String sDirName = ""; // String 하나에 몰아 담을 것.
						for(int j=0; j<dirNmArr.size(); j++) { //arr size대로 for문 돌 것임
							JSONObject dirNm = (JSONObject) dirNmArr.get(j); // 다시 object화						
							sDirName += (String) dirNm.get("peopleNm")+","; //peopleNm키값의 value 를 계속 더한다.																	
						}		
						sVO.setDirector(sDirName); //sVO에 추가	
					}
					else {
						sVO.setDirector("");
					}
					//혹시모르니까 일단 다 추가는 해주자
					sVO.setGenres((String) dirLine.get("repGenreNm"));
					sVO.setMovieNm((String) dirLine.get("movieNm"));
					sVO.setMovieCd((String) dirLine.get("movieCd"));
					sVO.setTypeNm((String) dirLine.get("typeNm"));
					sVO.setOpenDate((String) dirLine.get("openDt"));
					SearchVO sVO2 = getPosterPlot(sVO);
					sVO.setPlot(sVO2.getPlot());
					sVO.setThumnailURL(sVO2.getThumnailURL());
					sVO.setRuntime(sVO2.getRuntime());
					resultList.add(i,sVO); //req에 담아보낼 sVO값을 i번째에 add

				}

				req.setAttribute("DirectorSearchResult", resultList);	 //담아보냅니다.			
				req.setAttribute("keyword", search);

			}
			else { //감독명 검색 결과가 없을 때
				//				titleList = null;
				System.out.println("검색결과없음");
				req.setAttribute("keyword", search);
				//				req.setAttribute("DirectorSearchResult", titleList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	////////////////////////////////영화명 검색
	public void getMovieSearch(HttpServletRequest req, HttpServletResponse res) { 
		try {			
			String search =  (String) req.getSession().getAttribute("search");  //검색어
			String movie = search.replaceAll("\\p{Z}",""); //공백제거
			String ServiceKey = "fb7915ecb3c3515612b6ea4cdeccb7a8"; //통전망 인증키

			URL movieURL = new URL(
					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key="
							+ServiceKey+"&movieNm="+movie);

			HttpURLConnection movieHuc = (HttpURLConnection) movieURL.openConnection();
			InputStream movieIs = movieHuc.getInputStream();
			InputStreamReader movieIsr = new InputStreamReader(movieIs, "UTF-8");
			BufferedReader movieBr = new BufferedReader(movieIsr);
			String movieline = movieBr.readLine();
			//		System.out.println(movieline);

			JSONParser jp = new JSONParser();
			JSONObject jo = (JSONObject) jp.parse(movieline);		
			JSONObject MIR = (JSONObject) jo.get("movieListResult");
			JSONArray MI= (JSONArray) MIR.get("movieList");
			System.out.println("영화리스트 "+MI);
			

			if(MI.size()!=0) {
				List<SearchVO> resultList = new ArrayList<SearchVO>(); //결과 list

				//결과 추출 for문
				for(int i=0; i<MI.size(); i++) { //MovieList라는 슬라이스된 JSONObject에서 추출하기.
					SearchVO sVO = new SearchVO(); // 각 sVO 초기화

					JSONObject movieLine = (JSONObject) MI.get(i); //영화명 검색결과 슬라이스
					//System.out.println("ml:"+movieLine);
					JSONArray dirNmArr = (JSONArray) movieLine.get("directors"); //감독명 슬라이스 array화

					if(dirNmArr.size()==1) { //단독 연출일때
						JSONObject dirNm = (JSONObject) dirNmArr.get(0); //배열에서 0번째만 가져와 담는다.
						sVO.setDirector((String) dirNm.get("peopleNm")); //json배열중 peoplenm의 value값 셋팅										
					}
					else if(dirNmArr.size() >1) { //공동감독일때
						String sDirName = ""; // String 하나에 몰아 담을 것.
						for(int j=0; j<dirNmArr.size(); j++) { //arr size대로 for문 돌 것임
							JSONObject dirNm = (JSONObject) dirNmArr.get(j); // 다시 object화						
							sDirName += (String) dirNm.get("peopleNm")+","; //peopleNm키값의 value 를 계속 더한다.																	
						}		
						sVO.setDirector(sDirName); //sVO에 추가	
					}
					else {
						sVO.setDirector("");
					}
					//혹시모르니까 일단 다 추가는 해주자
					sVO.setGenres((String) movieLine.get("repGenreNm"));
					sVO.setMovieNm((String) movieLine.get("movieNm"));
					sVO.setMovieCd((String) movieLine.get("movieCd"));
					sVO.setTypeNm((String) movieLine.get("typeNm"));
					sVO.setOpenDate((String) movieLine.get("openDt"));
					SearchVO sVO2 = getPosterPlot(sVO);
					sVO.setPlot(sVO2.getPlot());
					sVO.setThumnailURL(sVO2.getThumnailURL());
					sVO.setRuntime(sVO2.getRuntime());
					resultList.add(i,sVO); //req에 담아보낼 sVO값을 i번째에 add

				}

				req.setAttribute("MovieSearchResult", resultList);	 //담아보냅니다.			
				req.setAttribute("keyword", search);

			}
			else { //감독명 검색 결과가 없을 때
				System.out.println("검색결과없음");
				req.setAttribute("keyword", search);
			}				

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public SearchVO getPosterPlot(SearchVO svo) {
		try {		

			String serviceKey = "642F68VV6759E5SC9W2O"; //KMDB인증키
			String movie = svo.getMovieNm().replaceAll("\\p{Z}",""); //공백제거
			String dir = svo.getDirector().replaceAll("\\p{Z}",""); //공백제거

			URL u2 = new URL(
					"http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new&detail=Y&ServiceKey="+serviceKey+"&query="
							+ movie + "%20" +dir );
			//detail=Y 로 해야 포스터, 스틸 뜸 
			//movie+"%20"+dir은 "영화명 감독명" 이런식으로 공백 들어가게 해줌

			HttpURLConnection huc = (HttpURLConnection) u2.openConnection();
			InputStream is = huc.getInputStream();
			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			BufferedReader br = new BufferedReader(isr);
			String line = br.readLine();
			//line이 널 아니면 실행 되어야 함 널이면 다 set을 null로 해야해.. 아귀차나....
			for (int i = 0; i < 1; i++) {

				line = br.readLine();
			}

			JSONParser jp = new JSONParser(); 

			JSONObject jo = (JSONObject) jp.parse(line);
			
			if(jo != null) {
				JSONArray data = (JSONArray) jo.get("Data");
				// data Array의 첫번째 인덱스
				JSONObject data_index0 = (JSONObject) data.get(0);

				if(!data_index0.containsKey("Result")) { //jsonobject에서 result라는 키값이 있는지 검사
					svo.setActors("");
					svo.setPlot("");
					svo.setThumnailURL(null);
				}
				else {
					JSONArray result = (JSONArray) data_index0.get("Result");

					JSONObject real = (JSONObject) result.get(0);
					//	System.out.println("real : "+real);
					String posterUrl = (String) real.get("posters");	
					//	System.out.println(posterUrl);
					if(!real.get("posters").toString().equals("")) {								
						String[] poster = posterUrl.split("[|]",0);				
						svo.setThumnailURL(poster[0]);
					}
					else {
						svo.setThumnailURL(null);
					}

					String plot = (String) real.get("plot");
					String str = plot.replace("'", "" );
					svo.setPlot(str);
					String run = (String) real.get("runtime");
					svo.setRuntime(run);
					List<JSONObject>actors=(List<JSONObject>) real.get("actor");					

					String nm ="";
					if(actors.size() >1) {

						for(int i=0; i<5; i++) { //5명만 뽑을래요; 너모많아;	
							if(i<actors.size()) {
								JSONObject test = actors.get(i);				
								nm += (String) test.get("actorNm")+", ";
							}
							else break;
						} // end of for
						svo.setActors(nm);
					} // end of if
					else if(actors.size()==1) {
						JSONObject test = actors.get(0);
						nm = (String) test.get("actorNm");
						svo.setActors(nm);
					} //end of else if
					else {
						svo.setActors("");
					} //end of else
				}// end of else
			}//end of if(jo!=null)
			else {
				svo.setActors("");
				svo.setPlot("");
				svo.setThumnailURL(null);
			}
			
		}// end of try
		catch(Exception e) {
			e.printStackTrace();
		}
		return svo;
	}//end of function getPosterPlot
}