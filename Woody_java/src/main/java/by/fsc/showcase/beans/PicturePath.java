package by.fsc.showcase.beans;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name ="picture_path" )
@Data
public class PicturePath {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    @Column
    private String picName;

    @ManyToOne
    @JoinColumn(name="item_id", nullable=false)
    private Item item;
}
