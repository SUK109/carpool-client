package com.wpl.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;

import com.wpl.model.User;

@Controller
@SessionAttributes("user")
public class UserController
{
	@RequestMapping(value="/login",method=RequestMethod.POST) 
	public String checkUser(@RequestParam("userId") String userId,
			@RequestParam("password") String password, ModelMap model)
	{
		RestTemplate template = new RestTemplate();
		String url = "https://localhost:8180/user/checkUser";
		/*Map<String,String> params = new HashMap<String,String>();
		params.put("userId", userId);
		params.put("password", password);
		*/
		User user = new User();
		user.setUserId(userId);
		user.setPassword(password);
		Boolean result = template.postForObject(url, user,Boolean.class);
		model.addAttribute("result",result);
		if(!result)
			return "login";			
		else
		{
			user = getUser(userId);
			model.addAttribute("user",user);
			System.out.println(user.getEmailId()+"   "+user.getFirstName());
			return "profile";
		}
	}
	
	@RequestMapping(value="/getProfile",method=RequestMethod.GET,headers="Accept=application/json")
	public User getUser(@RequestParam("userId") String userId)
	{
		String url = "https://localhost:8180/user/getUser?userId={userId}";
		RestTemplate template = new RestTemplate();
		Map<String,String> params = new HashMap<String,String>();
		params.put("userId", userId);
		ResponseEntity<User> user = template.getForEntity(url, User.class,params);
		return user.getBody();
	}
	
	@RequestMapping(value="/updateProfile",method=RequestMethod.POST)
	@ResponseBody
	public String updateProfile(
			@RequestHeader("userId") String userId,
			@RequestHeader("firstName") String firstName,
			@RequestHeader("lastName") String lastName,
			@RequestHeader("emailId") String emailId,
			@RequestHeader("phoneNo") String phoneNo
			)
	{
		String url = "https://localhost:8180/user/updateUserProfile";
		RestTemplate template = new RestTemplate();
		/*Map<String,String> params = new HashMap<String,String>();
		params.put("userId", userId);
		params.put("firstName", firstName);
		params.put("lastName", lastName);
		params.put("emailId", emailId);
		params.put("phoneNo", phoneNo);*/
		User user = new User();
		user.setUserId(userId);
		user.setEmailId(emailId);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setPhoneNo(phoneNo);
		user.setEmailId(emailId);
		
		System.out.println(user.toString());
		Boolean result = template.postForObject(url, user,Boolean.class);
		System.out.println("Called");
		return "Profile Updated Successfully";
	}
}