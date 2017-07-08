package kr.co.bit.mini.reply.vo;

public class ReplyVO {
	
	private int replyId;
	private String memberId;
	private String writeDate;
	private String content;
	private int reviewId;
	private String nickName;
	private int movieId;
	private String title;
	
	public ReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReplyVO(int replyId, String memberId, String writeDate, String content, int reviewId, String nickName,
			int movieId, String title) {
		super();
		this.replyId = replyId;
		this.memberId = memberId;
		this.writeDate = writeDate;
		this.content = content;
		this.reviewId = reviewId;
		this.nickName = nickName;
		this.movieId = movieId;
		this.title = title;
	}

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyId=" + replyId + ", memberId=" + memberId + ", writeDate=" + writeDate + ", content="
				+ content + ", reviewId=" + reviewId + ", nickName=" + nickName + ", movieId=" + movieId + ", title="
				+ title + "]";
	}
	
	
	
}
