



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
            fixedHeader: true,
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

                        return `<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input name="id[]" type="checkbox" class="checkboxes" value="${
                            row.StdSectionId}"><span></span></label>`;

                    }
                },
                { "data": "StudentNo", "name": "StudentNo" },
                { "data": "StudentName", "name": "StudentName" },
                {
                    "data": "WorkMark",
                    "name": "WorkMark",
                    render: function(data, type, row) {
                        var mark = '<span class="bold ">' + data + '</span> &nbsp;	&nbsp; &nbsp;';
                        return mark;
                    }
                },
                {
                    "data": "MidtermMark",
                    "name": "MidtermMark",
                    render: function (data, type, row) {
                        var result;
                        var mark = '<span class="bold ">' + data + '</span> &nbsp;	&nbsp; &nbsp;';

                        if (row.IsMidtermNoMark) {
                            result = '<span class="label label-sm label-danger"> غياب </span> 	&nbsp;	&nbsp;';
                        }

                        if (row.IsMidtermIncomplete) {
                            result = result + '<span class="label label-sm label-warning"> غير مكتمل </span>';
                        }
                        return mark + (result != null ? result : "");
                    }


                },
                {
                    "data": "FinalMark",
                    "name": "FinalMark",
                    render: function (data, type, row) {

                        var result;
                        var mark = '<span class="bold ">' + data + '</span> &nbsp;	&nbsp; &nbsp;';

                        if (row.IsFinalNoMark) {
                            result = '<span class="label label-sm label-danger"> غياب </span> 	&nbsp;	&nbsp;';
                        }

                        if (row.IsFinalIncomplete) {

                            result = result + '<span class="label label-sm label-warning"> غير مكتمل </span>';
                        }

                        return mark + (result != null ? result : "");

                    }


                },
                {
                    "data": "TotalMark",
                    "name": "TotalMark",
                    sClass: "text-center  active  ",


                },
                {
                    data: null,
                    name: null,
                    sClass: "text-center  ",
                    render: function (data, type, row) {
                        var result = "";
                        if (row.midTeacherAccreditation) {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }


                        return result;
                    }
                },
                {
                    data: null,
                    name: null,
                    sClass: "text-center",
                    render: function (data, type, row) {
                        var result = "";


                        if (row.midDeanAccreditation) {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }

                        return result;
                    }
                },
                {
                    data: null,
                    name: null,
                    sClass: "text-center",
                    render: function (data, type, row) {
                        var result = "";

                        if (row.midAcademicAccreditation) {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }
                        return result;
                    }
                },
                {
                    data: null,
                    name: null,
                    sClass: "text-center",
                    render: function (data, type, row) {
                        var result = "";
                        if (row.finalTeacherAccreditation) {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }

                        return result;
                    }
                },
                {
                    data: null,
                    name: null,
                    sClass: "text-center",
                    render: function (data, type, row) {
                        var result = "";


                        if (row.finalDeanAccreditation) {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }

                        return result;
                    }
                },
                {
                    data: null,
                    name: null,
                    sClass: "text-center",
                    render: function (data, type, row) {
                        var result = "";

                        if (row.finalAcademicAccreditation) {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs btn-success disabled"> معتمد</a>';
                        } else {
                            result = result +
                                '<a href="javascript:;" class="btn btn-xs grey disabled "> غير معتمد</a>';
                        }
                        return result;
                    }
                },
                ////
                {
                    data: "MarkId",
                    name: "MarkId",
                    sClass: "text-center",
                    render: function (data, type, row) {
                        if (
                            row.finalAcademicAccreditation ||
                            row.finalDeanAccreditation ||
                            row.finalHeadAccreditation ||
                            row.finalTeacherAccreditation ||
                            row.midAcademicAccreditation ||
                            row.midDeanAccreditation ||
                            row.midHeadAccreditation ||
                            row.midTeacherAccreditation
                        ) {
                            return `<a href="#" class="btn btn-xs  red btn-outline pop-up-md disabled "><i class="fa fa-plus"></i>تعديل</a>`;


                        } else {
                            return `<a href="/Academic/Mark/Update?markId=${data
                                }" class="btn btn-xs  red btn-outline pop-up-md"><i class="fa fa-plus"></i>تعديل</a>`;

                        }
                    }
                }
            ],

            bStateSave: !0,
            //lengthMenu: [
            //    [10, 20, 50, 100, 150, -1],
            //    [10, 20, 50, 100, 150, "All"]
            //],
            pageLength: -1,
            deferLoading: 0,

            ajax: { // define ajax settings
                "url": "/Academic/Mark/LoadData", // ajax URL
                "type": "POST", // request type
                "timeout": 40000,
                "dataSrc": function (res) { // Manipulate the data returned from the server
                    if (res.customActionMessage) {
                        App.alert({
                            type: (res.customActionStatus == "OK" ? "success" : "danger"),
                            icon: (res.customActionStatus == "OK" ? "check" : "warning"),
                            message: res.customActionMessage,
                            container: a.getTableWrapper(),
                            place: "prepend"
                        });
                    }
                    App.unblockUI(a.gettableContainer());

                    $("#course-name").text(res.info.CourseName);
                    $("#employee-name").text(res.info.EmployeeName);
                    $("#section-num").text(res.info.SectionNum);
                    $("#SectionStudentsMidtermMarks").attr("href",
                        `/Academic/Mark/SectionStudentsMidtermMarks?sectionID=${res.info.ID}`);
                    $("#SectionStudentsMarks").attr("href",
                        `/Academic/Mark/SectionStudentsMarks?sectionID=${res.info.ID}`);


                    /// staticts
                    $("#count").text(res.statistics.count);
                    $("#FinalIncompleteCount").text(res.statistics.FinalIncompleteCount);
                    $("#FinalNoMarkCount").text(res.statistics.FinalNoMarkCount);
                    $("#SuccessCount").text(res.statistics.SuccessCount);
                    $("#FailCount").text(res.statistics.FailCount);
                    $("#ExcellenceCount").text(res.statistics.ExcellenceCount);
                    $("#VeryGoodCount").text(res.statistics.VeryGoodCount);
                    $("#GoodCount").text(res.statistics.GoodCount);
                    $("#PassCount").text(res.statistics.PassCount);

                    /// percentage
                    $("#countPer").text(Math.round(res.statistics.count / res.statistics.count *100)  + " %");
                    $("#FinalIncompleteCountPer").text(Math.round(res.statistics.FinalIncompleteCount / res.statistics.count * 100) + " %");
                    $("#FinalNoMarkCountPer").text(Math.round(res.statistics.FinalNoMarkCount / res.statistics.count * 100) + " %");
                    $("#SuccessCountPer").text(Math.round(res.statistics.SuccessCount / res.statistics.count * 100) + " %");
                    $("#FailCountPer").text(Math.round(res.statistics.FailCount / res.statistics.count * 100) + " %");
                    $("#ExcellenceCountPer").text(Math.round(res.statistics.ExcellenceCount / res.statistics.count * 100) + " %");
                    $("#VeryGoodCountPer").text(Math.round(res.statistics.VeryGoodCount / res.statistics.count * 100) + " %");
                    $("#GoodCountPer").text(Math.round(res.statistics.GoodCount / res.statistics.count * 100) + " %");
                    $("#PassCountPer").text(Math.round(res.statistics.PassCount / res.statistics.count * 100) + " %");




                    console.log(res);

                    return res.data;
                }
            },

            ordering: true,
            order: [
                [2, "asc"]
            ]
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
        a.getDataTable().on("click",
            "td.details-control",
            function () {
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
        a.getDataTable().on("click",
            "button.Accerdiate",
            function (e) {
                e.preventDefault();
                const tr = $(this).closest("tr");
                const row = a.getDataTable().row(tr);
                const accreditationType = $(this).attr("AccreditationType");
                console.log(accreditationType);
                //$.post("/Financial/Installment/Accerdiate", { installmentOrderId: rowData.InstallmentOrderId, accreditationType: accreditationType });
            });

}


function format(rowData) {
    var div = $("<div/>")
        .addClass("loading")
        .text("Loading...");
    $.ajax({
        url: `/Financial/Installment/StudentInstallmentOrderList?studentId=${rowData.StudentID}&semesterId=${rowData
            .SemesterID}`,
        type: "GET",
        success: function (data) {
            div
                .html(data)
                .removeClass("loading");
        }
    });

    return div;
}







