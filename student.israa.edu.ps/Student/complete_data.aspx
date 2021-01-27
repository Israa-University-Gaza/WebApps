<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="complete_data.aspx.cs" Inherits="Student_complete_data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu30').addClass("active");
        });
    </script>
    <style>
        .trtd tr, .trtd td, .trtd th, .trtd {
            border: 0px !important;
            text-align: center !important;
        }

            .trtd tr:last-child {
                column-span: all !important;
                text-align: center !important;
            }

            .trtd a {
                text-decoration: none !important;
                transition: all ease-in-out 0.5s;
            }

                .trtd a:hover {
                    color: #808080 !important;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder font-ha">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#">إكمال معلومات الطالب</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>استكمال معلومات الطالب</div>
                </div>
                <div class="portlet-body">
                    <div class="clearfix">

                    <div id="divMsg" runat="server" class="alert alert-warning alert-dismissable" visible="true" style="font-size: 14px;">
                        <div class="col-xs-10">
                            <strong>
                                <asp:Label ID="lblMsg" runat="server" Text="الحقول المميزة بعلامة * مطلوبة"></asp:Label>
                            </strong>
                            <div style="clear: both"></div>
                        </div>
                        <button aria-hidden="true" data-dismiss="alert" class="close col-xs-2" style="margin-top: 4px;" type="button"></button>
                        <div style="clear: both"></div>
                    </div>
                    <div class="form-horizontal">
                      <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-4">نوع السكن</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="ddlHomeType" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=23) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر نوع  السكن'"></asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">حالة الأب</label>
                            <div class="col-md-8">
                               <asp:RadioButtonList ID="rBtnFatherStatus"  runat="server">
                                    <asp:ListItem Value="1">متوفي</asp:ListItem>
                                    <asp:ListItem Value="0">غير متوفي</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">حالة الطالب</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="DDLStdStatus" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=25) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر'"></asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">البلدة الأصلية</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtOriginalTown" CssClass="form-control" ValidationGroup="data" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOriginalTown" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">هل تحمل جنسية أخرى؟</label>
                            <div class="col-md-8">
                                <asp:RadioButtonList ID="rBtnHaveOtherNationality" runat="server">
                                    <asp:ListItem Value="1">نعم</asp:ListItem>
                                    <asp:ListItem Value="0">لا</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="form-group" runat="server" >
                            <label class="control-label col-md-4">أذكر الجنسية الأخرى إن وجدت</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtOtherNationality" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">عدد أفراد الأسرة</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtFamilyNo" CssClass="form-control" ValidationGroup="data" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFamilyNo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="يجب أن يكون المدخل رقم" ForeColor="Red" ControlToValidate="txtFamilyNo"  ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                          
                        <div class="form-group">
                            <label class="control-label col-md-4">عدد الطلاب الجامعيين</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtStdNo" CssClass="form-control" ValidationGroup="data" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStdNo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="يجب أن يكون المدخل رقم" ForeColor="Red" ControlToValidate="txtStdNo"  ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                            </div>
                        </div>
                        </div>

                        <div class="col-md-6">

                        <div class="form-group">
                            <label class="control-label col-md-4">رقم تسلسل الطالب في الأسرة</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtStdFSerial" CssClass="form-control"  ValidationGroup="data" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtStdFSerial" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="يجب أن يكون المدخل رقم" ForeColor="Red" ControlToValidate="txtStdFSerial"  ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">متوسط دخل الأسرة بالشيكل</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtFIncome" CssClass="form-control" ValidationGroup="data" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFIncome" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="يجب أن يكون المدخل رقم" ForeColor="Red" ControlToValidate="txtFIncome"  ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">حالة الأثاث</label>
                            <div class="col-md-8">
                                 <asp:DropDownList ID="DDLFurnStatus" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                     SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=24) AND ([IsActive] = 1) AND 
                                     ([IsDelete] = 0)) union Select -1 , N'إختر حالة الأثاث'"></asp:SqlDataSource>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-md-4">هل يوجد أسير؟</label>
                            <div class="col-md-8">
                                <asp:RadioButtonList ID="rBtnHavePrisonar" runat="server">
                                    <asp:ListItem Value="1">نعم</asp:ListItem>
                                    <asp:ListItem Value="0">لا</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">إسم الأسير إذا وجد</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtPrisonerName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">هل يوجد شهيد؟</label>
                            <div class="col-md-8">
                                <asp:RadioButtonList ID="rBtnHaveMartyr" runat="server">
                                    <asp:ListItem Value="1">نعم</asp:ListItem>
                                    <asp:ListItem Value="0">لا</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">إسم الشهيد إذا وجد</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtMartyrName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <%--<label class="control-label col-md-4"></label>--%>
                            <div class="col-md-6">
                               <br /><br /><br /> <asp:Button ID="btnSave" ValidationGroup="data" Width="100%" OnClick="btnSave_Click" CssClass="btn btn-primary"  runat="server" Text="حفظ" />
                            </div>
                        </div>
                        

                    </div>
                       

                    </div>
                 </div>
                    </div>
                </div>
            
        </div>
   </div>
</asp:Content>

