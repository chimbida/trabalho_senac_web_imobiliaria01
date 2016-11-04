<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <title>Imobiliária</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="<c:url value="/resources/css/materialize.css" />" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="<c:url value="/resources/css/style.css" />" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="<c:url value="/resources/css/custon.css" />" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body>

<form:form action="${pageContext.request.contextPath}/sair?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" id="sair_form">
    <input type="hidden" name="submit_sair" />
</form:form>
<nav class="white" role="navigation">
    <div class="nav-wrapper container">
        <a id="logo-container" href="<c:url value="/" />" class="brand-logo green-text">Imobiliária</a>
        <ul id="dropdown1" class="dropdown-content hide-on-med-and-down green">
            <li><a class="white-text" href="<c:url value="/listaImoveis" />">Todos</a></li>
            <li class="divider"></li>
            <li><a class="white-text" href="<c:url value="/listaVenda" />">Venda</a></li>
            <li><a class="white-text" href="<c:url value="/listaAluguel" />">Aluguel</a></li>
        </ul>
        <ul class="right hide-on-med-and-down">
            <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Imóveis<i class="material-icons right">arrow_drop_down</i></a></li>
            <sec:authorize access="hasRole('ROLE_USER')">
                <li><a href="<c:url value="/admin" />">Admin</a></li>
            </sec:authorize>
            <sec:authorize access="!hasRole('ROLE_USER')">
                <li><a class="btn green" href="<c:url value="/login" />">Entrar</a></li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER')">
                <c:url value="/sair" var="logoutUrl" />
                <li><a class="btn green" href="#" onClick="document.getElementById('sair_form').submit();">Sair</a></li>
            </sec:authorize>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <li class="no-padding">
                <ul class="collapsible collapsible-accordion">
                    <li>
                        <a class="collapsible-header center">Imóveis</a>
                        <div class="collapsible-body">
                            <ul>
                                <li><a href="<c:url value="/listaImoveis" />">Todos</a></li>
                                <li><a href="<c:url value="/listaVenda" />">Venda</a></li>
                                <li><a href="<c:url value="/listaAluguel" />">Aluguel</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </li>
            <sec:authorize access="hasRole('ROLE_USER')">
                <li><a class="center" href="<c:url value="/admin" />">Admin</a></li>
            </sec:authorize>
            <sec:authorize access="!hasRole('ROLE_USER')">
                <li><a class="btn green center" href="<c:url value="/login" />">Entrar</a></li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER')">
                <c:url value="/sair" var="logoutUrl" />
                <li><a class="btn green center" href="#" onClick="document.getElementById('sair_form').submit();">Sair</a></li>
            </sec:authorize>
        </ul>
        <a href="<c:url value="/" />" data-activates="nav-mobile" class="button-collapse green-text"><i class="material-icons">menu</i></a>
    </div>
</nav>