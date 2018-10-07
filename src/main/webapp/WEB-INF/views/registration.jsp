<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>

<page:template>
    <jsp:attribute name="title">Регистрация</jsp:attribute>
    <jsp:body>
    <div class="container wrapper">
        <div class="row">
            <div class="col-md-12">
                <h2 class="form-signin-heading">Регистрация Аккаунта</h2>
            </div>
        </div>
        <form:form method="POST" modelAttribute="userForm" class="form-signin">
            <spring:bind path="username">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="username" class="form-control" placeholder="Логин" autofocus="true"></form:input>
                    <form:errors path="username"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="password">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="password" class="form-control" placeholder="Пароль"></form:input>
                    <form:errors path="password"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="confirmPassword">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="confirmPassword" class="form-control"
                                placeholder="Повторите пароль"></form:input>
                    <form:errors path="confirmPassword"></form:errors>
                </div>
            </spring:bind>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Зарегистрироваться!</button>
        </form:form>
    <p style="margin-bottom: 500px"></p>
    </div>
    </jsp:body>
</page:template>