var ComponentsBootstrapSwitch = function () {

    var handleBootstrapSwitch = function() {

        $('.switch-radio1').on('switch-change', function () {
            $('.switch-radio1').bootstrapSwitch('toggleRadioState');
            alert('w1');
        });

        // or
        $('.switch-radio1').on('switch-change', function () {
            $('.switch-radio1').bootstrapSwitch('toggleRadioStateAllowUncheck');
            alert('w2');
        });

        // or
        $('.switch-radio1').on('switch-change', function () {
            $('.switch-radio1').bootstrapSwitch('toggleRadioStateAllowUncheck', false);
            alert('w3');
        });

    }

    return {
        //main function to initiate the module
        init: function () {
            handleBootstrapSwitch();
        }
    };

}();

jQuery(document).ready(function() {    
   ComponentsBootstrapSwitch.init(); 
});