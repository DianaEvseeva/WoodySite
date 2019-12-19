package by.fsc.showcase.service;

import by.fsc.showcase.beans.Admin;

import java.util.List;

public interface AdminService {

    Admin add(Admin admin);
    void removeById(int id);
    List<Admin> getAll();

}
