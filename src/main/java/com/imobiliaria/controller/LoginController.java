package com.imobiliaria.controller;

import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by chimbida on 28/10/2016.
 */

@Controller
public class LoginController {

    @RequestMapping("/login")
    public String login(@RequestParam (value = "error", required = false) String error,
                        @RequestParam (value = "logout", required = false) String logout, Model model) {

        if (error != null) {
            model.addAttribute("error", "Usuário invalido!");
        }

        if(logout != null) {
            model.addAttribute("msg", "Sessão fechou com sucesso!");
        }

        return "login";
    }

}
