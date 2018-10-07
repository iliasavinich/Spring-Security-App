package net.proselyte.springsecurityapp.model;

import org.hibernate.engine.profile.Fetch;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Set;

/**
 * Created by Ilia on 28.02.2018.
 */

@Entity
@Table(name = "good_char")
public class Good_char {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NotEmpty
    @Column(name = "char_value")
    private String char_value ;

    @NotEmpty
    @Column(name = "char_name")
    private String char_name ;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="good_id",referencedColumnName = "id")
    private Goods good_char_id;

    public Good_char() {
    }



    public String getChar_name() {
        return char_name;
    }

    public int getId() {
        return id;
    }

    public String getChar_value() {
        return char_value;
    }

    public void setChar_name(String char_name) {
        this.char_name = char_name;
    }

    public void setChar_value(String char_value) {
        this.char_value = char_value;
    }

    public Goods getGood_char_id() {
        return good_char_id;
    }

    public void setGood_char_id(Goods good_char_id) {
        this.good_char_id = good_char_id;
    }

    public void setId(int id) {
        this.id = id;
    }

}


