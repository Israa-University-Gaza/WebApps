function showToast(msg, type) {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "positionClass": "toast-bottom-full-width",
        "onclick": null,
        "showDuration": "1000",
        "hideDuration": "1000",
        "timeOut": "3000",
        "extendedTimeOut": "5000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
    toastr[type](msg);
}

function showToastTitle(title, msg, type) {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "positionClass": "toast-bottom-full-width",
        "onclick": null,
        "showDuration": "1000",
        "hideDuration": "1000",
        "timeOut": "3000",
        "extendedTimeOut": "5000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
    toastr[type](msg, title);
}