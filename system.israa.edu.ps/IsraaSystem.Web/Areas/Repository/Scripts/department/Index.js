

/////////////////////////////////////


jQuery(document).ready(function () {
    DataTableGo();

    $("#btnSearch").click(function () {
        a.submitFilter();
    });

    $(".modal").on("hidden.bs.modal",
        function () {
            a.submitFilter();
        });




});

var a = new Datatable;

function DataTableGo() {
    a.init({
        src: $("#datatable_ajax"),
        loadingMessage: "جاري التحميل...",
        dataTable: {
            columns: [
                { "data": "Name", "name": "Name" },
                {
                    data: "IsActive",
                    name: "IsActive",
                    render: function (data, type, row) {
                        const color = "black";
                        if (data) {
                            return '<span style="color:green">فعال</span>';
                        } else {
                            return '<span style="color:red">غير فعال</span>';
                        }
                    }
                },
                {
                    data: "Id",
                    name: "Id",
                    "targets": 0,
                    render: function (data, type, row) {

                        return `<a href="/Repository/Department/Edit/${data}" class="pop-up-lg btn btn-outline btn-xs green"><i class="fa fa-search"></i> تعديل</a>
                                <a href="/Repository/Department/Delete/${data}" data-toggle="tooltip" data-placement="right" title="" class="btn btn-xs  red  confirm" data-title="حذف" data-msg="هل أنت متأكد من أنك تود الحذف ؟" data-action="حذف" data-ajax-update="#refresh-list" data-original-title="حذف"><i class="fa fa-times"></i> حذف</a>`;

                    },
                    "orderable": false,
                    "searchable": false

                }
            ],
            ajax: { url: "/Repository/Department/LoadData" },
            buttons: [

                {
                    extend: "print",
                    className: "btn dark  btn-outline",
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
                {
                    extend: "colvis",
                    className: "btn dark btn-outline",
                    text: "الحقول",
                    exportOptions: { columns: ":visible" }
                },
                {
                    text: 'اضافة جديد <i class="fa fa-plus"></i>',
                    className: ' btn green  btn-outline  pop-up-lg',
                    titleAttr: 'Add a new record',
                    init: function (dt, node, config) {
                        $(node).attr('href', '/Repository/Department/Add');
                    }
                },
            ],

        }
    });


}


