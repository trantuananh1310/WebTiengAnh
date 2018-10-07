package dakt.javatech.jhibernate.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView getAllMembers(ModelMap model)
	{
		ModelAndView modelView=new ModelAndView("home");
		return modelView;
	}
}
