

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
                        $(node).attr('href', '/Repository/Transaction/AddImport');
                    }
                }
            ],
            columns: [
                { "data": "studentNo", "name": "studentNo" },
                { "data": "studentName", "name": "studentName" },
                { "data": "studentType", "name": "studentType" },
                { "data": "collegeName", "name": "collegeName" },
                { "data": "departmentName", "name": "departmentName" },
                {
                    "data": "StudentID",
                    "name": "StudentID",
                    width: 100,
                    render: function (data) {
                        return `<div class="btn-group ">
                                                        <button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> اجراءات
                                                            <i class="fa fa-angle-down"></i>
                                                        </button>
                                                        <ul class="dropdown-menu" role="menu">
                                                            <li>
                                                                <a href="/Affairs/StudentVolunteer/Add?studentId=`+ data + `" class="pop-up-lg"> اضافة ساعات تطوع </a>
                                                            </li>
<li>
                                                                <a href="/Affairs/StudentVolunteer/Print?studentId=`+ data + `"> طباعة </a>
                                                            </li>
                                                        </ul>
                                                    </div>`
                    }
                }

            ],

            ajax: {
                url: "/Academic/Student/LoadData",
            }
        }
    });
}






