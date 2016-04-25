package com.wpl.controller;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;

import com.wpl.model.ViewRide;

@Controller
@SessionAttributes("rides")
public class SearchController {
  @RequestMapping(value="/search",method=RequestMethod.GET,headers="Accept=application/json")
  public String searchRide(@RequestParam("ridedate") @DateTimeFormat(pattern="yyyy-MM-dd") Date rideDate, ModelMap model)
  {
    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
    String rDate = sd.format(rideDate);
    String url = "https://localhost:8180/search/searchRide?rideDate={rdate}";
    Map<String,String> params = new HashMap<String,String>();
    params.put("rdate", rDate);
    RestTemplate template = new RestTemplate();
    ResponseEntity<ArrayList> r = template.getForEntity(url, ArrayList.class, params);
    model.addAttribute("rides",r.getBody());
    return "profile";
  }
  
  @RequestMapping(value="/getRide",method=RequestMethod.GET,headers="Accept=application/json")
  public List<ViewRide> getRide(String userId)
  {
    String url = "https://localhost:8180/search/getRide?userId={userId}";
    RestTemplate template = new RestTemplate();
    Map<String,String> params = new HashMap<String,String>();
    params.put("userId", userId);
    ResponseEntity<ArrayList> ride = template.getForEntity(url, ArrayList.class,params);
    if(ride!=null)
    	return ride.getBody();
    else
    	return null;
  }
}