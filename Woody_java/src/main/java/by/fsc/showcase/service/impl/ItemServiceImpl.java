package by.fsc.showcase.service.impl;

import by.fsc.showcase.beans.Item;
import by.fsc.showcase.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    private Pageable pageable;

    @Value("${count.per_page}")
    int countPerPage;

    @Autowired
    private JpaRepository<Item, Integer> itemRepository;

    @Override
    public Page<Item> getAllItems(int page) {
        return itemRepository.findAll(PageRequest.of(page,countPerPage));
    }

    @Override
    public void remove(int id) {
        itemRepository.deleteById(id);
    }

    @Override
    public void update(Item item) {
        itemRepository.save(item);
    }

    @Override
    public Item getById(int id) {
        return itemRepository.findById(id).orElseThrow(() -> new RuntimeException("cannot find by id - " + id));
    }

    @Override
    public Item save(Item item) {
        return itemRepository.save(item);
    }
}
