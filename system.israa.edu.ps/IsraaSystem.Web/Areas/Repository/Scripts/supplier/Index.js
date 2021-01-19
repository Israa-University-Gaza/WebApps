

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
                { extend: "csv", className: "btn purple btn-outline ", exportOptions: { columns: ":visible" } },
                {
                    extend: "colvis",
                    className: "btn dark  btn-outline",
                    text: "الحقول",
                    exportOptions: { columns: ":visible" }
                },
                {
                    text: 'اضافة جديد <i class="fa fa-plus"></i>',
                    className: ' btn green  btn-outline  pop-up-lg',
                    titleAttr: 'Add a new record',
                    init: function (dt, node, config) {
                        $(node).attr('href', '/Repository/supplier/Add');
                    }
                }

            ],
            "dom":
                "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable
            columns: [
                { "data": "Name", "name": "Name" },
                { "data": "Address", "name": "Address" },
                { "data": "Mobile", "name": "Mobile" },
                //{ "data": "IsActive", "name": "IsActive" },
                {
                    data: 'IsActive',
                    name: "IsActive",
                    render: function (data, type, row) {
                        var color = 'black';
                        if (data) {
                            return '<span style="color:green">فعال</span>';
                        }
                        else {
                            return '<span style="color:red">غير فعال</span>';
                        }
                    }
                },

                {
                    data: 'Id',
                    name: "Id",
                    "targets": 0,
                    render: function (data, type, row) {

                        return `<a href="/Repository/supplier/Edit/` + data + `" class="pop-up-lg btn btn-xs btn-outline green"><i class="fa fa-search"></i> تعديل </a>` +
                            `<a href="/Repository/supplier/EditMaterials/` + data + `" class="pop-up-lg btn btn-xs btn-outline green"><i class="fa fa-search"></i> الاصناف </a>` +
                            `<a href="/Repository/supplier/Delete/` + data + `" data-toggle="tooltip" data-placement="right" title="" class="btn btn-xs red-sunglo confirm" data-title="حذف" data-msg="هل أنت متأكد من أنك تود الحذف ؟" data-action="حذف" data-ajax-update="#refresh-list" data-original-title="حذف"><i class="fa fa-times"></i> حذف</a>` ;


                    },
                    "orderable": false,
                    "searchable": false

                }


            ],

            bStateSave: !0,
            lengthMenu: [
                [10, 20, 50, 100, 150, -1],
                [10, 20, 50, 100, 150, "All"]
            ],
            pageLength: 50,
            ajax: {
                url: "/Repository/supplier/LoadData",

            },
            //ordering: !1,
            order: [
                [0, "asc"]
            ]

        }
    });


    //a.getDataTable().buttons().container()
    //    .appendTo($('.col-sm-6:eq(0)', a.getDataTable().table().container()));

}









