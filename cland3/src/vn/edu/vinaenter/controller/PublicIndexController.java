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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.constant.Defines;
import vn.edu.vinaenter.model.bean.Category;
import vn.edu.vinaenter.model.bean.Contact;
import vn.edu.vinaenter.model.bean.Land;
import vn.edu.vinaenter.model.dao.CategoryDAO;
import vn.edu.vinaenter.model.dao.ContactDAO;
import vn.edu.vinaenter.model.dao.LandDAO;

@Controller
public class PublicIndexController {
	@Autowired
	private LandDAO landDAO;
	
	@Autowired
	private CategoryDAO catDAO;
	
	@Autowired
	private ContactDAO contactDAO;
	
	@ModelAttribute
	public void commonObjects(ModelMap modelMap) {
		List<Category> listCatHeader = catDAO.getItems();
		List<Category> listHot = catDAO.getHotItems();
		List<Land> listMostView = landDAO.getMostView();
		
		modelMap.addAttribute("listCatHeader", listCatHeader);
		modelMap.addAttribute("listHot", listHot);
		modelMap.addAttribute("listMostView", listMostView);
		
		modelMap.addAttribute("landDAO", landDAO);
		
	}
	
	@GetMapping({"{page}",""})
	public String index(ModelMap modelMap, @PathVariable(name = "page", required = false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int row_count = Defines.ROW_COUNT;
		int totalLand = landDAO.countItems();
		
		int sumPage = (int)Math.ceil(totalLand/row_count);
		int offset = (page - 1) * row_count;
		
		List<Land> listLand = landDAO.getItemsByPagination(offset, row_count);
		
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("listLand", listLand);
		modelMap.addAttribute("catDAO", catDAO);
		return "cland.public.index.index";
	}
	
	@GetMapping("cat/{id}")
	public String cat(ModelMap modelMap,@PathVariable(name = "id") int idCat) {
		List<Land> listLandByIdCat = landDAO.getItemByIdCat(idCat);
		modelMap.addAttribute("listLandByIdCat", listLandByIdCat);
		return "cland.public.index.cat";
	}
	
	@GetMapping("single/{idLand}")
	public String single(ModelMap modelMap, @PathVariable(name = "idLand") int idLand) {
		Land objLand = landDAO.getItemById(idLand);
		
		int idCat = objLand.getCid();
		List<Land> relatedLand = landDAO.getItemOther(idLand, idCat);
		
		modelMap.addAttribute("relatedLand", relatedLand);
		modelMap.addAttribute("objLand", objLand);
		return "cland.public.index.single";
	}
	
	@GetMapping("contact")
	public String contact() {
		return "cland.public.index.contact";
	}
	
	@PostMapping("contact")
	public String contact(@Valid @ModelAttribute("objContact") Contact objContact, BindingResult br, RedirectAttributes ra, ModelMap modelMap) {
		if(br.hasErrors()) {
			modelMap.addAttribute("objContact", objContact);
			return "cland.public.index.contact";
		} 
		if(contactDAO.addItem(objContact) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_ADD_SUCCESSS);
			return "redirect:/contact.html";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERRORR);
			return "cland.public.index.contact";
		}
	}
	@GetMapping("search.html")
	public String search(@RequestParam("search") String search, ModelMap modelMap) {
		List<Land> listSearch = landDAO.getItemsBySearch(search);
		modelMap.addAttribute("search", search);
		modelMap.addAttribute("listSearch", listSearch);
		return "cland.public.index.search";
	}
}
