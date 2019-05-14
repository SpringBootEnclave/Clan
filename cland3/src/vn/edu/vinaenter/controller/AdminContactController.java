package vn.edu.vinaenter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.constant.Defines;
import vn.edu.vinaenter.model.bean.Contact;
import vn.edu.vinaenter.model.dao.ContactDAO;

@Controller
@RequestMapping("admin/contact")
public class AdminContactController {
	@Autowired
	private ContactDAO contactDAO;

	@GetMapping({"index/{i}", "index" })
	public String index(ModelMap modelMap, @PathVariable(name = "i", required = false) Integer currentPage) {
		if (currentPage == null) {
			currentPage = 1;
		}
		int totalContact = contactDAO.totalContact();
		int numberOfPage = (int)Math.ceil((double)totalContact / Defines.ROW_COUNT);
		if(currentPage > numberOfPage) {
			currentPage = numberOfPage;
		}
		int offset = (currentPage - 1) * Defines.ROW_COUNT;
		List<Contact> listContact = contactDAO.getItems(offset, Defines.ROW_COUNT);
		modelMap.addAttribute("numberOfPage", numberOfPage);
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("listContact", listContact);
		
		return "cland.admin.lienhe.index";
	}
	@GetMapping("del/{cid}")
	public String del(@PathVariable("cid") int cid , RedirectAttributes ra) {
		if (contactDAO.delItem(cid) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);
			return "redirect:/admin/contact/index";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
			return "redirect:/admin/contact/index";
		}
	}

}
