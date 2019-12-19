package by.fsc.showcase.controllers;

import org.springframework.boot.web.reactive.error.ErrorAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ErrorControllerImpl {
    private ErrorAttributes errorAttributes;

    private final static String ERROR_PATH = "/error";

    @GetMapping(value = ERROR_PATH, produces = "text/html")
    public String errorHtml(HttpServletRequest request) {
        return "error_temp";
    }
}