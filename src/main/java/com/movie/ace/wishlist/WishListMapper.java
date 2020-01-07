package com.movie.ace.wishlist;
 
import java.util.List;
 
public interface WishListMapper {

	public List<WishList> getWishList(WishList wishlist); 
	public WishList getDetail(WishList moviecd);
	public void setMovieReply(ModalWrite modalwrite);
	public List<ModalGetReplys> getMovieReply(ModalGetReplys modalgetreplys);
	public void delWishList(WishList wishlist);
	public void insertWishList(WishList wishlist);
	public List<WishList> getBoxOffice(WishList boxoffice);
	public int checkBeforeInsert(WishList check);	
	public int checkMovieDb(int mcode);
	public void insertMovieDB(WishList wishList);
	
}
