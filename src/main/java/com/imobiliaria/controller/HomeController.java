package com.imobiliaria.controller;

import com.imobiliaria.dao.ImoveisDao;
import com.imobiliaria.model.Imoveis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

/**
 * Created by chimbida on 28/10/2016.
 */

@Controller
public class HomeController {

    @Autowired
    private ImoveisDao imoveisDao;

    @RequestMapping("/")
    public String home(Model model) {

        List<Imoveis> imoveis = imoveisDao.getRandonImoveis();
        model.addAttribute("imoveis", imoveis);

        return "home";
    }

    @RequestMapping("/listaImoveis")
    public String listaImoveis(Model model) {

        List<Imoveis> imoveis = imoveisDao.getTodosImoveis();
        model.addAttribute("imoveis", imoveis);

        return "listaImoveis";
    }

    @RequestMapping("/listaVenda")
    public String listaVenda(Model model) {

        List<Imoveis> imoveis = imoveisDao.getVenda();
        model.addAttribute("imoveis", imoveis);

        return "listaVenda";
    }

    @RequestMapping("/listaAluguel")
    public String listaAluguel(Model model) {

        List<Imoveis> imoveis = imoveisDao.getAluguel();
        model.addAttribute("imoveis", imoveis);

        return "listaAluguel";
    }

    @RequestMapping("/detalheImoveis/{imovelId}")
    public String detalheImoveis(@PathVariable String imovelId, Model model) throws IOException {

        Imoveis imoveis = imoveisDao.getImoveisPorId(Integer.parseInt(imovelId));
        model.addAttribute(imoveis);

        return "detalheImoveis";
    }

}
