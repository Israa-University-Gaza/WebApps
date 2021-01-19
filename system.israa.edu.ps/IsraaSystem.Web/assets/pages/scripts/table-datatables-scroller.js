var TableDatatablesScroller = function () {
  var oTable;
  var initTable1 = function() {
    var table = $('#sample_1');

    oTable = table.dataTable({

      // Internationalisation. For more info refer to http://datatables.net/manual/i18n
      "language": {
        "aria": {
          "sortAscending": ": activate to sort column ascending",
          "sortDescending": ": activate to sort column descending"
        },
        "emptyTable": "لا توجد بيانات متاحة",
        "info": "عرض _START_ الى _END_ من _TOTAL_ سجل",
        "infoEmpty": "No entries found",
        "infoFiltered": "(filtered1 from _MAX_ total entries)",
        "lengthMenu": "_MENU_ entries",
        "search": "بحث:",
        "zeroRecords": "لا توجد نتائج مطابقة للبحث"
      },

      // Or you can use remote translation file
      //"language": {
      //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
      //},

      // setup buttons extension: http://datatables.net/extensions/buttons/
      buttons: [
         { extend: 'print', className: 'btn dark btn-outline', text: 'طباعة', exportOptions: { columns: ':visible' }  },
        //{ extend: 'pdf', className: 'btn green btn-outline' },
        //{ extend: 'csv', className: 'btn purple btn-outline ' },
        { extend: 'excel', className: 'btn yellow btn-outline ', exportOptions: { columns: ':visible' } },

        { extend: 'colvis', className: 'btn dark btn-outline', text: 'الحقول', exportOptions: { columns: ':visible' } }
      ],

      // scroller extension: http://datatables.net/extensions/scroller/
      deferRender: true,
      responsive: false,

      "scrollY": 400,
      "scrollX": true,

      stateSave: true,

      "order": [
        [1, 'asc']
      ],

      "lengthMenu": [
        [25, 50, 100, -1],
        [25, 50, 100, "الكل"] // change per page values here
      ],
      // set the initial value
      "pageLength": 10,

      "dom":
        "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable

      // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
      // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js).
      // So when dropdowns used the scrollable div should be removed.
      //"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
    });
  };

    return {

        //main function to initiate the module
        init: function () {

            if (!jQuery().dataTable) {
                return;
            }

            initTable1();

      },
      destroy: function () {



        oTable.fnDestroy();

      }


    };

}();

jQuery(document).ready(function() {
   // TableDatatablesScroller.init();
});