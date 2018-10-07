package net.proselyte.springsecurityapp.service;


import net.proselyte.springsecurityapp.model.*;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created for JavaStudy.ru on 28.02.2016.
 */
@Repository
@Transactional //need to update\delete queries. Don't forget <tx:annotation-driven/>
public class ORMService {

    @PersistenceContext
    private EntityManager entityManager;

    public Goods getGoodById (int id) {
        String query="SELECT distinct g from Goods g WHERE g.id=?";
        Query q=entityManager.createQuery(query,Goods.class);
        q.setParameter(1,id);
        Goods g=(Goods)q.getSingleResult();
        Hibernate.initialize(g.getGood_imgs());
        Hibernate.initialize(g.getGood_chars());
        return g;
    }

    public Good_img getImgById (int id) {
        return entityManager.find(Good_img.class,id);
    }

    public List getPodCatByCatId(int cat_id){
        String query="SELECT pc.podcategorie_name, pc.id FROM PodCategories pc WHERE pc.cat_id=? ORDER BY pc.id";
        Query q=entityManager.createNativeQuery(query);
        q.setParameter(1,cat_id);
        return q.getResultList();
    }

    public List getGoodsByPodCatId(int podcat_id){
        String query="SELECT g.goods_name, g.id FROM goods g WHERE g.podcat_id=? ORDER BY g.id";
        Query q=entityManager.createNativeQuery(query);
        q.setParameter(1,podcat_id);
        return q.getResultList();
    }

    public User findByUsername(String userName){
        String query="SELECT distinct u from User u WHERE u.username=?";
        Query q=entityManager.createQuery(query,User.class);
        q.setParameter(1,userName);
        return (User)q.getSingleResult();
    }
    public List<Categories> getAllCategoriesTypedQuery() {
        String query = "from Categories order by id";
        TypedQuery<Categories> typedQuery = entityManager.createQuery(query, Categories.class);
        List<Categories> categories=typedQuery.getResultList();
        this.initializePodCategoriesList(categories);
        return categories;
    }

    public List<Orders> getAllOrders(){
        String query = "from Orders order by id";
        TypedQuery<Orders> typedQuery = entityManager.createQuery(query, Orders.class);
        return typedQuery.getResultList();
    }

    public List<Categories> getAllCategories () {
        String query = "SELECT c.categorie_name, c.id FROM Categories c ORDER BY c.id";
        Query q = entityManager.createNativeQuery(query);
        return q.getResultList();
    }

    public List<PodCategories> getAllPodCategories () {
        System.out.println("getAllPodCategories");
        String query = "from PodCategories order by id";
        TypedQuery<PodCategories> typedQuery = entityManager.createQuery(query, PodCategories.class);
        return typedQuery.getResultList();
    }

    public Categories getCategorieById(int id) {
        Categories categorie=entityManager.find(Categories.class,id);
        Hibernate.initialize(categorie.getPodCategoriesSet());
        return categorie;
    }

    public PodCategories getPodCategorieGoods (int id) {
        String query="SELECT pc FROM PodCategories pc WHERE pc.id=?";
        Query q=entityManager.createQuery(query,PodCategories.class);
        q.setParameter(1,id);
        PodCategories pc=(PodCategories)q.getSingleResult();
        Hibernate.initialize(pc.getGoodsList());
        this.initializeGoodsImgsList(pc.getGoodsList());
        return pc ;
    }

    public Categories getCategorieTitle (int cat_id) {
        return entityManager.find(Categories.class,cat_id);
    }

    public List<Goods> getAllGoods () {
        System.out.println("getAllGoods");
        String query = "from Goods g JOIN FETCH g.good_imgs  order by g.id";
        TypedQuery<Goods> typedQuery = entityManager.createQuery(query, Goods.class);
        return typedQuery.getResultList();
    }

    public List<Goods> getAllGoods (int limit) {
        System.out.println("getAllGoods");
        String query = "select g from Goods g order by g.id";
        TypedQuery<Goods> typedQuery = entityManager.createQuery(query, Goods.class);
        typedQuery.setMaxResults(limit);
        List<Goods> goods=typedQuery.getResultList();
        this.initializeGoodsImgsList(goods);
        return goods;
    }

    private List<Goods> initializeGoodsImgsList(List<Goods> goods){
        for(Goods good:goods){
            Hibernate.initialize(good.getGood_imgs());
        }
        return goods;
    }


    private void initializePodCategoriesList(List<Categories> categories){
        for(Categories categorie:categories){
            Hibernate.initialize(categorie.getPodCategoriesSet());
        }
    }


    public boolean insertNewCategorie (String name){
        String query = "insert into categories (categorie_name) values (?)";
        Query q=entityManager.createNativeQuery(query);
        q.setParameter(1,name);
        int result = q.executeUpdate();
        return result > 0;
    }

    public void insertNewPodcategorie (PodCategories add_podcategorie) {
        String query = "insert into podcategories (cat_id,podcategorie_name,link) values (?,?,?)";
        Query q=entityManager.createNativeQuery(query);
        q.setParameter(1,add_podcategorie.getCat_id().getId());
        q.setParameter(2,add_podcategorie.getPodcategorie_name());
        q.setParameter(3,add_podcategorie.getLink());
        q.executeUpdate();
    }

    public void insertNewGood (Goods good) {
        entityManager.merge(good);
    }

    public void insertNewOrder (Orders order) {
        entityManager.merge(order);
    }

    public boolean changeChar_nameById(Map< String, String > list) {
        int id=Integer.parseInt(list.get("id"));
        String query = "update Good_char set char_name=?"+" where id=?";
        Query q=entityManager.createQuery(query);
        q.setParameter(1,list.get("data"));
        q.setParameter(2,id);
        return q.executeUpdate()>0;
    }
    public boolean changeChar_valueById(Map< String, String > list) {
        int id=Integer.parseInt(list.get("id"));
        String query = "update Good_char set char_value=?"+" where id=?";
        Query q=entityManager.createQuery(query);
        q.setParameter(1,list.get("data"));
        q.setParameter(2,id);
        return q.executeUpdate()>0;
    }
    public void dellCategorie (Categories dell_categorie) {
        String query = "DELETE from categories WHERE id=?";
        Query q=entityManager.createNativeQuery(query);
        q.setParameter(1,dell_categorie.getId());
        q.executeUpdate();
    }
    public void dellPodCategorie (PodCategories dell_podcategorie) {
        String query = "DELETE from podcategories WHERE id=?";
        Query q=entityManager.createNativeQuery(query);
        q.setParameter(1,dell_podcategorie.getId());
        q.executeUpdate();
    }

    public void dellGoodById (int id) {
        String query = "DELETE from goods WHERE id=?";
        Query q=entityManager.createNativeQuery(query);
        q.setParameter(1,id);
        q.executeUpdate();
    }
}
