


/////////////////////////////////////


jQuery(document).ready(function() {
    DataTableGo();

    //$("#btnSearch").click(function() {
    //    a.submitFilter();
    //});

    //$(".modal").on("hidden.bs.modal",
    //    function() {
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
            "columns": [
                { "data": "MaterialName", "name": "MaterialName" },
                { "data": "MaterialUnitName", "name": "MaterialUnitName" },
                {
                    data: "Id",
                    name: "Id",
                    "targets": 0,
                    render: function(data, type, row) {

                        return `<a href="/Repository/RepositoryBalance/IndexAllMaterialDetails?materialId=${data
                            }"class="btn btn-xs green  btn-outline">  <i class="fa fa-search"></i> تفاصيل </a>`;

                        //return `<a href="/Repository/RepositoryBalance/IndexAllMaterialDetails?materialId=${data}"class="btn btn-XS btn-outline grey-salsa"> <i class="fa fa-search"></i> تفاصيل </a>`;



                    },
                    "orderable": false,
                    "searchable": false

                }
            ],

            "ajax": {
	            "url": "/Repository/RepositoryBalance/LoadMaterialsData",
            },

        }
    });


}




