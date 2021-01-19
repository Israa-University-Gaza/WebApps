



/////////////////////////////////////


jQuery(document).ready(function () {
    DataTableGo();

    //$("#btnSearch").click(function () {
    //    a.submitFilter();
    //});

    $(".modal").on("hidden.bs.modal",
        function () {
            a.submitFilter();
        });

    a.UseDropDownButtons();


});

var a = new Datatable;

function DataTableGo() {
    a.init({
        src: $("#datatable_ajax"),
        loadingMessage: "جاري التحميل...",
        dataTable: {
            //"dom":
            //    "<'row'<'col-md-12 well col-sm-12' <'table-group-actions pull-right'> <'pull-left'  f >  ><'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'B>r><'table-responsive't><'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>>", // datatable layout

            buttons: [

                //{
                //    text: 'اضافة جديد <i class="fa fa-plus"></i>',
                //    className: 'datatable-option btn green  btn-outline  pop-up-lg',
                //    titleAttr: 'Add a new record',
                //    init: function (dt, node, config) {
                //        $(node).attr('href', '/Repository/material/Add');
                //    }
                //}

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

                {
                    text: 'اضافة جديد <i class="fa fa-plus"></i>',
                    className: 'buttons-add btn green  btn-outline  pop-up-lg',
                    titleAttr: 'Add a new record',
                    init: function (dt, node, config) {
                        $(node).attr('href', '/Repository/Material/Add');
                    }
                }
            ],
            columns: [
                { "data": "Code", "name": "Code" },
                { "data": "Name", "name": "Name" },
                { "data": "MaterialType.Name", "name": "MaterialType.Name" },
                { "data": "MaterialUnit.Name", "name": "MaterialUnit.Name" },
                { "data": "Price", "name": "Price", "sClass": "numeric" },
                { "data": "RequestLimit", "name": "RequestLimit" },
                {
                    data: 'UsageStatus',
                    name: "UsageStatus",
                    render: function (data, type, row) {
                        var color = 'black';
                        if (data) {
                            return '<span style="color:green">جديد</span>';
                        } else {
                            return '<span style="color:red">مستخدم</span>';
                        }
                    }
                },
                {
                    data: 'IsConsumed',
                    name: "IsConsumed",
                    render: function (data, type, row) {
                        var color = 'black';
                        if (data) {
                            return '<span style="color:green">مستهلك</span>';
                        } else {
                            return '<span style="color:red">غير مستهلك</span>';
                        }
                    }
                },
                {
                    data: 'IsActive',
                    name: "IsActive",
                    render: function (data, type, row) {
                        var color = 'black';
                        if (data) {
                            return '<span style="color:green">فعال</span>';
                        } else {
                            return '<span style="color:red">غير فعال</span>';
                        }
                    }
                },
                {
                    data: 'Id',
                    name: "Id",
                    "targets": 0,
                    render: function (data, type, row) {

                        return `<a href="/Repository/material/Edit/` +
                            data +
                            `" class="pop-up-lg btn btn-xs green btn-outline"><i class="fa fa-search"></i>تعديل </a>` +
                            `<a href="/Repository/material/EditSuppliers/` +
                            data +
                            `" class="pop-up-lg btn btn-xs green btn-outline"><i class="fa fa-search"></i>الموردون </a>`
                            + `<a href="/Repository/material/Delete/` +
                            data +
                            `" data-toggle="tooltip" data-placement="right" title="" class="btn btn-xs  red confirm" data-title="حذف" data-msg="هل أنت متأكد من أنك تود الحذف ؟" data-action="حذف" data-ajax-update="#refresh-list" data-original-title="حذف"><i class="fa fa-times"></i> حذف</a>`
                            ;
                    },
                    "orderable": false,
                    "searchable": false

                }
            ],

            ajax: {
                url: "/Repository/material/LoadData",

            }


        }
    });


}






