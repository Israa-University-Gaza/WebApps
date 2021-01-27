<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="VolunteerRequirement.aspx.cs" Inherits="APP_HRM_VolunteerRequirement" %>

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
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu2').addClass("active");
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
        <li><a href="#" class="font-ha">بيانات المتطوع</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="VolunteerID" runat="server" Text="1" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>بيانات المتطوع </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>

                        <%--   <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>--%>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="horizontal-form">
                        <div class="form-body">
                            <h3 class="inlineh"><i class="fa fa-book" style="margin: 0 20px!important"></i>البيانات الأساسية </h3>
                            <div class="clearfix"></div>
                            <div class="form-group">
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <label class="control-label col-md-2">تاريخ الميلاد</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDOB" placeholder="ادخل تاريخ الميلاد" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>

                                </div>
                                <label class="control-label col-md-2">تلفون المنزل</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtTelephone" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                </div>
                            </div>
                         
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <label class="control-label col-md-2">جوال</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-2">البريد الالكتروني</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                </div>
                            </div>
                         
                            <div class="clearfix"></div>
                                <div class="form-group row">
                                <label class="control-label col-md-2">الوظيفة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtJob" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-2">جهة العمل </label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtCompanyName" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                            <div class="form-group">
                            </div>
                            <div class="clearfix"></div>

                            <h3 class="inlineh"><i class="fa fa-book" style="margin: 0 20px!important"></i>المستوى التعليمي  </h3>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <label class="control-label col-md-2"></label>
                                <div class="col-md-10">
                                    <asp:RadioButtonList ID="ddlEducation" Width="50%" RepeatColumns="3" runat="server" DataSourceID="SqlDataSource1" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" AutoPostBack="true" OnSelectedIndexChanged="ddlEducation_SelectedIndexChanged"></asp:RadioButtonList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID], [Ar_Name] FROM [Emp_Sub_Constant] where Constant_ID=12"></asp:SqlDataSource>
                                </div>
                            </div>

                            <div id="Div1" runat="server" visible="true" class="form-group row">
                                  <div id="EduName" runat="server" visible="false">
                                <label class="control-label col-md-2">اسم المؤهل العلمي </label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtQualName" placeholder="ادخل اسم المؤهل" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>

                                </div>
                                        </div>
                              
                                <label class="control-label col-md-2">اسم المؤسسة التعليمية:</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtUniversityName" placeholder="ادخل اسم المؤسسة" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>

                                </div>
                                  
                            </div>
                            <h3 class="inlineh"><i class="fa fa-book" style="margin: 0 20px!important"></i>كيف تعرفت على نشاط التطوع: </h3>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <label class="control-label col-md-2"></label>
                                <div class="col-md-10">
                                    <asp:CheckBoxList ID="cbKnown" Width="50%" RepeatColumns="3" runat="server" DataSourceID="SqlDataSource2" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:CheckBoxList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID], [Ar_Name] FROM [Emp_Sub_Constant] where constant_ID =1026"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div id="Div2" runat="server" visible="true" class="form-group row">
                                <label class="control-label col-md-2">اذكر وسيلة المعرفة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtKnownName" placeholder="ادخل اسم الوسيلة" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>

                                </div>
                            </div>
                            <div id="Div3" runat="server" visible="true" class="form-group row">
                                <label class="control-label col-md-2">اسم هيئة المجتمع المدني </label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtOrganization" placeholder="ادخل اسم هيئة المجتمع المدني " runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>

                                </div>
                            </div>

                            <h3 class="inlineh"><i class="fa fa-book" style="margin: 0 20px!important"></i>طبيعة النشاط الذي تريد التطوع فيه:</h3>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <label class="control-label col-md-2"></label>
                                <div class="col-md-10">
                                    <asp:CheckBoxList ID="cblActivity" Width="50%" RepeatColumns="3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:CheckBoxList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID], [Ar_Name] FROM [Emp_Sub_Constant] where constant_ID =1027"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div id="Div4" runat="server" visible="true" class="form-group row">
                                <label class="control-label col-md-2">اسم مجال التوعية </label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtScopeName" placeholder="اذكر مجال التوعية" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>

                                </div>
                            </div>
                            <div id="Div5" runat="server" visible="true" class="form-group row">
                                <label class="control-label col-md-2">اسم نشاط آخر </label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtOtherActivity" placeholder="أدخل اسم نشاط آخر " runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>

                                </div>
                            </div>
                          

                            <h3 class="inlineh"><i class="fa fa-book" style="margin: 0 20px!important"></i>مدة التطوع</h3>
                            <div class="clearfix"></div>

                            <div class="form-group row">
                                <label class="control-label col-md-2"></label>
                                <div class="col-md-10">
                                    <asp:RadioButtonList ID="rblPeriod" Width="50%" RepeatColumns="2" runat="server" DataSourceID="SqlDataSource4" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:RadioButtonList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID], [Ar_Name] FROM [Emp_Sub_Constant] where Constant_ID=1028"></asp:SqlDataSource>
                                </div>
                            </div>
                              <div class="form-group row">
                                <label class="control-label col-md-2">عدد ساعات التطوع يومياً:</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtVolunteerHours" placeholder="ادخل عدد الساعات" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                </div>
                            </div>
                            <h3 class="inlineh"><i class="fa fa-book" style="margin: 0 20px!important"></i>بدء فترة التطوع</h3>
                            <div class="clearfix"></div>


                            <div class="form-group row">
                                <label class="control-label col-md-2">تاريخ بداية الفتره</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                </div>
                                <label class="control-label col-md-2">تاريخ نهاية الفتره</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                </div>
                            </div>

                            <h3 class="inlineh"><i class="fa fa-book" style="margin: 0 20px!important"></i>المهارات والخبرات</h3>
                            <div class="clearfix"></div>
                            <%--         <asp:ListBox ID="ListBox1"  Width="50%" RepeatColumns="2" runat="server""></asp:ListBox>--%>
                            <div class="col-md-8">
                                <table class="table table-striped table-hover table-bordered" id="">
                                    <thead>
                                       
                                    </thead>
                                    <tbody>
                          <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                            <ItemTemplate>
                                                <tr>

                                                    <td  style="width: 20%">
                                                        <asp:Label ID="txtSkillID" runat="server" Visible="false" Text='<%# Eval("Sub_Constant_ID") %>'></asp:Label><span><%# Eval("Ar_Name") %></span></td>
                                                    <td style="width: 50%">
                                                        <asp:TextBox ID="txtQulification" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>


                                        <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID], [Ar_Name] FROM [Emp_Sub_Constant] where Constant_ID=1029"></asp:SqlDataSource>
                                    </tbody>

                                </table>
                            </div>
                                 <div class="clearfix"></div>
                           
                             <h3 class="inlineh"><i class="fa fa-book" style="margin: 0 20px!important"></i> شخص يمكن الاتصال به عند الضرورة</h3>
                            <div class="clearfix"></div>

                            <div class="form-group row">
                                <label class="control-label col-md-2">الاسم</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtcontactName" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-2">التيلفون</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtContactphone" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                              <div class="col-md-offset-2 col-md-9">
                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="تفريغ الحقول" CssClass="btn default" />
                        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    





</asp:Content>

