<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="BorrowBook.aspx.cs" Inherits="Library_BorrowBook" %>

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
                <div class="caption"><i class="glyphicon glyphicon-book"></i>الاعارة</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                            <label class="col-md-2 control-label">رقم المستعير</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="ID" runat="server" CssClass="form-control " placeholder="رقم المستعير" AutoPostBack="true" OnTextChanged="ID_TextChanged"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">الرقم العام للكتاب </label>
                            <div class="col-md-2">
                                <asp:TextBox ID="PublicID" runat="server" CssClass="form-control " placeholder="رقم الكتاب" AutoPostBack="true" OnTextChanged="PublicID_TextChanged"></asp:TextBox>
                            </div>
                            </div>
                           <div class="form-group">
                             <label class="col-md-2 control-label">  اسم الكتاب </label>
                            <div class="col-md-6">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                <asp:Label ID="BookID" runat="server" Text="" Visible="false"></asp:Label>
                             

                            </div>
                         
                        </div>
                        
                     
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-2 col-md-9">
                            <asp:Button ID="btnSave" runat="server" Text="اعارة" CssClass="btn green" OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="تفريغ الحقول" CssClass="btn default" OnClick="btnCancel_Click"  />
                        </div>
                    </div>
                </div>
            </div>

           
        </div>
          <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption"><i class="glyphicon glyphicon-book"></i>بيانات المستعير</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">
                  
                        
                             <div class="form-horizontal">
                    <div class="form-body">
                       
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" >
                            <ItemTemplate>
                                 <div class="form-group">
                        
                   
                                <label class="col-md-2 ">الاسم  </label>
                                  <div class="col-md-4">
                               <asp:Label ID="Label2"  runat="server" Text='<%#Eval("DisplayName") %>'></asp:Label> 

                                  </div>
                                 <label class="col-md-2 ">الفئة  </label>
                                  <div class="col-md-4">
                               <asp:Label ID="Label3"  runat="server" Text='<%#Eval("BorrowCatType") %>'></asp:Label> 
                               <asp:Label ID="BorrowCatID"  runat="server" Text='<%#Eval("BorrowCatID") %>' Visible="false"></asp:Label> 
                              
                            </div>

                           <div class="clearfix"></div>
                           
                                <label class="col-md-2 ">مدة الاعارة  </label>
                                  <div class="col-md-4">
                               <asp:Label ID="Label4"  runat="server" Text='<%#Eval("BorrowMaxDayCount") %>'></asp:Label> 

                                  </div>
                                 <label class="col-md-2 ">الحد الأقصى للكتب المعارة  </label>
                                  <div class="col-md-4">
                               <asp:Label ID="Label5"  runat="server" Text='<%#Eval("BorrowMaxBookCount") %>'></asp:Label> 

                               
                            </div>
                                 </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="BorrowerDataGet" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ID" PropertyName="Text" Name="BorrowerNo"  Type="String"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                               <div class="portlet-body">
                                        <h1 class="inlineh"><i class="fa fa-truck" style="margin: 0 20px!important"></i> الكتب المعارة للمستعير </h1>
                                 <div class="clearfix"></div>
                                   <asp:Button ID="Button1" runat="server" Text="طباعة تقرير" CssClass="btn green" OnClick="Button1_Click" />

                                      <% if (Repeater1.Items.Count > 0)
                               { %>
                        <table class="table">

                        <thead>
                            <tr>
                                <th style="width: 15%;font-size:10pt">الرقم العام</th>
                                <th style="width: 20%;font-size:10pt">عنوان الكتاب</th>
                                      <th style="width: 15%;font-size:10pt">تاريخ الطلب</th>
                                <th style="width: 15%;font-size:10pt">تاريخ الاعارة</th>
                                  <th style="width: 15%;font-size:10pt">تاريخ الارجاع</th>
                                        <th style="width: 10%; text-align: center;font-size:10pt">تجديد</th>
                                <th style="width: 10%; text-align: center;font-size:10pt">أعاده</th>
                                  <th style="width: 15%;font-size:10pt"> بتاريخ</th>
                                  
                               
                                <th style="width: 10%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="ID" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                                        <td><span><%#Eval("PublicID") %></span></td>
                                        <td><span><%#Eval("BookTitle") %></span></td>
                                        <td><span><%#Eval("RequestDate","{0:yyyy/MM/dd}") %></span></td>
                                        <td><span><%#Eval("BorrowDate","{0:yyyy/MM/dd}") %></span></td>
                                        <td><span><%#Eval("ReturnDate","{0:yyyy/MM/dd}") %></span></td>
                                          <td style="text-align: center">
                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%#Eval("RenewBook") %>' AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged"/>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbIsActive" runat="server" Checked='<%#Eval("IsReturned") %>' AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged"/>
                                        </td>
                                        <td><span><%#Eval("ActualReturnDate","{0:yyyy/MM/dd}") %></span></td>
                                    </tr>

                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="ClientBorrowBookGet" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ID" PropertyName="Text" Name="ClientID" Type="String"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table></div>
                    <div class="clearfix"></div>


                          <% }
                               else
                               { %>

                       <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong> لا يوجد كتب معارة </strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                          <% } %>
                    </div></div>
        </div>
    </div>
        </div>
</asp:Content>

