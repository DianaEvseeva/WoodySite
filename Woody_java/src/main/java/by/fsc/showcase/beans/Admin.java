package by.fsc.showcase.beans;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity(name = "admins")
public class Admin {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    @Column
    private String login;

    @Column
    private String password;
}
