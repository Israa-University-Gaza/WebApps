



/////////////////////////////////////


jQuery(document).ready(function () {
    DataTableGo();

    $("#btnSearch").click(function () {
        a.submitFilter();
    });

    $(".modal").on("hidden.bs.modal",
        function () {
            a.fnFilter();
        });

});


var a = new Datatable;


function DataTableGo() {
    a.init({
        src: $("#datatable_ajax"),
        onSuccess: function (a, e) { },
        onError: function (a) { },
        onDataLoad: function (a) { },
        loadingMessage: "Loading...",
        dataTable: {
            buttons: [
                {
                    extend: "print",
                    className: "btn  btn-outline",
                    text: "طباعة",
                    exportOptions: { columns: ":visible" }
                },
                {
                    extend: "copy",
                    className: "btn red btn-outline",
                    text: "نسخ",
                    exportOptions: { columns: ":visible" }
                },
                { extend: "pdf", className: "btn green btn-outline", exportOptions: { columns: ":visible" } },
                {
                    extend: "excel",
                    className: "btn yellow btn-outline ",
                    exportOptions: { columns: ":visible" }
                },
                { extend: "csv", className: "btn purple btn-outline ", exportOptions: { columns: ":visible" } },
                {
                    extend: "colvis",
                    className: "btn  btn-outline",
                    text: "الحقول",
                    exportOptions: { columns: ":visible" }
                }
            ],
            "dom":
                "<'row'<'col-md-12 well col-sm-12' <'table-group-actions pull-right'> <'pull-left'  f >  ><'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'B>r><'table-responsive't><'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>>", // datatable layout
            columns: [
                {
                    "targets": 0,
                    orderable: false,
                    render: function (data, type, row) {

                        return '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input name="id[]" type="checkbox" class="checkboxes" value="' + row.ID + '"><span></span></label>';

                    }
                },
                {
                    "className": "details-control",
                    "orderable": false,
                    "data": null,
                    "defaultContent": ""

                },
                { "data": "DepartmentName", "name": "DepartmentName" },
                { "data": "CourseName", "name": "CourseName" },
                { "data": "SectionNum", "name": "SectionNum" },
                { "data": "EmployeeName", "name": "EmployeeName" },
                //Mid
                {
                    data: "IsMidTeacherAllAccreditation",
                    name: "IsMidTeacherAllAccreditation",
                    render: function (data, type, row) {
                        var result = '';
                        if (data) {
                            result = result + '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result + '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }

                        return result;
                    }
                },
                {
                    data: "IsMidDeanAllAccreditation",
                    name: "IsMidDeanAllAccreditation",
                    render: function (data, type, row) {
                        var result = '';

                        if (data) {
                            result = result + '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result + '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }

                        return result;
                    }
                },
                {
                    data: "IsMidAcademicAllAccreditation",
                    name: "IsMidAcademicAllAccreditation",
                    render: function (data, type, row) {
                        var result = '';

                        if (data) {
                            result = result + '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result + '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }
                        return result;
                    }
                },

                //Final
                {
                    data: "IsFinalTeacherAllAccreditation",
                    name: "IsFinalTeacherAllAccreditation",
                    render: function (data, type, row) {
                        var result = '';
                        if (data) {
                            result = result + '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result + '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }

                        return result;
                    }
                },
                {
                    data: "IsFinalDeanAllAccreditation",
                    name: "IsFinalDeanAllAccreditation",
                    render: function (data, type, row) {
                        var result = '';

                        if (data) {
                            result = result + '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result + '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }

                        return result;
                    }
                },
                {
                    data: "IsFinalAcademicAllAccreditation",
                    name: "IsFinalAcademicAllAccreditation",
                    render: function (data, type, row) {
                        var result = '';

                        if (data) {
                            result = result + '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result + '<a href="javascript:;" class="btn btn-xs grey disabled ">غير معتمد</a>';
                        }
                        return result;
                    }
                }



            ],

            bStateSave: !0,
            lengthMenu: [
                [10, 20, 50, 100, 150, -1],
                [10, 20, 50, 100, 150, "All"]
            ],
            pageLength: 10,
            ajax: {
                url: "/Academic/SectionMark/LoadData",
                timeout: 60000

            },
            //ordering: !1,
            order: [
                [2, "asc"]
            ]


        }
    }),
        a.getTableWrapper().on("click", ".table-group-action-submit", function (e) {

            e.preventDefault();
            const t = $(".table-group-action-input", a.getTableWrapper());
            if (t.val() != "" && a.getSelectedRowsCount() > 0) {



                a.setAjaxParam("customActionType", "Accerdiate"),
                    a.setAjaxParam("customActionName", t.val()),
                    a.setAjaxParam("SelectedItems", a.getSelectedRows()),
                    a.getDataTable().ajax.reload(),
                    a.clearAjaxParams();
            }
            else {
                "" == t.val()
                    ? App.alert({
                        type: "danger",
                        icon: "warning",
                        message: "الرجاء اختيار اجراء",
                        container: a.getTableWrapper(),
                        place: "prepend"
                    })
                    : 0 === a.getSelectedRowsCount() &&
                    App.alert({
                        type: "danger",
                        icon: "warning",
                        message: "لا توجد سجلات محددة",
                        container: a.getTableWrapper(),
                        place: "prepend"
                    });
            }
        }),
        a.getDataTable().on("click", "td.details-control", function () {
            const tr = $(this).closest("tr");
            const row = a.getDataTable().row(tr);

            if (row.child.isShown()) {
                row.child.hide();
                tr.removeClass("shown");
            } else {
                row.child(format(row.data())).show();
                tr.addClass("shown");
            }

        }),
        a.getDataTable().on("click", "button.Accerdiate", function (e) {
            e.preventDefault();

            const tr = $(this).closest("tr");
            const row = a.getDataTable().row(tr);
            const accreditationType = $(this).attr('AccreditationType');

            console.log(accreditationType);

            //$.post("/Financial/Installment/Accerdiate", { installmentOrderId: rowData.InstallmentOrderId, accreditationType: accreditationType });





        });

}


function format(rowData) {
    var div = $('<div/>')
        .addClass('loading')
        .text('Loading...');


    $.ajax({
        url: '/Financial/Installment/StudentInstallmentOrderList?studentId=' + rowData.StudentID + '&semesterId=' + rowData.SemesterID,
        type: "GET",
        success: function (data) {

            div
                .html(data)
                .removeClass('loading');
        }
    });



    return div;
}







