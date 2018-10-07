<%--
  Created by IntelliJ IDEA.
  User: Ilia
  Date: 03.02.2018
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<page:template>
    <jsp:attribute name="title">${PodCategorie.podcategorie_name}</jsp:attribute>
    <jsp:body>
        <div class="container wrapper">
            <div class="row">
                <div class="col-md-12">
                        <h2 ><i class="fas fa-certificate"></i> <c:out value="${PodCategorie.podcategorie_name}"/></h2>
                </div>
            </div>
            <ol class="breadcrumb wrapper">
                <li class="breadcrumb-item"><a href="/home">Каталог</a></li>
                <li class="breadcrumb-item"><a href="/categorie/${PodCategorie.cat_id.id}">${PodCategorie.cat_id.name}</a></li>
                <li class="breadcrumb-item active">${PodCategorie.podcategorie_name}</li>
            </ol>
                <div class="centre">
                    <div class="row">
                        <c:forEach var="Good" items="${PodCategorie.goodsList}">
                            <div class="col-md-3 podcatigorie transition">
                                <a href="/good/${Good.id}">
                                    <div class="photocat single-item">
                                        <c:forEach var="Img" items="${Good.good_imgs}">
                                            <div>
                                                <img class="photo" src="<c:choose><c:when test="${Good.id!=null}">/image/img_id=${Img.id}</c:when><c:otherwise>/resources/img/Empty.gif</c:otherwise></c:choose>">
                                            </div>
                                        </c:forEach>
                                    </div>
                                    </a>
                                <div class="row NoMargin"><div class="col-md-6  NoPadding"><p class="price">${Good.price} руб.</p></div>
                                    <div class="col-md-6 NoPadding"><div style="float:right; right: 0;"><button id="good-${Good.id}" class="btn btn-outline-info addCart_btn"><i class="fas fa-check hide icon"></i><img class="icon" src="/resources/img/basket.png"/></button></div></div>
                                </div>
                                <a href="/good/${Good.id}">
                                    <button class="input-basket-submit btn btn-outline-success my-2 my-sm-0 cent px5_wrapper" type="submit"><c:out value="${Good.goods_name}"/></button>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
        </div>
    </jsp:body>
</page:template>