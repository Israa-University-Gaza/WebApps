var Modal = function () {
    return {
        init: function () {
            $(document).on("click", ".pop-up-sm", function () {
                $("#pop-up-sm .modal-dialog").load($(this).attr("href"), function () {
                    $("#pop-up-sm").modal("show");
                });
                return false;
            });

            $(document).on("click", ".pop-up-md", function () {
                $("#pop-up-md .modal-dialog").load($(this).attr("href"), function () {
                    $("#pop-up-md").modal("show");
                });
                return false;
            });

            $(document).on("click", ".pop-up-lg", function () {
                console.log("pop-up-lg");

                $("#pop-up-lg .modal-dialog").load($(this).attr("href"), function () {
                    $("#pop-up-lg").modal("show");
                });
                return false;
            });

            $(document).on("click", ".confirm", function () {
                $("#confirm .modal-title").text($(this).data("title"));
                $("#confirm .confirm-msg").text($(this).data("msg"));
                $("#confirm .btn-danger span").text($(this).data("action"));
                $("#confirm .btn-danger").attr("href", $(this).attr("href"));
                $("#confirm .btn-danger").attr("data-ajax-update", $(this).data("ajax-update"));
                $("#confirm").modal("show");
                return false;
            });

            $(document).on("change", ".ddl-dependent", function () {
                var ddl = $(this);
                console.log(ddl.attr('id'));
                $(ddl.data("target-id")).load(ddl.data("url") + (this.value === "" ? "-1" : this.value), function () {
                    $(ddl.data("target-id")).trigger('change');

                });


                //if (ddl.attr('id') == "select2-EmployeePlacement_DepartmentID-container") {
                //    console.log("select2-EmployeePlacement_DepartmentID-container");
                //}


            });


            $(document).mouseenter(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });



            $(document).on("change", '.cb-activation', function () {
                var cb = $(this);
                $.post(cb.data("url"), { isActive: cb.is(':checked') }, function (data) {
                    $(cb.data("target-id")).html(data);
                });
            });

            $(document).on("change", '.input-change', function () {
                $(this).submit();
            });

            $(document).on("keyup", '.input-keyup', function () {
                $(this).submit();
            });

            $(".select2, .select2-multiple").select2({ width: null });

            $(document).ajaxComplete(function () {
                $(".select2, .select2-multiple").select2({ width: null });
            });
        }
    };
}();

var iCheck = function () {
    return {
        init: function () {

            //init ichick
            $('.icheck').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue'
            });


            // select all handler
            $('#SellectAllRows').on('ifChecked',
                function (event) {
                    $("input[name='SelectedRows']").iCheck('check');
                });

            $('#SellectAllRows').on('ifUnchecked',
                function (event) {
                    $("input[name='SelectedRows']").iCheck('uncheck');
                });


        }
    };
}();


jQuery(document).ready(function () {
    Modal.init();
    iCheck.init();
});

