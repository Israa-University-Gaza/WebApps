


/////////////////////////////////////


jQuery(document).ready(function() {
    DataTableGo();

    $("#btnSearch").click(function() {
        a.submitFilter();
    });

    //$(".modal").on("hidden.bs.modal",
    //    function() {
    //        a.submitFilter();
    //    });
    a.submitFilter();
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
                { "data": "TransactionTypeName", "name": "TransactionTypeName" },
                {
                    data: "TransactionDate",
                    name: "TransactionDate",
                    render: function(data, type, row) {
                        const d = new Date(data);
                        var month = `${d.getMonth() + 1}`,
                            day = `${d.getDate()}`;
                        const year = d.getFullYear();

                        if (month.length < 2) month = `0${month}`;
                        if (day.length < 2) day = `0${day}`;

                        return [year, month, day].join("/");
                    }
                },
                { "data": "Quantity", "name": "Quantity" },
                { "data": "RepositoryDepartmentName", "name": "RepositoryDepartmentName" },
                { "data": "ToRepositoryDepartmentName", "name": "ToRepositoryDepartmentName" },
                { "data": "Price", "name": "Price" },
                { "data": "SupplierName", "name": "SupplierName" },
                { "data": "DepartmentId", "name": "DepartmentId" },
                { "data": "QuantityAfterInventory", "name": "QuantityAfterInventory" },
	            {
		            "targets": -1,
		            "data": null,
		            "defaultContent": ""
	            }
              
            ],

            ajax: {
	            url: "/Repository/RepositoryBalance/LoadMaterialsDetails"
	            //"type": "POST",
	            //"datatype": "json",
	            //"data": function (d) {
	            //    //return $.extend({}, d, {
	            //    //    "getMaterialDetailsOutput.MaterialId": $('#MaterialId').val()
	            //    //});
	            //    d.matid = $("#MaterialId").val();
	            //}
            },


        }
    });


}








