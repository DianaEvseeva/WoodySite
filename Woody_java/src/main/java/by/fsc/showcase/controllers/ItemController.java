package by.fsc.showcase.controllers;

import by.fsc.showcase.beans.Item;
import by.fsc.showcase.beans.PicturePath;
import by.fsc.showcase.service.ItemService;
import by.fsc.showcase.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.Date;

@Controller
public class ItemController {

    @Autowired
    private ItemService itemService;

    @RequestMapping(path = "/items", method = RequestMethod.GET)
    public String getItems(ModelMap model, @RequestParam(defaultValue = "0") int page) {
        model.addAttribute("items", itemService.getAllItems(page));
        return "items_temp";
    }



    @GetMapping(path = "/admin/items/remove/{id}")
    public String removeItem(@PathVariable int id) throws IOException {
        itemService.remove(id);
        FileUtil.removeFile(id);
        return "redirect:/admin/admin_catalog";
    }


    @GetMapping(path = "/items/{id}")
    public String getById(@PathVariable int id, ModelMap model) {
        model.addAttribute("item", itemService.getById(id));
        return "item_temp";
    }


    @PostMapping(path = "admin/items/add")
    public String addItem(Item item, HttpServletRequest request) throws IOException, ServletException {


        item.setDate(new Date());
        itemService.save(item);
        Part part = request.getPart("file");
        FileUtil.processFile(item.getId(), part);
        return "redirect:/items/" + item.getId();
    }

    @PostMapping(path = "admin/items/add/{id}")
    public String addItem(HttpServletRequest request, @PathVariable Integer id) throws IOException, ServletException {
        Item item = itemService.getById(id);
        request.getParts().forEach(part->{
                    try {
                        FileUtil.processFile(part.getSubmittedFileName(), part);
                        PicturePath picturePath = new PicturePath();
                        picturePath.setPicName(part.getSubmittedFileName());
                        item.getPicturePaths().add(picturePath);
                        picturePath.setItem(item);
                        itemService.update(item);
                    } catch (IOException e) {

                    }
                }
        );
        return "redirect:/items/" + id;
    }


    @PostMapping(path = "admin/items/update/{id}")
    public String updateItem(@PathVariable int id, Item item, HttpServletRequest request) throws IOException, ServletException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
        Part part = request.getPart("file");
        if (part.getSize() != 0) {
            FileUtil.removeFile(id);
            FileUtil.processFile(item.getId(), part);
        }

        /*Item item1 = itemService.getById(id);
        item1.setName(item.getName());
        item1.setDescription(item.getDescription());
        item1.setDate(new Date());*/

        itemService.update(item);
        return "redirect:/items/" + item.getId();
    }


}