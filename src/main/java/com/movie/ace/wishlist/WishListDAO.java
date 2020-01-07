package com.movie.ace.wishlist;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishListDAO {

	@Autowired
	private SqlSession ss;

	@Autowired
	WishList wishlist;

	public void getWishList(HttpServletRequest req, HttpServletResponse res, int member_num) {

		String member_no = String.valueOf(member_num);
		wishlist.setMember_no(member_no);

		List<WishList> wishlist_return = new LinkedList<WishList>();
		wishlist_return = ss.getMapper(WishListMapper.class).getWishList(wishlist);

		Iterator<WishList> itr = wishlist_return.iterator();
		//가져온 wishlist의 경우 멤버넘버가 들어있지 않기때문에, 넣어준다.삭제 할떄 멤버넘버가 필요하기 떄문에.
		while (itr.hasNext()) {
			itr.next().setMember_no(member_no); 
		}

		//member_no 꺼내려고 쓴거다.
		if (wishlist_return.size() != 0) {
			//return할 위시리스트가 있을경우,membernum도 같이 저장해주기 위해 리스트 0번째 객체를 빼옴.
			wishlist = wishlist_return.get(0);
			req.getSession().setAttribute("wishlist", wishlist_return);
			req.getSession().setAttribute("member_num", wishlist.getMember_no());
		} else {
			req.getSession().setAttribute("wishlist", wishlist_return);
			req.getSession().setAttribute("member_num", wishlist.getMember_no());
		}
	}

	public WishList getDetail(HttpServletRequest req, HttpServletResponse res, WishList moviecode) {

		wishlist = ss.getMapper(WishListMapper.class).getDetail(moviecode); // 안되면 여기를 moviecd 만 넘기는 걸로 해보자.
		return wishlist;
	}

	public void setMoviereply(ModalWrite modal) {
		ss.getMapper(WishListMapper.class).setMovieReply(modal);
	}

	public List<ModalGetReplys> getMoviereply(ModalGetReplys modalgetreply) {
		List<ModalGetReplys> listreply = new LinkedList<ModalGetReplys>();
		listreply = ss.getMapper(WishListMapper.class).getMovieReply(modalgetreply);
		return listreply;
	}

	public void delWishList(WishList modify) {
		ss.getMapper(WishListMapper.class).delWishList(modify);
	}

	public void insertWishList(WishList modify) {
		ss.getMapper(WishListMapper.class).insertWishList(modify);
	}

	public int checkBeforeInsert(WishList movie) {
		int duplicate;
		duplicate = ss.getMapper(WishListMapper.class).checkBeforeInsert(movie);
		System.out.println(duplicate+"%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		return duplicate;
	}
	
	public int checkMovieDb(int mcode) {
		return ss.getMapper(WishListMapper.class).checkMovieDb(mcode);		
	}
	
	public void insertMovieDB(WishList wishList) {
		ss.getMapper(WishListMapper.class).insertMovieDB(wishList);
	}
}
