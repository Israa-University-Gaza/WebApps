
jQuery(document).ready(function () {
    DataTableGo();

    $("#btnSearch").click(function () {
        a.getDataTable().ajax.reload();
    });

});



var a = new Datatable;


function DataTableGo () {
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
                    className: "btn dark btn-outline",
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
                //{ extend: "csv", className: "btn purple btn-outline ", exportOptions: { columns: ":visible" } },
                {
                    extend: "colvis",
                    className: "btn dark btn-outline",
                    text: "الحقول",
                    exportOptions: { columns: ":visible" }
                }
            ],
            "dom":
                "<'row'<'col-md-12 well col-sm-12' <'table-group-actions pull-right'> <'pull-left'  f >  ><'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'B>r><'table-responsive't><'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>>", // datatable layout

            columns: [
                {
                    "className": "details-control",
                    "orderable": false,
                    "data": null,
                    "defaultContent": ""

                },
                { "data": "StudentNo", "name": "StudentNo" },
                { "data": "StudentFullName", "name": "StudentFullName" },
                { "data": "DepartmentArName", "name": "DepartmentArName" },
                { "data": "WarningsCount", "name": "WarningsCount" },

                {
                    data: "StudentCurrentWarningNo",
                    name: "StudentCurrentWarningNo",
                    render: function (data, type, row) {

                        if (data == 1) {
                            return '<span class="label label-sm bg-yellow-crusta"> تحذير اكاديمي  أول </span>';
                        } else if (data == 2) {
                            return '<span class="label label-sm bg-yellow-gold"> تحذير اكاديمي ثاني </span>';
                        }
                        else if (data >= 3) {
                            return '<span class="label label-sm label-danger"> تحذير اكاديمي ثالث </span>';
                        } else {
                            return '<span class="label label-sm bg-green-jungle"> بدون تحذير أكاديمي </span>';

                        }
                    }
                }


            ],


            bStateSave: !0,
            lengthMenu: [
                [10, 20, 50, 100, 150, -1],
                [10, 20, 50, 100, 150, "All"]
            ],
            pageLength: 50,
            ajax: {
                "url": "/Academic/AcademicWarning/LoadData",
                "type": "POST",
                "datatype": "json",
                "dataSrc": function (json) {
                    // Make your callback here.

                    return json.data;
                },
                "data": function (d) {
                    d.semesterId = $("#semesterId").val();
                }
            },
            //ordering: !1,
            order: [
                [1, "asc"]
            ]
        }
    }),
        a.getTableWrapper().on("click", ".table-group-action-submit", function (e) {

            e.preventDefault();
            const t = $(".table-group-action-input", a.getTableWrapper());
            "" != t.val() && a.getSelectedRowsCount() > 0
                ? (a.setAjaxParam("customActionType", "group_action"), a.setAjaxParam("customActionName",
                    t.val()),
                    a.setAjaxParam("id", a.getSelectedRows()), a.getDataTable().ajax.reload(),
                    a.clearAjaxParams())
                : "" == t.val()
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
        }),
        a.getDataTable().on("click", "td.details-control", function () {
            console.log(111111111111111111);
            const tr = $(this).closest("tr");
            const row = a.getDataTable().row(tr);


            console.log(row);

            if (row.child.isShown()) {
                row.child.hide();
                tr.removeClass("shown");
            } else {
                row.child(format(row.data())).show();
                tr.addClass("shown");
            }

        });


}



function format(rowData) {

    console.log("formatformatformat");

    var div = $('<div/>')
        .addClass('spinner')
        .html(`

                <div class="bounce1"></div>
                <div class="bounce2"></div>
                <div class="bounce3"></div>
                `);


    $.ajax({
        url: '/Academic/AcademicWarning/GetStudentAcademicWarningsRowChild?studentId=' + rowData.StudentID,
        type: "GET",
        success: function (data) {

            div
                .html(data)
                .removeClass('spinner');
        }
    });



    return div;
}


$(".modal").on("hidden.bs.modal",
    function () {
        a.fnFilter();
    });






