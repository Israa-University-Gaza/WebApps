$(function () {
    var message = $.connection.messageHub;
    // Create a function that the hub can call to broadcast messages.
    message.client.sendMessage = function (title, msg, type) {
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "onclick": null,
            "showDuration": "1000",
            "hideDuration": "1000",
            "timeOut": "5000000",
            "extendedTimeOut": "5000000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        toastr[type](msg, title);
    };
    //$.connection.hub.start();
});