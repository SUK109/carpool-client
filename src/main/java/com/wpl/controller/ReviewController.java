package com.wpl.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.wpl.model.User;

@Controller
public class ReviewController
{
	
	@RequestMapping(value="/addReview")
	@ResponseBody
	public String addReview(@RequestParam("rideId") String rideId,@RequestParam("stars") String stars,HttpSession session)
	{
		User user = (User)session.getAttribute("user");
		RestTemplate template = new RestTemplate();
		String url = "https://localhost:8180/review/addReview?rideId={rideId}&stars={stars}&userId={userId}";
		Map<String,String> params = new HashMap<String,String>();
		params.put("rideId", rideId);
		params.put("stars", stars);
		params.put("userId", user.getUserId());
		template.getForEntity(url, Boolean.class, params);
		return "Review Posted";
	}
}