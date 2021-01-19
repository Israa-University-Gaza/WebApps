
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
                        $(node).attr('href', '/Repository/Transaction/AddMovment');
		            }
	            }
            ],
            "columns": [
                                { "data": "Id", "name": "Id" },
                { "data": "TransactionType.Name", "name": "TransactionType.Name" },
                {
                    data: 'TransactionDate',
                    name: "TransactionDate",
                    render: function (data, type, row) {
                        var d = new Date(data),
                            month = '' + (d.getMonth() + 1),
                            day = '' + d.getDate(),
                            year = d.getFullYear();

                        if (month.length < 2) month = '0' + month;
                        if (day.length < 2) day = '0' + day;

                        return [year, month, day].join('/');
                    }
                },
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


                        return `<a href="/Repository/Transaction/EditMovment/` + data + `" class="pop-up-lg btn btn-xs green btn-outline"><i class="fa fa-search"></i>تعديل</a>`
                            +
                            `<a href="/Repository/TransactionDetails/IndexMovment?transactionId=` + data + `"class="btn btn-xs green btn-outline">تفاصيل</a>`
                            + `<a href="/Repository/Transaction/Delete/` + data + `" data-toggle="tooltip" data-placement="right" title="" class="btn btn-xs red-sunglo confirm" data-title="حذف" data-msg="هل أنت متأكد من أنك تود الحذف ؟" data-action="حذف" data-ajax-update="#refresh-list" data-original-title="حذف"><i class="fa fa-times"></i> حذف</a>`;

                            },
                    "orderable": false,
                    "searchable": false

                }


            ],

            ajax: {
	            "url": '/Repository/Transaction/LoadMovmentData',

            }

        }
    });


}





