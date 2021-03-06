package dakt.javatech.jhibernate.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.ReadquestionDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Readquestion;

@Controller
@EnableWebMvc
public class AdminReadQuestionController {
	
	@Autowired
	LevelDao levelDao;
	
	@Autowired
	ReadquestionDao readQuesDao;
	
	@RequestMapping(value="/AdminListReadQuestion", method=RequestMethod.GET)
	public ModelAndView listReadQuestion(int readexerciseid)
	{
		List<Readquestion> list = new ArrayList<Readquestion>();
		list= readQuesDao.getListByReadExId(readexerciseid);
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView = new ModelAndView("admin/read_exercise/list_read_question");
		modelView.addObject("lstReadQuestion", list);
		modelView.addObject("listLevel",lstLevel);
		modelView.addObject("readexerciseid", readexerciseid);
		return modelView;
	}
	
	@RequestMapping(value="/addReadQuestion", method=RequestMethod.POST)
	@ResponseBody
	public void AddAndEditReadQuestion(Readquestion readQuestion, String readquesid,ModelMap modelMap,HttpServletRequest request)
	{
		
		if(readquesid!=null && !readquesid.isEmpty()) {
			Readquestion readQues = new Readquestion();
			readQues = readQuesDao.getById(Integer.parseInt(readquesid));
			readQues.setQuestion(readQuestion.getQuestion());
			readQues.setOption1(readQuestion.getOption1());
			readQues.setOption2(readQuestion.getOption2());
			readQues.setOption3(readQuestion.getOption3());
			readQues.setOption4(readQuestion.getOption4());
			readQues.setCorrectanswer(readQuestion.getCorrectanswer());
			readQues.setReadexerciseid(readQuestion.getReadexerciseid());
			readQuesDao.update(readQues);
		}
		else {
			readQuesDao.add(readQuestion);
		}
	}
	
	@RequestMapping(value="/editReadQuestion",method=RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody Readquestion EditReadQuestion(Integer readQuestionId)	
	{
		Readquestion readQues = new Readquestion();
		readQues = readQuesDao.getById(readQuestionId);
		return readQues;
	}
	
	@RequestMapping(value="/deleteReadQuestion",method=RequestMethod.POST)
	public void deleteReadQuestion(Integer readQuestionId)	
	{
		readQuesDao.delete(readQuestionId);
	}
	
	@RequestMapping(value="/addReadQuestionExcel", method=RequestMethod.POST)
	public ModelAndView addListenQuestionExecl(@RequestParam(value = "excel") CommonsMultipartFile execl
												,HttpServletRequest request,ModelMap modelMap,int readexerciseid) throws IOException
	{
		try {
			//upload
			InputStream in = execl.getInputStream();
		    File currDir = new File(".");
		    String path = currDir.getAbsolutePath();
		    String fileLocation = path.substring(0, path.length() - 1) + execl.getOriginalFilename();
		    FileOutputStream f = new FileOutputStream(fileLocation);
		    int ch = 0;
		    while ((ch = in.read()) != -1) {
		        f.write(ch);
		    }
		    f.flush();
		    f.close();	
		    FileInputStream inputStream = new FileInputStream(new File(fileLocation));
		    // Đối tượng workbook cho file XSL.
		      XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
		      // Lấy ra sheet đầu tiên từ workbook
		       XSSFSheet sheet = workbook.getSheetAt(0);
		       int a=sheet.getLastRowNum();
		       for(int i=0; i<sheet.getLastRowNum();i++) {
		    	   Row row = sheet.getRow(i+1);
		    	   Readquestion readQues = new Readquestion();
		    	   readQues.setQuestion(row.getCell(0).getStringCellValue());
		    	   readQues.setOption1(row.getCell(1).getStringCellValue());
		    	   readQues.setOption2(row.getCell(2).getStringCellValue());
		    	   readQues.setOption3(row.getCell(3).getStringCellValue());
		    	   readQues.setOption4(row.getCell(4).getStringCellValue());
		    	   readQues.setCorrectanswer(row.getCell(5).getStringCellValue());
		    	   readQues.setReadexerciseid(readexerciseid);
		    	   readQuesDao.add(readQues);
		       }
			return new ModelAndView("redirect:/AdminListReadQuestion?readexerciseid="+readexerciseid);
		}
		catch(Exception e)
		{
			return new ModelAndView("admin/404");
		}
		
	}
//	public void uploadFile(CommonsMultipartFile CommonsMultipartFile, String path,HttpServletRequest request,ModelMap modelMap)
//	{
//		String item = CommonsMultipartFile.getOriginalFilename();
//		String dirFile = request.getRealPath(path);
//		System.out.println(dirFile);
//		File fileDir = new File(dirFile);
//		if (!fileDir.exists()) {
//			fileDir.mkdir();
//		}
//		try {
//			CommonsMultipartFile.transferTo(new File(fileDir + File.separator + item));
//			System.out.println("Upload file thÃ nh cÃ´ng");
//			modelMap.addAttribute("item", item);
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//		}
//	}
}
