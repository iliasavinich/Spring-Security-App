<%--
  Created by IntelliJ IDEA.
  User: Ilia
  Date: 27.02.2018
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>
    <jsp:attribute name="title">Регистрация</jsp:attribute>
    <jsp:body>
<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadedFile" action="uploadFile?${_csrf.parameterName}=${_csrf.token}"> //все атрибуты обязательные
    <table>
        <tr>
            <td>Upload File:</td>
            <td><input type="file" name="file" /></td>
            <td style="color: red; font-style: italic;">
                <form:errors path="file" /></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Upload" /></td>
            <td></td>
        </tr>
    </table>
</form:form>

</jsp:body>
    </page:template>
