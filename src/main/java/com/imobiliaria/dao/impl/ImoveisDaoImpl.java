package com.imobiliaria.dao.impl;

import com.imobiliaria.dao.ImoveisDao;
import com.imobiliaria.model.Imoveis;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by chimbida on 28/10/2016.
 */

@Repository
@Transactional
public class ImoveisDaoImpl implements ImoveisDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addImoveis(Imoveis imoveis) {

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(imoveis);
        session.flush();
    }

    public Imoveis getImoveisPorId(int id) {

        Session session = sessionFactory.getCurrentSession();
        Imoveis imoveis = (Imoveis) session.get(Imoveis.class, id);
        session.flush();

        return imoveis;
    }

    public List<Imoveis> getTodosImoveis() {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis order by imovelPreco");
        List<Imoveis> imoveis = query.list();

        return imoveis;
    }

    public List<Imoveis> getTodosDescImoveis() {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis order by imovelPreco desc");
        List<Imoveis> imoveis = query.list();

        return imoveis;
    }

    public List<Imoveis> getRandonImoveis() {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis order by RAND()");
        query.setMaxResults(4);
        List<Imoveis> imoveis = query.list();

        return imoveis;
    }


    public void deletaImoveis(int id) {

        Session session = sessionFactory.getCurrentSession();
        session.delete(getImoveisPorId(id));
        session.flush();
    }

    public void editarImoveis(Imoveis imoveis) {

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(imoveis);
        session.flush();
    }

    public List<Imoveis> getSearchImoveis(String procura) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis where imovelDescricao like :procura or imovelTipo like :tipo or imovelCategoria like :categoria or imovelEndereco like :endereco order by imovelPreco");
        query.setParameter("procura", "%" + procura + "%");
        query.setParameter("tipo", "%" + procura + "%");
        query.setParameter("categoria", "%" + procura + "%");
        query.setParameter("endereco", "%" + procura + "%");

        List<Imoveis> imoveis = query.list();

        return imoveis;

    }

    public List<Imoveis> getSearchDescImoveis(String procura) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis where imovelDescricao like :procura or imovelTipo like :tipo or imovelCategoria like :categoria or imovelEndereco like :endereco order by imovelPreco desc");
        query.setParameter("procura", "%" + procura + "%");
        query.setParameter("tipo", "%" + procura + "%");
        query.setParameter("categoria", "%" + procura + "%");
        query.setParameter("endereco", "%" + procura + "%");

        List<Imoveis> imoveis = query.list();

        return imoveis;

    }

    public List<Imoveis> getVendaImoveis(String procura) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis where imovelTipo = 'Venda' and (imovelDescricao like :procura or imovelCategoria like :categoria or imovelEndereco like :endereco) order by imovelPreco");
        query.setParameter("procura", "%" + procura + "%");
        query.setParameter("categoria", "%" + procura + "%");
        query.setParameter("endereco", "%" + procura + "%");

        List<Imoveis> imoveis = query.list();

        return imoveis;

    }

    public List<Imoveis> getVendaDescImoveis(String procura) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis where imovelTipo = 'Venda' and (imovelDescricao like :procura or imovelCategoria like :categoria or imovelEndereco like :endereco) order by imovelPreco desc");
        query.setParameter("procura", "%" + procura + "%");
        query.setParameter("categoria", "%" + procura + "%");
        query.setParameter("endereco", "%" + procura + "%");

        List<Imoveis> imoveis = query.list();

        return imoveis;

    }

    public List<Imoveis> getVenda() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis where imovelTipo = 'Venda' order by imovelPreco");

        List<Imoveis> imoveis = query.list();

        return imoveis;

    }

    public List<Imoveis> getVendaDesc() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis where imovelTipo = 'Venda' order by imovelPreco desc");

        List<Imoveis> imoveis = query.list();

        return imoveis;

    }

    public List<Imoveis> getAluguelImoveis(String procura) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis where imovelTipo = 'Aluguel' and (imovelDescricao like :procura or imovelCategoria like :categoria or imovelEndereco like :endereco) order by imovelPreco");
        query.setParameter("procura", "%" + procura + "%");
        query.setParameter("categoria", "%" + procura + "%");
        query.setParameter("endereco", "%" + procura + "%");

        List<Imoveis> imoveis = query.list();

        return imoveis;

    }

    public List<Imoveis> getAluguelDescImoveis(String procura) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis where imovelTipo = 'Aluguel' and (imovelDescricao like :procura or imovelCategoria like :categoria or imovelEndereco like :endereco) order by imovelPreco desc");
        query.setParameter("procura", "%" + procura + "%");
        query.setParameter("categoria", "%" + procura + "%");
        query.setParameter("endereco", "%" + procura + "%");

        List<Imoveis> imoveis = query.list();

        return imoveis;

    }

    public List<Imoveis> getAluguel() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis where imovelTipo = 'Aluguel' order by imovelPreco");

        List<Imoveis> imoveis = query.list();

        return imoveis;

    }

    public List<Imoveis> getAluguelDesc() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Imoveis where imovelTipo = 'Aluguel' order by imovelPreco desc");

        List<Imoveis> imoveis = query.list();

        return imoveis;

    }
}
