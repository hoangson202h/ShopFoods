package shopfoods.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;

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
import shopfoods.dao.SlideDao;
import shopfoods.model.Slide;

@Controller
@RequestMapping("/admin/slide")
public class AdminSlide {
	@Autowired
	private Defines defines;
	@Autowired
	private SlideDao slideDao;

	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpSession session, Principal principal) {
		modelMap.addAttribute("defines", defines);
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap model) {
		model.addAttribute("listSlide", slideDao.getSlide());
		return "admin.slide.index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "admin.slide.add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request,
			RedirectAttributes ra) {
		String fileName = cmf.getOriginalFilename();
		String nameFile = Defines.renameFile(fileName);

		String appPath = request.getServletContext().getRealPath("");
		String dirPath = appPath + Defines.DIR_SLIDE;
		System.out.println(dirPath);
		File dirFile = new File(dirPath);
		if (dirFile.exists()) {
			dirFile.mkdirs();
		}
		String filePath = dirPath + File.separator + nameFile;
		Slide slide = new Slide();
		slide.setS_picture(nameFile);

		try {
			cmf.transferTo(new File(filePath));
		} catch (IOException e) {
			System.out.println("lá»—i");
		}
		if (slideDao.addItem(slide) > 0) {
			ra.addFlashAttribute("msg", "Thêm thành công.");
		} else {
			ra.addFlashAttribute("msg", "Thêm không thành công.");
		}
		return "redirect:/admin/slide/index";
	}

	@RequestMapping(value = "/edit/{s_id}", method = RequestMethod.GET)
	public String edit(@PathVariable("s_id") int s_id, ModelMap model) {
		model.addAttribute("slide", slideDao.getItem(s_id));
		return "admin.slide.edit";
	}

	@RequestMapping(value = "/edit/{s_id}", method = RequestMethod.POST)
	public String edit(@PathVariable("s_id") int s_id, @RequestParam("hinhanh") CommonsMultipartFile cmf,
			HttpServletRequest request, RedirectAttributes ra) {
		Slide slide = slideDao.getItem(s_id);
		String fileName = cmf.getOriginalFilename();
		String nameFile = Defines.renameFile(fileName);
		String fileNameOld = slide.getS_picture();
		if (!"".equals(fileName)) {
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_SLIDE;
			File dirFile = new File(dirPath);
			if (dirFile.exists()) {
				dirFile.mkdirs();
			}
			String filePath = dirPath + File.separator + nameFile;
			try {
				if (!"".equals(fileNameOld)) {
					File fileOld = new File(dirPath + File.separator + fileNameOld);
					fileOld.delete();
				}
				cmf.transferTo(new File(filePath));
			} catch (IOException e) {
				System.out.println("lỗi");
			}
		} else {
			nameFile = fileNameOld;
		}
		slide.setS_picture(nameFile);
		if (slideDao.editItem(slide) > 0) {
			ra.addFlashAttribute("msg", "sửa thành công!");
		} else {
			ra.addFlashAttribute("msg", "Sửa không thành công!");
		}
		return "redirect:/admin/slide/index";
	}
	@RequestMapping("/del/{s_id}")
	public String delete(@PathVariable("s_id") int s_id,HttpServletRequest request,RedirectAttributes ra) {
		Slide slide = slideDao.getItem(s_id);
		String fileName = slide.getS_picture();
		String appPath = request.getServletContext().getRealPath("");
		String dirPath = appPath + Defines.DIR_SLIDE;
		String filePath = dirPath + File.separator + fileName;
		if(!"".equals(filePath)) {
			File file = new File(filePath);
			file.delete();
		}
		if(slideDao.delItem(s_id) > 0) {
			ra.addFlashAttribute("msg", "xóa thành công!");
		}else {
			ra.addFlashAttribute("msg", "xóa thất bại!");
		}
		return "redirect:/admin/slide/index";
	}
}
