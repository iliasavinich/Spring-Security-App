package net.proselyte.springsecurityapp.model;


import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.*;

@Entity
@Table(name = "GOODS")
public class Goods {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NotEmpty
    @Size(min=5, max=60)
    @Column(name = "goods_name")
    private String goods_name ;

    @Column(name = "price")
    private float price ;

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY,mappedBy = "good_img_id")
    private Set<Good_img> good_imgs= new HashSet<>();

    @OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY,mappedBy = "good_char_id")
    private List<Good_char> good_chars= new ArrayList<>();

    public List<Good_char> getGood_chars() {
        return good_chars;
    }

    public void setGood_chars(List<Good_char> good_chars) {
        this.good_chars = good_chars;
    }

    @Transient
    private List<UploadedFile> file=new ArrayList<>();

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Transient
    private int count;

    public List<UploadedFile> getFile() {
        return file;
    }

    public void setFile(List<UploadedFile> file) {
        this.file = file;
    }

    @ManyToOne()
    @JoinColumn(name="podcat_id")
    private PodCategories podcat_id;

    public Goods() {
    }

    public void addGood_img(Good_img good_img) {
        good_img.setGood_img_id(this);
        this.good_imgs.add(good_img);
    }

    public void addGood_char(Good_char good_char) {
        good_char.setGood_char_id(this);
        this.good_chars.add(good_char);
    }

    public List<Good_img> getGood_imgs() {
        return new ArrayList<>(good_imgs);
    }

    public void setGood_imgs(Set<Good_img> good_imgs) {
        this.good_imgs = good_imgs;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public PodCategories getPodcat_id() {
        return podcat_id;
    }

    public void setPodcat_id(PodCategories podcat_id) {
        this.podcat_id = podcat_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }


}
