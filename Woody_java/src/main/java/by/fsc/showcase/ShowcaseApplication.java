package by.fsc.showcase;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/*@EnableJpaRepositories(basePackageClasses = ItemRepository.class)
@EntityScan(basePackageClasses = Item.class)*/
@SpringBootApplication
public class ShowcaseApplication  {



    public static void main(String[] args) {
        SpringApplication.run(ShowcaseApplication.class, args);
    }

}
