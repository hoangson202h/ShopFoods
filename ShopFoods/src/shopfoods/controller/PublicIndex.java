package shopfoods.controller;

import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shopfoods.constant.Defines;
import shopfoods.dao.BookTableDao;
import shopfoods.dao.CategoryDao;
import shopfoods.dao.CommentDao;
import shopfoods.dao.NewsDao;
import shopfoods.dao.SlideDao;
import shopfoods.dao.UsersDao;
import shopfoods.model.BookTable;
import shopfoods.model.Comment;
import shopfoods.model.Contact;
import shopfoods.model.User;
import shopfoods.util.StringUtil;

@Controller
@RequestMapping("/public")
public class PublicIndex {
	@Autowired
	private Defines defines;
	@Autowired
	private NewsDao newsDao;
	@Autowired
	private SlideDao slideDao;
	@Autowired
	private CategoryDao catDao;
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private UsersDao userDao;
	@Autowired
	private StringUtil stringUtil;
	@Autowired
	private BookTableDao bookDao;
	
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpSession session, Principal principal) {
		modelMap.addAttribute("defines", defines);
	}
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String indexPublic(ModelMap model) {
		model.addAttribute("listSlide", slideDao.getListSlide());
		model.addAttribute("listPicture", newsDao.getListPicture());
		model.addAttribute("listNews", newsDao.getListNews());
		model.addAttribute("listCats", catDao.getCats());
		model.addAttribute("listNewsID", newsDao.ogetListNewsID(1));
		model.addAttribute("listNewsNews", newsDao.getListNewsNews());
		model.addAttribute("picture", slideDao.getPicture());
		return "public.index.index";
	}
	@RequestMapping(value="/product-single/{product_code}",method=RequestMethod.GET)
	public String product(@ModelAttribute("product_code") String product_code,ModelMap model) {
		model.addAttribute("food", newsDao.getFood(product_code));
		model.addAttribute("listCats",newsDao.getListCats(newsDao.getFood(product_code)));
		return "public.product-single";
	}
	@RequestMapping(value="/services",method=RequestMethod.GET)
	public String services(ModelMap model) {
		model.addAttribute("listSlide", slideDao.getListSlide());
		return "public.services";
	}
	@RequestMapping(value="/blog",method=RequestMethod.GET)
	public String blog(ModelMap model) {
		model.addAttribute("listFoods", newsDao.getListFood());
		model.addAttribute("listCommnet", commentDao.getListCM());
		return "public.blog";
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return "public.login";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@ModelAttribute("user") User userLG,HttpSession session,RedirectAttributes ra) {
		if(userDao.getUserCk(userLG) > 0) {
			User user = userDao.getUser(userLG);
			session.setAttribute("user", user);
		}else {
			ra.addFlashAttribute("msg", "Sai username hoặc password .");
			return "redirect:/public/login";
		}
		return "redirect:/public/index";
	}
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeValue("user");
		return "redirect:/public/index";
	}
	@RequestMapping(value="/commentLG",method=RequestMethod.POST)
	public String commentLG(@ModelAttribute("comment") Comment comment,HttpSession session) {
		User user = (User) session.getAttribute("user");
		comment.setAvatar(user.getAvatar());
		comment.setName(user.getFullname());
		Date date = new Date();
		String date_comment = ""+date;
		comment.setDate_comment(date_comment);
		commentDao.addCommentLG(comment);
		return "redirect:/public/blog";
	}
	@RequestMapping(value="/comment",method=RequestMethod.POST)
	public String comment(@ModelAttribute("comment") Comment comment) {
		Date date = new Date();
		String date_comment = ""+date;
		comment.setDate_comment(date_comment);
		commentDao.addComment(comment);
		return "redirect:/public/blog";
	}
	@RequestMapping(value="/about",method=RequestMethod.GET)
	public String about(ModelMap model) {
		model.addAttribute("listPicture", newsDao.getListPicture());
		return "public.about";
	}
	@RequestMapping(value="/contact",method=RequestMethod.GET)
	public String contact() {
		return "public.contact";
	}
	@RequestMapping(value="/contact",method=RequestMethod.POST)
	public String contact(@ModelAttribute("contact") Contact contact,RedirectAttributes ra) {
		if(commentDao.addContact(contact) > 0) {
			ra.addFlashAttribute("msg", "Đã gửi liên hệ.");
		}else {
			ra.addFlashAttribute("msg", "Gửi liên hệ thất bại.");
		}
		return "redirect:/public/contact";
	}
	@RequestMapping(value="/formDK",method=RequestMethod.GET)
	public String formDK() {
		return "public.formDK";
	}
	@RequestMapping(value="/formDK",method=RequestMethod.POST)
	public String formDK(@ModelAttribute("user") User user,@ModelAttribute("repassword") String repassword,HttpSession session,RedirectAttributes ra,ModelMap model) {
		if(!repassword.equals(user.getPassword())) {
			model.addAttribute("msg", "password không trùng khớp.");
			model.addAttribute("user1", user);
			model.addAttribute("repassword", repassword);
			return "public.formDK";
		}else {
			user.setPassword(stringUtil.tess(user.getPassword()));
			userDao.addUserPL(user);
			User user1 = userDao.getUser(user.getUsername());
			session.setAttribute("user", user1);
			userDao.addInfure(user1.getId_user());
		}
		return "redirect:/public/index";
	}
	@RequestMapping(value="/booktable",method=RequestMethod.GET)
	public String booktable(@ModelAttribute("booktable") BookTable bookTable,RedirectAttributes ra,ModelMap model) {
		if(bookDao.checkBook(bookTable) <1) {
			bookDao.addTable(bookTable);
			ra.addFlashAttribute("msgbook", "Đặt bàn thành công. Bàn "+bookTable.getNumber()+" - "+bookTable.getTime()+" - "+ bookTable.getDate()+"-thời gian: 30ph.<br />Nếu hủy vui lòng gọi đến 0376252545 trước 30ph.Thanks you!");
		}else {
			model.addAttribute("book", bookTable);
			ra.addFlashAttribute("msgbook", "Thời gian bạn đặt đã hết.Vui lòng chọn bàn hoặc thời gian khác.");
		}
		return "redirect:/public/index";
	}
}
