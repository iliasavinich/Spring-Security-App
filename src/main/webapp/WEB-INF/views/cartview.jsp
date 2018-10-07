<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<page:template>
    <jsp:attribute name="title">Корзина</jsp:attribute>
    <jsp:body>
        <c:set var="col">0</c:set>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Корзина товаров</h2>
                </div>
            </div>
            <form enctype="multipart/form-data" action="/makeOrder?${_csrf.parameterName}=${_csrf.token}" method="post">
                <div class="table-responsive">
                    <table class="cart_table table table-sm">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Товар</th>
                            <th scope="col">Цена</th>
                            <th scope="col">Количество</th>
                            <th scope="col">Сумма</th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="totalPrice">0</c:set>
                        <c:forEach var="Good" items='${Goods}'>
                            <tr>
                                <th scope="row">${col=col+1}</th>
                                <td class="cart_img">
                                    <div style="width: 20rem">
                                        <h3 style="text-align: center">${Good.goods_name}</h3>
                                        <img class="rounded" src="/image/img_id=${Good.good_imgs[0].id}">
                                    </div>
                                </td>
                                <td><div class="good_price">${Good.price}</div> руб.</td>
                                <td><input type="number" pattern="^\d+$" class="form-control total_count"  style="width: 2rem; text-align: center;display:inline-block;padding: 0.5rem 0;" name="goodCount_${col}" value="${Good.count}"/> ед.</td>
                                <td><div class="total_good_price">${Good.count*Good.price}</div> руб.</td>
                                <td class="trash_block" id="${Good.id}"><a class="click_trash"><i class="fas fa-trash-alt"></i></a>
                                    <input class="form-control hide" name="goodId_${col}" value="${Good.id}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div>Итого: <span id="total-cart-summa">${totalPrice}</span> руб.</div>
                <br>
                <button id="order" type="submit" class="btn btn-info">Оформить заказ</button>
            </form>
        </div>
        <script type="text/javascript">
            var total_price=0;
            var total_good_prices=$('.total_good_price');
            for(var i=0;i<total_good_prices.length;i++) {
                total_price+=parseFloat(total_good_prices[i].innerHTML);
            }
            var prev_value=0;
            $('#total-cart-summa')[0].innerHTML=total_price;
            $('.total_count').keyup(function() {
                this.value = this.value.replace (/\D/gi, '0').replace (/^0+/, '0');
                this.value=checkNaN(this.value);
                if(this.value>100){
                    this.value=prev_value;
                }else {
                    var tr=$(this).parent().parent();
                    var total_good_price=$(this).val()*parseFloat(tr.find('.good_price')[0].innerHTML);
                    $('#total-cart-summa')[0].innerHTML=$('#total-cart-summa')[0].innerHTML-parseFloat(tr.find('.total_good_price')[0].innerHTML)+parseFloat(total_good_price);
                    tr.find('.total_good_price')[0].innerHTML=total_good_price;
                    var basket=decodeURI($.cookie("basket"));
                    var basketArray=basket.split(',');
                    var newBasket='';
                    var id=tr.find('.trash_block').attr('id');
                    for(var i=0;i<basketArray.length-1;i++){
                        var good=basketArray[i].split(':');
                        if(good[0].replace(/\D/g,'')!==id){
                            newBasket+=basketArray[i]+",";
                        }else {
                            newBasket+=good[0]+':'+this.value+',';
                            totalCount-=parseInt(good[1]-this.value);
                        }
                    }
                    $.cookie("basket",newBasket,{path: "/"});
                    p.innerHTML=totalCount;
                }
                prev_value=this.value;
            });
            function checkNaN(value) {
                if(value===""){
                    return 0;
                }
                return parseInt(value);
            }
            $('.click_trash').click( function () {
                var parent=$(this).parent();
                var id=parent.attr('id');
                var basket=decodeURI($.cookie("basket"));
                var basketArray=basket.split(',');
                var newBasket='';
                for(var i=0;i<basketArray.length-1;i++){
                    var good=basketArray[i].split(':');
                    if(good[0].replace(/\D/g,'')!==id){
                        newBasket+=basketArray[i]+",";
                    }else {
                        totalCount-=parseInt(good[1]);
                    }
                }
                $.cookie("basket",newBasket,{path: "/"});
                p.innerHTML=totalCount;
                parent.parent().remove();
                }
            );
        </script>
    </jsp:body>
</page:template>