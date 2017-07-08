package kr.co.bit.mini.review.vo;

public class ReviewVO {
	
	private int reviewId;
	private String memberId;
	private int movieId;
	private String content;
	private double rate;
	private String writeDate;
	private String nickName;
	private String title;
	
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReviewVO(int reviewId, String memberId, int movieId, String content, double rate, String writeDate,
			String nickName, String title) {
		super();
		this.reviewId = reviewId;
		this.memberId = memberId;
		this.movieId = movieId;
		this.content = content;
		this.rate = rate;
		this.writeDate = writeDate;
		this.nickName = nickName;
		this.title = title;
	}
	
	public int getReviewId() {
		return reviewId;
	}
	
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	
	public String getMemberId() {
		return memberId;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public int getMovieId() {
		return movieId;
	}
	
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public double getRate() {
		return rate;
	}
	
	public void setRate(double rate) {
		this.rate = rate;
	}
	
	public String getWriteDate() {
		return writeDate;
	}
	
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	
	public String getNickName() {
		return nickName;
	}
	
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [reviewId=" + reviewId + ", memberId=" + memberId + ", movieId=" + movieId + ", content="
				+ content + ", rate=" + rate + ", writeDate=" + writeDate + ", nickName=" + nickName + ", title="
				+ title + "]";
	}
	
}
