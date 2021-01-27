<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="LoanRequestForm.aspx.cs" Inherits="Student_LoanRequestForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script type="text/javascript">
            $('document').ready(function () {
                $('.page-sidebar-menu li').removeClass("active");
                $('#menu10').addClass("active");
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha"> نموذج طلب قرض جامعي
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
       <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>نموذج طلب قرض جامعي </div>
                </div>
                <div class="portlet-body">
                    <div class="form-horizontal">
                    
                       <h3 class="inlineh"><i class="fa fa-paste (alias)" style="margin: 0 20px!important"></i>معلومات عن الأسرة </h3>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">عدد أفراد الأسرة</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="FamilyNo" runat="server" CssClass="form-control " placeholder="عدد أفراد الأسرة"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">عدد طلاب الجامعة</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="UnivStudentNo" runat="server" CssClass="form-control " placeholder="عدد طلاب الجامعة"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                         <div class="form-group">
                            <label class="col-md-2 control-label">عدد طلاب المدراس</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="FamilySchoolNo" runat="server" CssClass="form-control " placeholder="عدد طلاب المدراس"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">عدد الحالات الخاصة</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="SpecialNeedsNo" runat="server" CssClass="form-control " placeholder="عدد الحالات الخاصة(اعاقة-مرض مزمن)"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                         <div class="form-group">
                            <label class="col-md-2 control-label">  حالة اجتماعية  </label>
                            <div class="col-md-4">
                                <asp:RadioButtonList ID="SocialCaseType" runat="server" CssClass="radio-list" RepeatDirection="Horizontal" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ([ConstantID] = @ConstantID)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="20" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                           
                        </div>
                        <div class="clearfix"></div>
                         <div class="form-group">
                            <label class="col-md-2 control-label">  عمل الأب </label>
                            <div class="col-md-4">
                                <asp:TextBox ID="FatherWork" runat="server" CssClass="form-control " placeholder="عمل الأب"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">عمل الأم</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="MotherWork" runat="server" CssClass="form-control " placeholder="عمل الأم"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                         <div class="form-group">
                            <label class="col-md-2 control-label">   متوسط دخل الأسرة  </label>
                            <div class="col-md-4">
                                <asp:TextBox ID="FamilyIncome" runat="server" CssClass="form-control " placeholder="متوسط دخل الأسرة بالشيكل"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label"> هل احد الأبوين متوفيا</label>
                            <div class="col-md-4">
                                 <asp:RadioButtonList ID="IsPerentDead" runat="server" CssClass="radio-list" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1">نعم</asp:ListItem>
                                    <asp:ListItem Value="0">لا</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                              <div class="form-group">
                            <label class="col-md-2 control-label"> ملاحظات </label>
                            <div class="col-md-10">
                                <asp:TextBox ID="Others" runat="server" CssClass="form-control " placeholder="ملاحظات "></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                            <h3 class="inlineh"><i class="fa fa-paste (alias)" style="margin: 0 20px!important"></i>معلومات عن السكن </h3>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"> وصف السكن </label>
                            <div class="col-md-10">
                                <asp:TextBox ID="HouseDesc" runat="server" CssClass="form-control " placeholder="وصف السكن "></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                              <h3 class="inlineh"><i class="fa fa-paste" style="margin: 0 30px!important"></i> المساعدات التي يتلقاها الطالب </h3>
                                 <div class="clearfix"></div>
                      
                            <div class="col-md-12">
                                <table class="table table-striped table-hover table-bordered" id="">
                                    <thead>
                                        <tr>
                                           
                                            <th style="width: 30%!important; text-align: center"> نوع المساعدة</th>
                                            <th style="width: 40%!important; text-align: center">الجهة المساعدة</th>
                                              <th style="width: 30%!important; text-align: center">قيمة المساعدة</th>
                                           
                                      
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                           
                                            <td> <asp:TextBox ID="HelpType" runat="server" CssClass="form-control"></asp:TextBox></td>
                                            <td><asp:TextBox ID="HelpOrg" runat="server" CssClass="form-control"></asp:TextBox></td>
                                            <td><asp:TextBox ID="HelpValue" runat="server" CssClass="form-control"></asp:TextBox></td>
                                            </tr>

                                       
                                    </tbody>
                                </table>
                            </div>
                           
                        </div>
                    </div>
                </div>
                 <div class="form-actions fluid">
                        <div class="col-md-offset-2 col-md-9">
                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click"/>
                            <asp:Button ID="btnCancel" runat="server" Text="تفريغ الحقول" CssClass="btn default" OnClick="btnCancel_Click" />
                        </div>
                    </div>
            </div>
           </div>
    </div>
</asp:Content>

