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
import shopfoods.dao.CustomerDao;
import shopfoods.dao.OrderDao;

@Controller
@RequestMapping("/admin/customer")
public class AdminCustomer {
	@Autowired
	private Defines defines;
	@Autowired
	private CustomerDao cusDao;
	@Autowired
	private OrderDao orderDao;


	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpSession session, Principal principal) {
		modelMap.addAttribute("defines", defines);
	}

	@RequestMapping(value = { "/index", "/index/{page}" }, method = RequestMethod.GET)
	public String index(ModelMap model,@PathVariable(value="page",required=false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int toTalCats = cusDao.getCount();
		int sumPage = (int) Math.ceil((float) toTalCats / Defines.ROW_COUNT_ADMIN);
		model.addAttribute("sumPage", sumPage);
		int offset = (page - 1) * Defines.ROW_COUNT_ADMIN;
		model.addAttribute("page", page);
		model.addAttribute("listCustomer", cusDao.getListCus(offset));
		return "admin.customer.index";
	}
	@RequestMapping(value = "/del/{id_cus}", method = RequestMethod.GET)
	public String del(@PathVariable("id_cus") int id_cus,RedirectAttributes ra) {
		if(cusDao.delCus(id_cus) > 0) {
			if(orderDao.delOrder(id_cus) > 0) {
				ra.addFlashAttribute("msg", "Đã xóa thành công.");
			}
			return "redirect:/admin/customer/index";
		}else {
			ra.addFlashAttribute("msg", "Xóa không thành công.");
			return "redirect:/admin/customer/index";
		}
	}
	@RequestMapping(value = "/update-check/{check_st}/{id_cus}", method = RequestMethod.GET)
	public String updatecheck(@PathVariable("check_st") int check_st,@PathVariable("id_cus") int id_cus,ModelMap model) {
		cusDao.update(check_st,id_cus);
		if(check_st==2) {
			cusDao.updateDH(id_cus);
		}
		return "redirect:/admin/customer/index";
	}
}
