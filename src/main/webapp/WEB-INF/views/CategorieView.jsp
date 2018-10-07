<%--
  Created by IntelliJ IDEA.
  User: Илья
  Date: 27.03.2018
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<page:template>
    <jsp:attribute name="title">Главная</jsp:attribute>
    <jsp:body>
        <div class="container wrapper">
            <div class="row">
                <div class="col-md-12">
                    <h2 id="${Categorie.id}"><i class="fas fa-certificate"></i> <c:out value="${Categorie.name}"/></h2>
                </div>
            </div>
            <ol class="breadcrumb wrapper">
                <li class="breadcrumb-item"><a href="/home">Каталог</a></li>
                <li class="breadcrumb-item">${Categorie.name}</li>
            </ol>
            <div class="row">
                <c:forEach var="PodCat" items="${Categorie.podCategoriesSet}">
                    <div class="col-md-3 podcatigorie transition">
                        <a href="/categorie/${Categorie.id}/podcat/${PodCat.id}">
                            <div class="photocat">
                                <img class="photo" src="<c:choose>
                                                                    <c:when test="${PodCat.link!=null}">${PodCat.link}</c:when>
                                                                    <c:otherwise>/resources/img/Empty.gif</c:otherwise>
                                                                </c:choose>">
                            </div>
                        </a>
                        <div style="text-align: center;">
                            <a href="/categorie/${PodCat.cat_id}/podcat/${PodCat.id}" class="podCatTitle">${PodCat.podcategorie_name}</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </jsp:body>
</page:template>
