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
            <br><br>
            <nav>
                <div class="nav-wrapper">
                    <form>
                        <div class="input-field green white-text">
                            <input id="search" type="search" required placeholder="Procurar...">
                            <label for="search"><i class="material-icons">search</i></label>
                            <i class="material-icons">close</i>
                        </div>
                    </form>
                </div>

            </nav>
        </div>
    </div>
    <div class="parallax"><img src="<c:url value="/resources/background1.jpg" />" alt="Unsplashed background img 1"></div>
</div>


<div class="container">
    <div class="section">
        <div class="row">
            <div class="col s12">
                <form action="#">
                    <p class="right">
                        <input type="checkbox" id="option" />
                        <label for="option" id="option1">Ordenar pelo Maior Preço</label>
                    </p>
                </form>
                <br><br>
            </div>
                <table class="table centered responsive-table highlight">
                    <thead>
                    <tr>
                        <th data-field="image">Foto</th>
                        <th data-field="id">ID</th>
                        <th data-field="tipo">Tipo / Categoria</th>
                        <th data-field="categoria">Descrição</th>
                        <th data-field="preco">Preço</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="tabela">
                    <c:forEach items="${imoveis}" var="imoveis">
                        <tr onclick="window.location.href = '<spring:url value="/detalheImoveis/${imoveis.imovelId}" />';" class="tooltipped" data-position="top" data-delay="50" data-tooltip="${imoveis.imovelEndereco}">
                            <td style="width:150px; height:150px; text-align:center; vertical-align:middle"><img style="width:100%;" src="<c:url value="/resources/images/${imoveis.imovelId}.jpg" />"></td>
                            <td>${imoveis.imovelId}</td>
                            <td>${imoveis.imovelTipo} / ${imoveis.imovelCategoria}</td>
                            <td>${imoveis.imovelDescricao}</td>
                            <td>R$ ${imoveis.imovelPreco}</td>
                            <td>
                                <a href="<spring:url value="/detalheImoveis/${imoveis.imovelId}" />" class="tooltipped waves-effect waves-light btn-floating green" data-delay="50" data-tooltip="Click para mais detalhes"><i class="small material-icons">info_outline</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
    </div>
</div>



<%@include file="/WEB-INF/views/template/footer.jsp"%>

<script>

    var urlvar = "/api/search/";

    $("#search").keyup(function() {
        $.ajax({
            url: urlvar + $("#search").val(),
            dataType: 'json',
            success: function(resultado) {
                if(resultado.length==0) {
                    var linhas = "<tr>" +
                            "<td</td>" +
                            "<td></td>" +
                            "<td></td>" +
                            "<td></td>" +
                            "<td></td>" +
                            "<td></td>" +
                            "</tr>";
                } else {
                    var linhas;
                    resultado.forEach(function (imovel, idx) {
                        linhas += "<tr onclick=\"window.location.href = '/detalheImoveis/" + imovel.imovelId + "';\" class='tooltipped' data-position='top' data-delay='50' data-tooltip=\"" + imovel.imovelEndereco + "\">" +
                                "<td style=\"width:150px; height:150px; text-align:center; vertical-align:middle\"><img style=\"width:100%;\" src=\"/resources/images/" + imovel.imovelId + ".jpg\"></td>" +
                                "<td>" + imovel.imovelId + "</td>" +
                                "<td>" + imovel.imovelTipo + " / " + imovel.imovelCategoria + "</td>" +
                                "<td>" + imovel.imovelDescricao + "</td>" +
                                "<td> R$ " + imovel.imovelPreco.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1") + "</td>" +
                                "<td><a href=\"/detalheImoveis/" + imovel.imovelId + "\" class=\"tooltipped waves-effect waves-light btn-floating green\" data-delay=\"50\" data-tooltip=\"Click para mais detalhes\"><i class=\"small material-icons\">info_outline</i></a></td>" +
                                "</tr>";
                    });
                };
                $("#tabela").html(linhas);
            }
        });
    });
    function carrega() {
        $.ajax({
            url: urlvar + $("#search").val(),
            dataType: 'json',
            success: function(resultado) {
                var linhas;
                resultado.forEach(function(imovel, idx) {
                    linhas += "<tr onclick=\"window.location.href = '/detalheImoveis/" + imovel.imovelId + "';\" class='tooltipped' data-position='top' data-delay='50' data-tooltip='" + imovel.imovelEndereco + "'>" +
                            "<td style=\"width:150px; height:150px; text-align:center; vertical-align:middle\"><img style=\"width:100%;\" src=\"/resources/images/" + imovel.imovelId + ".jpg\"></td>" +
                            "<td>" + imovel.imovelId + "</td>" +
                            "<td>" + imovel.imovelTipo + " / " + imovel.imovelCategoria + "</td>" +
                            "<td>" + imovel.imovelDescricao + "</td>" +
                            "<td> R$ " + imovel.imovelPreco.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1") + "</td>" +
                            "<td><a href=\"/detalheImoveis/" + imovel.imovelId + "\" class=\"tooltipped waves-effect waves-light btn-floating green\" data-delay=\"50\" data-tooltip=\"Click para mais detalhes\"><i class=\"small material-icons\">info_outline</i></a></td>" +
                            "</tr>";
                });
                $("#tabela").html(linhas);
            }
        });
    };

    function verifica() {
        var elementValues = $.cookie('elementValues');

        if(elementValues){
            Object.keys(elementValues).forEach(function(element) {
                var checked = elementValues[element];
                if(checked) {
                    urlvar = "/api/desc/search/";
                }
                if(!checked) {
                    urlvar = "/api/search/";
                }
            });
        };
        carrega();
    };

    window.onload=verifica();
</script>