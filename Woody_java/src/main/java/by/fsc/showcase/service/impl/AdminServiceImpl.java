package by.fsc.showcase.service.impl;

import by.fsc.showcase.beans.Admin;
import by.fsc.showcase.repsitories.AdminRepository;
import by.fsc.showcase.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private AdminRepository adminRepository;

    @Override
    public Admin add(Admin admin) {
        admin.setPassword(passwordEncoder.encode(admin.getPassword()));
        return adminRepository.save(admin);
    }

    @Override
    public void removeById(int id) {
        adminRepository.deleteById(id);
    }

    @Override
    public List<Admin> getAll() {
        return adminRepository.findAll();
    }
}
