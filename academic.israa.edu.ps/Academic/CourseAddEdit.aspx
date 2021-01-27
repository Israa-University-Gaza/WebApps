<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="CourseAddEdit.aspx.cs" Inherits="Academic_CourseAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu20').addClass("active open");
            $('#menu2_1 a').css("background-color", "#575757");
            $('#menu20 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>المساقات</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="Program.aspx">عرض البرامج</a></li>
                <li class="font-ha"><a href="College.aspx">عرض الكليات</a></li>
                <li class="font-ha"><a href="Department.aspx">عرض الأقسام</a></li>
                <li class="font-ha"><a href="CourseView.aspx">عرض المساقات</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">

        <div class="col-md-12">
            <div class="portlet box blue">
                <asp:Label ID="EmpID" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="lblCourseID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل مساق</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label">الكود</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtCourseCode" runat="server" CssClass="form-control" placeholder="الرجاء ادخال كود المساق"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">الإسم بالعربية</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtArName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم المساق بالعربي"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">الإسم بالإنجليزية</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtEnName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم المساق بالإنجليزي"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">البرنامج</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlProgram" runat="server" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeePrograms" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">الكلية</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCollege" runat="server" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeCollages" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">القسم</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeDepartments" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="EmpID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">تصنيف المساق</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCCourseType" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [ConstantDetails] WHERE ((ConstantID = 5) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر نوع المساق'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">المتطلب السابق للمساق</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlPreRequest" runat="server" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID,  ('(' + CourseCode +') - ' + ArName)as ArName FROM [Course] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر المساق'"></asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 control-label">المستوى الدراسي</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlStudyLevel" runat="server" DataSourceID="SqlDataSource7" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="ddlStudyLevels" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">الفصل الدراسي</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlSemester" runat="server" AutoPostBack="true" CssClass="select2_category form-control" >
                                        <asp:ListItem Value="-1" Selected="True">اختر الفصل الدراسي</asp:ListItem>
                                        <asp:ListItem Value="1">الفصل الدراسي الأول</asp:ListItem>
                                        <asp:ListItem Value="2">الفصل الدراسي الثاني</asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">نوع المساق</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCourseType" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlCourseTypes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">عدد الساعات</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtNumOfHours" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال عدد ساعات المساق"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-4">
                                    <asp:CheckBox ID="cbHaveDiscussion" runat="server" Text="يوجد مناقشة" />
                                    <asp:CheckBox ID="cbHaveLab" runat="server" Text="يوجد عملي" />
                                </div>
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-4">
                                    <asp:CheckBox ID="cbIsScholarship" runat="server" Text="خارج المنح والإعفاءات" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-4">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
