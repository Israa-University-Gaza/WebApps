<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Job_AddEdit.aspx.cs" Inherits="APP_HRM_Job_AddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu7').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Job_AddEdit.aspx" class="font-ha">المسميات الوظيفية</a></li>
    </ul>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN VALIDATION STATES-->
            <% if (Permissions.Contains("JobTitleView"))
               { %>
            <div class="col-md-6">
                <div class="portlet box red">
                    <div class="portlet-title">
                        <div class="caption"><i class="fa fa-cogs"></i>المسميات الوظيفية </div>
                        <div class="tools">
                            <a class="remove" href="javascript:;"></a>
                            <a href="javascript:;" class="collapse"></a>

                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="table-responsive">
                            <div class="input-group input-medium">
                                <asp:TextBox ID="txtNameFilter" runat="server" class="form-control"></asp:TextBox>
                                <span class="input-group-btn">
                                    <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btnFilter_Click" class="btn btn-primary" />

                                </span>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 20%">المسمى الوظيفي</th>

                                            <th style="width: 20%; text-align: center">القسم</th>
                                            <th style="width: 15%"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource6">
                                            <ItemTemplate>
                                                <asp:Label ID="JobTitleID" runat="server" Text='<%# Eval("Job_Title_ID") %>' Visible="false"></asp:Label>
                                                <tr>
                                                    <td><span><%# Eval("Ar_Job_Name") %></span></td>

                                                    <td style="text-align: center"><span><%# Eval("DepartmentName") %></span></td>
                                                    <td style="text-align: center">
                                                        <% if (Permissions.Contains("JobTitleEdit"))
                                                           { %>
                                                        <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                        <%} %>
                                                        <% if (Permissions.Contains("JobTitleDelete"))
                                                           { %>
                                                        <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                        <%} %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                            ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                            SelectCommand="JobTitleGetAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%} %>
            <% if (Permissions.Contains("JobTitleAdd") || Permissions.Contains("JobTitleEdit"))
               { %>
            <div class="col-md-6">
                <div class="portlet box blue ">
                    <div class="portlet-title">
                        <div class="caption"><i class="fa fa-reorder"></i>المسميات الوظيفية </div>
                        <div class="tools">
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <!-- BEGIN FORM-->
                        <div class="form-horizontal">
                            <div class="form-body">
                                <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
                                <div class="form-group">
                                    <label class="control-label col-md-5">المسمى الوظيفي بالعربية</label>
                                    <div class="col-md-7">
                                        <asp:TextBox ID="Ar_Title" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <label class="control-label col-md-5">المسمى الوظيفي بالانجليزية</label>
                                    <div class="col-md-7">
                                        <asp:TextBox ID="En_Title" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <label class="control-label col-md-5">القسم</label>
                                    <div class="col-md-7">
                                        <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="SqlDataSource4" DataTextField="Ar_Name" DataValueField="Department_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                            SelectCommand="SELECT Department_ID,Ar_Name FROM [Department_TB] WHERE IsDelete=0 union select -1,N'اختر القسم' "></asp:SqlDataSource>

                                    </div>
                                </div>
                            </div>
                            <div class="form-actions fluid">
                                <div class="col-md-offset-3 col-md-9">
                                    <asp:Button ID="Button1" runat="server" Text="حفظ" class="btn green" OnClick="Button1_Click" />
                                    <asp:Button ID="Button2" runat="server" Text="الغاء الأمر" class="btn default" OnClick="Button2_Click" />

                                </div>
                            </div>
                        </div>
                        <!-- END FORM-->
                    </div>
                    <!-- END VALIDATION STATES-->
                </div>
            </div>
            <%} %>
        </div>
    </div>

</asp:Content>
