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
import shopfoods.dao.CommentDao;
import shopfoods.dao.UsersDao;
import shopfoods.model.User;

@Controller
@RequestMapping("/admin/comment")
public class AdminComment {
	@Autowired
	private Defines defines;
	@Autowired
	private CommentDao commentDao;

	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpSession session, Principal principal) {
		modelMap.addAttribute("defines", defines);
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap model) {
		model.addAttribute("listComment", commentDao.getListCM());
		return "admin.comment.index";
	}
	@RequestMapping(value = "/del/{id_comment}")
	public String delete(@PathVariable("id_comment") int id_comment,RedirectAttributes ra) {
		if(commentDao.delComment(id_comment) > 0) {
			ra.addFlashAttribute("msg", "xóa thành công");
		}else {
			ra.addFlashAttribute("msg", "xóa không thành công");
		}
		return "redirect:/admin/comment/index";
	}
}
