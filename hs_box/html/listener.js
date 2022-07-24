
$(function () {
    function display(bool) {
        if (bool) {
            $("#menu").show();
        } else {
            $("#menu").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post("https://hs_box/exit", JSON.stringify({}));
            return
        }
    };

    $("#start").click(function () {
        $.post('https://hs_box/start', JSON.stringify({}));
        return
    })
})