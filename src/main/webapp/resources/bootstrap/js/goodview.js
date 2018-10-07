/**
 * Created by Ilia on 03.03.2018.
 */
var count;
var totalC=$('#GoodAmount');
var scoreUnit=$('#score');
var dic = document.getElementById('dic');
var inc = document.getElementById('inc');
dic.onclick = function () {
    count=totalC.val();
    if(count<=1){
        count=2;
    }
    count--;
    totalC[0].value = count
};
inc.onclick = function () {
    count = totalC.val();
    if (count <= 1) {
        count = 1;
    }
    count++;
    totalC[0].value = count;
};
$('#star').click(function () {
    scoreUnit.removeClass('hide');
    var score=$('.col-md-12').find('input').val();
    scoreUnit.removeClass('good');
    scoreUnit.removeClass('veryGood');
    scoreUnit.removeClass('normal');
    scoreUnit.removeClass('bad');
    scoreUnit.removeClass('veryBad');
    switch(score){
        case '1':
            scoreUnit.addClass('veryBad');
            scoreUnit.empty().text('Очень плохо');
            break;
        case '2':
            scoreUnit.addClass('bad');
            scoreUnit.empty().text('Плохо');
            break;
        case '3':
            scoreUnit.addClass('normal');
            scoreUnit.empty().text('Нормально');
            break;
        case '4':
            scoreUnit.addClass('good');
            scoreUnit.empty().text('Хорошо');
            break;
        case '5':
            scoreUnit.addClass('veryGood');
            scoreUnit.empty().text('Отлично!');
            break;
    }
});
$(function() {

    $('div#star').raty();

});
var input_val;
$(document).on('click', '.edit', function () {
    var parent = $(this).parent();
    input_val = parent.find('a')[0].innerText;
    var a_class = parent.find('a').attr('class');
    parent[0].innerHTML='<input class="form-control" name="name" value="'+input_val+'" ><a id="'+a_class+'" class="save1"><button class="btn btn-primary">Сохранить</button></a><a class="cancel"><button class="btn btn-primary">Отмена</button></a>';
});
$(document).on('click', '.save1', function () {
    var parent=$(this).parent();
    var parent_tr=parent.parent();
    input_val = parent.find('input').val();
    var id = parent_tr.attr('id');
    var url=$(this).attr('id');
    $.ajax({
        type: "get",
        dataType: 'json',
        contentType: 'application/json',
        mimeType: 'application/json',
        url: '/'+url,
        data: ({data: input_val, id: id
        }),
        success: function ( data ) {
            parent[0].innerHTML='<a class="'+url+'">'+input_val+'</a><a class="edit"><i class="fas fa-edit"></i></a>';
        }
    });
});
$(document).on('click', '.cancel', function () {
    var parent=$(this).parent();
    var url=parent.find('a').attr('id');
    parent[0].innerHTML='<a class="'+url+'">'+input_val+'</a><a class="edit"><i class="fas fa-edit"></i></a>';

});