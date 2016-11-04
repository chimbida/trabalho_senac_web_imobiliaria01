<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .parallax-container {
        height: 300px;
    }
</style>

<div id="index-banner" class="parallax-container">
    <div class="section no-pad-bot">
        <div class="container">
            <br><br>
            <h1 class="header center write-text text-accent-2" style="background-color: #4caf50;" > ${imoveis.imovelCategoria} / ${imoveis.imovelTipo}</h1>
        </div>
        <br><br>
        <div class="row center">
            <a href="javascript: history.go(-1)" class="btn-large waves-effect waves-light green">Voltar</a>
        </div>
    </div>
    <div class="parallax"><img src="<c:url value="/resources/images/${imoveis.imovelId}.jpg" />" alt="Unsplashed background img 1"></div>
</div>


<div class="container">
    <div class="section">

        <div class="row">

                <div class="col s6">
                    <div class="card-panel green">
                        <img class="materialboxed responsive-img" width="100%" src="<c:url value="/resources/images/${imoveis.imovelId}.jpg" />">
                    </div>
                </div>
                <div class="col s3 offset-6">
                    <div class="card-panel green">
                        <div class="card-title white-text">
                            Código Imóvel:
                        </div>
                        <span class="white-text">
                            <h5>${imoveis.imovelId}</h5>
                        </span>
                    </div>
                </div>
                <div class="col s3 offset-6">
                    <div class="card-panel red">
                        <div class="card-title white-text">
                            Valor:
                        </div>
                        <span class="white-text">
                            <h5>R$ ${imoveis.imovelPreco}</h5>
                        </span>
                    </div>
                </div>
                <div class="col s3 offset-6">
                    <div class="card-panel green">
                        <div class="card-title white-text">
                            Tipo:
                        </div>
                        <span class="white-text">
                            <h5>${imoveis.imovelTipo}</h5>
                        </span>
                    </div>
                </div>
                <div class="col s3 offset-6">
                    <div class="card-panel green">
                        <div class="card-title white-text">
                            Categoria:
                        </div>
                        <span class="white-text">
                            <h5>${imoveis.imovelCategoria}</h5>
                        </span>
                    </div>
                </div>
                <div class="col s6 offset-6">
                    <div class="card-panel green">
                        <div class="card-title white-text">
                            Endereço:
                        </div>
                        <span class="white-text">
                            <h5>${imoveis.imovelEndereco}</h5>
                        </span>
                    </div>
                </div>
                <div class="col s12 offset-6">
                    <div class="card-panel green">
                        <div class="card-title white-text">
                            <h5>Descrição:</h5>
                        </div>
                        <span class="white-text">
                            ${imoveis.imovelDescricao}
                        </span>
                    </div>
                </div>

        </div>

    </div>
</div>

<%@include file="/WEB-INF/views/template/footer.jsp"%>