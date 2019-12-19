package by.fsc.showcase.controllers;

import by.fsc.showcase.beans.Admin;
import by.fsc.showcase.beans.PicturePath;
import by.fsc.showcase.service.AdminService;
import by.fsc.showcase.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import java.io.IOException;

@Controller
public class AdminController {

    @Autowired
    private JpaRepository<PicturePath, Integer> picturePathRepository;

    @Autowired
    private AdminService adminService;
    @Autowired
    private ItemService itemService;

    @RequestMapping(path = "/admin/admins", method = RequestMethod.GET)
    public String getAdmins(ModelMap model) {
        model.addAttribute("admins", adminService.getAll());
        return "console_temp";
    }


    @GetMapping(path = "admin/add_item")
    public String loadPicture() {

        return "add_item";
    }

    @GetMapping(path = "admin/admin_catalog")
    public String getCatalog(ModelMap model, @RequestParam(defaultValue = "0") int page) {
        model.addAttribute("items", itemService.getAllItems(page));
        return "admin_catalog";
    }

    @GetMapping(path = "/admin/picture/remove/{picId}")
    public String removePicture(@PathVariable Integer picId) {
        Integer itemId = picturePathRepository.findById(picId).get().getItem().getId();
        picturePathRepository.deleteById(picId);
        return "redirect:/items/" + itemId;
    }

    @GetMapping(path = "/admin/remove/{id}")
    public String removeAdmin(@PathVariable int id) throws IOException {
        adminService.removeById(id);
        return "redirect:/admin/admins";
    }

    @PostMapping(path = "/admin/add")
    public String addAdmin(Admin admin) throws IOException {
        adminService.add(admin);
        return "redirect:/admin/admins";
    }

    @PostConstruct
    private void createFirstAdmin() throws IOException {
        if (adminService.getAll().size() == 0) {
            Admin admin = new Admin();
            admin.setLogin("admin");
            admin.setPassword("admin");
            addAdmin(admin);
        }
    }
}
