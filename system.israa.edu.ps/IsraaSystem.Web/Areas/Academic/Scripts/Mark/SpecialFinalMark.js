
/////////////////////////////////////


jQuery(document).ready(function () {
    DataTableGo();

    $("#btnSearch").click(function () {
        a.submitFilter();
    });

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
                }
            ],
            columns: [
                { "data": "courseName", "name": "courseName" },
                { "data": "studentNo", "name": "studentNo" },
                { "data": "studentName", "name": "studentName" },
                { "data": "studentCollege", "name": "studentCollege" },
                {
                    "data": "totalMark", "name": "totalMark",
                    render: function (data, type, row) {
                        return `<input type="text" class="form-control text-center mark" value="` + data + `"/>`;
                    },
                    "orderable": false,
                    "searchable": false
                },
                {
                    data: "academicAccreditation",
                    name: "academicAccreditation",
                    render: function (data, type, row) {
                        if (data) {
                            return '<span class="btn btn-xs btn-success disabled">معتمد</span>'
                        } else {
                            return '<span class="btn btn-xs grey disabled ">غير معتمد</span>'
                        }
                    }
                },
                {
                    data: "",
                    name: "",
                    "targets": 0,
                    render: function (data, type, row) {

                        return `<button class="btn btn-xs green btn-outline subm"><span class="fa fa-save"></span> حفظ واعتماد</button>`;
                    },
                    "orderable": false,
                    "searchable": false

                },
            ],

            ajax: {
                url: "/Academic/Mark/SpecialFinalMarkLoadData",

            }


        }
    }), a.getDataTable().on("click", "button.subm", function () {
        const tr = $(this).closest("tr");
        const row = a.getDataTable().row(tr);
        format(row.data())

    }), a.getDataTable().on("change", "input.mark", function () {
	    const tr = $(this).closest("tr");
	    const row = a.getDataTable().row(tr);
        row.data().totalMark = $(this).val();
    });


}

function format(rowData) {

    console.log(rowData);
    $.ajax({
        url: '/Academic/Mark/SetStdSectionTotalMark?stdsectionId=' + rowData.StdSectionID + '&totalMark=' + rowData.totalMark,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            //App.alert({
            //    type: "success",
            //    icon: "success",
            //    message: "good",
            //    container: a.getTableWrapper(),
            //    place: "prepend"
            //});
        }
    });
}

