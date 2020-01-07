package com.movie.ace.search;


import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class SearchController {
	
	@Autowired
	private searchDAO searchDAO;

	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String Search(Locale locale, Model model) {
		return "/search/Search";
	}
	
	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	public String SearchResult(HttpServletRequest req, HttpServletResponse res) {		

		searchDAO.search(req, res);
		searchDAO.getDirSearch(req, res);
		searchDAO.getMovieSearch(req,res);
		return "/search/SearchResult";
	}
}
