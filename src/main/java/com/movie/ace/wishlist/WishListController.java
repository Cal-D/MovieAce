package com.movie.ace.wishlist;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.ace.member.CustomUserDetails;

@Controller
public class WishListController {

	@Autowired
	private WishListDAO wishDAO;

	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	@RequestMapping(value = "/WishList", method = RequestMethod.GET)
	public String Movielist(HttpServletRequest req, HttpServletResponse res) {
		CustomUserDetails cud = (CustomUserDetails) req.getSession().getAttribute("userInfo");
		int mno = cud.getMember_no();
		wishDAO.getWishList(req, res, mno);
		return "/wishlist/WishList";
	}

	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	@RequestMapping(value = "/MovieDel", method = RequestMethod.GET)
	public String Moviedelete(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("************************/MOVIE DELETE 들어옴***********************************");
//		CustomUserDetails cud = (CustomUserDetails) req.getSession().getAttribute("userInfo");
//		int mno = cud.getMember_no();
//		String memberNo = String.valueOf(mno);
		String memberNo = req.getParameter("member_no");
		String moviecd = req.getParameter("moviecd");
		// String memberNo = req.getParameter("member_no");

		WishList del_wishlist = new WishList();
		del_wishlist.setMoviecd(moviecd);
		del_wishlist.setMember_no(memberNo);
		System.out.println("여기까지 들어옴");
		// 영화를 지움.
		wishDAO.delWishList(del_wishlist);
		// 지운후 다시 위시리스트를 보여줘야한다.
		wishDAO.getWishList(req, res, Integer.valueOf(memberNo));

		System.out.println(
				"************************/MOVIE DELETE나간다****************************************************");
		return "/wishlist/WishList";
	}

	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	@ResponseBody
	@RequestMapping(value = "/MovieInsert", method = RequestMethod.GET)
	public int Movieinsert(@ModelAttribute WishList movie) {
		int duplicate;
		duplicate = wishDAO.checkBeforeInsert(movie);

		String test = movie.getMoviecd();
		int test2 = Integer.parseInt(test);

		if (wishDAO.checkMovieDb(test2) != 0) {
			// MovieDb안에 들어있을경우
			if (duplicate == 0) {
				// 내 위시리스트에 넣으려고하는 영화가 없을경우
				wishDAO.insertWishList(movie);
				return duplicate;
			} else {
				return duplicate;
			}
		} else {
			// MovieDB안에 애초부터 없을경우
			wishDAO.insertMovieDB(movie);
			System.out.println(movie);
			wishDAO.insertWishList(movie);
			return duplicate;
		}
	}
}
