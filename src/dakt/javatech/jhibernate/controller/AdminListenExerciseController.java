package dakt.javatech.jhibernate.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;









import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dakt.javatech.jhibernate.dao.LevelDao;
import dakt.javatech.jhibernate.dao.ListenexerciseDao;
import dakt.javatech.jhibernate.dao.ListenquestionDao;
import dakt.javatech.jhibernate.entity.Level;
import dakt.javatech.jhibernate.entity.Listenexercise;
import dakt.javatech.jhibernate.entity.Listenquestion;
import dakt.javatech.jhibernate.entity.Readquestion;
import freemarker.core.ReturnInstruction.Return;

@Controller
public class AdminListenExerciseController {
	@Autowired
	LevelDao levelDao;
	
	@Autowired
	ListenexerciseDao listenExDao;
	@Autowired
	ListenquestionDao listenQuestionDao;
	@RequestMapping(value="/AdminListenExercise", method=RequestMethod.GET)
	public ModelAndView getListListenExercise()
	{
		List<Listenexercise> list= new ArrayList<Listenexercise>();
		list= listenExDao.list();
		List<Level> lstLevel=levelDao.list();
		ModelAndView modelView= new ModelAndView("admin/listen_exercise/list_listenExerciseAdmin");
		modelView.addObject("listListenExer",list);
		modelView.addObject("listLevel",lstLevel);
		return modelView;
	}
	@RequestMapping(value="/getListExrciseByLevelIdAjax",method=RequestMethod.GET)
	public ModelAndView getListExrciseByLevelIdAjax(String levelId)
	{
		List<Level> lstLevel=levelDao.list();
		List<Listenexercise> list= new ArrayList<Listenexercise>();
		if(levelId.equals("0")) list=listenExDao.list();
		else
			list= listenExDao.getListByLevelId(levelId);
		ModelAndView modelView= new ModelAndView("admin/listen_exercise/list_exercise_byLevelIdAdmin");
		modelView.addObject("listListenExer",list);
		modelView.addObject("listLevel",lstLevel);
		return modelView;

	}
	@RequestMapping(value="/addAndEditListenExercise",method=RequestMethod.POST)
	public ModelAndView addAndEditListenExercise(String listenname,Integer levelid, String listenexeriseid, @RequestParam(value = "file") CommonsMultipartFile commonsMultipartFiles,
			ModelMap modelMap,HttpServletRequest request ) throws UnsupportedOperationException, IOException 
	{
		String nameFile = commonsMultipartFiles.getOriginalFilename();
		if(!listenexeriseid.isEmpty() && listenexeriseid!=null)
		{
			Listenexercise listenExr= listenExDao.getById(Integer.parseInt(listenexeriseid));
			listenExr.setListenexerciseimage(nameFile);
			listenExr.setListenexercisename(listenname);
			listenExr.setLevelid(levelid);
			listenExDao.update(listenExr);
		}
		else
		{
			Listenexercise listenEx = new Listenexercise();
			listenEx.setListenexercisename(listenname);
			listenEx.setListenexerciseimage(nameFile);
			listenEx.setLevelid(levelid);
			listenExDao.add(listenEx);
		}
		String dirFile = request.getRealPath("images\\listenexercises");
		System.out.println(dirFile);
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdir();
		}
		try {
			commonsMultipartFiles.transferTo(new File(fileDir + File.separator + nameFile));
			System.out.println("Upload file thÃ nh cÃ´ng");
			modelMap.addAttribute("filename", nameFile);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Upload file tháº¥t báº¡i");
		}
		ModelAndView modelView = new ModelAndView("redirect:/AdminListenExercise");
		return modelView;
	}
	@RequestMapping(value="/getListenExerciseByExrId",method=RequestMethod.GET,headers = "Accept=application/json")
	public @ResponseBody Listenexercise getListenExerciseByExrId( int listenExerciseId)
	{
		Listenexercise item = listenExDao.getById(listenExerciseId);
		return item;
				
	}
	@RequestMapping(value="/deleteListenExercise",method=RequestMethod.POST)
	public void deleteReadExercise(Integer listenExerciseId)	
	{
		List<Listenquestion> lstListenQuestion = new ArrayList<>();
		lstListenQuestion = listenQuestionDao.getListByListenExerciseId(listenExerciseId);
		if(lstListenQuestion!=null || lstListenQuestion.size()>0) {
			for (Listenquestion item : lstListenQuestion) {
				listenQuestionDao.delete(item.getListenquestionid());
			}
		}
		listenExDao.delete(listenExerciseId);
	}
	
	@RequestMapping(value="/addWithFileExecl",method=RequestMethod.POST)
	@ResponseBody
	public String  addWithFileExecl(@RequestParam(value = "file") CommonsMultipartFile commonsMultipartFiles,HttpServletRequest request) throws IOException
	{
		String[] ArrayName ={"listenexercisename","listenexerciseimage","levelid"};
		// upload file lên 
		InputStream in = commonsMultipartFiles.getInputStream();
	    File currDir = new File(".");
	    String path = currDir.getAbsolutePath();
	    String fileLocation = path.substring(0, path.length() - 1) + commonsMultipartFiles.getOriginalFilename();
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
	    // Lấy ra Iterator cho tất cả các dòng của sheet hiện tại.
	       Iterator<Row> rowIterator = sheet.iterator();
	       int numberRow=0;
	       while (rowIterator.hasNext()) {
	    	   Row row = rowIterator.next();
	    	   if(numberRow==0)
	    	   {
	    		   // Lấy Iterator cho tất cả các cell của dòng hiện tại.
		           Iterator<Cell> cellIterator = row.cellIterator();
		           int i=0;
		           while (cellIterator.hasNext()) {
		               Cell cell = cellIterator.next();
		               if(!cell.getStringCellValue().equals(ArrayName[i])) 
		            	   return "File chọn không hợp lệ";
		               i++;
		           }
	    	   }
	    	   else
	    	   {
	    		   Iterator<Cell> cellIterator = row.cellIterator();
		           int i=0;
		           while (cellIterator.hasNext()) {
		        	   Cell cell = cellIterator.next();
//		        	   try
//		        	   {
		        		   Listenexercise item = new Listenexercise();
			        	   if(i==0) item.setListenexercisename(cell.getStringCellValue()); 
			        	   else if(i==1) item.setListenexerciseimage(cell.getStringCellValue());
			        	   else{ 
			        		   String number=String.valueOf(cell.getNumericCellValue());
			        		   String[] arrayLevelId =number.split(".0");
			        		   item.setLevelid(Integer.parseInt(arrayLevelId[0]));  
			        	   }
			        	   i++;
//		        	   }
//		        	   catch(Exception e)
//		        	   {
//		        		  return "File chọn không hợp lệ"; 
//		        	   }
		        	   
		           }
	    	   }
	         
	           numberRow++;
	     }
	       return "Nhập dữ liệu thành công";
	     
	}
}	

