package dakt.javatech.jhibernate.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.ReadexerciseDao;
import dakt.javatech.jhibernate.dao.ReadquestionDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Readexercise;
import dakt.javatech.jhibernate.entity.Readquestion;

@Controller
@EnableWebMvc
public class AdminReadExerciseController {
	@Autowired
	LevelDao levelDao;
	
	@Autowired
	ReadexerciseDao readExDao;
	
	@Autowired
	ReadquestionDao readQuesDao;
	
	@RequestMapping(value="/AdminReadExercise", method=RequestMethod.GET)
	public ModelAndView AdminReadExercise()
	{
		List<Readexercise> lstReadEx= new ArrayList<Readexercise>();
		lstReadEx = readExDao.list();
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView= new ModelAndView("admin/read_exercise/list_read_exercise");
		modelView.addObject("lstReadEx",lstReadEx);
		modelView.addObject("listLevel",lstLevel);
		return modelView;
	}
	
	@RequestMapping(value="/addReadExercise", method=RequestMethod.POST)
	public ModelAndView AddReadExercise(String readname,Integer levelid, String readexeriseidd, @RequestParam(value = "file") CommonsMultipartFile commonsMultipartFiles,
			ModelMap modelMap,HttpServletRequest request)
	{
		String nameFile = commonsMultipartFiles.getOriginalFilename();
		if(readexeriseidd!=null || !readexeriseidd.isEmpty()) {
			Readexercise readEx = new Readexercise();
			readEx = readExDao.getById(Integer.parseInt(readexeriseidd));
			readEx.setReadname(readname);
			readEx.setLevelid(levelid);
			readEx.setReadimage(nameFile);
			readExDao.update(readEx);
		}
		else {
			Readexercise readExercise = new Readexercise();
			readExercise.setReadname(readname);
			readExercise.setReadimage(nameFile);
			readExercise.setLevelid(levelid);
			readExDao.add(readExercise);
		}
		String dirFile = request.getRealPath("images\\readexercises");
		System.out.println(dirFile);
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdir();
		}
		try {
			commonsMultipartFiles.transferTo(new File(fileDir + File.separator + nameFile));
			System.out.println("Upload file thành công");
			modelMap.addAttribute("filename", nameFile);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Upload file thất bại");
		}
		ModelAndView modelView= new ModelAndView("redirect:/AdminReadExercise");
		return modelView;
	}
	
	@RequestMapping(value="/editReadExercise",method=RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody Readexercise editReadExercise(Integer readExerciseId)	
	{
		Readexercise readEx = new Readexercise();
		readEx = readExDao.getById(readExerciseId);
		return readEx;
	}
	
	@RequestMapping(value="/deleteReadExercise",method=RequestMethod.POST)
	public void deleteReadExercise(Integer readExerciseId)	
	{
		List<Readquestion> lstReadQues = new ArrayList<>();
		lstReadQues = readQuesDao.getListByReadExId(readExerciseId);
		if(lstReadQues!=null || lstReadQues.size()!=0) {
			for (Readquestion readquestion : lstReadQues) {
				readQuesDao.delete(readquestion.getReadquestionid());
			}
		}
		readExDao.delete(readExerciseId);
	}
		
}
