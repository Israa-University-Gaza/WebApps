<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="LibraryRegisterReport.aspx.cs" Inherits="Library_LibraryRegisterReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption font-ha"><i class="fa fa-search"></i>كشف دخول المكتبة</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
         <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                            <label class="col-md-2 control-label">من تاريخ</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="from" runat="server"  data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" ></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">حتى تاريخ </label>
                            <div class="col-md-2">
                                     <asp:TextBox ID="to" runat="server" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" ></asp:TextBox>
                                      
                            </div>
                     <div class="col-md-2">
                                   
                                      <asp:Button ID="Button2" runat="server" Text="عرض" CssClass="btn green" />
                            </div>
                            </div>
                <div class="clearfix"></div>
                <div class="form-group">

                    <asp:Button ID="print" runat="server" Text="طباعة تقرير" CssClass="btn green" OnClick="print_Click"   />
                    </div>
                <div class="form-group">
                                   <% if (Repeater1.Items.Count > 0)
                               { %>     
                                <table  class="table">
                                    <thead>
                                        <tr>
                                           <%-- <th style="width: 5%!important; text-align: center">#</th>--%>
                                              <th style="width: 5%!important; ">رقم  </th>
                                            <th style="width: 60%!important; ">اسم الطالب </th>
                                            <th style="width: 35%!important; ">التاريخ</th>
                                      <th style="width: 35%!important; ">الوقت</th>
                                            <th ></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
                                      
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="ID" Visible="false" runat="server" Text=' <%# Eval("ID") %>'></asp:Label>
                                                    <td style="width: 18%!important;"><%# Eval("RowNumber") %></td>
                                                    <td style="width: 18%!important;"><%# Eval("DisplayName") %></td>
                                                    <td style="width: 20%!important;"><%# Eval("LibDate","{0:yyyy/MM/dd}") %></td>
                                                   <td style="width: 20%!important;"><%# Eval("LibTime") %></td>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="LibraryRegisterReport" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                        <asp:ControlParameter ControlID="from" PropertyName="Text" DbType="Date" Name="From"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="to" PropertyName="Text" DbType="Date" Name="To"></asp:ControlParameter>                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>

                    
                                             <div class="clearfix"></div>
                            <% }
                               else
                               { %>

                       <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد نتائج للبحث</strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                          <% } %>
               </div>
                </div>
            </div>
         </div>
</asp:Content>

