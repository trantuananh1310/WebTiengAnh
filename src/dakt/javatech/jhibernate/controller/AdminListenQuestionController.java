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

import dakt.javatech.jhibernate.dao.ListenquestionDao;
import dakt.javatech.jhibernate.entity.Listenexercise;
import dakt.javatech.jhibernate.entity.Listenquestion;

@Controller
@EnableWebMvc
public class AdminListenQuestionController {
	@Autowired ListenquestionDao listQuestionDao;
	@RequestMapping(value="/AdminListListenQuestion", method=RequestMethod.GET)
	public ModelAndView listListenQuestion(int idListenExercis)
	{
		List<Listenquestion> list = new ArrayList<Listenquestion>();
		list= listQuestionDao.getListByListenExerciseId(idListenExercis);
		ModelAndView modelView = new ModelAndView("admin/listen_exercise/list_listenQuestion");
		modelView.addObject("idListenExercis",idListenExercis);
		modelView.addObject("listQuestion", list);
		return modelView;
	}
	@RequestMapping(value="/addListenQuestion", method=RequestMethod.GET)
	public ModelAndView addQuestion(int listenexerciseid)
	{
		ModelAndView modelView= new ModelAndView("admin/listen_exercise/add_listenquestion");
		modelView.addObject("listenexerciseid", listenexerciseid);
		return modelView;
	}
	@RequestMapping(value="/editListenQuestion", method=RequestMethod.GET)
	public ModelAndView editListenQuestion(int listenQuestionid,int listenexerciseid)
	{
		Listenquestion item=listQuestionDao.getById(listenQuestionid);
		ModelAndView modelView= new ModelAndView("admin/listen_exercise/edit_question");
		modelView.addObject("item", item);
		modelView.addObject("listenexerciseid", listenexerciseid);
		return modelView;
	}
	@RequestMapping(value="/deleteListenQuestion", method=RequestMethod.POST)
	public  @ResponseBody void deleteListenQuestion(int listenQuestionId)
	{
		listQuestionDao.delete(listenQuestionId);
	}
	@RequestMapping(value="/addListenQuestion1", method=RequestMethod.POST)
	public ModelAndView AddListenQuestion(Listenquestion listenQuestion,@RequestParam(value = "file_picture") CommonsMultipartFile picture,
			@RequestParam(value = "file_mp3") CommonsMultipartFile fileMp3,HttpServletRequest request,ModelMap modelMap)
	{
		String imagename = picture.getOriginalFilename();
		String audiomp3= fileMp3.getOriginalFilename();
		listenQuestion.setAudiomp3(audiomp3);
		listenQuestion.setImagename(imagename);
		String dirFile = request.getRealPath("images\\ListenQuestion");
		System.out.println(dirFile);
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdir();
		}
		try {
			picture.transferTo(new File(fileDir + File.separator + imagename));
			System.out.println("Upload file thÃ nh cÃ´ng");
			modelMap.addAttribute("imagename", imagename);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String dirFile1 = request.getRealPath("Audio\\listenquestion");
		System.out.println(dirFile1);
		File fileDir1 = new File(dirFile1);
		if (!fileDir1.exists()) {
			fileDir1.mkdir();
		}
		try {
			fileMp3.transferTo(new File(fileDir1 + File.separator + audiomp3));
			System.out.println("Upload file thÃ nh cÃ´ng");
			modelMap.addAttribute("audiomp3", audiomp3);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		listQuestionDao.add(listenQuestion);
		return new ModelAndView("redirect:/AdminListListenQuestion?idListenExercis="+listenQuestion.getListenexerciseid());
	}
	@RequestMapping(value="/editListenQuestion", method=RequestMethod.POST)
	public ModelAndView EditListenQuestion(Listenquestion listenQuestion,@RequestParam(value = "file_picture") CommonsMultipartFile picture,
			@RequestParam(value = "file_mp3") CommonsMultipartFile fileMp3,HttpServletRequest request,ModelMap modelMap)
	{
		
		String imagename = picture.getOriginalFilename();
		String audiomp3= fileMp3.getOriginalFilename();
		if(!audiomp3.isEmpty())listenQuestion.setAudiomp3(audiomp3);
		if(!imagename.isEmpty())listenQuestion.setImagename(imagename);
		String dirFile = request.getRealPath("images\\ListenQuestion");
		System.out.println(dirFile);
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdir();
		}
		try {
			picture.transferTo(new File(fileDir + File.separator + imagename));
			System.out.println("Upload file thÃ nh cÃ´ng");
			modelMap.addAttribute("imagename", imagename);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String dirFile1 = request.getRealPath("Audio\\listenquestion");
		System.out.println(dirFile1);
		File fileDir1 = new File(dirFile1);
		if (!fileDir1.exists()) {
			fileDir1.mkdir();
		}
		try {
			fileMp3.transferTo(new File(fileDir1 + File.separator + audiomp3));
			System.out.println("Upload file thÃ nh cÃ´ng");
			modelMap.addAttribute("audiomp3", audiomp3);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		listQuestionDao.update(listenQuestion);
		return new ModelAndView("redirect:/AdminListListenQuestion?idListenExercis="+listenQuestion.getListenexerciseid());
	}
	@RequestMapping(value="/addListenQuestionExecl", method=RequestMethod.POST)
	public ModelAndView addListenQuestionExecl(@RequestParam(value = "execl") CommonsMultipartFile execl,@RequestParam(value = "image") CommonsMultipartFile[] image,
			@RequestParam(value = "filemp3") CommonsMultipartFile[] fileMp3,HttpServletRequest request,ModelMap modelMap,int listenexerciseid) throws IOException
	{
		//upload
		try{
			
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
	    // Lấy ra Iterator cho tất cả các dòng của sheet hiện tại.
	       Iterator<Row> rowIterator = sheet.iterator();
	       int numberRow=0;
	       while (rowIterator.hasNext()) {
	    	   Row row = rowIterator.next();
	    	   if(numberRow==0){}
	    	   else
	    	   {
	    		   Iterator<Cell> cellIterator = row.cellIterator();
		           int i=0;
		           Listenquestion item = new Listenquestion();
		           while (cellIterator.hasNext()) {
		        	   Cell cell = cellIterator.next();
			        	   if(i==0) item.setImagename(cell.getStringCellValue()); 
			        	   else if(i==1) item.setAudiomp3(cell.getStringCellValue());
			        	   else if(i==2) item.setQuestion(cell.getStringCellValue());
			        	   else if(i==3) item.setOption1(cell.getStringCellValue());
			        	   else if(i==4) item.setOption2(cell.getStringCellValue());
			        	   else if(i==5) item.setOption3(cell.getStringCellValue());
			        	   else if(i==6) item.setOption4(cell.getStringCellValue());
			        	   else if(i==7) item.setCorrectanswer(cell.getStringCellValue());
			        	   i++;
		           }
		           item.setListenexerciseid(listenexerciseid);
		           listQuestionDao.add(item);
	    	   }
	           numberRow++;
	     }
	      // up load list ảnh và video
	       for (CommonsMultipartFile item : image) {
	    	   uploadFile(item,"images\\ListenQuestion",request,modelMap);
		}
	       for(CommonsMultipartFile item:fileMp3){
	    	   uploadFile(item,"Audio\\listenquestion",request,modelMap);
	       }
	       return new ModelAndView("redirect:/AdminListListenQuestion?idListenExercis="+listenexerciseid);
		}
		catch(Exception e)
		{
			return new ModelAndView("redirect:/errorAdmin");
		}
	}
	public void uploadFile(CommonsMultipartFile CommonsMultipartFile, String path,HttpServletRequest request,ModelMap modelMap)
	{
		String item = CommonsMultipartFile.getOriginalFilename();
		String dirFile = request.getRealPath(path);
		System.out.println(dirFile);
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdir();
		}
		try {
			CommonsMultipartFile.transferTo(new File(fileDir + File.separator + item));
			System.out.println("Upload file thÃ nh cÃ´ng");
			modelMap.addAttribute("item", item);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
}
