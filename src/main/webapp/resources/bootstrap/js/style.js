$(document).ready(function() {
    var previousScroll = 0,
        navBarOrgOffset = $('#navbar').offset().top,
        SearchOffset = $('#FirstSearch').offset().top;

    $(window).scroll(function() {
        var currentScroll = $(this).scrollTop();
        if(currentScroll > SearchOffset) {
            $('#FirstSearch').addClass('fixed');
        } else {
            $('#FirstSearch').removeClass('fixed');
        }
        if(currentScroll > navBarOrgOffset) {
            $('#SecondSearch').removeClass('hide');
            $('#navbar').addClass('fixed');

        } else {
             $('#navbar').removeClass('fixed');
             $('#SecondSearch').addClass('hide');
        }
        previousScroll = currentScroll;
    });
     $('.slider-for').slick({
         slidesToShow: 1,
         slidesToScroll: 1,
         arrows: false,
         fade: true,
         asNavFor: '.slider-nav'
     });
     $('.slider-nav').slick({
         slidesToShow: 3,
         slidesToScroll: 1,
         asNavFor: '.slider-for',
         dots: true,
         centerMode: true,
         focusOnSelect: true,
         autoplay: true,
         autoplaySpeed: 2000
     });
     $('.single-item').slick();
    $.ajax({
        type: "get",
        dataType: 'json',
        contentType: 'application/json',
        mimeType: 'application/json',
        url: "/loadCategories",
        data: ({odin:1}),
        success: function ( data ) {
            var answer;
            if($('#chooseCat')[0]!==undefined) {
                answer=$('#chooseCat')[0].innerHTML;
                data.forEach(function (a) {
                    answer=''+answer+'<option value="'+a[1]+'">'+a[0]+'</option>';
                });
                $('#chooseCat')[0].innerHTML=answer;
                $('.chooseCat')[0].innerHTML=answer;
                $('#choose')[0].innerHTML=answer;
                $('#chooseDelCat')[0].innerHTML=answer;
                $('#chooseDelPCat')[0].innerHTML=answer;
                answer=null;
            }
            var otvet=$('#navigator')[0].innerHTML;
            data.forEach(function (a) {
                otvet=''+otvet+'<li class="nav-item"><a class="nav-link" href="/categorie/'+a[1]+'">'+a[0]+'</a></li>';
            });
            $('#navigator')[0].innerHTML=otvet;
            niAmount=$('#navigator').find('.nav-item').length-1;
            summaryWidth=$('#navigator').width()+$('#right_part').width();
            field=$('#navigator').width()/niAmount;
        }
    });
    window.p = document.getElementById('amount');
    window.totalCount=0;
    var basket = decodeURI($.cookie("basket"));
    console.log(basket);
    if($.cookie("basket")) {
        var basketArray = basket.split(',');
        for (var x = 0; x < basketArray.length - 1; x++) {
            totalCount += parseInt(basketArray[x].split(':')[1]);
        }
        p.innerHTML = totalCount;
    }
 });
