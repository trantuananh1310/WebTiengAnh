package dakt.javatech.jhibernate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeAdmin {

	@RequestMapping(value="/HomeAdmin", method=RequestMethod.GET)
	public ModelAndView HomeAdmin()
	{
		return new ModelAndView("admin/index");
	}
}
