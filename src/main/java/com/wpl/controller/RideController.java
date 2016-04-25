package com.wpl.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.wpl.model.Ride;
import com.wpl.model.User;

@Controller
//@SessionAttributes("result")
public class RideController
{
	@RequestMapping(value="/addRide", method=RequestMethod.POST)
	public String addRide(@RequestBody Ride ride, HttpSession session){
		RestTemplate template = new RestTemplate();
		System.out.println("this is ws1");
		System.out.println(ride.getRideStartLocation());
		String url = "https://localhost:8180/ride/createRide";
		Ride result_ride = template.postForObject(url, ride,Ride.class);
		
		
		//map.addAttribute("result",result_ride.getRideId());
		
		String url1 = "https://localhost:8180/ride/saveRider?rideId={rideId}&userId={userId}";
		User user = (User) session.getAttribute("user");
		
		Map<String,String> params = new HashMap<String,String>();
		params.put("rideId", result_ride.getRideId());
		params.put("userId", user.getUserId());
		template.getForEntity(url1, Boolean.class,params);
		return "profile";
	}
		
	@RequestMapping(value="/createRide",method=RequestMethod.POST) 
	public String createRide(@RequestBody Ride ride, ModelMap model)
	{
		RestTemplate template = new RestTemplate();
		String url = "https://localhost:8180/ride/createRide";
		/*Map<String,String> params = new HashMap<String,String>();
		params.put("userId", userId);
		params.put("password", password);
		*/
		Boolean result = template.postForObject(url, ride,Boolean.class);
		model.addAttribute("result",result);
		return "profile";
	}
	
	@RequestMapping(value="/saveRider",method=RequestMethod.GET,headers="Accept=application/json")
	public String saveRider(@RequestParam("rideId") String rideId,@RequestParam("userId") String userId)
	{
		String url = "https://localhost:8180/ride/saveRider?rideId={rideId}&userId={userId}";
		RestTemplate template = new RestTemplate();
		Map<String,String> params = new HashMap<String,String>();
		params.put("rideId", rideId);
		params.put("userId", userId);
		ResponseEntity<Boolean> result = template.getForEntity(url, Boolean.class,params);
		return "profile";
	}
}