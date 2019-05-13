package shopfoods.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import shopfoods.constant.Defines;
import shopfoods.dao.UsersDao;
import shopfoods.model.User;

@Controller
@RequestMapping("/admin")
public class AdminIndex {
	@Autowired
	private Defines defines;
	@Autowired
	private UsersDao userDao;

	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpSession session, Principal principal) {
		modelMap.addAttribute("defines", defines);
		User user = userDao.getUser(principal.getName());
		session.setAttribute("user", user);
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "admin.index.index";
	}
	@RequestMapping(value = "/sign-up", method = RequestMethod.POST)
	public String signup() {
		System.out.println("ok");
		return "auth.login";
	}
}
