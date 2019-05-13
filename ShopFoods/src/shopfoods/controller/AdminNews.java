package shopfoods.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shopfoods.constant.Defines;
import shopfoods.dao.CategoryDao;
import shopfoods.dao.NewsDao;
import shopfoods.dao.OrderDao;
import shopfoods.model.Food;

@Controller
@RequestMapping("/admin/news/")
public class AdminNews {
	@Autowired
	private Defines defines;
	@Autowired
	private CategoryDao catDao;
	@Autowired
	private NewsDao newsDao;
	@Autowired
	private OrderDao orderDao;

	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpSession session, Principal principal) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("listCats", catDao.getCats());
	}

	@RequestMapping(value = { "/index", "/index/{page}" })
	public String index(ModelMap model, @PathVariable(value = "page", required = false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int toTalCats = newsDao.getCount();
		int sumPage = (int) Math.ceil((float) toTalCats / Defines.ROW_COUNT_ADMIN);
		model.addAttribute("sumPage", sumPage);
		int offset = (page - 1) * Defines.ROW_COUNT_ADMIN;
		model.addAttribute("page", page);
		model.addAttribute("listNews", newsDao.getNews(offset));
		return "admin.news.index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add() {
		return "admin.news.add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("food") Food food, @RequestParam("hinhanh") CommonsMultipartFile cmf,
			HttpServletRequest request, RedirectAttributes ra, ModelMap model) {
		String fileName = cmf.getOriginalFilename();
		ArrayList<String> listProduct_code = (ArrayList<String>) newsDao.getListProduct_code();
		for (String tem : listProduct_code) {
			if (tem.equals(food.getProduct_code())) {
				ra.addFlashAttribute("food", food);
				ra.addFlashAttribute("image", fileName);
				ra.addFlashAttribute("err", "Mã Food đã tồn tại !");
				return "redirect:/admin/news/add";
			}
		}
		String reFileName = Defines.renameFile(fileName);
		String appPath = request.getServletContext().getRealPath("");
		String dirPath = appPath + Defines.DIR_UPLOAD;
		File dirFile = new File(dirPath);
		if (dirFile.exists()) {
			dirFile.mkdir();
		}
		String filePath = dirPath + File.separator + reFileName;
		System.out.println(filePath);
		food.setImage(reFileName);
		try {
			cmf.transferTo(new File(filePath));
		} catch (IOException e) {
			System.out.println("loi roi");
		}

		if (newsDao.addNews(food) > 0) {
			ra.addFlashAttribute("msg", "Thêm sản phẩm thành công !");
		} else {
			ra.addFlashAttribute("msg", "Thêm sản phẩm không thành công !");
		}

		return "redirect:/admin/news/index";
	}

	@RequestMapping(value = "/edit/{product_code}/{page}", method = RequestMethod.GET)
	public String edit(@PathVariable("product_code") String product_code, @PathVariable("page") int page,
			ModelMap model) {
		model.addAttribute("food", newsDao.getFood(product_code));
		model.addAttribute("page", page);
		return "admin.news.edit";
	}

	@RequestMapping(value = "/edit/{product_code}/{page}", method = RequestMethod.POST)
	public String edit(@ModelAttribute("food") Food food, @RequestParam("product_code") String product_code,
			@PathVariable("page") int page, @RequestParam("hinhanh") CommonsMultipartFile cmf,
			HttpServletRequest request, RedirectAttributes ra) {
		Food foodOld = newsDao.getFood(product_code);
		String fileNameOld = foodOld.getImage();
		String fileName = cmf.getOriginalFilename();
		String reFileName = Defines.renameFile(fileName);
		if (!"".equals(fileName)) {
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			String filePath = dirPath + File.separator + reFileName;
			try {
				if ("".equals(fileNameOld)) {
					File fileOld = new File(dirPath + File.separator + fileNameOld);
					fileOld.delete();
				}
				cmf.transferTo(new File(filePath));
			} catch (Exception e) {
				return "redirect:/admin/news/index";
			}
		} else {
			reFileName = fileNameOld;
		}
		food.setImage(reFileName);
		if (newsDao.editNews(food) > 0) {
			ra.addFlashAttribute("msg", "Sửa Sửa thành công !");
		} else {
			ra.addFlashAttribute("msg", "Sửa không thành công.");
		}
		return "redirect:/admin/news/index/" + page;
	}

	@RequestMapping(value = "/del/{product_code}", method = RequestMethod.GET)
	public String del(@PathVariable("product_code") String product_code, HttpServletRequest request,
			RedirectAttributes ra) {
		Food food = newsDao.getFood(product_code);
		String fileNameOld = food.getImage();
		String appPath = request.getServletContext().getRealPath("");
		String dirPath = appPath + Defines.DIR_UPLOAD;
		String filePath = dirPath + File.separator + fileNameOld;
		if ("".equals(filePath)) {
			File file = new File(filePath);
			file.delete();
		}
		if (newsDao.delNews(product_code) > 0) {
			ra.addFlashAttribute("msg", "Xóa thành công!");
		} else {
			ra.addFlashAttribute("msg", "Xóa không thành công.");
		}
		return "redirect:/admin/news/giorac";
	}

	@RequestMapping(value = "/search")
	public String search(@ModelAttribute("name") String name, @RequestParam("id_cat") int id_cat, ModelMap model,
			RedirectAttributes ra) {
		if (id_cat == 0) {
			List<Food> listNews = newsDao.getListNews(name);
			if (listNews.size() > 0) {
				model.addAttribute("listNews", listNews);
				model.addAttribute("msg", "kết quả cho : " + name);
			} else {
				ra.addFlashAttribute("msg0", "không tìm thấy " + name);
				return "redirect:/admin/news/index";
			}
		} else {
			List<Food> listNews = newsDao.getListNews(id_cat, name);
			if (listNews.size() > 0) {
				model.addAttribute("listNews", listNews);
				model.addAttribute("msg", "kết quả cho : " + name);
			} else {
				ra.addFlashAttribute("msg0", "không tìm thấy " + name);
				return "redirect:/admin/news/index";
			}
		}
		return "admin.news.index";
	}

	@RequestMapping(value = "/giorac/search")
	public String searchGR(@ModelAttribute("name") String name, ModelMap model, RedirectAttributes ra) {
		List<Food> listNewsGR = newsDao.getListNewsGR(name);
		if (listNewsGR.size() > 0) {
			model.addAttribute("listNewsGR", listNewsGR);
			model.addAttribute("msg", "kết quả cho : " + name);
		} else {
			ra.addFlashAttribute("msg0", "không tìm thấy " + name);
			return "redirect:/admin/news/index";
		}
		return "admin.news.giorac";
	}

	@RequestMapping(value = "/views/{views}")
	public String views(@PathVariable("views") int id_cat, ModelMap model,
			@PathVariable(value = "page", required = false) Integer page, RedirectAttributes ra) {
		if (id_cat == 0) {
			return "redirect:/admin/news/index";
		} else {
			if (page == null) {
				page = 1;
			}
			int toTalCats = newsDao.getCount(id_cat);
			int sumPage = (int) Math.ceil((float) toTalCats / Defines.ROW_COUNT_ADMIN);
			model.addAttribute("sumPage", sumPage);
			int offset = (page - 1) * Defines.ROW_COUNT_ADMIN;
			model.addAttribute("page", page);
			List<Food> listNews = newsDao.getListNews(id_cat, offset);
			if (listNews.size() > 0) {
				model.addAttribute("listNews", listNews);
			} else {
				ra.addFlashAttribute("msg0", "không có kết quả nào.");
				return "redirect:/admin/news/index";
			}
		}
		return "admin.news.index";
	}

	@RequestMapping(value = { "/giorac", "/giorac/{page}" })
	public String gioRac(@PathVariable(value = "page", required = false) Integer page, ModelMap model) {
		if (page == null) {
			page = 1;
		}
		int toTalCats = newsDao.getCountGR();
		int sumPage = (int) Math.ceil((float) toTalCats / Defines.ROW_COUNT_ADMIN);
		model.addAttribute("sumPage", sumPage);
		int offset = (page - 1) * Defines.ROW_COUNT_ADMIN;
		model.addAttribute("page", page);
		model.addAttribute("listNewsGR", newsDao.getNewsGR(offset));
		return "admin.news.giorac";
	}

	@RequestMapping(value = "/delTam/{product_code}", method = RequestMethod.GET)
	public String delTam(@PathVariable("product_code") String product_code, HttpServletRequest request,
			RedirectAttributes ra) {
		if (newsDao.DelTam(product_code) > 0) {
			ra.addFlashAttribute("msg", "Xóa thành công!");
		} else {
			ra.addFlashAttribute("msg", "Xóa không thành công.");
		}
		return "redirect:/admin/news/index";
	}

	@RequestMapping(value = "/delAllTam/{list_idnews}", method = RequestMethod.GET)
	public String delAllTam(@ModelAttribute("list_idnews") String list_idnews, HttpServletRequest request,
			RedirectAttributes ra) {
		String[] list = list_idnews.split(",");
		for (int i = 1; i < list.length; i++) {
			newsDao.delAllTamNews(list[i]);
		}
		return "redirect:/admin/news/index";
	}

	@RequestMapping(value = "/delAllMM/{list_idnews}", method = RequestMethod.GET)
	public String delAllMM(@PathVariable("list_idnews") String list_idnews, HttpServletRequest request,
			RedirectAttributes ra) {
		String[] list = list_idnews.split(",");
		for (int i = 1; i < list.length; i++) {
			Food food = newsDao.getFood(list[i]);
			String fileNameOld = food.getImage();
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			String filePath = dirPath + File.separator + fileNameOld;
			if ("".equals(filePath)) {
				File file = new File(filePath);
				file.delete();
			}
			newsDao.delNews(list[i]);
		}
		return "redirect:/admin/news/index";
	}

	@RequestMapping(value = "/restore/{product_code}", method = RequestMethod.GET)
	public String restore(@PathVariable("product_code") String product_code, RedirectAttributes ra) {
		if (newsDao.restoreNews(product_code) > 0) {
			ra.addFlashAttribute("msg", "restore thành công!");
		} else {
			ra.addFlashAttribute("msg", "restore không thành công!");
		}
		return "redirect:/admin/news/giorac";
	}

	@RequestMapping(value = "/thongke", method = RequestMethod.GET)
	public String thongke(ModelMap model) {
		model.addAttribute("year", 2019);
		model.addAttribute("month", 5);
		model.addAttribute("listOrder", orderDao.getListOrd());
		return "admin.news.thongke";
	}

	@RequestMapping(value = "/thongke/{month}/{year}", method = RequestMethod.GET)
	public String thongkeMonth(@PathVariable("month") int month, @PathVariable("year") int year, ModelMap model) {
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		String year1 = "%" + year + "%";
		String month1 = "";
		switch (month) {
		case 1:
			month1 = "%jan%";
			break;
		case 2:
			month1 = "%Feb%";
			break;
		case 3:
			month1 = "%Mar%";
			break;
		case 4:
			month1 = "%Apr%";
			break;
		case 5:
			month1 = "%May%";
			break;
		case 6:
			month1 = "%Jun%";
			break;
		case 7:
			month1 = "%Jul%";
			break;
		case 8:
			month1 = "%Aug%";
			break;
		case 9:
			month1 = "%Sep%";
			break;
		case 10:
			month1 = "%Oct%";
			break;
		case 11:
			month1 = "%Nov%";
			break;
		case 12:
			month1 = "%Dec%";
			break;
		default:
			break;
		}
		model.addAttribute("listOrder", orderDao.getListOrdMonth(year1, month1));
		return "admin.news.thongke";
	}
}
