package shopfoods.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import shopfoods.constant.Defines;
import shopfoods.dao.CustomerDao;
import shopfoods.dao.NewsDao;
import shopfoods.dao.OrderDao;
import shopfoods.dao.UsersDao;
import shopfoods.model.Customer;
import shopfoods.model.Food;
import shopfoods.model.User;

@Controller
@RequestMapping("/admin/order")
public class AdminOrder {
	@Autowired
	private Defines defines;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private CustomerDao customerDao;
	@Autowired
	private UsersDao userDao;
	
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpSession session, Principal principal) {
		modelMap.addAttribute("defines", defines);
	}

	@RequestMapping(value =  {"/index/{id_cus}", "/index/{id_cus}/{page}" } , method = RequestMethod.GET)
	public String views(@PathVariable("id_cus") int id_cus,ModelMap model,@PathVariable(value="page",required=false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int toTalOrder = orderDao.getCount(id_cus);
		int sumPage = (int) Math.ceil((float) toTalOrder / Defines.ROW_COUNT_ADMIN);
		model.addAttribute("sumPage", sumPage);
		int offset = (page - 1) * Defines.ROW_COUNT_ADMIN;
		model.addAttribute("page", page);
		model.addAttribute("listOrder", orderDao.getListOrd(id_cus,offset));
		model.addAttribute("customer", customerDao.getCustomer(id_cus));
		return "admin.order.views";
	}
	
	@RequestMapping(value = {"/myorder","/myorder/{page}"}, method = RequestMethod.GET)
	public String myorder(@PathVariable(value="page",required=false) Integer page,ModelMap model,HttpSession session) {
		
		User user1 = (User) session.getAttribute("user");
		User user = userDao.getUser(user1.getUsername());
		if (page == null) {
			page = 1;
		}
		if(customerDao.getCustomercheck(user.getId_user())>0) {
			Customer cus = customerDao.getCustomerID(user.getId_user());
			model.addAttribute("customer", cus);
			int toTalOrder = orderDao.getCount(cus.getId_cus());
			int sumPage = (int) Math.ceil((float) toTalOrder / Defines.ROW_COUNT_ADMIN);
			model.addAttribute("sumPage", sumPage);
			int offset = (page - 1) * Defines.ROW_COUNT_ADMIN;
			model.addAttribute("page", page);
			model.addAttribute("listOrder", orderDao.getListMyOrder(cus.getId_cus(),offset));
		}
		return "admin.order.myorder";
	}
}
