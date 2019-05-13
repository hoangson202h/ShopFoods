package shopfoods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shopfoods.constant.Defines;
import shopfoods.model.User;

@Controller
@RequestMapping("auth")
public class AdminAuth {
	@Autowired
	private Defines defines;
	
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
	}
	@RequestMapping("/login")
	public String login() {
		return "auth.login";
	}
	
	@RequestMapping("403")
	public String eror403() {
		return "err.403";
	}
}
