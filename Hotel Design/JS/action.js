$('#khachChinh').change(
    () => {
        if ($('#khachChinh').is(':checked')) {
            $('[name="tenKhach"]').each((index, element) => {
                $(element).attr('disabled', true);
                $(element).attr('type', "hidden");
            })
        } else {
            $('[name="tenKhach"]').each((index, element) => {
                $(element).attr('disabled', false);
                $(element).attr('type', "text");
            })
        }
    }
);

function load() {
    var today = new Date();
    var tomorow = new Date();
    tomorow.setDate(today.getDate() + 1);
    var inday = [today.getFullYear(), '0' + (today.getMonth() * 1 + 1), today.getDate()];
    var outday = [tomorow.getFullYear(), '0' + (tomorow.getMonth() * 1 + 1), tomorow.getDate()];
    var checkInDay = inday.join('-');
    var checkOutDay = outday.join('-');
    $('#checkinday').attr('min', checkInDay);
    $('#checkinday').val(checkInDay);
    $('#checkoutday').attr('min', checkOutDay);
    $('#checkoutday').val(checkOutDay);
}
load();
$('#checkinday').change(() => {
    offsetCheckOut();
});

function offsetCheckOut() {
    var date = $('#checkinday').val().split('-');
    date[2] = date[2] * 1 + 1;
    $('#checkoutday').attr('min', date.join('-'));
    $('#checkoutday').val(date.join('-'));
}
/*Add class to Card when hover (shadow)*/
$(document).ready(function() {
    $(".card").hover(
        function() {
            $(this).addClass('shadow border border-primary');
        },
        function() {
            $(this).removeClass('shadow border border-primary');
        }
    );

    var web_name_count = 0;
    var web_sologan_count = 0;
    var web_name = 'KhachSanTotNhat.com';
    var web_sologan = "Khách sạn mơ ước trong tầm tay";
    var speed = 100; /* The speed/duration of the effect in milliseconds */

    function typeWebName() {
        if (web_name_count < web_name.length) {
            //document.getElementById("web-name").innerHTML += txt.charAt(i);
            //i++;
            $("#web-name").html($("#web-name").html() + web_name.charAt(web_name_count++));
            setTimeout(typeWebName, speed);
        }
        if (web_name.length == web_name_count) {
            setTimeout(typeWebSologan, 500);
            web_name_count = undefined;
        }
    }

    function typeWebSologan() {
        if (web_sologan_count < web_sologan.length) {
            $("#web-sologan").html($("#web-sologan").html() + web_sologan.charAt(web_sologan_count++));
            setTimeout(typeWebSologan, speed / 2);
        }
    }
    typeWebName();

});