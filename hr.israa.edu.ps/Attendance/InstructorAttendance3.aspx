<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="InstructorAttendance3.aspx.cs" Inherits="Attendance_InstructorAttendance3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="../assets/datepicker/datetimepicker.css" rel="stylesheet" />


    <script type="text/javascript" src="../assets/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="../assets/datepicker/clockface.js"></script>
    <script type="text/javascript" src="../assets/datepicker/moment.min.js"></script>
    <script type="text/javascript" src="../assets/datepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-datetimepicker.min.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script src="../assets/datepicker/quick-sidebar.js" type="text/javascript"></script>
    <script src="../assets/datepicker/demo.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js"></script>
    <script>
        jQuery(document).ready(function () {
            QuickSidebar.init(); // init quick sidebar
            Demo.init(); // init demo features
            ComponentsPickers.init();
        });
    </script>
     <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu4').addClass("active open");
            $('#menu4_8 a').css("background-color", "#575757");
            $('#menu4 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">دوام المحاضر</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>دوام المحاضر </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>
            </div>
        </div>
        <div class="portlet-body">
            <div class="form-group row">
                <label class="control-label col-md-2">تصنيف الموظف  : </label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlEmployeeCat" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource12" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [Name] FROM TypeCategory where TypeID=1 union select-1,N'الكل' order by ID "></asp:SqlDataSource>
                </div>
                <label class="control-label col-md-2">نوع العقد: </label>
                <div class="col-md-2">
                    <asp:DropDownList ID="ddlContractTypeID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource6" DataTextField="Contract_Type" DataValueField="Contract_Type_ID"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Contract_Type_ID], [Contract_Type] FROM Contract_Type_TB union select-1,N'الكل' "></asp:SqlDataSource>
                </div>
                <div class="col-md-2">
                    <asp:DropDownList ID="ddlSubContractType" placeholder="ادخل نوع العقد مخصص" runat="server" DataSourceID="SqlDataSource13" DataTextField="ContractSubName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource13" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,ContractSubName FROM [ContractSubType] where Contract_Type_ID=@Type union select -1,N'الكل'">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="7" Name="Type"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="form-group row">
                <label class="control-label col-md-2">تصنيف دوام الموظف  : </label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlEmpCategoryID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpCategoryID_SelectedIndexChanged" DataSourceID="SqlDataSource3" DataTextField="CategoryName" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [CategoryName] FROM EmpCategory where ID=4 union select-1,N'الكل' order by ID "></asp:SqlDataSource>

                </div>
                <label class="control-label col-md-2">حالة الموظف: </label>
                <div class="col-md-4">
                    <asp:DropDownList ID="Empstatus" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" AutoPostBack="true" OnSelectedIndexChanged="Empstatus_SelectedIndexChanged"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select -1,N' الكل'">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="7" Name="Constant_ID" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
              
            </div>
            <div class="form-group row">
                <div class="form-group">
                    <label class="col-md-2 control-label" style="text-align: right">الفصل الدراسي </label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlSemester" runat="server" DataSourceID="SqlDataSource1" DataTextField="ArName" AutoPostBack="true" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT ID,[ArName] FROM [Semester] where IsDelete=0  and IsActive=1 and ID<>1 ORDER BY ID DESC"></asp:SqlDataSource>
                    </div>
                    <label class="col-md-2 control-label">اسم الموظف </label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlEmployee" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged" runat="server" DataSourceID="SqlDataSource2" DataTextField="DisplayName" DataValueField="Emp_ID"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetAllEmployeesName" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlEmpCategoryID" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpCategoryID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="Empstatus" PropertyName="SelectedValue" DefaultValue="" Name="EmpStatusID" Type="Int32"></asp:ControlParameter>
                               <asp:ControlParameter ControlID="ddlEmployeeCat" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeCatID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="-1" Name="ContractTypeID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlSubContractType" PropertyName="SelectedValue" DefaultValue="-1" Name="SubContractTypeID" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="form-group row">
                    <label class="col-md-2 control-label">من تاريخ </label>
                    <div class="col-md-4">
                        <div class="input-icon">
                            <i class="fa fa-calendar"></i>
                            <asp:TextBox ID="DateFrom" runat="server" AutoPostBack="true" OnTextChanged="date_TextChanged" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>
                    <label class="col-md-2 control-label">الى تاريخ </label>
                    <div class="col-md-4">
                        <div class="input-icon">
                            <i class="fa fa-calendar"></i>
                            <asp:TextBox ID="DateTo" runat="server" AutoPostBack="true" OnTextChanged="date_TextChanged" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>
              <div class="form-group row">
                    <asp:Button ID="btnLate" runat="server" Text="طباعة كشف التاخير" CssClass="btn blue" OnClick="btnLate_Click" />
                </div>
        </div>
        <div class="portlet-body">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-2">
                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource5">
                        <ItemTemplate>
                            <span>إجمالي عدد الساعات :</span>
                            <asp:Label ID="lblTotalHours" runat="server" Text='<%# Eval("TotalHours") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                        SelectCommand="GetInstructorAttendanceTotalHours" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <%--<asp:ControlParameter ControlID="DateFrom" Name="DateFrom" PropertyName="Text" Type="string" />
                            <asp:ControlParameter ControlID="DateTo" Name="DateTo" PropertyName="Text" Type="string" />--%>
                            <asp:ControlParameter ControlID="ddlEmployee" Name="EmployeeID" PropertyName="SelectedValue" Type="Int16" />
                            <asp:ControlParameter ControlID="ddlSemester" Name="SemesterID" PropertyName="SelectedValue" Type="string" DefaultValue="5" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnUpdate" runat="server" Text="تحديث العقد بإجمالي الساعات" CssClass="btn green" OnClick="btnUpdate_Click" />
                </div>
               
            </div>
            <br />
            <br />
            <table class="table table-striped">
                <thead>
                    <tr>

                    
                        <th style="width: 23%">اسم الموظف</th>
                        <th style="width: 8%">التاريخ </th>
                        <th style="width: 10%">وقت الحضور</th>
                        <th style="width: 10%">وقت الانصراف</th>
                        <th style="width: 17%">اسم المساق</th>
                        <th style="width: 5%">القاعة</th>
                        <th style="width: 10%">موعد المحاضرة</th>
                        <th style="width: 5%">ع.س المحاضرة</th>
                        <th style="width: 8%">ع.س دوام المحاضر</th>
                        <th style="width: 9%">ع. س </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>

                            <tr <%# Eval("IsLate").ToString()=="True"? "style='color:red;'" : "" %>>
                                <asp:Label ID="Date" runat="server" Text='<%# Eval("Date") %>' Visible="false"></asp:Label>

                                <td><%# Eval("EmployeeNo")%>  <%#Eval("DisplayName") %> </td>
                                <td><%# Eval("Date") %> </td>
                                <td><%# Eval("Attendance_From") %></td>
                                <td><%# Eval("Attendance_To") %></td>
                                <td><%# Eval("CourseArName") %></td>
                                <td><%# Eval("Room") %></td>
                                <td><%# Eval("LectureTime") %></td>
                                <td><%# Eval("lectureHours") %></td>
                                <td><%# Eval("InstructorLectureAttendanceHours") %></td>
                                <td><%# Eval("GetInstructorLectureCalculatedHour") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>


                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                        SelectCommand="GetInstructorAttendance3" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DateFrom" Name="DateFrom" PropertyName="Text" Type="string" />
                            <asp:ControlParameter ControlID="DateTo" Name="DateTo" PropertyName="Text" Type="string" />
                            <asp:ControlParameter ControlID="ddlEmployee" Name="EmployeeID" PropertyName="SelectedValue" Type="Int16" />
                            <asp:ControlParameter ControlID="ddlSemester" Name="SemesterID" PropertyName="SelectedValue" Type="string" DefaultValue="5" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>

