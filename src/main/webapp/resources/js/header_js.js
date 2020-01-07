function goSearch() {
	var search = document.searchForm.searchKeyword.value;
	if(search==""){
		alert("검색어를 입력하세요");
		return false;
	}
}