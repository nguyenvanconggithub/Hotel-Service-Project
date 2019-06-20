$('#khachChinh').change(
    () => {
        if ($('#khachChinh').is(':checked')) {
            $('[name="guestName"]').each((index, element) => {
                $(element).attr('disabled', true);
                $(element).attr('type', "hidden");
            })
        } else {
            $('[name="guestName"]').each((index, element) => {
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
    //$('#checkinday').val(checkInDay);
    $('#checkoutday').attr('min', checkOutDay);
    //$('#checkoutday').val(checkOutDay);
}
load();
$('#checkinday').change(() => {
    if (new Date($('#checkinday').val()).getTime() > new Date($('#checkoutday').val()).getTime() || $('#checkoutday').val() == "")
        offsetCheckOut();
});

function offsetCheckOut() {
    var date = $('#checkinday').val().split('-');
    date[2] = date[2] * 1 + 1;
    $('#checkoutday').attr('min', date.join('-'));
    $('#checkoutday').val(date.join('-'));
}
/*Add class to Card when hover (shadow)*/
$(document).ready(function () {
    $(".card").hover(
        function () {
            $(this).addClass('shadow border border-primary');
        },
        function () {
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
$('#registerForm').on("submit", () => {
    var pass = $('#matKhau');
    var re_pass = $('#nhapLaiMatKhau');
    var email = $('#email');
    var re_email = $('#nhapLaiEmail');
    var sdt = $('#SDT');
    if (pass.val() != re_pass.val()) {
        alert("Mật Khẩu không khớp nhau !")
        return false;
    }
    if (email.val() != re_email.val()) {
        alert("Email không khớp nhau !")
        return false;
    }
    if (isNaN(sdt.val())) {
        alert("Vui lòng kiểm tra lại Số Điện Thoại");
        return false;
    }
    return true;
});
window.setTimeout(function () {
    $(".alert").fadeTo(500, 0).slideUp(500, function () {
        $(this).remove();
    });
}, 4000);
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
        '<input type="file" name="imageList" class="square-150x150 position-absolute opacity-0" id=""' +
        'onchange="addMoreImage(this)">' +
        '<span class="position-absolute text-danger invisible cursor-pointer font-weight-bold" style="top:0;right:5%" onclick="deleteImage(this)">X</span>' +
        '</span>';
    var spanElement;
    if (elem != undefined) {
        spanElement = $(elem).parent();
        if ($(spanElement).hasClass("previewer")) {
            //get ID Image And remove from database
            setPreloadIMG(elem, $(spanElement).children("img"));
            if (!$('#listRemoveImage').val().includes($(elem).attr("id"))) {
                if ($('#listRemoveImage').val() == "") {
                    $('#listRemoveImage').val($('#listRemoveImage').val() + $(elem).attr("id"));
                } else {
                    $('#listRemoveImage').val($('#listRemoveImage').val() + "-" + $(elem).attr("id"));
                }

            }
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
function deleteImage(elem) {
    if (elem != undefined) {

        if (!$('#listRemoveImage').val().includes($(elem).prev().attr("id"))) {
            if ($('#listRemoveImage').val() == "") {
                $('#listRemoveImage').val($('#listRemoveImage').val() + $(elem).prev().attr("id"));
            } else {
                $('#listRemoveImage').val($('#listRemoveImage').val() + "-" + $(elem).prev().attr("id"));
            }

        }
        $(elem).parent().remove();
    }
}
//Add - down button Room
//Quanlity Rooom
$('#decreaseQuanlityRoom').click(() => {
    if ($('#quanlityRoomInput').val() <= 1) {
        $('#quanlityRoomInput').val(1);
    }
    else {
        $('#quanlityRoomInput').val($('#quanlityRoomInput').val() - 1);
        $('#quanlityRoomSpan').html($('#quanlityRoomInput').val());
    }

});
$('#increaseQuanlityRoom').click(() => {
    if ($('#quanlityRoomInput').val() >= 999) {
        $('#quanlityRoomInput').val(999);
    }
    else {
        $('#quanlityRoomInput').val($('#quanlityRoomInput').val() * 1 + 1);
        $('#quanlityRoomSpan').html($('#quanlityRoomInput').val());

    }
});

$('#decreaseMaxPeople').click(() => {
    if ($('#quanlityMaxPeopleInput').val() <= 1) {
        $('#quanlityMaxPeopleInput').val(1);
    }
    else {
        $('#quanlityMaxPeopleInput').val($('#quanlityMaxPeopleInput').val() - 1);
        $('#quanlityMaxPeopleSpan').html($('#quanlityMaxPeopleInput').val());
    }

});
$('#increaseMaxPeople').click(() => {
    if ($('#quanlityMaxPeopleInput').val() >= 999) {
        $('#quanlityMaxPeopleInput').val(999);
    }
    else {
        $('#quanlityMaxPeopleInput').val($('#quanlityMaxPeopleInput').val() * 1 + 1);
        $('#quanlityMaxPeopleSpan').html($('#quanlityMaxPeopleInput').val());

    }
});

$('#search-guest-increase').click(() => {
    $('#search-guest-value').html($('#search-guest-value').html() * 1 + 1);
    $('#search-guest-input').html($('#search-guest-input').html() * 1 + 1);
})
$('#search-guest-decrease').click(() => {
    if ($('#search-guest-value').html() > 1) {
        $('#search-guest-value').html($('#search-guest-value').html() * 1 - 1);
        $('#search-guest-input').html($('#search-guest-input').html() * 1 - 1);
    }
})
$('#search-room-increase').click(() => {
    $('#search-room-value').html($('#search-room-value').html() * 1 + 1);
    $('#search-room-input').html($('#search-room-input').html() * 1 + 1);
})
$('#search-room-decrease').click(() => {
    if ($('#search-room-value').html() > 1) {
        $('#search-room-value').html($('#search-room-value').html() * 1 - 1);
        $('#search-room-input').html($('#search-room-input').html() * 1 - 1);
    }

})

$("button[id*='decrease-room-']").each((index, elem) => {
    $(elem).click(() => {
        if ($(elem).next("span").html() > 0) {
            $(elem).next("span").html($(elem).next("span").html() - 1);
        }
    })
})

$("button[id*='increase-room-']").each((index, elem) => {
    $(elem).click(() => {
        if ($(elem).prev().prev().html() * 1 < $(elem).prev().html() * 1) {
            $(elem).prev().prev().html($(elem).prev().prev().html() * 1 + 1);
        }
    })
})
function addOrder(elem) {
    var idRoom = $(elem).next().html();
    var numberRoom = $("#numberRoom-" + idRoom).html();
    if (numberRoom == 0) {
        alert("Bạn phải chọn số lượng phòng muốn đặt trước khi chọn phòng !");
        return;
    }
    var roomNameAndType = $("#roomNameAndType-" + idRoom).html();
    var cost = $("#cost-" + idRoom).html();
    cost = cost * numberRoom;
    var totalCostOrder = $('#totalCostOrder').html();
    totalCostOrder = cost + totalCostOrder * 1;
    $('#totalCostOrder').html(totalCostOrder);

    $('#orderListChose').append(
        '<div class="row" id="idRoom-' + idRoom + '">' +
        '<input type="hidden" name="idRoom" value="' + idRoom + '">' +
        '<input type="hidden" name="roomOrder" value="' + numberRoom + '">' +
        '<div class="col-sm-12 col-md-7">' +
        '' + roomNameAndType + '' +
        '</div>' +
        '<div class="col-sm-12 col-md-2">' +
        'Số lượng: ' + numberRoom + '' +
        '</div>' +
        '<div class="col-sm-12 col-md-3">' +
        'Giá: <span id="sumCostRoom-' + idRoom + '">' + cost + '</span> VND' +
        '</div>' +
        '</div>' +
        '<hr />'
    );

    var removeOrderBtn = $(elem).next().next();
    $(elem).removeClass("d-block");
    $(elem).addClass("d-none");
    $(removeOrderBtn).removeClass("d-none");
    $(removeOrderBtn).addClass("d-block");

}

function removeOrder(elem) {
    var idRoom = $(elem).prev().html();
    var totalCostOrder = $('#totalCostOrder').html();
    totalCostOrder = totalCostOrder * 1 - $('#sumCostRoom-' + idRoom).html() * 1;
    $('#totalCostOrder').html(totalCostOrder);
    var queryRoom = '#idRoom-' + idRoom;
    console.log(queryRoom);
    $(queryRoom).next().remove(); //<hr/> tag
    $(queryRoom).remove();

    var addOrderBtn = $(elem).prev().prev();
    $(elem).removeClass("d-block");
    $(elem).addClass("d-none");
    $(addOrderBtn).removeClass("d-none");
    $(addOrderBtn).addClass("d-block");
}
$('#actionSubmitOrder').on("click", () => {
    var orderLength = $('#orderListChose').children().length;
    if (orderLength == 0) {
        alert("Bạn phải chọn ít nhất một phòng mới có thể Đặt Phòng !");
        return false;
    }

})

function removeRoom(elem) {
    var numberOfRoomToRemove = prompt("Bạn muốn xóa bao nhiêu phòng này?");
    while (isNaN(numberOfRoomToRemove)) {
        numberOfRoomToRemove = prompt("Bạn muốn xóa bao nhiêu phòng này?\n<Phải nhập số>");
    }
    var idRoom = $(elem).prev().html();
    var roomCard = $('#roomCardID-' + idRoom);
    var roomOrder = $('#roomOrderID-' + idRoom);
    var roomOrderNumber = $('#roomOrderNumber-' + idRoom).html();
    var roomOrderCost = $('#roomOrderCost-' + idRoom).html()
    var costPerRoom = $('#costPerRoom-' + idRoom).html();
    var periodDay = $('#periodDay').html();

    var totalCost = $('#totalCost').html();
    if (numberOfRoomToRemove >= roomOrderNumber) {
        var confirmed = false;
        if (numberOfRoomToRemove > roomOrderNumber) {
            confirmed = confirm("Bạn chỉ có " + roomOrderNumber + " phòng đã chọn\nBạn có chắc chắn xóa " + roomOrderNumber + " phòng?");
        }
        if (numberOfRoomToRemove == roomOrderNumber) {
            confirmed = confirm("Bạn có chắc chắn xóa " + roomOrderNumber + " phòng?");
        }
        if (confirmed) {
            if ($('#orderFormData').children('.card').length == 1) {
                alert("Bạn không thể xóa hết phòng trong đơn đặt\nBạn phải đặt ít nhất một phòng");
            } else {
                $(roomCard).remove();
                $(roomOrder).next().remove();//<hr/> tag
                $(roomOrder).remove();
                var newTotalCost = totalCost - roomOrderNumber * costPerRoom * periodDay;
                $('#totalCost').html(newTotalCost);
            }

        }
    } else {
        var confirmed = false;
        confirmed = confirm("Bạn có chắc chắn xóa " + numberOfRoomToRemove + " phòng?");
        if (confirmed) {
            var newNumberOfRoom = roomOrderNumber - numberOfRoomToRemove;
            $('#roomOrderNumber-' + idRoom).html(newNumberOfRoom);
            $('#roomCardNumber-' + idRoom).html(newNumberOfRoom);
            $('#orderNumberInput-' + idRoom).val(newNumberOfRoom);
            var newRoomCost = roomOrderCost - costPerRoom * periodDay * numberOfRoomToRemove;
            $('#roomOrderCost-' + idRoom).html(newRoomCost);
            $('#cost-' + idRoom).html(newRoomCost);
            var newTotalCost = totalCost - numberOfRoomToRemove * costPerRoom * periodDay;
            $('#totalCost').html(newTotalCost);
        }
    }

}
var star = [1, 1, 1, 1, 1];
if ($('#star').val() == 1) {
    star[0] = 1;
    star[1] = 0;
    star[2] = 0;
    star[3] = 0;
    star[4] = 0;
    setStarValue(1, 0, 0, 0, 0);
    $('#star').val(1);
}
if ($('#star').val() == 2) {
    star[0] = 1;
    star[1] = 1;
    star[2] = 0;
    star[3] = 0;
    star[4] = 0;
    setStarValue(1, 1, 0, 0, 0);
    $('#star').val(2);
}
if ($('#star').val() == 3) {
    star[0] = 1;
    star[1] = 1;
    star[2] = 1;
    star[3] = 0;
    star[4] = 0;
    setStarValue(1, 1, 1, 0, 0);
    $('#star').val(3);
}
if ($('#star').val() == 4) {
    star[0] = 1;
    star[1] = 1;
    star[2] = 1;
    star[3] = 1;
    star[4] = 0;
    setStarValue(1, 1, 1, 1, 0);
    $('#star').val(4);
}
if ($('#star').val() == 5) {
    star[0] = 1;
    star[1] = 1;
    star[2] = 1;
    star[3] = 1;
    star[4] = 1;
    setStarValue(1, 1, 1, 1, 1);
    $('#star').val(5);
}
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