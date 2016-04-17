package com.wpl.model;

public class User_Rides 
{
	private User user;
	private Ride ride;
	private int riderNo;
	
	public int getRiderNo() {
		return riderNo;
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

	public void setRiderNo(int riderNo) {
		this.riderNo = riderNo;
	}	
}
