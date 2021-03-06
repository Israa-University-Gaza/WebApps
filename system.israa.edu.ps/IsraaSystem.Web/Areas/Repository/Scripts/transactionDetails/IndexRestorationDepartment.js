﻿

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
                        $(node).attr('href', '/Repository/TransactionDetails/AddRestorationDepartmentDetail?TransactionId=' + $('#TransactionId').val());
                    }
                }
            ],
            "columns": [
	            { "data": "RepositoryDepartmentName", "name": "RepositoryDepartment.Name" },
	            { "data": "MaterialName", "name": "Material.Name" },
	            { "data": "MaterialUnitName", "name": "MaterialUnit.Name" },
	            { "data": "Quantity", "name": "Quantity" },
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

	            //{
	            //  data: 'Id',
	            //  name: "Id",
	            //  "targets": 0,
	            //  render: function (data, type, row) {

	            //      return `<a href="/Repository/TransactionDetails/DeleteRestorationDetail/` + data + `" data-toggle="tooltip" data-placement="right" title="" class="btn btn-xs red-sunglo confirm" data-title="حذف" data-msg="هل أنت متأكد من أنك تود الحذف ؟" data-action="حذف" data-ajax-update="#refresh-list" data-original-title="حذف"><i class="fa fa-times"></i> حذف</a>`;


	            //  },
	            //  "orderable": false,
	            //  "searchable": false

	            //}


            ],
            ajax: {
                "url": '/Repository/TransactionDetails/LoadRestorationDepartmentData?transactionId=',

                "data": function (d) {
	                d.TransactionId = $('#TransactionId').val();
                }

            }

        }
    });


}

//var TableDatatablesButtons = function () {

//  var initTable1 = function () {
//    const table = $('#israa-table');
//    var oTable = table.dataTable({

//      // Internationalisation. For more info refer to http://datatables.net/manual/i18n
//      "language": {
//       "aria": {
//          "sortAscending": ": activate to sort column ascending",
//          "sortDescending": ": activate to sort column descending"
//        },
//        "emptyTable": "No data available in table",
//        "info": "عرض _START_ الى _END_ من _TOTAL_ سجلات",
//        "infoEmpty": "لا توجد بيانات",
//        "infoFiltered": "(filtered1 from _MAX_ total entries)",
//        "lengthMenu": "_MENU_ سجلات",
//        "search": "بحث:",
//        "zeroRecords": "No matching records found"
//      },

//      // Or you can use remote translation file
//      //"language": {
//      //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
//      //},
//      searchDelay: 3350,//Set a throttle frequency for searching.
//      "serverSide": true, // for process server side
//      //"filter": true, // this is for disable filter (search box)
//      "ajax": {
//          "url": '/Repository/TransactionDetails/LoadRestorationDepartmentData?transactionId=',
//        "type": "POST",
//        "datatype": "json",
//        "data": function (d) {
//            d.TransactionId = $('#TransactionId').val();
//        }
//      },
//      "columns": [
//        { "data": "RepositoryDepartmentName", "name": "RepositoryDepartment.Name" },
//        { "data": "MaterialName", "name": "Material.Name" },
//        { "data": "MaterialUnitName", "name": "MaterialUnit.Name" },
//        { "data": "Quantity", "name": "Quantity" },
//        //{ "data": "IsActive", "name": "IsActive" },
//        {
//          data: 'IsActive',
//          name: "IsActive",
//          render: function (data, type, row) {
//            var color = 'black';
//            if (data) {
//              return '<span style="color:green">فعال</span>';
//            }
//            else {
//              return '<span style="color:red">غير فعال</span>';
//            }
//          }
//        },

//        //{
//        //  data: 'Id',
//        //  name: "Id",
//        //  "targets": 0,
//        //  render: function (data, type, row) {

//        //      return `<a href="/Repository/TransactionDetails/DeleteRestorationDetail/` + data + `" data-toggle="tooltip" data-placement="right" title="" class="btn btn-xs red-sunglo confirm" data-title="حذف" data-msg="هل أنت متأكد من أنك تود الحذف ؟" data-action="حذف" data-ajax-update="#refresh-list" data-original-title="حذف"><i class="fa fa-times"></i> حذف</a>`;
              
              
//        //  },
//        //  "orderable": false,
//        //  "searchable": false

//        //}


//      ],

//      buttons: [

//        {
//          text: 'اضافة جديد <i class="fa fa-plus"></i>',
//          className: 'datatable-option btn green  btn-outline  pop-up-lg',
//          titleAttr: 'Add a new record',
//          init: function (dt, node, config) {
//              $(node).attr('href', '/Repository/TransactionDetails/AddRestorationDepartmentDetail?TransactionId=' + $('#TransactionId').val());
//          }
//        },
//        { extend: 'print', className: 'btn dark btn-outline', text: 'طباعة', exportOptions: { columns: ':visible' } },
//        { extend: 'copy', className: 'btn red btn-outline', text: 'نسخ', exportOptions: { columns: ':visible' } },
//        { extend: 'pdf', className: 'btn green btn-outline', exportOptions: { columns: ':visible' } },
//        { extend: 'excel', className: 'btn yellow btn-outline ', exportOptions: { columns: ':visible' } },
//        { extend: 'csv', className: 'btn purple btn-outline ', exportOptions: { columns: ':visible' } },
//        { extend: 'colvis', className: 'btn dark btn-outline', text: 'الحقول', exportOptions: { columns: ':visible' } }
//      ],

//      // setup responsive extension: http://datatables.net/extensions/responsive/

//      "orderCellsTop": true,

//      "scrollY": 400,
//      //"scrollX": true,


//      //"ordering": false, disable column ordering
//      //"paging": false, disable pagination

//      "order": [
//        [0, 'asc']
//      ],

//      "lengthMenu": [
//        [10, 15, 20, -1],
//        [10, 15, 20, "All"] // change per page values here
//      ],
//      // set the initial value
//      "pageLength": 10,

//      "dom":
//        "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable

//      // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
//      // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js).
//      // So when dropdowns used the scrollable div should be removed.
//      //"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
//    });

//    $('#israa-table tbody').on('click',
//      'tr',
//      function () {
//        if ($(this).hasClass('selected')) {
//          $(this).removeClass('selected');
//        } else {
//          oTable.$('tr.selected').removeClass('selected');
//          $(this).addClass('selected');
//        }
//      });



//    $('.modal').on('hidden.bs.modal',
//      function () {
//        oTable.fnFilter();
//      });


//  };


//  return {

//    //main function to initiate the module
//    init: function () {

//      if (!jQuery().dataTable) {
//        return;
//      }

//      initTable1();

//    }

//  };

//}();
//jQuery(document).ready(function () {
//  TableDatatablesButtons.init();




//});

