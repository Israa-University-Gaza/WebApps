<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="CurPrice_AddEdit.aspx.cs" Inherits="APP_HRM_CurPrice_AddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="../assets/datepicker/datetimepicker.css" rel="stylesheet" />
    <style>
        .input-medium {
            max-width: 187px !important;
        }
    </style>

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
               $('.page-sidebar-menu li').removeClass("active");
               $('#menu6').addClass("active");
           });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i><a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="CurPrice_AddEdit.aspx" class="font-ha">أسعار العملات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("CurrancyPriceView"))
           { %>
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>اضافة أسعارالعملات </div>
                    <div class="tools">
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

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 1%"></th>
                                    <th style="width: 18%">اسم العملة   </th>
                                    <th style="width: 22%">سعر صرف العملة </th>
                                    <th style="width: 30%">تاريخ سعر صرف العملة </th>
                                                  <th style="width: 19%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>

                                        <tr>
                                            <td style="text-align:center;">
                                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label></td>
                                            <td style="text-align:center;"><span><%# Eval("Cur_Ar_Name") %></span></td>
                                            <td style="text-align:center;"><span><%# Eval("Price") %> </span></td>
                                            <td style="text-align:center;"><span><%# Eval("Date","{0:yyyy/MM/dd}") %> </span></td>

                                            <td style="text-align: center">
                                                <% if (Permissions.Contains("CurrancyPriceEdit"))
                                                   { %>
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <%} %>
                                                <% if (Permissions.Contains("CurrancyPriceDelete"))
                                                   { %>
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                <%} %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="SELECT  dbo.CurrencyPrice_TB.ID, dbo.CurrencyPrice_TB.Cur_ID, dbo.CurrencyPrice_TB.Price, dbo.CurrencyPrice_TB.Date, dbo.Currency_TB.Cur_Ar_Name
                                  FROM   dbo.Currency_TB INNER JOIN
                                    dbo.CurrencyPrice_TB ON dbo.Currency_TB.Cur_ID = dbo.CurrencyPrice_TB.Cur_ID   where dbo.CurrencyPrice_TB.IsDelete=0  Order by Cur_ID desc  ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtNameFilter" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
        <% if (Permissions.Contains("CurrancyPriceAdd") || Permissions.Contains("CurrancyPriceEdit"))
           { %>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:TextBox ID="lblCurID" runat="server" Text="" Visible="false"></asp:TextBox>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل أسعار العملات  </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">

                 

                        <div class="form-horizontal">
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-6 control-label">اسم العملة باللغة العربية</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="txtName" class="form-control"  CssClass="select2_category form-control" placeholder="ادخل اسم العملة" runat="server" DataSourceID="SqlDataSource2" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select 0,N'  '"></asp:SqlDataSource>

                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-md-6 control-label">سعر صرف العملة  </label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="الرجاء ادخال سعر صرف العملة"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-6 control-label">تاريخ صرف العملة    </label>
                                    <div class="col-md-6">
                                        <div class="input-icon">
                                            <i class="fa fa-calendar"></i>

                                            <asp:TextBox ID="txtSDate" runat="server" placeholder="ادخل  تاريخ صرف العملة " class="form-control form-control-inline input-medium date-picker" type="text" value=""></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                        <div class="form-actions fluid">
                            <div class="col-md-offset-6 col-md-6">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>

</div>
              
                </div>
            </div>
        </div>
        <%} %>
    </div>
</asp:Content>


