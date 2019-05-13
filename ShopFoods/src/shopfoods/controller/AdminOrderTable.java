package shopfoods.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shopfoods.constant.Defines;
import shopfoods.dao.BookTableDao;
import shopfoods.dao.UsersDao;

@Controller
@RequestMapping("/admin/table")
public class AdminOrderTable {
	@Autowired
	private Defines defines;
	@Autowired
	private BookTableDao tableDao;

	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpSession session, Principal principal) {
		modelMap.addAttribute("defines", defines);
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap modelMap) {	
		modelMap.addAttribute("listtable", tableDao.getList());
		return "admin.table.index";
	}
	@RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
	public String del(@PathVariable("id") int id,ModelMap modelMap,RedirectAttributes ra) {
		if(tableDao.del(id)>0) {
			ra.addFlashAttribute("msg", "Hủy thành công");
		}
		return "redirect:/admin/table/index";
	}
	@RequestMapping(value = "/update/{check_tb}/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("check_tb") int check_tb,@PathVariable("id") int id,ModelMap modelMap,RedirectAttributes ra) {
		if(tableDao.update(id,check_tb)>0) {
			ra.addFlashAttribute("msg", "update thành công");
		}
		return "redirect:/admin/table/index";
	}
	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public String history(ModelMap modelMap) {
		modelMap.addAttribute("listtable", tableDao.getListHistory());
		return "admin.table.history";
	}
	@RequestMapping(value = "/update-check/{day}/{month}/{year}", method = RequestMethod.GET)
	public String updatecheck(@PathVariable("day") int day,@PathVariable("month") int month,@PathVariable("year") int year,ModelMap modelMap) {
		String date = month+"/"+day+"/"+year;
		modelMap.addAttribute("listtable", tableDao.getList(date));
		return "admin.table.index";
	}
	@RequestMapping(value = "/history/{day}/{month}/{year}", method = RequestMethod.GET)
	public String history1(@PathVariable("day") int day,@PathVariable("month") int month,@PathVariable("year") int year,ModelMap modelMap) {
		String date = month+"/"+day+"/"+year;
		modelMap.addAttribute("listtable", tableDao.getListHistory(date));
		return "admin.table.history";
	}
}
