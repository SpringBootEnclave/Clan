package vn.edu.vinaenter.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.constant.Defines;
import vn.edu.vinaenter.model.bean.Category;
import vn.edu.vinaenter.model.dao.CategoryDAO;

@Controller
@RequestMapping("admin/cat")
public class AdminCatController {
	
	@Autowired
	private CategoryDAO catDAO;
	
	@GetMapping("index")
	public String index(ModelMap modelMap) {
		List<Category> listCat = catDAO.getItems();
		modelMap.addAttribute("listCat", listCat);
		return "cland.admin.cat.index";
	}
	
	@GetMapping("add")
	public String add() {
		return "cland.admin.cat.add";
	}
	
	@PostMapping("add")
	public String add(@ModelAttribute("objCat") Category objCat, RedirectAttributes ra) {
		if (catDAO.addItem(objCat) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_ADD_SUCCESS);
			return "redirect:/admin/cat/index";
		}
		else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
			return "redirect:/admin/cat/add";
		}
	}
	
	@GetMapping("edit/{idCat}")
	public String edit(ModelMap modelMap,@PathVariable int idCat) {
		Category oldCat = catDAO.getItemById(idCat);
		modelMap.addAttribute("oldCat", oldCat);
		return "cland.admin.cat.edit";
	}
	@PostMapping("edit/{idCat}")
	public String edit(@RequestParam("cname") String cname, RedirectAttributes ra, @PathVariable int idCat) {
		if (catDAO.updateItem(cname, idCat) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_UPDATE_SUCCESS);
			return "redirect:/admin/cat/index";
		}
		else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
			return "redirect:/admin/cat/edit/" + idCat;
		}
		
	}
	
	@GetMapping("del/{idCat}")
	public String del(@PathVariable int idCat, RedirectAttributes ra) {
		
		if (catDAO.delItem(idCat) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);
			return "redirect:/admin/cat/index";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
			return "redirect:/admin/cat/index";
		}
	}

}
