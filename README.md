# MovieAce
  
  * 영화 검색기능    
  * 원하는 영화 장바구니 추가     
  * 게시판
  * 스프링 시큐리티 
  
  팀원
  ----------------------
   * __박경남 (위시리스트,박스오피스)__  
   * 오민영 (메인페이지,게시판)  
   * 염승훈 (스프링 시큐리티를 사용한 회원가입, 수정,관리자 페이지)    
   * 이아르미 (검색)
   
   개발동기
  ----------------------
   "OpenAPI 사용"을 목표로  
   영상자료원과,영화진흥위원회의 DB자료를 이용하여  
   검색기능이 들어간 영화게시판을 개발.
   
   사용기술
   ------------------------
   * Json Parsing(DB에 영화정보 저장)   
   * Ajax(댓글기능)
   
   만드는 과정에서
   ------------------------
   1. 협업에서 왜 Git을 쓰는지에 대해 직접적으로 체감했다.  
       다만,'목표한 날짜에 구현완료'를 최우선순위로 진행하다보니 본인이 맡은 페이지 개발에 바빠 제대로 Git을 이용해 협업을 하지 못한 것이
       아쉬운점이다. 그렇기에 개인적으로 공부 중.  
         > [Git  공부 중](https://github.com/Cal-D/iTshirt) 
       
   2. 파싱시 원하는 객체의 위치를 Chrome 혹은 Firefox로 먼저 훑어보자.     
      불러온 값들 중 원하는 객체의 위치를 console에서 찾는것이 생각보다 힘들다. 아니, 귀찮다.    
      Chrome이나 Firefox는 계층적으로 들여쓰기를 적용해 보여주기에,직관적으로 몇번 꺼내면 나올지 쉽게 계산이 가능하다.   
      
   3.팀이 아닌 개인 게시판 구현의 필요성을 느낌.    
   > [진행중](https://github.com/Cal-D/SpringStart)   
      [정리노트](https://cal-d.tistory.com/)     
          
      
      
   URL
   ------------------------
   [MovieAce](https://180.229.1.114:8080/)
   
   > 회원가입이 귀찮은 경우  
       ID : batman  
       PW : batman1234$   
   ***
   
   ERD 
  ----------------------
 1. <Strong>ERD</Strong>
  ![Alt ERD](https://user-images.githubusercontent.com/53854831/70408595-12b7cb00-1a8c-11ea-8d79-bf88903541bc.PNG)
   
 ***
   View 
  ----------------------
  * 메인페이지
  
  ![Main](https://user-images.githubusercontent.com/43934497/71876204-9509dc80-3169-11ea-9892-18fd7a1255fe.PNG)
  ![Main2](https://user-images.githubusercontent.com/43934497/71876244-a94dd980-3169-11ea-9944-9b8e95194e45.PNG)  
  
  * 위시리스트
  
  ![image](https://user-images.githubusercontent.com/43934497/71903288-1895ee80-31a7-11ea-8e6e-5d0e3a31071f.png)
  * 위시리스트 상세정보 및 댓글 기능
  
  ![image](https://user-images.githubusercontent.com/43934497/71903309-22b7ed00-31a7-11ea-9fa8-82ea678fef63.png)
 
  
