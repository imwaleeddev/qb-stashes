var cart = [];
var total = 0;
var PlayerData

window.addEventListener('message', function (event) {
    let action = event.data.action
    if (action === 'show') {
        cart = [];
        total = 0;
        PlayerData = event.data.PlayerData
        var Items = event.data.Items
        $('.app-store').empty()
        for (let i = 0; i < event.data.items.length; i++) {
            var item = event.data.items[i];
            var sharedITem = Items[item.name];
            if (item && item.name && sharedITem) {
                var img = `nui://qb-inventory/html/images/${sharedITem.image}`
                if (PlayerData.job.grade.level >= item.grades[0] && PlayerData.job.grade.level <= item.grades[1] && img) {
                    $('.app-store').append(`<div class="box-itmes" item="${item.name}" label="${sharedITem.label}" price="${item.price}" img="${img}">
                <div class="interactions-box">
                    <div class="box-add">
                        <span class="text-add">+</span>
                    </div>
                    <div class="box-add price">
                        <span class="text-add pricee">${item.price}$</span>
                    </div>
                </div>
                <img class="img-itmes" src="${img}">
                <span class="text-nameitmes">${sharedITem.label}</span>
            </div>`)
                }
            }
        }
        $('.container').show()
    }
});

$(document).on('click', '.box-add', function () {
    var item = $(this).parent().parent().attr('item');
    var label = $(this).parent().parent().attr('label');
    var price = $(this).parent().parent().attr('price');
    var img = $(this).parent().parent().attr('img');
    total = 0;
    $('.app-right').empty()
    var index = cart.findIndex(element => element.item === item);
    if (index === -1) {
        cart.push({ item: item, price: price, amount: 1, label: label, img: img });
    } else {
        cart[index].amount += 1;
    }
    cart.forEach(element => {
        total += parseInt(element.price) * element.amount;
        $('.app-right').append(`
                        <div class="box">
                <img class="img-itmes s3" src="${element.img}">
                <span class="text-naber">${element.amount}x</span>
                <span class="text-nameitmes we2">${element.label}</span>
                <div class="box-interact">
                    <div class="box- AddOne" item="${element.item}">
                        <i class="icon5 fa-solid fa-plus"></i>
                    </div>
                    <div class="box- RemoveOne" item="${element.item}">
                        <span class="text-add" style="color: #ffffff8f;">-</span>
                    </div>
                    <div class="box- RemoveAllItem" item="${element.item}">
                        <i class="icon5 fa-solid fa-trash"></i>
                    </div>
                </div>
            </div>
            `)
    });
    if (total > PlayerData.money.cash) {
        $('.cash').addClass('disabled')
    } else {
        $('.cash').removeClass('disabled')
    }
    if (total > PlayerData.money.bank) {
        $('.bank').addClass('disabled')
    } else {
        $('.bank').removeClass('disabled')
    }
    $('.text-total').html(`Total : ${total}$`)
});


$(document).on('click', '.RemoveOne', function () {
    var item = $(this).attr('item');
    total = 0;
    $('.app-right').empty()
    cart.forEach(element => {
        if (element.item === item) {
            element.amount -= 1;
            if (element.amount < 1) {
                return cart.splice(cart.indexOf(element), 1)
            }
        }
        total += parseInt(element.price) * element.amount;
        $('.app-right').append(`
                        <div class="box" item="${element.item}">
                <img class="img-itmes s3" src="${element.img}">
                <span class="text-naber">${element.amount}x</span>
                <span class="text-nameitmes we2">${element.label}</span>
                <div class="box-interact">
                    <div class="box- AddOne" item="${element.item}">
                        <i class="icon5 fa-solid fa-plus"></i>
                    </div>
                    <div class="box- RemoveOne" item="${element.item}">
                        <span class="text-add" style="color: #ffffff8f;">-</span>
                    </div>
                    <div class="box- RemoveAllItem" item="${element.item}">
                        <i class="icon5 fa-solid fa-trash"></i>
                    </div>
                </div>
            </div>
            `)
    });
    if (total > PlayerData.money.cash) {
        $('.cash').addClass('disabled')
    } else {
        $('.cash').removeClass('disabled')
    }
    if (total > PlayerData.money.bank) {
        $('.bank').addClass('disabled')
    } else {
        $('.bank').removeClass('disabled')
    }
    $('.text-total').html(`Total : ${total}$`)
});


$(document).on('click', '.AddOne', function () {
    var item = $(this).attr('item');
    total = 0;
    $('.app-right').empty()
    cart.forEach(element => {
        if (element.item === item) {
            element.amount += 1;
        }
        total += parseInt(element.price) * element.amount;
        $('.app-right').append(`
                        <div class="box" item="${element.item}">
                <img class="img-itmes s3" src="${element.img}">
                <span class="text-naber">${element.amount}x</span>
                <span class="text-nameitmes we2">${element.label}</span>
                <div class="box-interact">
                    <div class="box- AddOne" item="${element.item}">
                        <i class="icon5 fa-solid fa-plus"></i>
                    </div>
                    <div class="box- RemoveOne" item="${element.item}">
                        <span class="text-add" style="color: #ffffff8f;">-</span>
                    </div>
                    <div class="box- RemoveAllItem" item="${element.item}">
                        <i class="icon5 fa-solid fa-trash"></i>
                    </div>
                </div>
            </div>
            `)
    });
    if (total > PlayerData.money.cash) {
        $('.cash').addClass('disabled')
    } else {
        $('.cash').removeClass('disabled')
    }
    if (total > PlayerData.money.bank) {
        $('.bank').addClass('disabled')
    } else {
        $('.bank').removeClass('disabled')
    }
    $('.text-total').html(`Total : ${total}$`)
});

$(document).on('click', '.RemoveAllItem', function () {
    var item = $(this).attr('item');
    total = 0;
    $('.app-right').empty()
    cart = cart.filter(element => element.item !== item);
    cart.forEach(element => {
        total += parseInt(element.price) * element.amount;
        $('.app-right').append(`
                        <div class="box" item="${element.item}">
                <img class="img-itmes s3" src="${element.img}">
                <span class="text-naber">${element.amount}x</span>
                <span class="text-nameitmes we2">${element.label}</span>
                <div class="box-interact">
                    <div class="box- AddOne" item="${element.item}">
                        <i class="icon5 fa-solid fa-plus"></i>
                    </div>
                    <div class="box- RemoveOne" item="${element.item}">
                        <span class="text-add" style="color: #ffffff8f;">-</span>
                    </div>
                    <div class="box- RemoveAllItem" item="${element.item}">
                        <i class="icon5 fa-solid fa-trash"></i>
                    </div>
                </div>
            </div>
            `)
    });
    if (total > PlayerData.money.cash) {
        $('.cash').addClass('disabled')
    } else {
        $('.cash').removeClass('disabled')
    }
    if (total > PlayerData.money.bank) {
        $('.bank').addClass('disabled')
    } else {
        $('.bank').removeClass('disabled')
    }
    $('.text-total').html(`Total : ${total}$`)
});

$(document).on('click', '.box-cash', function () {
    var type = $(this).hasClass('cash') ? 'cash' : 'bank';
    if (type && total > 0) {
        $.post(`https://${GetParentResourceName()}/buyWuth`, JSON.stringify({ type: type, cart: cart, total: total }), function (cb) {
            if (cb) {
                $('.container').hide()
                $('.app-right').empty()
                $('.app-store').empty()
                cart = [];
                total = 0;
            };
        });
    };
});

$('.ind').on('input', function () {
    var search = $(this).val().toLowerCase();
    $('.box-itmes').each(function () {
        var item = $(this).attr('item');
        var label = $(this).attr('label');
        if (label.toLowerCase().includes(search)) {
            $(this).show()
        } else {
            $(this).hide()
        }
    });
});


$(document).keydown(function (e) {
    if (e.keyCode == 27) {
        $.post(`https://${GetParentResourceName()}/closeFucs`, JSON.stringify({}), function (cb) {
            if (cb) {
                $('.container').hide()
                cart = [];
                total = 0;
                $('.text-total').html(`Total : 0$`)
                $('.app-right').empty()
                $('.app-store').empty()
            };
        });
    }
});
