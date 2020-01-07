package com.movie.ace.board;

public class BoardPager {
		//페이지당 게시물 수
		public static final int PAGE_SCALE =10;
		//화면당 페이지 수
		public static final int BLOCK_SCALE = 10;
		private int curPage;	//현재 페이지
		private int prevPage;	//이전 페이지
		private int nextPage;	//다음 페이지
		private int totPage;	//전체 페이지수
		private int totBlock;	//전체페이지 블록갯수
		private int curBlock;	//현재 페이지블록
		private int prevBlock;	//이전 페이지 블록
		private int nextBlock;	//다음 페이지 블록
		
		//WHERE rn BETWEEN #{start} and #{end}
		private int pageBegin;	// #{start}
		private int pageEnd;	//#{end}
		private int blockBegin;	//편재 페이지 블록의 시작번호
		private int blockEnd;
		
		public BoardPager(int count, int curPage) {
			curBlock=1;
			this.curPage = curPage;
			setTotPage(count);
			setPageRange();
			setTotBlock();
			setBlockRange();
		}
		public void setBlockRange() {
			//현재 페이지가 몇번째 페이지 블록에 속하는지 계산
			curBlock = (int)Math.ceil((curPage-1)/BLOCK_SCALE)+1;
			// 현재 페이지 블록의 시작, 끝 번호 계산
			blockBegin = (curBlock-1)*BLOCK_SCALE+1;
			//페이지 블록의 끝번호
			blockEnd = blockBegin+BLOCK_SCALE-1;
			//마지막 블록이 범위를 초과하지 않도록 계산
			if(blockEnd> totPage) blockEnd=totPage;
			//이전을 눌렀을때 이동할 페이지 번호
			prevPage = (curPage ==1)? 1:(curBlock-1)*BLOCK_SCALE;
			//다음을 눌렀을때 이동할 페이지 번호
			nextPage = curBlock > totBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE);
			//마지막 페이지가 범위를 초과하지 않도록 처리
			if(nextPage >= totPage) nextPage = totPage;
		}
		public void setPageRange() {
			//WHERE rn BETWEEN #{start} and #{end}
			//시작번호 = (현재페이지 -1)*페이지당 게시물 수 +1
			pageBegin = (curPage-1)*PAGE_SCALE;
			//끝번호 = 시작번호 +페이지당 게시물 수 -1
			pageEnd = pageBegin+PAGE_SCALE-1;
		}
		public int getCurPage() {
			return curPage;
		}
		public void setCurPage(int curPage) {
			this.curPage = curPage;
		}
		public int getPrevPage() {
			return prevPage;
		}
		public void setPrevPage(int prevPage) {
			this.prevPage = prevPage;
		}
		public int getNextPage() {
			return nextPage;
		}
		public void setNextPage(int nextPage) {
			this.nextPage = nextPage;
		}
		public int getTotPage() {
			return totPage;
		}
		public void setTotPage(int count) {
			totPage = (int) Math.ceil(count*1.0/PAGE_SCALE);
		}
		public int getTotBlock() {
			return totBlock;
		}
		public void setTotBlock() {
			totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
		}
		public int getCurBlock() {
			return curBlock;
		}
		public void setCurBlock(int curBlock) {
			this.curBlock = curBlock;
		}
		public int getPrevBlock() {
			return prevBlock;
		}
		public void setPrevBlock(int prevBlock) {
			this.prevBlock = prevBlock;
		}
		public int getNextBlock() {
			return nextBlock;
		}
		public void setNextBlock(int nextBlock) {
			this.nextBlock = nextBlock;
		}
		public int getPageBegin() {
			return pageBegin;
		}
		public void setPageBegin(int pageBegin) {
			this.pageBegin = pageBegin;
		}
		public int getPageEnd() {
			return pageEnd;
		}
		public void setPageEnd(int pageEnd) {
			this.pageEnd = pageEnd;
		}
		public int getBlockBegin() {
			return blockBegin;
		}
		public void setBlockBegin(int blockBegin) {
			this.blockBegin = blockBegin;
		}
		public int getBlockEnd() {
			return blockEnd;
		}
		public void setBlockEnd(int blockEnd) {
			this.blockEnd = blockEnd;
		}
		public static int getPageScale() {
			return PAGE_SCALE;
		}
		public static int getBlockScale() {
			return BLOCK_SCALE;
		}
		@Override
		public int hashCode() {
			// TODO Auto-generated method stub
			return super.hashCode();
		}
		@Override
		public boolean equals(Object obj) {
			// TODO Auto-generated method stub
			return super.equals(obj);
		}
		@Override
		protected Object clone() throws CloneNotSupportedException {
			// TODO Auto-generated method stub
			return super.clone();
		}
		@Override
		public String toString() {
			return "BoardPager [curPage=" + curPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", totPage="
					+ totPage + ", totBlock=" + totBlock + ", curBlock=" + curBlock + ", prevBlock=" + prevBlock
					+ ", nextBlock=" + nextBlock + ", pageBegin=" + pageBegin + ", pageEnd=" + pageEnd + ", blockBegin="
					+ blockBegin + ", blockEnd=" + blockEnd + "]";
		}
		@Override
		protected void finalize() throws Throwable {
			// TODO Auto-generated method stub
			super.finalize();
		}
		public BoardPager() {
			super();
			// TODO Auto-generated constructor stub
		}
		
}
