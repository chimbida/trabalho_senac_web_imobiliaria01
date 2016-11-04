<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="index-banner" class="parallax-container">
    <div class="section no-pad-bot">
        <div class="container">
            <br><br>
            <h1 class="header center lime-text text-accent-2">Painel Administrativo</h1>
            <div class="row center">
                <h5 class="header col s12 light lime-text text-accent-1">Bem vindo: <span class="red-text" style="background-color: #4caf50;">${pageContext.request.userPrincipal.name}</span></h5>
            </div>
            <div class="row center">
                <a href="<c:url value="/admin/addImoveis" />" id="download-button" class="tooltipped btn-large waves-effect waves-light green lighten-1" data-delay="50" data-tooltip="Click para adicionar um imóvel">Adicionar</a>
            </div>
        </div>
    </div>
    <div class="parallax"><img src="<c:url value="/resources/background1.jpg" />" alt="Unsplashed background img 1"></div>
</div>




<div class="container">
    <div class="section">
        <div class="row">
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
                    <tbody>
                    <c:forEach items="${imoveis}" var="imoveis">
                        <tr class="tooltipped" data-position="top" data-delay="50" data-tooltip="${imoveis.imovelEndereco}">
                            <td style="width:150px; height:150px; text-align:center; vertical-align:middle"><img style="width:100%;" src="<c:url value="/resources/images/${imoveis.imovelId}.jpg" />"></td>
                            <td>${imoveis.imovelId}</td>
                            <td>${imoveis.imovelTipo} / ${imoveis.imovelCategoria}</td>
                            <td>${imoveis.imovelDescricao}</td>
                            <!-- <td><fmt:setLocale value="pt_BR"/><fmt:formatNumber value="${imoveis.imovelPreco}" type="currency" currencySymbol="R$"/></td> -->
                            <td>R$ ${imoveis.imovelPreco}</td>
                            <td>
                                <a href="<spring:url value="/admin/editarImoveis/${imoveis.imovelId}" />" class="tooltipped waves-effect waves-light btn-floating green" data-delay="50" data-tooltip="Editar"><i class="small material-icons">mode_edit</i></a>
                                <a href="<spring:url value="/admin/deleta/${imoveis.imovelId}" />" class="tooltipped waves-effect waves-light btn-floating red" data-delay="50" data-tooltip="Deletar"><i class="small material-icons">delete</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

        </div>
    </div>
</div>

<%@include file="/WEB-INF/views/template/footer.jsp"%>