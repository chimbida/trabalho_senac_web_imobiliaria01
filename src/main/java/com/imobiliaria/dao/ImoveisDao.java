package com.imobiliaria.dao;

import com.imobiliaria.model.Imoveis;
import java.util.List;

/**
 * Created by chimbida on 28/10/2016.
 */
public interface ImoveisDao {

    void addImoveis(Imoveis imoveis);

    void editarImoveis(Imoveis imoveis);

    Imoveis getImoveisPorId(int id);

    List<Imoveis> getTodosImoveis();

    List<Imoveis> getTodosDescImoveis();

    List<Imoveis> getRandonImoveis();

    List<Imoveis> getSearchImoveis(String procura);

    List<Imoveis> getSearchDescImoveis(String procura);

    List<Imoveis> getVendaImoveis(String procura);

    List<Imoveis> getVenda();

    List<Imoveis> getVendaDescImoveis(String procura);

    List<Imoveis> getVendaDesc();

    List<Imoveis> getAluguelImoveis(String procura);

    List<Imoveis> getAluguel();

    List<Imoveis> getAluguelDescImoveis(String procura);

    List<Imoveis> getAluguelDesc();

    void deletaImoveis(int id);

}
