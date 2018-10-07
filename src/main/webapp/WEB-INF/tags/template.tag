<!DOCTYPE html>
<%@tag description="Template Site tag" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@attribute name="title" fragment="true" %>
<%@ taglib prefix= "security" uri= "http://www.springframework.org/security/tags" %>
<html>
<head>
	<title><jsp:invoke fragment="title"/></title>
	<!-- Meta -->
	<meta charset="utf-8">
	<meta name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Responsive HTML5 website landing page for developers and startups">
	<link rel="shortcut icon" href="/resources/img/favicon.ico">
	<!-- Global CSS -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/resources/bootstrap/js/jquery.cookie.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css" >
	<link rel="stylesheet" href="/resources/font-awesome/css/font-awesome.css" >
	<link href="https://fonts.googleapis.com/css?family=Ubuntu:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="/resources/slick/slick-theme.css"/>
	<script type="text/javascript" src="/resources/slick/slick.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<!--<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">-->
	<link rel="stylesheet" href="/resources/bootstrap/css/styles.css">
	<script type="text/javascript" src="/resources/bootstrap/js/style.js"></script>
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>

<body>
<c:set scope="session" var="good_amount"/>
<security:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin"/>
<div class="wapper">
    <div class="content">
        <div class="page-header">
            <nav class="navbar navbar-expand-lg navbar-light bg-light wrapper_header">
                <a class="navbar-brand" href="#">ОДО "Сервис Техника"</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <form id="logoutForm" method="POST" action="/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </c:if>
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/home">Главная <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">О СКНО</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav" id="logform" >
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <c:if test="${isAdmin}">
                                <li class="nav-item"><a href="/admin" class="nav-link"><i class="fas fa-user"></i> Кабинет</a></li>
                            </c:if>
                            <li class="nav-item"><button class="nav-link" onclick="document.forms['logoutForm'].submit()"><i class="fas fa-sign-out-alt"></i>Выйти</button></li>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal.name == null}">
                            <li class="nav-item"><a href="/login" class="nav-link"><i class="fas fa-sign-in-alt"></i> Войти</a></li>
                            <li class="nav-item"><a href="/registration" class="nav-link"><i class="fas fa-user-plus"></i> Зарегистрироваться</a></li>
                        </c:if>
                    </ul>
                </div>
            </nav>
            <div class="container-fluid wrapper_header">
                <div class="row">
                    <div class="col-md-3">
                        <img class="logotype" src="/resources/img/Intel-Logo.png">
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <img class="icon" src="/resources/img/phone.ico"><p class="lead"> + 375 (17) 288 88 88</p>
                        </div>
                        <div class="row">
                            <p class="lead">Мы Работаем: c 8:00 до 17:00 </p>
                        </div>
                        <div class="row">
                            <p class="lead">Email: 56029@mail.ru <img class="icon" src="/resources/img/email.ico"><p class="lead"></p>
                        </div>
                    </div>
                    <div class="col-md-6" style="float: right">
                        <form class="form-inline my-2 my-lg-0" style="right: 0; float: right;" id="FirstSearch">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" style="padding:0;" type="submit"><img class="icon" src="/resources/img/search.ico"></button>
                        </form>
                        <!--<form id="FirstSearch" class="navbar-form" action="/action_page">
                            <div class="input-group put-right">
                                <input type="text" class="form-control" placeholder="Поиск">
                                <div class="input-group-btn">
                                    <button class="btn btn-default strict" type="submit">
                                        <img class="icon" src="/resources/img/search.ico">
                                    </button>
                                </div>
                            </div>
                        </form>-->
                    </div>
                </div>
            </div>
        </div>
        <nav id="navbar" class="navbar navbar-expand navbar-dark bg-dark">
            <div class="container">
                <div class="collapse navbar-collapse" id="SupportedContent">
                    <ul id="navigator" class="navbar-nav position-absolute">
                        <li class="nav-item active">
                            <a class="nav-link" href="/home">Каталог <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <div id="right_part" class="right" style="display: -webkit-box;">
                        <!--Hidden at start, look at style.js-->
                        <form class="form-inline my-2 my-lg-0 hide" id="SecondSearch">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" id="header_input">
                            <button class="btn btn-outline-success my-2 my-sm-0 " type="submit">Поиск</button>
                        </form>
                        <form id="corzina_form" action="/cart" method="get">
                            <div class="form-group hide">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </div>
                            <button type="submit" class="btn btn-success corzina"><div class="absolute" id="amount">0</div><img class="corzina_icon" src="/resources/img/corzina.png"/></button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        <jsp:doBody/>
    </div>
        <footer class="bg-dark footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <img src="/resources/img/Intel-Logo.png" class="logotype">
                    </div>
                </div>
            </div>
        </footer>
</div>
<script type="text/javascript">

    var field;
    var niAmount;
    var currentWidth;
    var summaryWidth;
    var resize_called=false;
    $($(window).resize(function RS() {
        summaryWidth=$('#navigator').width()+$('#right_part').width();
        currentWidth=$('#SupportedContent').width();
            if(summaryWidth>currentWidth){
                $('#navigator').find('.nav-item').eq(niAmount).addClass('hide');
                niAmount--;
                resize_called=true;
                RS();
                resize_called=false;
            } else if(summaryWidth<(currentWidth+$('#navigator').find('.nav-item').eq(niAmount+1).width())&&!resize_called) {
                $('#navigator').find('.nav-item').eq(niAmount+1).removeClass('hide');
                niAmount++;
			}
    }));
    $('.addCart_btn').click(function () {
        var thisIs=$(this);
        var good_id = thisIs.attr('id').split('-');
        addCart(good_id[1],1);
        thisIs.find('img').addClass('hide');
        thisIs.find('.fa-check').removeClass('hide');
        var check=function() {
            thisIs.find('.fa-check').addClass('hide');
            thisIs.find('img').removeClass('hide');
        };
        setTimeout(check,2000);
    });
    function addCart(id,amount) {
        var totalCount=0;
        var basket = "";
        var basketArray;
        basket = decodeURI($.cookie("basket"));
        if(basket!=='null') {
            basketArray=basket.split(',');
            var amoun=0;
            for(var i=0;i<basketArray.length-1;i++){
                var good=basketArray[i].split(':');
                if(good[0].replace(/\D/g,'')===id){
                    good[1]=parseInt(good[1])+amount;
                    basketArray[i]=good[0]+':'+good[1];
                    basket="";
                    for(var a=0;a<basketArray.length-1;a++){
                        basket+=basketArray[a]+',';
                    }
                    amoun++;
                }
            }
            if(amoun===0) {
                basket+=id+':'+amount+',';
            }
        }else {
            basket+=id+':'+amount+',';
        }
        basketArray=basket.split(',');
        $.cookie("basket",basket,{
            path: '/'
        });
        for(var x=0;x<basketArray.length-1;x++){
            totalCount+=parseInt(basketArray[x].split(':')[1]);
        }
        p.innerHTML=totalCount;
    }
</script>
</body>

	<!-- Javascript -->
	<!--<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>-->
</html> 