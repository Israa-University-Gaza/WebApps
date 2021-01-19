


jQuery(document).ready(function () {
    DataTableGo();

    //$("#btnSearch").click(function () {
    //    a.submitFilter();
    //});

    //$(".modal").on("hidden.bs.modal",
    //    function () {
    //        a.submitFilter();
    //    });

    a.UseDropDownButtons();


});

var a = new Datatable;

function DataTableGo() {
    a.init({
        src: $("#datatable_ajax"),
        loadingMessage: "جاري التحميل...",
        dataTable: {
            "dom":
                "<'row'<'col-md-12 well col-sm-12' <'table-group-actions pull-right'> <'pull-left'  f >  ><'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'B>r><'table-responsive't><'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>>", // datatable layout
            order: [
                [1, "asc"]
            ],
            columns: [
                {
                    "targets": 0,
                    orderable: false,
                    render: function (data, type, row) {

                        return `<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input name="id[]" type="checkbox" class="checkboxes" value="${
                            row.StudentID}"><span></span></label>`;

                    }
                },
                { "data": "StudentNo", "name": "StudentNo" },
                { "data": "StudentName", "name": "StudentName" },
                { "data": "DepartmentName", "name": "DepartmentName" },
                { "data": "StudentType", "name": "StudentType" },
                { "data": "SumOfHours", "name": "SumOfHours" },
                { "data": "SumOfOldUniversityTransformationHours", "name": "SumOfOldUniversityTransformationHours" },
                { "data": "PlanTotalHours", "name": "PlanTotalHours" },
                {
                    data: "DeanAccreditation",
                    name: "DeanAccreditation",
                    sClass: 'text-center',
                    render: function (data, type, row) {
                        var result = "";
                        if (row.DeanAccreditation) {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result + '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }


                        return result;
                    }
                },
                {
                    data: "AcademicAccreditation",
                    name: "AcademicAccreditation",
                    sClass: 'text-center',
                    render: function (data, type, row) {
                        var result = "";
                        if (row.AcademicAccreditation) {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result + '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }


                        return result;
                    }
                },
                {
                    data: "StudentID",
                    name: "StudentID",
                    sClass: 'text-center',
                    render: function (data, type, row) {
                        return `<div class="btn-group">
                            <a href="javascript:;" data-toggle="dropdown" class="btn red btn-outline btn-circle btn-xs">
                            <i class="icon-settings "></i>
                            <span class="hidden-xs"> ادوات </span>
                            <i class="fa fa-angle-down"></i></a>



                            <ul id="sample_3_tools" class="dropdown-menu pull-right">

                            <li><a href="http://academic.israa.edu.ps/Academic/StudentExternalTransforamtion.aspx?id=` + data +`" class="tool-action"><i class="fa fa-search"></i>تفاصيل</a></li>

                            <li><a href="AcredPdf?studentId=`+ data+`"data-action-class="buttons-pdf" class="tool-action"><i class="icon-doc"></i> PDF تقرير المعتمد </a></li>
                            <li><a href="UnAcredPdf?studentId=`+ data +`" data-action-class="buttons-pdf" class="tool-action"><i class="icon-doc"></i> PDF تقرير الغير معتمد </a></li>
                            </ul></div>`;
                    }
                }
            ],
            ajax: {
                url: "/Academic/Transformation/LoadData",

            }


        }
    }),a.getTableWrapper().on("click", ".table-group-action-submit", function (e) {

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
        });


}






