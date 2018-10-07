<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 22.02.2018
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<page:template>
    <jsp:attribute name="title">Товар</jsp:attribute>
    <jsp:body>
        <security:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin"/>
        <script src="/resources/raty-2.8.0/lib/jquery.raty.js"></script>
        <link rel="stylesheet" href="/resources/raty-2.8.0/lib/jquery.raty.css">
        <div class="container wrapper">
            <div class="row">
                <div class="col-md-8 bg-white good_slider">
                    <div class="slider-for">
                        <c:forEach var="Img" items="${Good.good_imgs}">
                            <div>
                                <img src="/image/img_id=${Img.id}">
                            </div>
                        </c:forEach>
                    </div>
                    <c:if test="${Good.good_imgs.size()>1}">
                        <div class="slider-nav slider">
                            <c:forEach var="Img" items="${Good.good_imgs}">
                                <div>
                                    <img src="/image/img_id=${Img.id}">
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
                <div class="col-md-4">
                    <div class="priceblock" style="margin-top: 2rem;margin-bottom: 1rem">
                        <div class="row"><h4 class="mauto">${Good.goods_name}</h4></div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mauto">
                                    <p>
                                        <span style="text-align:left; font-size: 2rem; margin-left: 0.5rem">Цена:</span>
                                        <span class="right"><span class="pricegood ">${Good.price}</span> руб.</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="padding:0 15px;margin-bottom:40px;">
                            <div class="input-group mb-3" style="width: 32% !important;margin: 8px 3px !important;">
                                <div class="input-group-prepend">
                                    <button id="dic" class="btn btn-outline-secondary" type="button">-</button>
                                </div>
                                <input onkeyup="this.value = this.value.replace (/\D/gi, '').replace (/^0+/, ''); if(this.value===''){this.value=1}" style="flex: 1" type="text" id="GoodAmount" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1" value="1" >
                                <div class="input-group-append">
                                    <button id="inc" class="btn btn-outline-secondary" type="button">+</button>
                                </div>
                            </div>
                            <button id="addgood" type="button" class="btn">Добавить в корзину <img class="icon" src="/resources/img/basket.png"/></button>
                        </div>
                    </div>
                    <div class="priceblock" style="margin-top: 30px">
                        <div class="row">
                            <div class="col-md-12 NoMargin">
                                <div class="mauto">
                                    <p>
                                        <span style="text-align:left; font-size: 1.5rem; margin-left: 5px">Средняя оценка:</span>
                                        <span class="right" style="font-size: 1.7rem;">4.77<i class="far fa-star"></i></span>
                                    </p>
                                </div>
                                <span style="font-size: 1.3rem">Насколько вам нравится товар ?</span>
                                <div style="margin: 1.3rem 0;">
                                    <div id="star"></div>
                                    <button type="button" class="btn btn-sm hide" id="score" style="font-size: 1.3rem"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="bg-white" style="width: 100%; margin-top: 3rem;">
                    <ul class="nav nav-tabs" style="background: #f5f5f5" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link nav-font bg-dark first-child1 active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Описание</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-font bg-dark" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Характеристики</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-font bg-dark" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Способы доставки и оплаты</a>
                        </li>
                    </ul>
                    <div class="col-md-12">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab"><h2>Описание</h2></div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <div class="box">
                                    <table class="table">
                                        <tbody>
                                        <c:if test="${Good.good_chars.size()!=0}">
                                            <c:forEach var="Char" items="${Good.good_chars}">
                                                <tr id="${Char.id}">
                                                    <td class="charName"><a class="char_name">${Char.char_name}</a> <c:if test="${isAdmin}"><a class="edit"><i class="fas fa-edit"></i></a></c:if></td>
                                                    <td class="char right"><a class="char_value">${Char.char_value}</a> <c:if test="${isAdmin}"><a class="edit"><i class="fas fa-edit"></i></a></c:if></td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td class="charName"></td>
                                                <td class="char right"></td>
                                            </tr>
                                        </c:if>
                                        </tbody>
                                    </table>
                                    <c:if test="${isAdmin}">
                                        <div id="addChar" class="text-center">
                                            <img onclick="alert(1)" src="/resources/img/plus%20icon.png"/>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab"><h2>Способы доставки и оплаты</h2></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <p style="margin-bottom: 600px"></p>

        <div></div>
        <script type="text/javascript" src="/resources/bootstrap/js/goodview.js"> </script>
    </jsp:body>
</page:template>
