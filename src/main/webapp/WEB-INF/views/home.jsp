<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="index-banner" class="parallax-container">
    <div class="section no-pad-bot">
        <div class="container">
            <br><br>
            <h1 class="header center lime-text text-accent-2" >Encontre seu Imóvel</h1>
            <div class="row center">
                <h5 class="header col s12 light lime-text text-accent-1">O maior shopping de imóveis do Brasil </h5>
            </div>
            <div class="row center">
                <a href="<c:url value="/listaImoveis" />" id="download-button" class="btn-large waves-effect waves-light green tooltipped" data-position="bottom" data-delay="50" data-tooltip="Click aqui para listar dodos nossos imóveis!">Veja todos nossos Imóveis</a>
            </div>
            <br><br>

        </div>
    </div>
    <div class="parallax"><img src="<c:url value="/resources/background1.jpg" />" alt="Unsplashed background img 1"></div>
</div>


<div class="container">
    <div class="section">

        <div class="row">
            <div class="col s12 green">
                <h4 class="white-text center-align">Imóveis em Destaque</h4>
            </div>

            <c:forEach items="${imoveis}" var="imoveis">

                <div class="col s12 m6">
                    <div class="card medium sticky-action">
                        <div class="card-image waves-effect waves-block waves-light">
                            <img src="<c:url value="/resources/images/${imoveis.imovelId}.jpg" />" class="activator" style="width:100%;">
                            <h5><span class="card-title right" style="background-color: #4caf50;">R$ ${imoveis.imovelPreco}</span></h5>
                        </div>
                        <div class="card-content">
                            <span class="card-title activator green-text text-darken-4">${imoveis.imovelCategoria} / ${imoveis.imovelTipo}<i class="material-icons right tooltipped" data-position="bottom" data-delay="50" data-tooltip="Click para ver descrição do Produto!">visibility</i></span>
                        </div>
                        <div class="card-reveal">
                            <span class="card-title green-text text-darken-4">Cod: ${imoveis.imovelId} - ${imoveis.imovelCategoria} / ${imoveis.imovelTipo}<i class="material-icons right">close</i></span>
                            <p>${imoveis.imovelDescricao}</p>
                            <p></p>
                            <p>${imoveis.imovelEndereco}</p>
                            <h4><span class="red-text text-accent-1 right">R$ ${imoveis.imovelPreco}</span></h4>
                        </div>
                        <div class="card-action">
                            <a href="<spring:url value="/detalheImoveis/${imoveis.imovelId}" />" class="waves-effect waves-light btn-floating green tooltipped right" data-position="bottom" data-delay="50" data-tooltip="Click para exibir mais detalhes do produto!"><i class="material-icons">info_outline</i></a>
                        </div>
                    </div>
                </div>

            </c:forEach>

        </div>

    </div>
</div>

<%@include file="/WEB-INF/views/template/footer.jsp"%>