<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="InsertBook.aspx.cs" Inherits="Library_InsertBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="glyphicon glyphicon-book"></i>إضافة كتاب</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                            <label class="col-md-2 control-label">الرقم العام</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="PublicID" runat="server" CssClass="form-control " placeholder="الرقم العام"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">الباركود</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="Barcode" runat="server" CssClass="form-control " placeholder="الباركود"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">رقم التصنيف</label>
                            <div class="col-md-4">
                          
                                <asp:TextBox ID="DDCat" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">نوع الموضوع</label>
                            <div class="col-md-4">
                                <asp:DropDownList class="select2_category form-control" ID="DDType" runat="server"  DataSourceID="SqlDataSource8" DataTextField="SubConstantName" DataValueField="SubConstantID"  OnSelectedIndexChanged="DDType_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT SubConstantID,SubConstantName FROM [SubConstantTB] WHERE ([ConstantID] = @ConstantID) union select 0,N''">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">العنوان الرئيس</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="Title1" runat="server" CssClass="form-control " placeholder="العنوان الرئيس"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">العنوان الموازي</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="Title2" runat="server" CssClass="form-control " placeholder="العنوان الموازي"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">العنوان الشارح</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="Title3" TextMode="MultiLine" Rows="1" runat="server" CssClass="form-control " placeholder="الرجاء ادخال العنوان الشارح"></asp:TextBox>
                            </div>
                        </div>
                        <div id="next" runat="server" visible="false">
                        <div class="clearfix"></div>
                        <h1 class="inlineh"><i class="fa fa-paste (alias)" style="margin: 0 20px!important"></i>مقاس الكتاب</h1>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">الطول</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="Height" runat="server" CssClass="form-control " placeholder="الطول"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">العرض</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="Width" runat="server" CssClass="form-control " placeholder="العرض"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">عدد النسخ</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="CopyCount" runat="server" CssClass="form-control " placeholder="عدد النسخ"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">وضع الكتاب</label>
                            <div class="col-md-4">
                                <asp:DropDownList class="select2_category form-control" ID="BookStatus" runat="server" DataSourceID="SqlDataSource7" DataTextField="SubConstantName" DataValueField="SubConstantID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT SubConstantID,SubConstantName FROM [SubConstantTB] WHERE ([ConstantID] = @ConstantID) union select 0,N''">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="3" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                             <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">عدد الصفحات</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="PagesCount" runat="server" CssClass="form-control " placeholder="عدد الصفحات"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">حالة الكتاب</label>
                            <div class="col-md-4">
                                <asp:DropDownList class="select2_category form-control" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="SubConstantName" DataValueField="SubConstantID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT SubConstantID,SubConstantName FROM [SubConstantTB] WHERE ([ConstantID] = @ConstantID) union select 0,N''">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="6" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">لغة الكتاب</label>
                            <div class="col-md-4">
                                <asp:DropDownList class="select2_category form-control" ID="BookLang" runat="server" DataSourceID="SqlDataSource6" DataTextField="SubConstantName" DataValueField="SubConstantID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT SubConstantID,SubConstantName FROM [SubConstantTB] WHERE ([ConstantID] = @ConstantID) union select 0,N''">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="5" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <label class="col-md-2 control-label">Tdmak</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="Tdmak" runat="server" CssClass="form-control " placeholder="tdmak"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">مستخلص الكتاب</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="BookSummary" TextMode="MultiLine" Rows="3" runat="server" CssClass="form-control " placeholder="مستخلص الكتاب"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                               <div id="per" runat="server" visible="false">
                                                    <h1 class="inlineh"><i class="fa fa-paste (alias)" style="margin: 0 20px!important"></i> بيانات العدد</h1>
                                   <asp:Button ID="Button2" runat="server" Text=" انتقل الى بيانات العدد "  CssClass="btn purple " OnClick="Button2_Click"  />

                        <div class="clearfix">

                        </div></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">عدد المجلدات</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="FolderCount" runat="server" CssClass="form-control " placeholder="عدد المجلدات"></asp:TextBox>
                                 <asp:CheckBox ID="CheckBox2" runat="server" Text="تكرار بعدد المجلدات" />
                            </div>
                            <label class="col-md-2 control-label">رقم المجلد</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="FolderNo" runat="server" Enabled="false" CssClass="form-control " placeholder="رقم المجلد"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                             <div class="form-group">
                            <label class="col-md-2 control-label">عدد الاجزاء</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="PartsCount" runat="server" CssClass="form-control " placeholder="عدد المجلدات"></asp:TextBox>
                                <asp:CheckBox ID="CheckBox1" runat="server" Text="تكرار بعدد الاجزاء" />
                                 </div>
                            <label class="col-md-2 control-label">رقم الجزء</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="PartsNo" runat="server" Enabled="false" CssClass="form-control " placeholder="رقم المجلد"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">موقع الكتاب</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="BookPlace" runat="server" CssClass="form-control " placeholder="موقع الكتاب"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">طريقة الحصول علي الكتاب</label>
                            <div class="col-md-2">
                                <asp:DropDownList class="select2_category form-control" ID="BookGet" runat="server" DataSourceID="SqlDataSource5" DataTextField="SubConstantName" DataValueField="SubConstantID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT SubConstantID,SubConstantName FROM [SubConstantTB] WHERE ([ConstantID] = @ConstantID) union select 0,N''">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="4" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                             <div class="form-group">
                            <label class="col-md-1 control-label"> اسم الجهة</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="BookGetName" runat="server" CssClass="form-control " placeholder="اسم الجهة"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                              <h1 class="inlineh"><i class="fa fa-truck" style="margin: 0 20px!important"></i>القائمين على الكتاب</h1>
                                 <div class="clearfix"></div>
                            <div class="btn-group col-md-2">
                                <label class="col-md-8 control-label">الاسم  </label>
                                    <asp:Button ID="btnAuthor" runat="server" Text="+"  Font-Size="Large"   CssClass="btn green" OnClick="Author_Click"  />
                            </div>
                            <div class="col-md-8">
                                <table class="table table-striped table-hover table-bordered" id="">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%!important; text-align: center">#</th>
                                            <th style="width: 50%!important; text-align: center"> الاسم</th>
                                            <th style="width: 20%!important; text-align: center">النوع</th>
                                            <th></th>
                                      
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td> </td>
                                            <td> <asp:TextBox ID="Author" runat="server" CssClass="form-control"></asp:TextBox></td>
                                            <td><asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource9" DataTextField="SubConstantName" DataValueField="SubConstantID"></asp:DropDownList></td>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT [SubConstantID], [SubConstantName] FROM [SubConstantTB] WHERE ([ConstantID] = @ConstantID) and SubConstantID != 9">
                                                 <SelectParameters>
                                                     <asp:Parameter DefaultValue="2" Name="ConstantID" Type="Int32"></asp:Parameter>
                                                 </SelectParameters>
                                             </asp:SqlDataSource>
                                            <td><asp:Button ID="Save" runat="server" Text="حفظ" class="btn default btn-xs green" OnClick="Author_Click"  /></td>
                                             </tr>

                                         <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                            <ItemTemplate>
                                                <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Visible="false" Text='<%# Eval("ID") %>'></asp:Label></td>
                                                <td> <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Eval("PersonName") %>' Enabled="false"></asp:TextBox></td>
                                         <td>
                                             <asp:DropDownList ID="DropDownList11" CssClass="form-control" runat="server" selectedValue='<%# Eval("SubConstantID") %>' DataSourceID="SqlDataSource9" DataTextField="SubConstantName" DataValueField="SubConstantID" Enabled="false"></asp:DropDownList>
                                            
                                         </td>
                                                      <td>
                                             <asp:Button ID="lbEdit" runat="server" Text="تحرير" class="btn default btn-xs black" OnClick="lbEdit_Click"  /></td>
                                                     
                                                </tr>

                                                     </ItemTemplate>

                                        </asp:Repeater>
                                         
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT *  FROM [BookPersons] WHERE ([BookID] = @BookID)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="BookID"  Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                            </div>
                           
                        </div>
                       
                      
                        <div class="clearfix"></div>
                        <h1 class="inlineh"><i class="fa fa-truck" style="margin: 0 20px!important"></i>بيانات الناشر</h1>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <div class="btn-group col-md-2">
                                <label class="col-md-8 control-label">الناشر</label>
                               <%-- <button id="sample_editable_1_new3" class="btn green" runat="server" onclick="">--%>
                                    <asp:Button ID="sample_editable_1_new3" runat="server" Text="+"  Font-Size="Large"   CssClass="btn green"  OnClick="PublishAdd_Click" />
                             <%--       <i class="fa fa-plus"></i>--%>
                               <%-- </button>--%>
                            </div>
                            <div class="col-md-8">
                                <table class="table table-striped table-hover table-bordered" id="sample_editable_13">
                                    <thead>
                                        <tr>
                                           <%-- <th style="width: 5%!important; text-align: center">#</th>--%>
                                            <th style="width: 40%!important; text-align: center">اسم الناشر</th>
                                            <th style="width: 40%!important; text-align: center">العنوان</th>
                                            <th style="width: 15%!important; text-align: center">سنة النشر</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                        
                                           <td><asp:TextBox ID="PubName" runat="server" CssClass="form-control"></asp:TextBox></td>
                                           <td> <asp:TextBox ID="PubPlace" runat="server" CssClass="form-control"></asp:TextBox></td>
                                           <td> <asp:TextBox ID="PubYear" runat="server" CssClass="form-control"></asp:TextBox></td>
                                           <td><asp:Button ID="Button1" runat="server" Text="حفظ" class="btn default btn-xs green" OnClick="PublishAdd_Click"  /></td>

                                       </tr>
                                      
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <tr>
                                                   <asp:Label ID="Label2" runat="server" Visible="false" Text='<%# Eval("ID") %>'></asp:Label>
                                                <td>
                                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Eval("PublisherName") %>' Enabled="false"></asp:TextBox></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Eval("PublisherPlace") %>' Enabled="false"></asp:TextBox></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Eval("PublisherYear") %>' Enabled="false"></asp:TextBox></td>
                                          <td>  <asp:Button ID="lbEdit" runat="server" Text="تحرير" class="btn default btn-xs black" OnClick="lbEdit2_Click"  /></td>
                                                     </tr>
                                                     </ItemTemplate>

                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT * FROM [Publisher] WHERE ([BookID] = @BookID)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="BookID" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">ملاحظات</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="Notes" TextMode="MultiLine" Rows="3" runat="server" CssClass="form-control " placeholder="ملاحظات"></asp:TextBox>
                            </div>
                        </div>
                            <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">الايضاحات</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="Explain" TextMode="MultiLine" Rows="3" runat="server" CssClass="form-control " placeholder="ملاحظات"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">عنوان السلسلة</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="SeriesTitle" runat="server" CssClass="form-control " placeholder="عنوان السلسلة"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">رقم السلسلة</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="SeriesNo" runat="server" CssClass="form-control " placeholder="رقم السلسلة"></asp:TextBox>
                            </div> 
                        </div>
                       <%-- <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">عدد الاجزاء</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="TextBox25" runat="server" CssClass="form-control " placeholder="عدد الاجزاء"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">رقم الجزء</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="TextBox26" runat="server" CssClass="form-control " placeholder="رقم الجزء"></asp:TextBox>
                            </div>
                        </div>--%>
                                  <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">الطبعة</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="Edition" runat="server" CssClass="form-control " placeholder="الطبعة"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">المرفقات</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="Attach" runat="server" CssClass="form-control " placeholder="المرفقات"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">تاريخ الورود</label>
                            <div class="col-md-4">
                                <div class="input-icon">
                                    <i class="fa fa-calendar" style="right: 0px;"></i>
                                    <asp:TextBox ID="EntryDate" runat="server" placeholder="EX : 2015/06/11" CssClass="form-control form-control-inline input-large date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">تاريخ التعديل</label>
                            <div class="col-md-4">
                                <div class="input-icon">
                                    <i class="fa fa-calendar" style="right: 0px;"></i>
                                    <asp:TextBox ID="UpdateDate" runat="server" Enabled="false" placeholder="EX : 2015/06/11" CssClass="form-control form-control-inline input-large date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">رؤوس الموضوعات</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="SubjectHead" TextMode="MultiLine" Rows="3" runat="server" CssClass="form-control " placeholder="رؤوس الموصوعات"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-2 col-md-9">
                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green"  OnClick="btnSave_Click"/>
                            <asp:Button ID="btnCancel" runat="server" Text="تفريغ الحقول" CssClass="btn default" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

