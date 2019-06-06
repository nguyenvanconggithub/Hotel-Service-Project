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
function setPreloadIMG(input, img) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            console.log(e.target.result);

            $(img).attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

function addMoreImage(elem) {
    var moreInputElement =
        '<span class="bg-dark d-flex align-items-center justify-content-center opacity-50-100 position-relative square-150x150 m-2"' +
        'id="image-element-add">' +
        '<img src="images/add_button.PNG" class="square-150x150 position-absolute" id="preload-img-add">' +
        '<input type="file" name="imageList" class="square-150x150 position-absolute opacity-0" id="preload-inp-add"' +
        'onchange="addMoreImage(this)">' +
        '<span class="position-absolute text-danger invisible cursor-pointer font-weight-bold" style="top:0;right:5%" onclick="deleteImage(this)">X</span>'+
        '</span>';
    var spanElement;
    if (elem != undefined) {
        spanElement = $(elem).parent();
        if ($(spanElement).hasClass("previewer")) {
            setPreloadIMG(elem, $(spanElement).children("img"));
        }
        else {
            setPreloadIMG(elem, $(spanElement).children("img"));
            $('#image-element-add').after(moreInputElement);
            $(spanElement).attr("id", "image-element-loaded")
            $(spanElement).removeClass("opacity-50-100");
            $(spanElement).addClass("previewer");
            $(spanElement).children("span").removeClass("invisible");
        }
    }
}

function deleteImage(elem){
    if(elem != undefined){
        $(elem).parent().remove();
    }
}
var star = [1, 1, 1, 1, 1];

$('#oneStar').hover(() => {
    setStarValue(1, 0, 0, 0, 0);
}, () => {
    setStarValue(star[0], star[1], star[2], star[3], star[4]);
})
$('#twoStar').hover(() => {
    setStarValue(1, 1, 0, 0, 0);
}, () => {
    setStarValue(star[0], star[1], star[2], star[3], star[4]);
})
$('#threeStar').hover(() => {
    setStarValue(1, 1, 1, 0, 0);
}, () => {
    setStarValue(star[0], star[1], star[2], star[3], star[4]);
})
$('#fourStar').hover(() => {
    setStarValue(1, 1, 1, 1, 0);
}, () => {
    setStarValue(star[0], star[1], star[2], star[3], star[4]);
})
$('#fiveStar').hover(() => {
    setStarValue(1, 1, 1, 1, 1);
}, () => {
    setStarValue(star[0], star[1], star[2], star[3], star[4]);
})
//ON CLICK set Value
$('#oneStar').click(() => {
    star[0] = 1;
    star[1] = 0;
    star[2] = 0;
    star[3] = 0;
    star[4] = 0;
    setStarValue(1, 0, 0, 0, 0);
    $('#star').val(1);
})
$('#twoStar').click(() => {
    star[0] = 1;
    star[1] = 1;
    star[2] = 0;
    star[3] = 0;
    star[4] = 0;
    setStarValue(1, 1, 0, 0, 0);
    $('#star').val(2);
})
$('#threeStar').click(() => {
    star[0] = 1;
    star[1] = 1;
    star[2] = 1;
    star[3] = 0;
    star[4] = 0;
    setStarValue(1, 1, 1, 0, 0);
    $('#star').val(3);
})
$('#fourStar').click(() => {
    star[0] = 1;
    star[1] = 1;
    star[2] = 1;
    star[3] = 1;
    star[4] = 0;
    setStarValue(1, 1, 1, 1, 0);
    $('#star').val(4);
})
$('#fiveStar').click(() => {
    star[0] = 1;
    star[1] = 1;
    star[2] = 1;
    star[3] = 1;
    star[4] = 1;
    setStarValue(1, 1, 1, 1, 1);
    $('#star').val(5);
})
function setStarValue(one, two, three, four, five) {
    $('#oneStar').removeClass("text-warning");
    $('#twoStar').removeClass("text-warning");
    $('#threeStar').removeClass("text-warning");
    $('#fourStar').removeClass("text-warning");
    $('#fiveStar').removeClass("text-warning");

    if (one == 1)
        $('#oneStar').addClass("text-warning");
    if (two == 1)
        $('#twoStar').addClass("text-warning");
    if (three == 1)
        $('#threeStar').addClass("text-warning");
    if (four == 1)
        $('#fourStar').addClass("text-warning");
    if (five == 1)
        $('#fiveStar').addClass("text-warning");
}