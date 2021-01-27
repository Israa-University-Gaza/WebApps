<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="PeriodicDetailsAddEdit.aspx.cs" Inherits="Library_PeriodicDetailsAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link rel="stylesheet" href="../assets/plugins/data-tables/DT_bootstrap_rtl.css" />
    <link href="assets/css/themes/default-rtl.css" rel="stylesheet" type="text/css" id="style_color" />
    <link href="assets/css/custom-rtl.css" rel="stylesheet" type="text/css" />
    <link href="assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="assets/datepicker/datetimepicker.css" rel="stylesheet" />
    <style>
        .input-large {
            width: 100% !important;
        }
    </style>
    <style type="text/css">
        .button-link {
            padding: 10px 15px;
            font-size: 14px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .isra-inline {
            display: inline-block !important;
            width: 100% !important;
            margin: 0px 0 13px 0 !important;
            font-size: 18px !important;
        }

        .inlineh {
            font-family: hasanin;
            font-size: 16px;
            display: block;
            margin: 15px;
        }

        #sample_editable_1_filter, #sample_editable_1_info, #sample_editable_1_length, #sample_editable_11_filter, #sample_editable_11_info, #sample_editable_11_length, #sample_editable_12_filter, #sample_editable_12_info, #sample_editable_12_length, #sample_editable_13_filter, #sample_editable_13_info, #sample_editable_13_length {
            display: none !important;
        }

        .pagination {
            display: none !important;
        }

        .input-small {
            width: 100% !important;
        }

        .table-scrollable {
            margin: 0px !important;
        }

        button {
            font-family: hasanin !important;
        }
    </style>
    <script type="text/javascript" src="../assets/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../assets/plugins/data-tables/DT_bootstrap.js"></script>
    <script src="../assets/scripts/table-editable.js"></script>
    <script type="text/javascript" src="assets/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/datepicker/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="assets/datepicker/clockface.js"></script>
    <script type="text/javascript" src="assets/datepicker/moment.min.js"></script>
    <script type="text/javascript" src="assets/datepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="assets/datepicker/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/datepicker/bootstrap-datetimepicker.min.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <script src="assets/datepicker/metronic.js" type="text/javascript"></script>

    <script src="assets/datepicker/quick-sidebar.js" type="text/javascript"></script>
    <script src="assets/datepicker/demo.js" type="text/javascript"></script>
    <script src="assets/datepicker/components-pickers.js"></script>
    <script>
        jQuery(document).ready(function () {
            TableEditable.init();
            Demo.init(); // init demo features
            ComponentsPickers.init();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <div class="row">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="glyphicon glyphicon-book"></i>بيانات أعداد الدوريات</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="clearfix"></div>
                        <asp:Label ID="Label1" runat="server" Text="1" Visible="false"></asp:Label>
                        <div class="form-group">
                          <%--  <div class="btn-group col-md-2">
                          
                             
                                    <asp:Button ID="sample_editable_1_new3" runat="server" Text="+"  Font-Size="Large"   CssClass="btn green"   />
                        
                            </div>--%>
                            <div class="col-md-12">
                                <table class="table table-striped table-hover table-bordered" id="sample_editable_13">
                                    <thead>
                                        <tr>
                                           <%-- <th style="width: 5%!important; text-align: center">#</th>--%>
                                            <th style="width: 20%!important; text-align: center">رقم المجلد </th>
                                            <th style="width: 20%!important; text-align: center">رقم العدد</th>
                                            <th style="width: 15%!important; text-align: center">تاريخ النشر</th>
                                               <th style="width: 15%!important; text-align: center"></th>
                                            <th style="width: 15%!important; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                        
                                           <td><asp:TextBox ID="FolderNo" runat="server" CssClass="form-control"></asp:TextBox></td>
                                           <td> <asp:TextBox ID="PeriodicNo" runat="server" CssClass="form-control"></asp:TextBox></td>
                                           <td> <asp:TextBox ID="date" runat="server" CssClass="form-control form-control-inline input-large date-picker" data-date-format="yyyy/mm/dd"></asp:TextBox></td>
                                           <td><asp:Button ID="Button1" runat="server" Text="حفظ" class="btn default btn-xs green" OnClick="Button1_Click"   /></td>
                                             <td></td>
                                       </tr>
                                      
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
                                            <ItemTemplate>
                                                <tr>
                                                   <asp:Label ID="Label2" runat="server" Visible="false"  Text=' <%# Eval("ID") %>' ></asp:Label>
                                                <td>
                                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text=' <%# Eval("FolderNo") %>' Enabled="false"></asp:TextBox></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"  Text=' <%# Eval("PeriodicNo") %>'  Enabled="false"></asp:TextBox></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"  Text=' <%# Eval("PeriodicNoDate","{0:yyyy/MM/dd}") %>'  Enabled="false"></asp:TextBox></td>
                                          <td>  <asp:Button ID="lbEdit" runat="server" Text="تحرير" class="btn default btn-xs black" OnClick="lbEdit_Click" /></td>
                                          <td><asp:Button ID="Button2" runat="server" Text="تكشيف المقالات" class="btn default btn-xs green" OnClick="Button2_Click"   /></td>

                                                      </tr>
                                                     </ItemTemplate>

                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="PeriodicDetailsGet" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="BookID" DefaultValue="1" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>

                </div>

            </div>

        </div>

      </div>
</asp:Content>

