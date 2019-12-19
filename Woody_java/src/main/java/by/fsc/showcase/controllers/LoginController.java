package by.fsc.showcase.controllers;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/login")
public class LoginController {
    @GetMapping
    public String toLogInPAge(Authentication authentication, Model model, HttpServletRequest request) {
        if (authentication != null) {
            return "redirect:/admin/admin_catalog";
        }

        if (request.getParameterMap().containsKey("error")) {
            model.addAttribute("error", true);
        }

        return "login_temp";
    }
}

