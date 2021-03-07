
window.onData = function (data) {
    if (data.setDisplay == true) {
        $("#container__dead").css('display', 'flex');

    } else {
        $("#container__dead").css('display', 'none');
    }

}


window.onload = function (e) {
    window.addEventListener('message', function (event) {
        onData(event.data)
    });
}

