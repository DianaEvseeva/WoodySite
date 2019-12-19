package by.fsc.showcase.service;

import by.fsc.showcase.beans.Item;
import org.springframework.data.domain.Page;


public interface ItemService {

    Page<Item> getAllItems(int page);
    void remove(int id);
    void update(Item update);
    Item getById(int id) throws RuntimeException;
    Item save(Item item);
}
