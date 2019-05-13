package shopfoods.controller;

import java.security.Principal;
import java.util.List;

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
import shopfoods.dao.CategoryDao;
import shopfoods.dao.NewsDao;
import shopfoods.model.Category;

@Controller
@RequestMapping("/admin/cats/")
public class AdminCats {
	@Autowired
	private Defines defines;
	@Autowired
	private CategoryDao catDao;
	
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpSession session, Principal principal) {
		modelMap.addAttribute("defines", defines);
	}
	
	@RequestMapping(value= {"/index","/index/{page}"})
	public String index(@PathVariable(value="page",required=false) Integer page,ModelMap modelMap) {
		if(page == null) {
			page = 1;
		}
		int toTalCats = catDao.getCount();
		int sumPage = (int)Math.ceil((float)toTalCats / Defines.ROW_COUNT_ADMIN);
		modelMap.addAttribute("sumPage", sumPage);
		int offset = (page - 1)*Defines.ROW_COUNT_ADMIN;
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("listCats", catDao.getCats(offset));
		return "admin.cats.index";
	}
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add() {
		return "admin.cats.add";
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("cat") Category cat,RedirectAttributes ra) {
		if(catDao.addCat(cat) > 0) {
			ra.addFlashAttribute("msg", "Thêm thành công !");
		}else {
			ra.addFlashAttribute("msg", "Thêm không thành công.");
		}
		return "redirect:/admin/cats/index";
	}
	@RequestMapping(value="/edit/{id_cat}",method=RequestMethod.GET)
	public String edit(@PathVariable("id_cat") int id_cat,ModelMap model) {
		if(catDao.getCat(id_cat) != null) {
			model.addAttribute("cat", catDao.getCat(id_cat));
		}
		return "admin.cats.edit";
	}
	@RequestMapping(value="/edit/{id_cat}",method=RequestMethod.POST)
	public String edit(@ModelAttribute("cat") Category cat,@PathVariable("id_cat") int id_cat,RedirectAttributes ra) {
		if(catDao.editCat(cat) > 0) {
			ra.addFlashAttribute("msg", "Sửa thành công !");
		}else {
			ra.addFlashAttribute("msg", "Sửa không thành công !");
		}
		return "redirect:/admin/cats/index";
	}
	@RequestMapping(value="/search")
	public String search(@ModelAttribute("name") String name,ModelMap model,RedirectAttributes ra) {
		List<Category> listCats = catDao.getListCats(name);
		if(listCats.size() > 0) {
			model.addAttribute("listCats", listCats);
			model.addAttribute("msg","kết quả cho : " + name);
		}else {
			ra.addFlashAttribute("msg0", "không tìm thấy "+name);
			return "redirect:/admin/cats/index";
		}
		return "admin.cats.index";
	}
	@RequestMapping(value="/giorac")
	public String giorac(ModelMap modelMap) {
		modelMap.addAttribute("listCats", catDao.getCatsGR());
		return "admin.cats.giorac";
	}
	@RequestMapping(value="/delete/{id_cat}",method=RequestMethod.GET)
	public String delete(@PathVariable("id_cat") int id_cat,RedirectAttributes ra) {
		if(catDao.deleteCat(id_cat) > 0) {
			ra.addFlashAttribute("msg", "Xóa thành công!");
		}else {
			ra.addFlashAttribute("msg", "Xóa không thành công!");
		}
		return "redirect:/admin/cats/giorac";
	}
	@RequestMapping(value="/delTam/{id_cat}",method=RequestMethod.GET)
	public String deleteAll(@ModelAttribute("id_cat") String id_cat,RedirectAttributes ra,ModelMap model) {
		String[] list= id_cat.split(",");
		for(int i = 1;i<list.length;i++) {
			catDao.updateCat(Integer.parseInt(list[i]));
		}
		//catDao.updateCat(id_cat);
		return "redirect:/admin/cats/index";
	}
	@RequestMapping(value="/delAllMM/{id_cat}",method=RequestMethod.GET)
	public String deleteAllMM(@ModelAttribute("id_cat") String id_cat,RedirectAttributes ra,ModelMap model) {
		//catDao.deleteCat(id_cat);
		String[] list= id_cat.split(",");
		for(int i = 1;i<list.length;i++) {
			catDao.deleteCat(Integer.parseInt(list[i]));
		}
		return "redirect:/admin/cats/index";
	}
	@RequestMapping(value="/del/{id_cat}",method=RequestMethod.GET)
	public String del(@PathVariable("id_cat") int id_cat,RedirectAttributes ra) {
		if(catDao.updateCat(id_cat) > 0) {
			ra.addFlashAttribute("msg", "Xóa thành công!");
		}else {
			ra.addFlashAttribute("msg", "Xóa không thành công!");
		}
		return "redirect:/admin/cats/index";
	}
	@RequestMapping(value="/restore/{id_cat}",method=RequestMethod.GET)
	public String restore(@PathVariable("id_cat") int id_cat,RedirectAttributes ra) {
		if(catDao.restoreCat(id_cat) > 0) {
			ra.addFlashAttribute("msg", "restore thành công!");
		}else {
			ra.addFlashAttribute("msg", "restore không thành công!");
		}
		return "redirect:/admin/cats/giorac";
	}
	@RequestMapping(value="/giorac/search")
	public String searchGioRac(@ModelAttribute("name") String name,ModelMap model,RedirectAttributes ra) {
		List<Category> listCats = catDao.getListCatsGR(name);
		if(listCats.size() > 0) {
			model.addAttribute("listCats", listCats);
			model.addAttribute("msg","kết quả cho : " + name);
		}else {
			ra.addFlashAttribute("msg0", "không tìm thấy "+name);
			return "redirect:/admin/cats/giorac";
		}
		return "admin.cats.giorac";
	}
}
