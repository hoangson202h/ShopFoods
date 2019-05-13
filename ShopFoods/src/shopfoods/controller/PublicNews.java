package shopfoods.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import shopfoods.dao.CustomerDao;
import shopfoods.dao.NewsDao;
import shopfoods.dao.OrderDao;
import shopfoods.dao.SlideDao;
import shopfoods.dao.UsersDao;
import shopfoods.model.Customer;
import shopfoods.model.Food;
import shopfoods.model.User;

@Controller
@RequestMapping("/public/news")
public class PublicNews {
	private ArrayList<Food> listFoods = new ArrayList<Food>();
	@Autowired
	private Defines defines;
	@Autowired
	private NewsDao newsDao;
	@Autowired
	private SlideDao slideDao;
	@Autowired
	private CategoryDao catDao;
	@Autowired
	private UsersDao userDao;
	@Autowired
	private OrderDao orDao;
	@Autowired
	private CustomerDao cusDao;

	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpSession session, Principal principal) {
		modelMap.addAttribute("defines", defines);
	}

	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public String indexPublic(ModelMap model) {
		model.addAttribute("listSlide", slideDao.getListSlide());
		model.addAttribute("listCats", catDao.getCats());
		model.addAttribute("listNews", newsDao.getListNewsMN());
		model.addAttribute("listCats", catDao.getCats());
		model.addAttribute("listNewsID", newsDao.ogetListNewsID(1));
		return "public.menu";
	}

	@RequestMapping(value = "/addcart/{stt}", method = RequestMethod.GET)
	public String addcart(@PathVariable("stt") int stt, HttpSession session) {
		int i;
		if (session.getAttribute("soluong") != null) {
			i = (int) session.getAttribute("soluong") + 1;
		} else {
			i = 1;
		}

		int dem = 0;
		if (session.getAttribute("listFoods") != null) {
			for (Food food : listFoods) {
				if (stt == food.getStt()) {
					int sl = food.getQuantity() + 1;
					food.setQuantity(sl);
					dem = 1;
				}
			}
		}

		if (dem == 0) {
			Food food = newsDao.getFood(stt);
			food.setQuantity(1);
			listFoods.add(food);
			session.setAttribute("listFoods", listFoods);
		}
		session.setAttribute("soluong", i);

		return "public.cart-add";
	}

	@RequestMapping(value = "/cart")
	public String cart(HttpSession session, ModelMap model) {
		model.addAttribute("listFoodRand", newsDao.getListFoodRand());
		return "public.cart";
	}

	@RequestMapping(value = "/del/{stt}")
	public String del(@PathVariable("stt") int stt, HttpSession session, ModelMap model) {
		int slOld = (int) session.getAttribute("soluong");
		int sl = 0;
		for (int i = 0; i < listFoods.size(); i++) {
			if (listFoods.get(i).getStt() == stt) {
				sl = slOld - listFoods.get(i).getQuantity();
				listFoods.remove(i);
			}
		}
		session.setAttribute("soluong", sl);
		session.setAttribute("listGuitar", listFoods);
		return "public.delfood";
	}

	@RequestMapping(value = "/delcart")
	public String delcart() {
		return "public.cart-add";
	}

	@RequestMapping(value = "/addcart-product/{stt}")
	public String addcartproduct(@ModelAttribute("food") Food food, @PathVariable("stt") int stt, HttpSession session,
			ModelMap model) {
		Food foodDB = newsDao.getFood(stt);
		int i;
		if (session.getAttribute("soluong") != null) {
			i = (int) session.getAttribute("soluong") + food.getQuantity();
		} else {
			i = food.getQuantity();
		}

		int dem = 0;
		if (session.getAttribute("listFoods") != null) {
			for (Food temp : listFoods) {
				if (stt == temp.getStt()) {
					int sl = temp.getQuantity() + food.getQuantity();
					temp.setQuantity(sl);
					dem = 1;
				}
			}
		}
		if (dem == 0) {
			foodDB.setQuantity(food.getQuantity());
			listFoods.add(foodDB);
			session.setAttribute("listFoods", listFoods);
		}
		session.setAttribute("soluong", i);

		return "redirect:/public/product-single/" + foodDB.getProduct_code();
	}

	@RequestMapping(value = "/update/{stt}/{sl}")
	public String update(@PathVariable("stt") int stt, @PathVariable("sl") int sl, HttpSession sesion) {
		int soluong = (int) sesion.getAttribute("soluong");
		for (int i = 0; i < listFoods.size(); i++) {
			if (listFoods.get(i).getStt() == stt) {
				if (sl == 0) {
					soluong = soluong - listFoods.get(i).getQuantity();
					listFoods.remove(listFoods.get(i));
				} else {
					soluong = soluong + sl - listFoods.get(i).getQuantity();
					listFoods.get(i).setQuantity(sl);
				}
			}
		}
		sesion.setAttribute("listFoods", listFoods);
		sesion.setAttribute("soluong", soluong);
		return "public.cart";
	}

	@RequestMapping(value = "/checkout/{tongtien}")
	public String checkout(@PathVariable("tongtien") int tongtien, ModelMap model, HttpSession session) {
		User user = (User) session.getAttribute("user");

		if (user != null) {
			if (userDao.getUserCk(user) > 0) {
				Customer cus = userDao.getcus(user.getId_user());
				model.addAttribute("infuser", cus);
			}
		}

		session.setAttribute("tongtien", tongtien);
		model.addAttribute("listFoods", newsDao.getListFood());
		return "public.checkout";
	}

	@RequestMapping(value = "/pass")
	public String pass() {
		return "public.pass";
	}

	@RequestMapping(value = "/del-pass")
	public String delpass() {
		return "public.del-pass";
	}

	@RequestMapping(value = "/payment")
	public String payment(ModelMap model, HttpSession session, @ModelAttribute("customer") Customer customer) {
		session.setAttribute("customer", customer);
		return "public.payment";
	}

	@RequestMapping(value = "/payment/{check}")
	public String payment1(@PathVariable("check") int check, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Customer cus = (Customer) session.getAttribute("customer");
		Customer customer = null;
		if (check == 1) {
			if(user !=null) {
				cus.setId_user(user.getId_user());
				userDao.update(cus);
				customer = userDao.getcus(user.getId_user());
			}else {
				cus.setId_user(0);
				userDao.addCus(cus);
				customer = userDao.getcus();
			}
		}else {
			if(user !=null) {
				cus.setId_user(user.getId_user());
				userDao.update1(cus);
			}else {
				cus.setId_user(0);
				userDao.addCus1(cus);
			}
		}
		Date date = new Date();
		String dat = date + "";
		for (Food food : listFoods) {
			newsDao.addDH(food,customer.getId_cus(),dat);
		}
		listFoods = new ArrayList<Food>();
		session.removeAttribute("soluong");
		session.removeAttribute("customer");
		session.removeAttribute("listFoods");
		return "public.paymentend";
		
	}
	@RequestMapping(value = "/search")
	public String search(@ModelAttribute("name") String name,ModelMap model) {
		model.addAttribute("listNews", newsDao.getListNews(name));
		model.addAttribute("listSlide", slideDao.getListSlide());
		return "public.search";
	}
	@RequestMapping(value = "/myorder")
	public String myorder(HttpSession session,ModelMap model) {
		User user = (User) session.getAttribute("user");
		Customer cus = cusDao.getCustomerID(user.getId_user());
		model.addAttribute("listOrder", orDao.getListOrder(cus.getId_cus()));
		model.addAttribute("cus", cus);
		return "public.myorder";
	}
}
