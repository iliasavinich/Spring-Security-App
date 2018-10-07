package net.proselyte.springsecurityapp.controller;

import net.proselyte.springsecurityapp.model.*;
import net.proselyte.springsecurityapp.service.ORMService;
import net.proselyte.springsecurityapp.service.UserService;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import static java.lang.Integer.parseInt;

@Controller
public class ScopeController {

    @Autowired
    private ORMService ormService;

    @RequestMapping(value = "/categorie/{CatId}", method = RequestMethod.GET)
    public ModelAndView categorie(HttpSession session,@PathVariable("CatId") int CatId) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("Categorie", ormService.getCategorieById(CatId));
        modelAndView.setViewName("/CategorieView");
        return modelAndView;
    }

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView();
        System.out.println("ORMController GetAllCategories is called");
        List<Categories> categories = ormService.getAllCategoriesTypedQuery();
        List<Goods> goods=ormService.getAllGoods(3);
        modelAndView.addObject("Categories",categories);
        modelAndView.addObject("Goods",goods);
        modelAndView.setViewName("/index");
        return modelAndView;
    }


    @RequestMapping(value ="/cart", method = RequestMethod.GET)
    public ModelAndView cart(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        Cookie[] cookies= request.getCookies();
        String cookie=null;
        for(Cookie a:cookies){
            if(a.getName().equals("basket")){
               cookie=a.getValue().replaceAll("null","");
            }
        }
        if(cookie!=null&&!cookie.equals("")){
            String[] goodsArray=cookie.split("%2C");
            List<Goods> goods=new ArrayList<Goods>();
            for(String goodArray:goodsArray){
                String[] goodArr=goodArray.split("%3A");
                Goods good=(Goods)ormService.getGoodById(parseInt(goodArr[0]));
                if(good.getGoods_name()!=null) {
                    good.setCount(parseInt(goodArr[1]));
                    goods.add(good);
                }
                goodArray=null;
            }
            modelAndView.addObject("Goods",goods);
        }
        modelAndView.setViewName("/cartview");
        return modelAndView;
    }

    @RequestMapping(value = "/add_categorie", method = RequestMethod.POST)
    public String add_categorie(@ModelAttribute("redacting") Categories add_categorie) {
        boolean result=ormService.insertNewCategorie(add_categorie.getName());
        return "redirect:/home";
    }

    @RequestMapping(value = "/makeOrder", method = RequestMethod.POST)
    public String makeOrder(HttpServletRequest request) {
        Orders order= new Orders();
        List<Order_goods> order_goodsList=new ArrayList<>();
        int i=1;
        while(request.getParameter("goodCount_"+i)!=null){
            Order_goods order_goods=new Order_goods();
            order_goods.getGood().setId(parseInt(request.getParameter("goodId_"+i)));
            order_goods.setCount(parseInt(request.getParameter("goodCount_"+i)));
            order_goods.setOrder(order);
            order_goodsList.add(order_goods);
            i++;
        }
        order.setOrder(order_goodsList);
        String username=SecurityContextHolder.getContext().getAuthentication().getName();
        order.setUser(ormService.findByUsername(username));
        ormService.insertNewOrder(order);
        return "redirect:/home";
    }

    @RequestMapping(value = "/add_podcategorie", method = RequestMethod.POST)
    public String add_podcategorie(@ModelAttribute("redacting") PodCategories add_podcategorie) {
        ormService.insertNewPodcategorie(add_podcategorie);
        return "redirect:/categorie/"+add_podcategorie.getCat_id().getId();
    }


    @RequestMapping(value = "/dell_categorie", method = RequestMethod.POST)
    public String dell_categorie(@ModelAttribute("Categorie") Categories dell_categorie) {
        ormService.dellCategorie(dell_categorie);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/dell_podcategorie", method = RequestMethod.POST)
    public String dell_podcategorie(@ModelAttribute("PodCategorie") PodCategories dell_podcategorie) {
        ormService.dellPodCategorie(dell_podcategorie);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/dell_good", method = RequestMethod.POST)
    public String dell_god(@ModelAttribute("Good") Goods dell_good,HttpServletRequest request,HttpServletResponse response) {
        ormService.dellGoodById(dell_good.getId());
        String cookie=null,newCookie="";
        for(Cookie a:request.getCookies()){
            if(a.getName().equals("basket")){
                cookie=a.getValue().replaceAll("null","");
                for(String goods:cookie.split("%2C")){
                    String[] goodArr=goods.split("%3A");
                    if(!goodArr[0].equals(Integer.toString(dell_good.getId()))){
                        newCookie=newCookie+goods+"%2C";
                    }
                }
                a.setValue(newCookie);
                response.addCookie(a);
            }
        }
        return "redirect:/admin";
    }

}
