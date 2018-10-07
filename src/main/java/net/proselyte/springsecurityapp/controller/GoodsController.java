package net.proselyte.springsecurityapp.controller;

import net.proselyte.springsecurityapp.model.*;
import net.proselyte.springsecurityapp.service.ORMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


@Controller
public class GoodsController {

    @Autowired
    private ORMService ormService;

    @RequestMapping(value ="/categorie/{CatId}/podcat/{podcat_id}", method = RequestMethod.GET)
    public ModelAndView podcat(@PathVariable("podcat_id") int podcat_id, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        PodCategories podCategorie= ormService.getPodCategorieGoods(podcat_id);
        modelAndView.addObject("PodCategorie",podCategorie);
        modelAndView.setViewName("PodCategorieView");
        return modelAndView;
    }

    @RequestMapping(value ="/good/{goodId}", method = RequestMethod.GET)
    public ModelAndView good(@PathVariable("goodId") int good_id) {
        ModelAndView modelAndView = new ModelAndView();
        Goods good=ormService.getGoodById(good_id);
        if (good!=null) {
            modelAndView.addObject("Good", good);
            modelAndView.setViewName("/goodview");
        } else {
            modelAndView.setViewName("redirect:/home");
        }
        return modelAndView;
    }

}
