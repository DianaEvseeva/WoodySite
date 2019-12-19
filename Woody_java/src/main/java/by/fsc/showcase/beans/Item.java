package by.fsc.showcase.beans;


import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Data
@Entity(name = "items")
public class Item {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;

    @Column
    private String name;

    @Column
    private Date date;

    @Column
    private String age;
    @Column(length = 500)
    private String material;
    @Column
    private Integer details;

    @Column
    private String toy_size;
    @Column
    private String box_size;
    @Column
    private Double weight;

    @Column
    private Integer art;

    @Column
    private Double cost;
    @Column
    private Double sale_cost;

    @Column
    private Boolean new_label;
    @Column
    private Boolean hit_label;
    @Column
    private Boolean sale_label;

    @Column(length = 3000)
    private String description;

    @OneToMany(mappedBy="item", cascade = CascadeType.ALL)
    private List<PicturePath> picturePaths = new ArrayList<>();

}
