package by.fsc.showcase.security;

import by.fsc.showcase.beans.Admin;
import by.fsc.showcase.repsitories.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class UserDetailServiceImpl implements UserDetailsService {
    @Autowired
    private AdminRepository adminRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<Admin> adminOptional  = adminRepository.findByLogin(username);
        return new UserDetailsImpl(
                adminOptional.orElseThrow(IllegalArgumentException::new)
        );

    }
}

