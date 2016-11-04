package com.imobiliaria.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;
import javax.persistence.*;
import javax.validation.constraints.Min;
import java.math.BigDecimal;

/**
 * Created by chimbida on 28/10/2016.
 */

@Entity
public class Imoveis {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int imovelId;

    @NotEmpty(message = "O endereço do imovel não pode ser nulo!")
    private String imovelEndereco;

    @NotEmpty(message = "O endereço do imovel não pode ser nulo!")
    private String imovelCategoria;

    @NotEmpty(message = "O endereço do imovel não pode ser nulo!")
    private String imovelDescricao;

    @Min(value = 0, message = "O preco do imovel não pode ser menor que zero!")
    private BigDecimal imovelPreco;

    @NotEmpty(message = "O tipo do imovel não pode ser nulo!")
    private String imovelTipo;

    @Transient
    private MultipartFile imovelImagem;

    public int getImovelId() {
        return imovelId;
    }

    public void setImovelId(int imovelId) {
        this.imovelId = imovelId;
    }

    public String getImovelEndereco() {
        return imovelEndereco;
    }

    public void setImovelEndereco(String imovelEndereco) {
        this.imovelEndereco = imovelEndereco;
    }

    public String getImovelCategoria() {
        return imovelCategoria;
    }

    public void setImovelCategoria(String imovelCategoria) {
        this.imovelCategoria = imovelCategoria;
    }

    public String getImovelDescricao() {
        return imovelDescricao;
    }

    public void setImovelDescricao(String imovelDescricao) {
        this.imovelDescricao = imovelDescricao;
    }

    public BigDecimal getImovelPreco() {
        return imovelPreco;
    }

    public void setImovelPreco(BigDecimal imovelPreco) {
        this.imovelPreco = imovelPreco;
    }

    public String getImovelTipo() {
        return imovelTipo;
    }

    public void setImovelTipo(String imovelTipo) {
        this.imovelTipo = imovelTipo;
    }

    public MultipartFile getImovelImagem() {
        return imovelImagem;
    }

    public void setImovelImagem(MultipartFile imovelImagem) {
        this.imovelImagem = imovelImagem;
    }
}
