package com.imobiliaria.controller;

import com.imobiliaria.model.Imoveis;
import com.imobiliaria.dao.ImoveisDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

/**
 * Created by chimbida on 31/10/2016.
 */

@RestController
public class ApiController {

    @Autowired
    private ImoveisDao imoveisDao;

    @RequestMapping(value = "/api/imoveis", method = RequestMethod.GET, produces = "application/json")
    public List<Imoveis> getImoveis() {
        List<Imoveis> imoveis = imoveisDao.getTodosImoveis();

        return imoveis;
    }

    @RequestMapping(value = "/api/imoveis/{imovelId}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getImoveis(@PathVariable String imovelId) throws IOException {
        Imoveis imovel = imoveisDao.getImoveisPorId(Integer.parseInt(imovelId));

        return new ResponseEntity(imovel, HttpStatus.OK);

    }

    @RequestMapping(value = { "/api/search/", "/api/search/{procura}"}, method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getCategoria(@PathVariable Optional<String> procura) throws IOException {

        if (procura.isPresent()) {
            List<Imoveis> imoveis = imoveisDao.getSearchImoveis(procura.get());
            return new ResponseEntity(imoveis, HttpStatus.OK);
        } else {
            List<Imoveis> imoveis = imoveisDao.getTodosImoveis();
            return new ResponseEntity(imoveis, HttpStatus.OK);
        }
    }

    @RequestMapping(value = { "/api/desc/search/", "/api/desc/search/{procura}"}, method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getCategoriaDesc(@PathVariable Optional<String> procura) throws IOException {

        if (procura.isPresent()) {
            List<Imoveis> imoveis = imoveisDao.getSearchDescImoveis(procura.get());
            return new ResponseEntity(imoveis, HttpStatus.OK);
        } else {
            List<Imoveis> imoveis = imoveisDao.getTodosDescImoveis();
            return new ResponseEntity(imoveis, HttpStatus.OK);
        }
    }

    @RequestMapping(value = { "/api/venda/search/", "/api/venda/search/{procura}"}, method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getVenda(@PathVariable Optional<String> procura) throws IOException {

        if (procura.isPresent()) {
            List<Imoveis> imoveis = imoveisDao.getVendaImoveis(procura.get());
            return new ResponseEntity(imoveis, HttpStatus.OK);
        } else {
            List<Imoveis> imoveis = imoveisDao.getVenda();
            return new ResponseEntity(imoveis, HttpStatus.OK);
        }
    }

    @RequestMapping(value = { "/api/venda/desc/search/", "/api/venda/desc/search/{procura}"}, method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getVendaDesc(@PathVariable Optional<String> procura) throws IOException {

        if (procura.isPresent()) {
            List<Imoveis> imoveis = imoveisDao.getVendaDescImoveis(procura.get());
            return new ResponseEntity(imoveis, HttpStatus.OK);
        } else {
            List<Imoveis> imoveis = imoveisDao.getVendaDesc();
            return new ResponseEntity(imoveis, HttpStatus.OK);
        }
    }

    @RequestMapping(value = { "/api/aluguel/search/", "/api/aluguel/search/{procura}"}, method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getAluguel(@PathVariable Optional<String> procura) throws IOException {

        if (procura.isPresent()) {
            List<Imoveis> imoveis = imoveisDao.getAluguelImoveis(procura.get());
            return new ResponseEntity(imoveis, HttpStatus.OK);
        } else {
            List<Imoveis> imoveis = imoveisDao.getAluguel();
            return new ResponseEntity(imoveis, HttpStatus.OK);
        }
    }

    @RequestMapping(value = { "/api/aluguel/desc/search/", "/api/aluguel/desc/search/{procura}"}, method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getAluguelDesc(@PathVariable Optional<String> procura) throws IOException {

        if (procura.isPresent()) {
            List<Imoveis> imoveis = imoveisDao.getAluguelDescImoveis(procura.get());
            return new ResponseEntity(imoveis, HttpStatus.OK);
        } else {
            List<Imoveis> imoveis = imoveisDao.getAluguelDesc();
            return new ResponseEntity(imoveis, HttpStatus.OK);
        }
    }

}
