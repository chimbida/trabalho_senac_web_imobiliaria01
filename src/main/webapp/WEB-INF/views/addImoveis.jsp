<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <div class="section">

        <div class="row center">
            <h5 class="header col s12 light green-text">Adicionar Imovel</h5>
        </div>

        <div class="row">
            <form:form action="${pageContext.request.contextPath}/admin/addImoveis?${_csrf.parameterName}=${_csrf.token}" method="post" commandName="imoveis" enctype="multipart/form-data">



                <div class="input-field col s12">
                    <i class="material-icons prefix">description</i>
                    <form:textarea path="imovelDescricao" id="descricao" type="file" class="materialize-textarea" />
                    <label for="descricao">Descrição</label>
                </div>

                <div class="file-field input-field col s12">
                    <div class="btn green lighten-1">
                        <spam><i class="material-icons">perm_media</i></spam>
                        <form:input path="imovelImagem" type="file" multiple="true" />
                    </div>
                    <div class="file-path-wrapper">
                        <form:input path="imovelImagem" class="file-path validate" type="text" placeholder="Upload de imagem do Imovel" />
                    </div>
                </div>

                <div class="input-field col s6">
                    <i class="material-icons prefix">location_on</i>
                    <form:input path="imovelEndereco" id="endereco" class="validate" />
                    <label for="endereco">Endereço</label><form:errors path="imovelEndereco" cssStyle="color: #FF1744" />
                </div>

                <div class="input-field col s6">
                    <i class="material-icons prefix">shopping_cart</i>
                    <form:input path="imovelPreco" id="preco" class="validate" />
                    <label for="preco">Preço</label><form:errors path="imovelPreco" cssStyle="color: #FF1744" />
                </div>


                <div class="input-field col s6">
                    <i class="material-icons prefix">toc</i>
                    <form:select path="imovelCategoria" id="categoria">
                        <form:option value="---" disabled="true">Escolha uma Categoria</form:option>
                        <form:option value="Casa">Casa</form:option>
                        <form:option value="Apartamento">Apartamento</form:option>
                        <form:option value="Comercial">Comercial</form:option>
                        <form:option value="Terreno">Terreno</form:option>
                    </form:select>
                    <label for="categoria">Categoria</label>
                </div>

                <div class="input-field col s6">
                    <i class="material-icons prefix">toc</i>
                    <form:select path="imovelTipo" id="tipo">
                        <form:option value="---" disabled="true" title="Escolha uma Tipo" />
                        <form:option value="Aluguel" title="Aluguel" />
                        <form:option value="Venda" title="Venda" />
                    </form:select>
                    <label for="tipo">Tipo Operação</label>
                </div>


                <div class="input-field col s12">
                    <a href="<c:url value="/admin" />" id="cancelar" class="btn green lighten-1">Cancelar</a>
                    <input type="submit" value="Salvar" class="btn green lighten-1">
                </div>
            </form:form>


        </div>

    </div>
</div>

<%@include file="/WEB-INF/views/template/footer.jsp"%>