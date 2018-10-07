package net.proselyte.springsecurityapp.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

/**
 * Simple JavaBean object that represents role of {@link User}.
 *
 * @author Eugene Suleimanov
 * @version 1.0
 */
@Component
@Entity
@Table(name = "CATEGORIES")
public class Categories {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NotEmpty
    @Size(min=5, max=60)
    @Column(name = "categorie_name")
    private String name ;

    public Set<PodCategories> getPodCategoriesSet() {
        return podCategoriesSet;
    }

    public void setPodCategoriesSet(Set<PodCategories> podCategoriesSet) {
        this.podCategoriesSet = podCategoriesSet;
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy = "cat_id")
    private Set<PodCategories> podCategoriesSet= new HashSet<PodCategories>();


    public Categories() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name ;
    }

    public void setName(String categorie_name) {
        this.name = categorie_name ;
    }

    /*@Override
    public String toString() {
        return "Categories{" +
                "id=" + id +
                ", categorie_name'" + categorie_name +
                '}';
    }*/
}
