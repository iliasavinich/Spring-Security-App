<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<page:template>
    <jsp:attribute name="title">Admin</jsp:attribute>
    <jsp:body>
        <script type="text/javascript">
            $(function () {
                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");
                $(document).ajaxSend(function(e, xhr, options) {
                    xhr.setRequestHeader(header, token);
                });
            });
            function error(data) {
                alert("Error sending message");
            }
            function getPodcategories(podcatString,id) {
                console.log($(podcatString));
                $(podcatString).removeClass('hide');
                var answer='';
                $.ajax({
                    type: "get",
                    dataType: 'json',
                    contentType: 'application/json',
                    mimeType: 'application/json',
                    url: "categorie_podcat",
                    data: ({
                        cat_id: id
                    }),
                    success: function ( data ) {
                        $(podcatString).find('select').empty().html("Загрузка...");
                        var a;
                        answer='<option value=0>Выберите подкатегорию</option>';
                        data.forEach(function (a) {
                            answer=''+answer+'<option value='+a[1]+'>'+a[0]+'</option>'
                        });
                        $(podcatString).find('select').html(answer);
                    },
                    error: error
                });
            }
            function getGoods(podcatString,id) {
                console.log($(podcatString));
                $(podcatString).removeClass('hide');
                var answer='';
                $.ajax({
                    type: "get",
                    dataType: 'json',
                    contentType: 'application/json',
                    mimeType: 'application/json',
                    url: "podcategorie_good",
                    data: ({
                        podcat_id: id
                    }),
                    success: function ( data ) {
                        $(podcatString).find('select').empty().html("Загрузка...");
                        var a;
                        answer='<option value=0>Выберите товар</option>';
                        data.forEach(function (a) {
                            answer=''+answer+'<option value='+a[1]+'>'+a[0]+'</option>'
                        });
                        $(podcatString).find('select').html(answer);
                    },
                    error: error
                });
            }
            var photoAmount=0;
            var charAmount=0;
            function remoweH(data,thi) {
                if($(thi).val()!=='0'&&$(thi).val()!=='') {$(data).removeClass('hide');} else {
                    $(data).find('.col-md-6').find('input').val().text('');
                    $(data).addClass('hide');
                }
            }
        </script>
        <div class="container wrapper">
            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="margin-top: 5rem">
                <li class="nav-item">
                    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-redacting" role="tab" aria-controls="pills-home" aria-selected="true">Редактирование</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-orders" role="tab" aria-controls="pills-profile" aria-selected="false">Заказы</a>
                </li>

            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-redacting" role="tabpanel" aria-labelledby="pills-home-tab">
                    <div class="row">
                        <div class="col-md-12">
                            <h2> Редактирование</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <div class="list-group" id="list-tab" role="tablist">
                                <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Добавить категорию</a>
                                <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Добавить подкатегорию</a>
                                <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Добавить товар</a>
                                <a class="list-group-item list-group-item-action" id="del-categorie-list" data-toggle="list" href="#del-categorie" role="tab" aria-controls="settings">Удалить категорию</a>
                                <a class="list-group-item list-group-item-action" id="del-podcategorie-list" data-toggle="list" href="#del-podcategorie" role="tab" aria-controls="settings">Удалить подкатегорию</a>
                                <a class="list-group-item list-group-item-action" id="del-good-list" data-toggle="list" href="#del-good" role="tab" aria-controls="settings">Удалить товар</a>
                            </div>
                        </div>
                        <div class="col-8 redact">
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
                                    <div class="row">
                                        <div class="col-md-12" style="margin-top: 0;">
                                            <h2>Добавление категории</h2>
                                        </div>
                                    </div>
                                    <form:form method="post" modelAttribute="Categorie" action="add_categorie">
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Категория</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" name="name" placeholder="Название новой категории" required data-validation-required-message="Введите название категории.">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-10">
                                                <button type="submit" class="btn btn-primary">Добавить</button>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                                <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
                                    <div class="row">
                                        <div class="col-md-12" style="margin-top: 0;">
                                            <h2>Добавление подкатегории</h2>
                                        </div>
                                    </div>
                                    <form:form method="post" enctype="multipart/form-data" modelAttribute="PodCategorie" action="add_podcategorie?${_csrf.parameterName}=${_csrf.token}">
                                        <div class="form-group row">
                                            <label for="choose" class="col-sm-2 col-form-label">Категория</label>
                                            <div class="col-md-6">
                                                <select id="choose" name="cat_id.id" class="form-control">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Подкатегория</label>
                                            <div class="col-md-6">
                                                <input class="form-control" name="podcategorie_name" placeholder="Название новой подкатегории" required data-validation-required-message="Введите название подкатегории.">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Ссылка</label>
                                            <div class="col-md-6">
                                                <input class="form-control" name="link" placeholder="Ссылка на фотографию">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-10">
                                                <button type="submit" class="btn btn-primary">Добавить</button>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                                <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
                                    <div class="row">
                                        <div class="col-md-12" style="margin-top: 0;">
                                            <h2>Добавление товара</h2>
                                        </div>
                                    </div>
                                    <form:form method="post" modelAttribute="Good" enctype="multipart/form-data"  action="add_good?${_csrf.parameterName}=${_csrf.token}">
                                        <div class="form-group row">
                                            <label for="chooseCat" class="col-sm-2 col-form-label">Категория</label>
                                            <div class="col-md-6">
                                                <select id="chooseCat" onchange="getPodcategories('#G_podcategorie',this.value)" class="form-control">
                                                    <option value="0">Выберите категорию</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row hide" id="G_podcategorie">
                                            <label for="choosePodcat" class="col-sm-2 col-form-label">Подкатегория</label>
                                            <div class="col-md-6">
                                                <select id="choosePodcat" onchange="remoweH('#good','#choosePodcat')" name="podcat_id.id" class="form-control">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row hide" id="good">
                                            <label class="col-sm-2 col-form-label">Товар</label>
                                            <div class="col-md-6">
                                                <input id="chooseGood" class="form-control" name="goods_name" onkeyup="remoweH('#link','#chooseGood')" placeholder="Имя товара"/>
                                            </div>
                                        </div>
                                        <div class="form-group hide photoblock" id="link">
                                            <div class="row">
                                                <label class="col-sm-2 col-form-label">Фото</label>
                                                <div class="col-md-6">
                                                    <input id="chooseLink" class="form-control" type="file" name="file[0].file" onchange="remoweH('#chars','#chooseLink')" placeholder="Выберите фотографию"/>
                                                </div>
                                                <div class="col-md-2">
                                                    <a onclick="addPhoto()" id="addPhoto"><button type="button" style="font-size: 20px; font-weight: 500;" class="btn btn-info">+</button></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group hide charblock" id="chars">
                                            <div class="row">
                                                <h3>Характеристики</h3>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-2 col-form-label">Название</label>
                                                <div class="col-md-3">
                                                    <input id="chooseCharName" class="form-control" type="text" name="good_chars[0].char_name" onchange="remoweH('#price','#chooseCharValue')" placeholder="Введите название характеристики"/>
                                                </div>
                                                <label class="col-sm-2 col-form-label">Характеристика</label>
                                                <div class="col-md-3">
                                                    <input id="chooseCharValue" class="form-control" type="text" name="good_chars[0].char_value" onchange="remoweH('#price','#chooseCharName')" placeholder="Введите характеристику"/>
                                                </div>
                                                <div class="col-md-2">
                                                    <a onclick="addChar()" id="addChar"><button type="button" style="font-size: 20px; font-weight: 500;" class="btn btn-info">+</button></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row hide" id="price">
                                            <label class="col-sm-2 col-form-label">Цена</label>
                                            <div class="col-md-6">
                                                <input id="priceGood" class="form-control" name="price" onkeyup="remoweH('.buton','#priceGood')" placeholder="Укажите цену товара"/>
                                            </div>
                                        </div>
                                        <div class="form-group row hide buton">
                                            <div class="col-sm-10">
                                                <button type="submit" class="btn btn-primary">Добавить</button>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                                <div class="tab-pane fade" id="del-categorie" role="tabpanel" aria-labelledby="list-settings-list">
                                    <form:form method="post" modelAttribute="Categorie" action="dell_categorie">
                                        <div class="row">
                                            <div class="col-md-12" style="margin-top: 0;">
                                                <h2>Удалить категорию</h2>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="chooseDelCat" class="col-sm-2 col-form-label">Категория</label>
                                            <div class="col-md-6">
                                                <select id="chooseDelCat" name="id" class="form-control">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-10">
                                                <button type="submit" class="btn btn-primary">Удалить</button>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                                <div class="tab-pane fade" id="del-podcategorie" role="tabpanel" aria-labelledby="list-settings-list">
                                    <form:form method="post" modelAttribute="PodCategorie" action="dell_podcategorie">
                                        <div class="row">
                                            <div class="col-md-12" style="margin-top: 0;">
                                                <h2>Удалить подкатегорию</h2>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="chooseDelPCat" class="col-sm-2 col-form-label">Категория</label>
                                            <div class="col-md-6">
                                                <select id="chooseDelPCat" onchange="getPodcategories('#D_podcategorie',this.value)" name="cat_id.id" class="form-control">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row hide" id="D_podcategorie">
                                            <label for="chooseDelPodCat" class="col-sm-2 col-form-label">Подкатегория</label>
                                            <div class="col-md-6">
                                                <select id="chooseDelPodCat" name="id" class="form-control">
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-10">
                                                <button type="submit" class="btn btn-primary">Удалить</button>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                                <div class="tab-pane fade" id="del-good" role="tabpanel" aria-labelledby="list-settings-list">
                                    <form:form method="post" modelAttribute="Good" action="dell_good">
                                        <div class="row">
                                            <div class="col-md-12" style="margin-top: 0;">
                                                <h2>Удалить товар</h2>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Категория</label>
                                            <div class="col-md-6">
                                                <select onchange="getPodcategories('#_podcategorie',this.value)" class="form-control chooseCat">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row hide" id="_podcategorie">
                                            <label class="col-sm-2 col-form-label">Подкатегория</label>
                                            <div class="col-md-6">
                                                <select onchange="getGoods('#Del_goods',this.value)" class="form-control">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row hide" id="Del_goods">
                                            <label class="col-sm-2 col-form-label">Товар</label>
                                            <div class="col-md-6">
                                                <select name="id" class="form-control">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-10">
                                                <button type="submit" class="btn btn-primary">Удалить</button>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:set var="col">0</c:set>
                <div class="tab-pane fade" id="pills-orders" role="tabpanel" aria-labelledby="pills-profile-tab">
                    <table class="table table-striped table-inverse">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Пользователь</th>
                            <th>Товар</th>
                            <th>Количество</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="firstGood">0</c:set>
                        <c:forEach var="Order" items="${Orders}">
                            <c:forEach var="OrderList" items="${Order.order}">
                                <tr>
                                    <c:choose>
                                        <c:when test="${firstGood==0}">
                                            <th scope="row">${col=col+1}</th>
                                            <td>${Order.user.username}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <th scope="row"></th>
                                            <td></td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td><a href="/good/${OrderList.good.id}">${OrderList.good.goods_name}</a></td>
                                    <td>${OrderList.count}</td>
                                </tr>
                                <a class="hide">${firstGood=1}</a>
                            </c:forEach>
                            <a class="hide">${firstGood=0}</a>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script type="text/javascript">
                const price='#price';
                const chooseCharValue='#chooseCharValue';
                const chooseCharName='#chooseCharName';
                function addPhoto(){
                    photoAmount++;
                    $('#addPhoto').remove();
                    var inner=$('.photoblock')[0].innerHTML;
                    $('.photoblock')[0].innerHTML=''+inner+'<div class="row"> <label class="col-sm-2 col-form-label"></label> <div class="col-md-6"><input class="form-control" type="file" name="file['+photoAmount+'].file" placeholder="Выберите фотографию"/> </div> <div class="col-md-2"> <a onclick="addPhoto()" id="addPhoto"><button style="font-size: 20px; font-weight: 500;" class="btn btn-info">+</button></a> </div> </div>';

                }
                function addChar(){
                    charAmount++;
                    $('#addChar').remove();
                    var inner=$('.charblock')[0].innerHTML;
                    $('.charblock')[0].innerHTML=''+inner+'<div class="row"><label class="col-sm-2 col-form-label">Название</label> <div class="col-md-3"> <input id="chooseCharName" class="form-control" type="text" name="good_chars['+charAmount+'].char_name" onchange="remoweH('+price+','+chooseCharValue+')" placeholder="Введите название характеристики"/> </div> <label class="col-sm-2 col-form-label">Характеристика</label> <div class="col-md-3"> <input id="chooseCharValue" class="form-control" type="text" name="good_chars['+charAmount+'].char_value" onchange="remoweH('+price+','+chooseCharName+')" placeholder="Введите значение"/> </div> <div class="col-md-2"> <a onclick="addChar()" id="addChar"><button type="button" style="font-size: 20px; font-weight: 500;" class="btn btn-info">+</button></a> </div></div>'
                }
        </script>
    </jsp:body>
</page:template>