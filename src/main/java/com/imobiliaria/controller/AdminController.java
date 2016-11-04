package com.imobiliaria.controller;

import com.imobiliaria.dao.ImoveisDao;
import com.imobiliaria.model.Imoveis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.*;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Created by chimbida on 30/10/2016.
 */

@Controller
public class AdminController {

    private Path path;

    @Autowired
    private ImoveisDao imoveisDao;

    @RequestMapping("/admin")
    public String adminPage(Model model) {
        List<Imoveis> imoveis = imoveisDao.getTodosImoveis();
        model.addAttribute("imoveis", imoveis);

        return "admin";
    }

    @RequestMapping("/admin/addImoveis")
    public String addImoveis(Model model) {
        Imoveis imoveis = new Imoveis();
        imoveis.setImovelTipo("Casa");
        imoveis.setImovelCategoria("Venda");

        model.addAttribute("imoveis", imoveis);

        return "addImoveis";
    }

    @RequestMapping(value = "/admin/addImoveis", method = RequestMethod.POST)
    public String addImoveis(@Valid @ModelAttribute("imoveis") Imoveis imoveis, BindingResult resultado, HttpServletRequest request) {

        if (resultado.hasErrors()) {
            return "addImoveis";
        }

        imoveisDao.addImoveis(imoveis);

        MultipartFile imagemImoveis = imoveis.getImovelImagem();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\"+imoveis.getImovelId()+".jpg");

        if (imagemImoveis != null && !imagemImoveis.isEmpty()) {
            try {
                imagemImoveis.transferTo(new File(path.toString()));
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Problema para salvar a imagem!", e);
            }
        }

        return "redirect:/admin";
    }

    @RequestMapping("/admin/deleta/{imovelId}")
    public String deletaImoveis(@PathVariable String imovelId, Model model, HttpServletRequest request) {

        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\"+imovelId+".jpg");

        if (Files.exists(path)) {
            try {
                Files.delete(path);
            }catch (IOException e) {
                e.printStackTrace();
            }
        }

        imoveisDao.deletaImoveis(Integer.parseInt(imovelId));

        return "redirect:/admin";
    }

    @RequestMapping("/admin/editarImoveis/{imovelId}")
    public String editarImoveis(@PathVariable("imovelId") String imovelId, Model model) {
        Imoveis imoveis = imoveisDao.getImoveisPorId(Integer.parseInt(imovelId));
        model.addAttribute(imoveis);

        return "editarImoveis";
    }

    @RequestMapping(value = "/admin/editarImoveis", method = RequestMethod.POST)
    public String editarImoveis(@Valid @ModelAttribute("imoveis") Imoveis imoveis, BindingResult resultado, Model model, HttpServletRequest request) {

        if (resultado.hasErrors()) {
            return "editarImoveis";
        }

        MultipartFile imovelImagem = imoveis.getImovelImagem();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\"+imoveis.getImovelId()+".jpg");

        if (imovelImagem != null && !imovelImagem.isEmpty()) {
            try {
                imovelImagem.transferTo(new File(path.toString()));
            } catch (Exception e) {
                throw new RuntimeException("Problema para salvar a imagem!", e);
            }
        }

        imoveisDao.editarImoveis(imoveis);

        return "redirect:/admin";
    }
}
