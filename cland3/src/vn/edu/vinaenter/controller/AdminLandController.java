package vn.edu.vinaenter.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.constant.Defines;
import vn.edu.vinaenter.model.bean.Category;
import vn.edu.vinaenter.model.bean.Land;
import vn.edu.vinaenter.model.dao.CategoryDAO;
import vn.edu.vinaenter.model.dao.LandDAO;
import vn.edu.vinaenter.util.FileUtil;

@Controller
@RequestMapping("admin/land")
public class AdminLandController {
	@Autowired
	private LandDAO landDAO;
	
	@Autowired
	private CategoryDAO catDAO;
	
	@Autowired
	private ServletContext context;
	
	@GetMapping({"index/{page}", "index"})
	public String index(ModelMap modelMap, @PathVariable(name = "page", required = false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int row_count = Defines.ROW_COUNT;
		int totalLand = landDAO.countItems();
		int sumPage = (int)Math.ceil(totalLand/Defines.ROW_COUNT);
		int offset = (page - 1) * Defines.ROW_COUNT;
		
		List<Land> listLand = landDAO.getItemsByPagination(offset, row_count);
		modelMap.addAttribute("listLand", listLand);
		modelMap.addAttribute("sumPage", sumPage);
		return "cland.admin.land.index";
	}
	
	@GetMapping("add")
	public String add(ModelMap modelMap) {
		List<Category> listCat = catDAO.getItems();
		modelMap.addAttribute("listCat", listCat);
		return "cland.admin.land.add";
	}
	
	@PostMapping("add")
	public String add(@ModelAttribute("objLand") Land objLand, @RequestParam("image") CommonsMultipartFile image, RedirectAttributes ra) throws IllegalStateException, IOException {
		if ("".equals(image.getOriginalFilename())){
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
			return "redirect:/admin/land/add";
		}else {
			String fileName = image.getOriginalFilename();
			fileName = FileUtil.rename(fileName);
			
			String dirPath = context.getRealPath("") + Defines.DIR_UPLOAD;//tạo ra đường dẫn files, lấy đường dẫn đến files
			System.out.println(dirPath);
			
			File dir = new File (dirPath);
			if (!dir.exists()) {
				dir.mkdir();
			}//chưa tòn tại thfi tạo ra cái đường dẫn files trên
			
			String filePath = dirPath + File.separator + fileName;
			image.transferTo(new File(filePath));
			
			objLand.setPicture(fileName);
			
			if (landDAO.addItem(objLand) > 0) {
				ra.addFlashAttribute("msg", Defines.MSG_ADD_SUCCESS);
				return "redirect:/admin/land/index";
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "redirect:/admin/land/add";
			}
			
		}
	}
	
	@GetMapping("edit/{lid}")
	public String edit(@PathVariable int lid, ModelMap modelMap) {
		Land objLand = landDAO.getItemByLid(lid);
		List<Category> listCat = catDAO.getItems();
		modelMap.addAttribute("listCat", listCat);
		modelMap.addAttribute("objLand", objLand);
		return "cland.admin.land.edit";
	}
	
	@PostMapping("edit/{lid}")
	public String edit(@PathVariable("lid") int lid,@ModelAttribute("objLand") Land objLand, @RequestParam("image") CommonsMultipartFile cmf,
			RedirectAttributes ra) {
		
		String fileName = FileUtil.rename(cmf.getOriginalFilename());
		objLand.setPicture(fileName);
		
		if (!"".equals(fileName)) {
			String dirPath = context.getRealPath("") + Defines.DIR_UPLOAD;
			File dir = new File(dirPath);
			if (dir.exists()) {
				dir.mkdirs();
			}
			String filePath = dirPath + File.separator + fileName;
			try {
				cmf.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "redirect:/admin/land/index";
			}
		}
		try {
			if (landDAO.editItem(objLand) > 0) {
				ra.addFlashAttribute("msg", Defines.MSG_UPDATE_SUCCESS);
				return "redirect:/admin/land/index";
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "cland.admin.land.edit";
			}
		} catch (Exception e) {
			return "cland.admin.land.edit";
		}
	}

	
	@GetMapping("del/{lid}")
	public String del(@PathVariable("lid") int idLand , RedirectAttributes ra) {
		if (landDAO.delItem(idLand) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);
			return "redirect:/admin/land/index";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
			return "redirect:/admin/land/index";
		}
	}

}
