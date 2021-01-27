<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="HelpRequestForm.aspx.cs" Inherits="Student_HelpRequestForm" %>

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
        <li><a href="#" class="font-ha"> نموذج طلب مساعدة
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
       <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>نموذج طلب مساعدة </div>
                </div>
                <div class="portlet-body">
                    <div class="form-horizontal">
                           <div class="form-group">
                            <div class="col-md-12">
                                <asp:RadioButtonList ID="HelpType" runat="server" CssClass="radio-list" RepeatDirection="Horizontal" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID" TextAlign="Right">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ([ConstantID] = @ConstantID)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="21" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                           
                        </div>
                        <div class="clearfix"></div>
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
                                <asp:TextBox ID="FatherWork" runat="server" CssClass="form-control " placeholder="  عمل الأب"></asp:TextBox>
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
                                <asp:TextBox ID="FamilyIncome" runat="server" CssClass="form-control " placeholder="   متوسط دخل الأسرة بالشيكل"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label"> هل احد الأبوين متوفيا</label>
                            <div class="col-md-4">
                                 <asp:RadioButtonList ID="IsPerentDead" runat="server" CssClass="radio-list" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1">نعم</asp:ListItem>
                                    <asp:ListItem Value="0" Selected="True">لا</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                            <h3 class="inlineh"><i class="fa fa-paste (alias)" style="margin: 0 20px!important"></i>معلومات عن السكن </h3>
                        <div class="clearfix"></div>
                           <div class="form-group">
                                <label class="col-md-2 control-label">  خاصية المسكن  </label>
                            <div class="col-md-4">
                                <asp:RadioButtonList ID="houseType" runat="server" CssClass="radio-list" RepeatDirection="Horizontal" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" OnSelectedIndexChanged="houseType_SelectedIndexChanged" AutoPostBack="true">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ([ConstantID] = @ConstantID)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="17" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                               <div id="Rent" runat="server" visible="false">
                            <label class="col-md-2 control-label">   قيمة الايجار </label>
                            <div class="col-md-4">
                                <asp:TextBox ID="RentValue" runat="server" CssClass="form-control " placeholder="قيمة الايجار"></asp:TextBox>
                            </div>
                           </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">حالة البناء</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="BulidingStatus" runat="server" CssClass="form-control " placeholder="حالة البناء"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">مساحة البناء</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="BulidingArea" runat="server" CssClass="form-control " placeholder="مساحة البناء"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                          <div class="form-group">
                            <label class="col-md-2 control-label">نوع البناء</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="BulidingType" runat="server" CssClass="form-control " placeholder="نوع البناء"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">حالة الأثاث</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="FurnitureStatus" runat="server" CssClass="form-control " placeholder="حالة الأثاث"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                                <div class="form-group">
                            <label class="col-md-2 control-label"> طبيعة السكن  </label>
                            <div class="col-md-4">
                                <asp:RadioButtonList ID="HouseNature" runat="server" CssClass="radio-list" RepeatDirection="Horizontal" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ([ConstantID] = @ConstantID)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="18" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <label class="col-md-2 control-label"> مكان الاقامة</label>
                            <div class="col-md-4">
                                <asp:RadioButtonList ID="ResidencePlace" runat="server" CssClass="radio-list" RepeatDirection="Horizontal" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ([ConstantID] = @ConstantID)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="19" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                             <div class="form-group">
                            <label class="col-md-2 control-label">بيانات أخرى </label>
                            <div class="col-md-10">
                                <asp:TextBox ID="Others" runat="server" CssClass="form-control " placeholder="بيانات أخرى"></asp:TextBox>
                            </div>
                       
                        <div class="clearfix"></div>
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

