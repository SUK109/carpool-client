package com.wpl.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wpl.localservice.EmailService;
import com.wpl.model.User;

//@SessionAttributes("result")
@Controller
public class EmailController
{
	@Autowired
	private EmailService emailService;
	
	@RequestMapping(value="/sendEmail",method=RequestMethod.GET)
	@ResponseBody
	public String sendMail(@RequestParam("name") String name,@RequestParam("emailId") String emailId,HttpServletRequest req)
	{
		User user = (User)req.getSession().getAttribute("user");
		emailService.sendMail(user.getFirstName()+"  "+user.getLastName(),emailId,false);
		return "Email Sent Successfully";
	}
}