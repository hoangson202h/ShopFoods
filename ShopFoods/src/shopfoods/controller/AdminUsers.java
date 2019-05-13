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
import shopfoods.dao.UsersDao;
import shopfoods.model.User;
import shopfoods.util.StringUtil;

@Controller
@RequestMapping("/admin/user")
public class AdminUsers {
	@Autowired
	private Defines defines;
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private StringUtil stringUtil;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpSession session, Principal principal) {
		modelMap.addAttribute("defines", defines);
	}
	@RequestMapping(value= {"/index","/index/{page}"})
	public String index(@PathVariable(value="page",required=false) Integer page,ModelMap model) {
		if(page == null) {
			page = 1;
		}
		int toTalCats = usersDao.getCount();
		int sumPage = (int)Math.ceil((float)toTalCats / Defines.ROW_COUNT_ADMIN);
		model.addAttribute("sumPage", sumPage);
		int offset = (page - 1)*Defines.ROW_COUNT_ADMIN;
		model.addAttribute("page", page);
		
		model.addAttribute("listUser", usersDao.getListUser(offset));
		return "admin.user.index";
	}
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add() {
		return "admin.user.add";
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("user") User user,ModelMap model,RedirectAttributes ra) {
		String password = stringUtil.tess(user.getPassword());
		user.setPassword(password);
		List<User> listUser = usersDao.getListUser();
		boolean ck = true;
		for (User item : listUser) {
			if(user.getUsername().equals(item.getUsername())) {
				ck = false;
			}
		}
		if(ck) {
			if(usersDao.addUser(user) > 0) {
				ra.addFlashAttribute("msg", "Thêm thành công !");
			}else {
				ra.addFlashAttribute("msg", "Thêm không thành công !");
			}
		}else {
			model.addAttribute("user", user);
			model.addAttribute("msg", "username đã tồn tại.");
			return "admin.user.add";
		}
		return "redirect:/admin/user/index";
	}
	@RequestMapping(value="/edit/{id_user}",method=RequestMethod.GET)
	public String edit(@PathVariable("id_user") int id_user,ModelMap model) {
		model.addAttribute("user", usersDao.getUser(id_user));
		return "admin.user.edit";
	}
	@RequestMapping(value="/edit/{id_user}",method=RequestMethod.POST)
	public String edit(@ModelAttribute("user") User user,@PathVariable("id_user") int id_user,RedirectAttributes ra) {
		String password = "";
		if("".equals(user.getPassword())) {
			User userOld = usersDao.getUser(id_user);
			password = userOld.getPassword();
		}else{
			String password1 = user.getPassword();
			password = stringUtil.tess(password1);
		}
		user.setPassword(password);
		user.setAvatar("h1");
		if(usersDao.editUser(user) > 0) {
			ra.addFlashAttribute("msg", "Sửa thành công !");
		}else {
			ra.addFlashAttribute("msg", "Sửa không thành công !");
		}
		return "redirect:/admin/user/index";
	}
	@RequestMapping(value="/del/{id_user}")
	public String del(@PathVariable("id_user") int id_user,RedirectAttributes ra) {
		if(usersDao.delUser(id_user) > 0) {
			ra.addFlashAttribute("msg", "Xóa thành công !");
		}else {
			ra.addFlashAttribute("msg", "Xóa không thành công !");
		}
		return "redirect:/admin/user/index";
	}
	@RequestMapping(value="/search")
	public String search(@ModelAttribute("fullname") String fullname,ModelMap model,RedirectAttributes ra) {
		List<User> listUsers = usersDao.getListUser(fullname);
		if(listUsers.size() > 0) {
			model.addAttribute("listUser", listUsers);
			model.addAttribute("msg", "kết quả cho : " + fullname);
		}else {
			ra.addFlashAttribute("msg0", "không tìm thấy : " + fullname);
			return "redirect:/admin/user/index";
		}
		return "admin.user.index";
	}
}



