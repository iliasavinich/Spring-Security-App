package net.proselyte.springsecurityapp.controller;

import net.proselyte.springsecurityapp.model.Categories;
import net.proselyte.springsecurityapp.model.Goods;
import net.proselyte.springsecurityapp.model.PodCategories;
import net.proselyte.springsecurityapp.service.ORMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Controller
public class AjaxController {

    @Autowired
    private ORMService ormService;

    @RequestMapping(value = "/categorie_podcat", method = RequestMethod.GET,produces="application/json")
    @ResponseBody
    public List getPodcategoriesByCatId(@RequestParam Integer cat_id) {
        System.out.println(cat_id);
        return ormService.getPodCatByCatId(cat_id);
    }

    @RequestMapping(value = "/podcategorie_good", method = RequestMethod.GET,produces="application/json")
    @ResponseBody
    public List getGoodsByPodCatId(@RequestParam Integer podcat_id) {
        System.out.println(podcat_id);
        return ormService.getGoodsByPodCatId(podcat_id);
    }

    @RequestMapping(value = "/char_name", method = RequestMethod.GET,produces="application/json")
    @ResponseBody
    public boolean char_name(@RequestParam Map< String, String > list) {
        return ormService.changeChar_nameById(list);
    }

    @RequestMapping(value = "/char_value", method = RequestMethod.GET,produces="application/json")
    @ResponseBody
    public boolean char_value(@RequestParam Map< String, String > list) {
        return ormService.changeChar_valueById(list);
    }

    @RequestMapping(value = "/loadCategories", method = RequestMethod.GET,produces="application/json")
    @ResponseBody
    public List loadCategories(@RequestParam int odin) {
        return ormService.getAllCategories();
    }
}
