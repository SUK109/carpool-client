package com.wpl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wpl.localservice.EmailService;

@Controller
//@SessionAttributes("result")
public class ReviewController
{
	@Autowired
	private EmailService emailService;
	
	@RequestMapping(value="/sendEmail",method=RequestMethod.GET)
	public void sendMail(@RequestParam("emailId") String emailId)
	{
		emailService.sendMail(emailId);
	}
}