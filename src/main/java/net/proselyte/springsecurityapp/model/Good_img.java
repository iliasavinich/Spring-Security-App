package net.proselyte.springsecurityapp.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

/**
 * Created by Ilia on 05.03.2018.
 */
@Entity
@Table(name = "good_img")
public class Good_img {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NotEmpty
    @Column(name = "image_src")
    private String image_src ;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="good_id",referencedColumnName = "id")
    private Goods good_img_id;

    public Good_img() {
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getId() {
        return id;
    }

    public Goods getGood_img_id() {
        return good_img_id;
    }

    public void setGood_img_id(Goods good_img_id) {
        this.good_img_id = good_img_id;
    }

    public String getImage_src() {
        return image_src;
    }

    public void setImage_src(String image_src) {
        this.image_src = image_src;
    }
}
