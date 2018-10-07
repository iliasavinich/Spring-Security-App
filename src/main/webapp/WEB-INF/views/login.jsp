<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<page:template>
    <jsp:attribute name="title">Вход</jsp:attribute>
    <jsp:body>
        <div class="container wrapper">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="form-heading">Войти</h2>
                </div>
            </div>
            <form method="POST" action="/login" class="form-signin">
                <div class="form-group ${error != null ? 'has-error' : ''}">
                    <span>${message}</span>
                    <div class="form-group">
                        <input name="username" type="text" class="form-control" placeholder="Логин" autofocus="true"/>
                    </div>

                    <div class="form-group">
                        <input name="password" type="password" class="form-control" placeholder="Пароль"/>
                    </div>

                    <span>${error}</span>
                    <div class="form-group">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </div>

                    <button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
                    <h4 class="text-center"><a href="/registration">Создать новый аккаунт</a></h4>
                </div>

            </form>
            <p style="margin-bottom: 500px"></p>
        </div>
    </jsp:body>
</page:template>