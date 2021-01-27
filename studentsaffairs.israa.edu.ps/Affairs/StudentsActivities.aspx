<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsActivities.aspx.cs" Inherits="Affairs_StudentsActivities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu3').addClass("active open");
            $('#menu3 a').css("background-color", "#575757");
            $('#menu3 a span.arrow').addClass("open");
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
                <span>الأنشطة الطلابية</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الأنشطة الطلابية</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 20%">الفصل الدراسي</th>
                                <th style="width: 15%">نوع النشاط</th>
                                <th style="width: 30%">النشاط</th>
                                <th style="width: 15%; text-align: center">تكاليف النشاط</th>
                                <th style="width: 10%; text-align: center">فعال</th>
                                <th style="width: 10%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("ArName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ActiveCost") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ActiveTitle") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ActiveNotes") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ActiveCost") %></span></td>
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
                                ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                SelectCommand="SELECT * From [StudentsActivities]  order by ID DESC"></asp:SqlDataSource>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل نشاط طلابي</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">طبيعة النشاط</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlActiveType" runat="server" class="form-control">
                                        <asp:ListItem Value="0">اختر النشاط الطلابي </asp:ListItem>
                                        <asp:ListItem Value="1">رياضي</asp:ListItem>
                                        <asp:ListItem Value="2">ثقافي</asp:ListItem>
                                        <asp:ListItem Value="3">أخري</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">الفصل الدراسي</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlSemester" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                        SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) And Code<>'111111111') union select -1,N'إختر الفصل الدراسي'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">تفاصيل النشاط</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtActiveNotes" runat="server" class="form-control" placeholder="الرجاء ادخال تفاصيل النشاط" TextMode="MultiLine" Rows="10"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">تكلفة النشاط</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtActiveCost" runat="server" class="form-control" placeholder="الرجاء ادخال تكلفة النشاط"></asp:TextBox>
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

