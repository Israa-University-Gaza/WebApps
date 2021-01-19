



/////////////////////////////////////


jQuery(document).ready(function () {
    DataTableGo();

    //$("#btnSearch").click(function () {
    //    a.submitFilter();
    //});

    //$(".modal").on("hidden.bs.modal",
    //    function () {
    //        a.submitFilter();
    //    });

   // a.UseDropDownButtons();


});

var a = new Datatable;

function DataTableGo() {
    a.init({
        src: $("#datatable_ajax"),
        loadingMessage: "جاري التحميل...",
        dataTable: {
            "dom":
                "<'row'<'col-md-12 well col-sm-12' <'table-group-actions pull-right'> <'pull-left'  f >  ><'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'B>r><'table-responsive't><'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>>", // datatable layout

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
                { extend: "csv", className: "btn purple btn-outline ", exportOptions: { columns: ":visible" } },
                {
                    extend: "colvis",
                    className: "btn dark btn-outline",
                    text: "الحقول",
                    exportOptions: { columns: ":visible" }
                },

            ],
            columns: [
                {
                    "targets": 0,
                    orderable: false,
                    render: function (data, type, row) {

                        return '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input name="id[]" type="checkbox" class="checkboxes" value="' + row.InstallmentOrderId + '"><span></span></label>';

                    }
                },
                {
                    "className": "details-control",
                    "orderable": false,
                    "data": null,
                    "defaultContent": ""

                },
                { "data": "StudentNo", "name": "StudentNo" },
                { "data": "StudentName", "name": "StudentName" },
                { "data": "DepartmentName", "name": "DepartmentName" },
                { "data": "RequierdHours", "name": "RequierdHours" },
                { "data": "VolunteerHours", "name": "VolunteerHours" },
                {
                    render: function (data, type, row, meta) {
                        return row.StudentVolunteer + "/" + row.AcceptedNo;
                    }
                },
                {

                    render: function (data, type, row, meta) {
                        return `<div class="btn-group ">
                                    <button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> اجراءات
                                        <i class="fa fa-angle-down"></i>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li>
                                            <a href="Add?studentId=`+ row.StudentID + `" class="pop-up-lg"> اضافة ساعات تطوع </a>
                                        </li>
                                        <li>
                                            <a href="Print?studentId=`+ row.StudentID + `" > طباعة </a>
                                        </li>

                                    </ul>
                                </div>`;
                    }

                }

            ],
            order: [
                [2, "asc"]
            ],

            ajax: {
                url: "/Affairs/StudentVolunteer/LoadData",

            }

        }
    }),
        a.getTableWrapper().on("click",
            ".table-group-action-submit",
            function (e) {

                e.preventDefault();
                const t = $(".table-group-action-input", a.getTableWrapper());
                if (t.val() != "" && a.getSelectedRowsCount() > 0) {

                    a.setAjaxParam("customActionType", "Accerdiate"),
                        a.setAjaxParam("customActionName", t.val()),
                        a.setAjaxParam("SelectedItems", a.getSelectedRows()),
                        a.submitFilter();
                    // a.getDataTable().ajax.reload(),
                    a.clearAjaxParams();
                } else {
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

        })
        ;


}




function format(rowData) {
    var div = $('<div/>')
        .addClass('loading')
        .text('Loading...');


    $.ajax({
        url: 'StudentVolunteerRequests?studentId=' + rowData.StudentID,
        type: "GET",
        success: function (data) {

            div
                .html(data)
                .removeClass('loading');
        }
    });



    return div;
}


function AccreditRequest(id) {

    var dom = event.target;

    $.post("AccreditRequest", { id: id })
        .done(function (data) {
            if (data.success) {
                toastr.success("تمت العملية بنجاح", " ");
                $(dom).attr("disabled", true);
                $(dom).removeClass("btn-outline");
            } else {
                toastr.warning("لا تملك الصلاحية ","")
            }

        })
        .fail(function () {
            toastr.danger("حدث خطأ داخلي", " ");
        })
        .always(function () {
        });

}




