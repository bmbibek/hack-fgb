package com.decode.fdb.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FDBController {

	private final static String VIEW_RESOLVER_PATH_MAB = "mab/";
		@RequestMapping("**/home.xhtml")
	public ModelAndView fareLockTermsConditions(@RequestParam("pageIdentifier") String pageIdentifier, HttpServletRequest request)
	{
		
		Map<String, Object> model = new HashMap<String, Object>();
				
		return new ModelAndView(VIEW_RESOLVER_PATH_MAB+"home","model",model);
	}
}