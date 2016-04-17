package com.wpl.model;

public class Review 
{
	private String reviewId;
	private User user;
	private Ride ride;
	private String comments;
	private int stars;
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Ride getRide() {
		return ride;
	}
	public void setRide(Ride ride) {
		this.ride = ride;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
}
