var Progress = function () {
    return {
        init: function () {
            $(document).ajaxStart(function () {
                NProgress.start();
            });
            $(document).ajaxStop(function () {
                NProgress.done();
            });
            $(document).ajaxError(function () {
                NProgress.done();
            });
        }
    };
}();

$(document).ready(function () { Progress.init(); });