<%--
  Created by IntelliJ IDEA.
  User: Ilia
  Date: 03.02.2018
  Time: 16:31
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
                <c:forEach var="Cat" items="${Categories}">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 id="${Cat.id}"><i class="fas fa-certificate"></i> <c:out value="${Cat.name}"/></h2>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="PodCat" items="${Cat.podCategoriesSet}">
                            <div class="col-md-3 podcatigorie transition">
                                <a href="/categorie/${Cat.id}/podcat/${PodCat.id}">
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
                </c:forEach>
                <div class="row">
                    <div class="col-md-12">
                        <h2><i class="fa fa-thumbs-up" aria-hidden="true"></i> Рекомендуемые товары</h2>
                    </div>
                    <c:forEach var="Good" items="${Goods}">
                        <div class="col-md-3 podcatigorie transition mauto">
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
                <div class="row">
                    <div class="col-md-12">
                        <h2>О Нас</h2>
                    </div>
                        <p>Общественное объединение «Белорусская республиканская пионерская организация» – одно из самых массовых детских объединений не только в нашей стране, но и на постсоветском пространстве. С каждым днем наша организация пополняется активными, инициативными, креативными, и талантливыми ребятами.
О своей самостоятельной деятельности пионерская организация нашей страны заявила 13 сентября 1990 года на Х Республиканском Слете пионеров. В этот день был принят Устав, Девиз и Законы белорусских пионеров. Дату 13 сентября принято считать Днем самоопределения, Днем рождения Белорусской республиканской пионерской организации.
Белорусская республиканская пионерская организация – это самодеятельное, добровольное общественное объединение детей, подростков и взрослых, которое представляет и защищает интересы и права своих членов.
Республиканская – пионерская организация действует по всей стране, на территории районов, городов, шести областных центров и города Минска, в каждом учреждении образования.
Общественная – неполитическая организация. Обновленная детская организация взаимодействует на партнерских основах с детскими и молодежными общественными организациями, государственными учреждениями и ведомствами, родителями, общественностью. Членам организации нравится помогать другим и заниматься полезной деятельностью.
Самодеятельная – организация, в которой пионеры действуют сами, решительно, активно, как настоящие хозяева своих пионерских коллективов, под руководством своих старших друзей – вожатых, лидеров решают сообща все пионерские дела.
Добровольная – дети вступают в ряды организации по собственному желанию, без принуждения, а те, кто младше 14 лет – с согласия родителей.</p>
<p>Детская – пионерская организация – организация детей и подростков. И, чем больше в отряде будет интересных и полезных дел, веселых игр, пылающих костров, ярких легенд, звонких песен, увлекательных походов по родному краю незабываемых встреч с ветеранами, тем полнее и ярче будет пионерская жизнь.
    Цель ОО «БРПО» – помочь каждому пионеру стать Гражданином, своими делами и поступками приносить пользу себе, семье, Родине.</p>
                        <p>ОО «БРПО» является правопреемником Всесоюзной пионерской организации, Белорусской республиканской пионерской организации имени В.И.Ленина и субъектом (входит в состав): Международного Союза детских общественных объединений «Союз Пионерских Организаций – Федерация Детских Организаций» и Пионерского содружества стран независимых государств.
                            Мы сумели сохранить самое ценное – образ и дух организации, ее лучшие традиции воспитания и вечные ценности: преданность Родине, верность идеалам Добра и Справедливости!</p>
                </div>
            </div>
        </jsp:body>
    </page:template>
