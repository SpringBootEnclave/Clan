package vn.edu.vinaenter.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.constant.Defines;
import vn.edu.vinaenter.model.bean.Land;
import vn.edu.vinaenter.model.bean.Role;
import vn.edu.vinaenter.model.bean.User;
import vn.edu.vinaenter.model.dao.UserDAO;
import vn.edu.vinaenter.util.FileUtil;

@Controller
@RequestMapping("admin/user")
public class AdminUserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BCryptPasswordEncoder encoder;/*thư viện mã hóa thêm vô lib*/
	
	@GetMapping("index")
	public String index(ModelMap modelMap, Principal principal) {
		List<User> listUser = userDAO.getItems();
		String loginSession = principal.getName();
		modelMap.addAttribute("loginSession", loginSession);
		modelMap.addAttribute("listUser", listUser);
		return "cland.admin.user.index";
	}
	
	@GetMapping("add")
	public String add() {
		return "cland.admin.user.add";
	}
	
	@PostMapping("add")
	public String add(@ModelAttribute("objUser") User objUser, RedirectAttributes ra) {
		String password = encoder.encode(objUser.getPassword());
		objUser.setPassword(password);
		
		if (userDAO.addItem(objUser) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_ADD_SUCCESS);
			return "redirect:/admin/user/index";
		}
		else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
			return "redirect:/admin/user/add";
		}
	}
	
	@GetMapping("edit/{id}")
	public String edit(@PathVariable int id,ModelMap modelMap,Principal principal, RedirectAttributes ra) {
		String currentName = principal.getName();
		User objUserCurent = userDAO.getIdByName(currentName);
		int idUserCurrent = objUserCurent.getId();
		
		if(idUserCurrent == id) {
			User objUser = userDAO.getItemById(id);
			List<Role> listRole = userDAO.getRole();
			modelMap.addAttribute("listRole", listRole);
			modelMap.addAttribute("objUser", objUser);
			return "cland.admin.user.edit";
		}else{
			if(idUserCurrent == 1) {
				User objUser = userDAO.getItemById(id);
				List<Role> listRole = userDAO.getRole();
				modelMap.addAttribute("listRole", listRole);
				modelMap.addAttribute("objUser", objUser);
				return "cland.admin.user.edit";
			}else {
				ra.addFlashAttribute("khongcoquyen", Defines.MSG_KHONGQUYEN);
				return "redirect:/admin/user/index";
			}
		}
	}
	
	@PostMapping("edit/{id}")
	public String edit(@PathVariable("id") int id,@ModelAttribute("objUser") User objUser, RedirectAttributes ra) {
		
		if("".equals(objUser.getPassword())) {
			if (userDAO.updateById(objUser) > 0) {
				ra.addFlashAttribute("msg", Defines.MSG_UPDATE_SUCCESS);
				return "redirect:/admin/user/index/";
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "redirect:/admin/user/edit/" + id;
			}
		}else {
			String password = encoder.encode(objUser.getPassword());
			objUser.setPassword(password);
			
			if (userDAO.updateByIdPass(objUser) > 0) {
				ra.addFlashAttribute("msg", Defines.MSG_UPDATE_SUCCESS);
				return "redirect:/admin/user/index/";
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "redirect:/admin/user/edit/" + id;
			}
		}
	}

	
	@GetMapping("del/{id}")
	public String del(@PathVariable("id") int idUser,ModelMap modelMap,Principal principal, RedirectAttributes ra) {
		String currentName = principal.getName();
		User objUserCurent = userDAO.getIdByName(currentName);
		int idUserCurrent = objUserCurent.getId();
		
		if(idUserCurrent == idUser) {
			if (userDAO.delItem(idUser) > 0) {
				ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);
				return "redirect:/admin/user/index";
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "redirect:/admin/user/index";
			}
		}else{
			if(idUserCurrent == 1) {
				if (userDAO.delItem(idUser) > 0) {
					ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);
					return "redirect:/admin/user/index";
				} else {
					ra.addFlashAttribute("msg", Defines.MSG_ERROR);
					return "redirect:/admin/user/index";
				}
			}else {
				ra.addFlashAttribute("khongcoquyen", Defines.MSG_KHONGQUYEN);
				return "redirect:/admin/user/index";
			}
		}
	}
	
}
