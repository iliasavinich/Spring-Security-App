package net.proselyte.springsecurityapp.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Simple JavaBean object that represents role of {@link User}.
 *
 * @author Eugene Suleimanov
 * @version 1.0
 */

@Entity
@Table(name = "PODCATEGORIES")
public class PodCategories {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NotEmpty
    @Size(min=5, max=60)
    @Column(name = "podcategorie_name")
    private String podcategorie_name ;

    @Column(name = "link")
    private String link ;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy = "podcat_id")
    private List<Goods> goodsList=new ArrayList<Goods>();

    @ManyToOne()
    @JoinColumn(name="cat_id")
    private Categories cat_id=new Categories();


    public PodCategories() {
    }

    public List<Goods> getGoodsList() {
        return new ArrayList<>(new HashSet<>(goodsList));
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPodcategorie_name() {
        return podcategorie_name ;
    }

    public void setPodcategorie_name(String podcategorie_name) {
        this.podcategorie_name = podcategorie_name ;
    }

    public Categories getCat_id() {
        return cat_id;
    }

    public void setCat_id(Categories cat_id) {this.cat_id=cat_id;}

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Override
    public String toString() {
        return "";
    }
}
