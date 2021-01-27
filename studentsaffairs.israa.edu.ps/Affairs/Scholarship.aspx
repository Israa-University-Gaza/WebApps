<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="Scholarship.aspx.cs" Inherits="Affairs_Scholarship" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu1').addClass("active open");
            $('#menu1 a').css("background-color", "#575757");
            $('#menu1 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">شؤون الطلاب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>المنح والإعفاءات</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>المنح والإعفاءات</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 48%">المنحة</th>
                                <th style="width: 15%; text-align: center">نوع المنحة</th>
                                <th style="width: 15%; text-align: center">القيمة</th>
                                <th style="width: 10%; text-align: center">فعال</th>
                                <th style="width: 12%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("ArName") %></span></td>
                                        <td style="text-align: center"><span><%# (Eval("RVType").ToString() == "1")? "نسبة" : "قيمة" %></span></td>
                                        <td style="text-align: center"><span><%# (Eval("RVType").ToString() == "1")? Eval("value") + " %" : Eval("value") %></span></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' /></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i></a></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="SELECT * From [Action] where [IsScholarship]=1 and [IsDelete]=0 order by ID"></asp:SqlDataSource>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:Label ID="lblScholarshipID" runat="server" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل المنح والاعفاءات</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">المسمى بالعربية</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtArName" runat="server" class="form-control" placeholder="الرجاء ادخال اسم الحركة بالعربي"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">المسمى بالإنجليزية</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtEnName" runat="server" class="form-control" placeholder="الرجاء ادخال اسم الحركة بالإنجليزي"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">قيمة المنحة</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtvalue" runat="server" class="form-control" placeholder="الرجاء ادخال قيمة الحركة"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label"></label>
                                <div class="col-md-8">
                                    <asp:RadioButton ID="rbRate" runat="server" GroupName="rv" Text="% نسبة" Checked="true" />
                                    <asp:RadioButton ID="rbValue" runat="server" GroupName="rv" Text="قيمة" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label"></label>
                                <div class="col-md-8">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
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

