package shopfoods.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

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
import shopfoods.dao.UsersDao;
import shopfoods.model.User;
import shopfoods.util.StringUtil;

@Controller
@RequestMapping("account")
public class AdminAccount {
	@Autowired
	private Defines defines;
	@Autowired
	private UsersDao userDao;
	@Autowired
	private StringUtil stringUtil;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("defines", defines);
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String eitAccount() {
		return "admin.user.account";
	}

	@RequestMapping(value = "/edit/{id_user}", method = RequestMethod.POST)
	public String eitAccount(@ModelAttribute("user") User user, @RequestParam("hinhanh") CommonsMultipartFile cmf,
			@PathVariable("id_user") int id_user, RedirectAttributes ra, HttpServletRequest request) {

		User userOld = userDao.getItem(id_user);
		String fileName = cmf.getOriginalFilename();
		String nameFile = Defines.renameFile(fileName);
		String fileNameOld = userOld.getAvatar();
		if (!"".equals(fileName)) {
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_AVATAR;
			File dirFile = new File(dirPath);
			if (dirFile.exists()) {
				dirFile.mkdirs();
			}
			String filePath = dirPath + File.separator + nameFile;
			try {
				if (!"".equals(fileNameOld)) {
					File filePathOld = new File(dirPath + File.separator + fileNameOld);
					filePathOld.delete();
				}
				cmf.transferTo(new File(filePath));
			} catch (IOException e) {
				System.out.println("lỗi");
			}
		} else {
			nameFile = fileNameOld;
		}
		String pass = "";
		if ("".equals(user.getPassword())) {
			pass = userOld.getPassword();
		} else {
			pass = stringUtil.tess(user.getPassword());
		}
		user.setPassword(pass);
		user.setAvatar(nameFile);
		user.setId_user(id_user);
		if (userDao.editUser(user) > 0) {
			ra.addFlashAttribute("msg", "Sửa thành công");
		} else {
			ra.addFlashAttribute("msg", "Sửa thất bại");
		}
		return "redirect:/admin/index";
	}

}
