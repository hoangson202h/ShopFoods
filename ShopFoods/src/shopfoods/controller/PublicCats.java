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

import shopfoods.constant.Defines;
import shopfoods.dao.CategoryDao;
import shopfoods.dao.NewsDao;

@Controller
@RequestMapping("/public/cats")
public class PublicCats {
	@Autowired
	private Defines defines;
	@Autowired
	private NewsDao newsDao;
	@Autowired
	private CategoryDao catDao;
	
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpSession session, Principal principal) {
		modelMap.addAttribute("defines", defines);
	}
	@RequestMapping(value="/{id_cat}",method=RequestMethod.GET)
	public String indexPublic(@PathVariable("id_cat") int id_cat,ModelMap model) {
		model.addAttribute("listNewsID",newsDao.ogetListNewsID(id_cat));
		return "public.cats";
	}
	
}
