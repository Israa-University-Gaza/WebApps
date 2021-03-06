﻿
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
                },

                {
                    text: 'اضافة جديد <i class="fa fa-plus"></i>',
                    className: 'buttons-add btn green  btn-outline  pop-up-lg',
                    titleAttr: 'Add a new record',
                    init: function (dt, node, config) {
                        $(node).attr('href', '/Repository/TransactionDetails/AddInventoryDetail?TransactionId=' + $('#TransactionId').val());
                    }
                }
            ],
            "columns": [
                { "data": "RepositoryDepartmentName", "name": "RepositoryDepartment.Name" },
                { "data": "MaterialName", "name": "Material.Name" },
                { "data": "MaterialUnitName", "name": "MaterialUnit.Name" },
                { "data": "Quantity", "name": "Quantity" },
                { "data": "QuantityAfterInventory", "name": "QuantityAfterInventory" },
                { "data": "Notes", "name": "Notes" },
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


            ],
            ajax: {
                "url": '/Repository/TransactionDetails/LoadInventoryData?transactionId=',

                "data": function (d) {
                    d.TransactionId = $('#TransactionId').val();
                }

            }

        }
    });


}




