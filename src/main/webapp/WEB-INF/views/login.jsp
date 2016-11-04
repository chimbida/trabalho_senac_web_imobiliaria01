<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<div class="section"></div>
<main>
    <center>
        <div class="section"></div>

        <h5 class="red-text">Por favor, entre com seu usuário e senha!</h5>
        <div class="section"></div>

        <div class="container">
            <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">



                <form class="col s12" name="loginForm" action="<c:url value="/j_spring_security_check" />" method="post">
                    <c:if test="${not empty error}">
                        <div class="error" style="color: #bf360c;">${error}</div>
                    </c:if>

                    <c:if test="${not empty msg}">
                        <div class='row'>
                            <div class='col s12'>
                                    ${msg}
                            </div>
                        </div>
                    </c:if>

                    <div class='row'>
                        <div class='input-field col red-text s12'>
                            <input class='validate' type='text' name='username' id='username' />
                            <label for='username'>Usuário:</label>
                        </div>
                    </div>

                    <div class='row'>
                        <div class='input-field col red-text s12'>
                            <input class='validate' type='password' name='password' id='password' />
                            <label for='password'>Senha:</label>
                        </div>
                    </div>

                    <br />
                    <center>
                        <div class='row'>
                            <input type="submit" value="Enviar" class="btn-flat green white-text">
                        </div>
                    </center>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                </form>
            </div>
        </div>
    </center>

    <div class="section"></div>
    <div class="section"></div>
</main>

<%@include file="/WEB-INF/views/template/footer.jsp"%>
