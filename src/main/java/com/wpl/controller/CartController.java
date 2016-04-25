package com.wpl.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;

import com.wpl.localservice.EmailService;
import com.wpl.model.Ride;
import com.wpl.model.User;
import com.wpl.model.ViewRide;

@Controller
@SessionAttributes({"usercart","riders","uride"})
public class CartController {

	@Autowired
	private EmailService email;
	
	@Autowired
	private SearchController sc;
	
	@RequestMapping(value="/addToCart")
	@ResponseBody
	public String addToCart(@RequestParam("rideId") String rideId, 
			HttpSession session,ModelMap model)
	{
		RestTemplate template = new RestTemplate();
		String url = "https://localhost:8180/ride/getRide?rideId={rideId}";
		Map<String,String> params = new HashMap<String,String>();
		params.put("rideId", rideId);
		ResponseEntity<Ride> ride = template.getForEntity(url, Ride.class, params);
		List<Ride> rides;
		model.addAttribute("riders",1);
		//Check if this is first item added
		if(session.getAttribute("usercart")!=null)
			rides = (List<Ride>) session.getAttribute("usercart");
		else {
			rides = new ArrayList<Ride>();
		}
		rides.add(ride.getBody());
		
		model.addAttribute("usercart", rides);
		model.addAttribute("riders",1);
		System.out.println("CART SIZE : " + rides.size());
		return "Ride Added to your cart";
	}
	
	@RequestMapping(value="/checkOut")
	@ResponseBody
	public String checkOut(HttpSession session,ModelMap model)
	{
		User user = (User)session.getAttribute("user");	
		List<Ride> rides = (ArrayList<Ride>)session.getAttribute("usercart");
		RestTemplate template = new RestTemplate();
		String url = "https://localhost:8180/cart/checkOut?userId={userId}&rides={rides}";
		String[] rideIds = new String[rides.size()];
		int i=0;
		for(Ride ride : rides) {
			rideIds[i++]=ride.getRideId();
		}
		String pass = Arrays.toString(rideIds);
		System.out.println("STRING ARRAY OF RIDES " + pass.substring(1, pass.length()-1));
		Map<String,String> params = new HashMap<String,String>();
		params.put("userId",user.getUserId());
		params.put("rides",pass.substring(1, pass.length()-1));
		user = template.getForObject(url, User.class, params);
		session.removeAttribute("usercart");
		model.remove("usercart");
		email.sendMail(user.getFirstName()+"  "+user.getLastName(),user.getEmailId(),true);
		List<ViewRide> vr = sc.getRide(user.getUserId());
		model.addAttribute("uride",vr);
		return "Check Out Successful";
	}
	
	@RequestMapping(value="/removeFromCart")
	@ResponseBody
	public String removeFromCart(@RequestParam("rideId") String rideId,HttpSession session,ModelMap model)
	{
		List<Ride> rides = (ArrayList<Ride>)session.getAttribute("usercart");
		for(Ride ride : rides) {
			if(rideId.equals(ride.getRideId())) {
					rides.remove(ride);
					break;
			}
		}
		model.addAttribute("usercart", rides);
		return "Cart Updated";
	}
	
	@RequestMapping(value="/updateCart")
	@ResponseBody
	public String updateCart(String qty,ModelMap model) {
		
		model.addAttribute("riders",qty);
		return "Riders Updated";
	}
	
	// OAUTH
	@RequestMapping("/oauth")
	public void getAuthorizationToken(HttpServletResponse res)
	{
		System.out.println(res.getHeader("access_token"));
	}
}