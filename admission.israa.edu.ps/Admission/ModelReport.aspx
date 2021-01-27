<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="ModelReport.aspx.cs" Inherits="Admission_ModelReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            font-size: 13px !important;
        }
        .inlineh {
            font-family: hasanin;
            font-size: 16px;
            display: block;
            margin: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption font-ha"><i class="fa fa-paste (alias)"></i>النماذج والتقارير</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">

                            <div class="form-group">
                                <label class="col-md-2 control-label">الكلية</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From College Where IsDelete=0"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">التخصص</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From Department Where CollegeID=@CollegeID and IsDelete=0 union select -1,N'إختر القسم '">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lbSemesterCoursePDF" runat="server" OnClick="lbSemesterCoursePDF_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">جدول المواد الفصلية</asp:LinkButton>
                                </div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lbDepartmentSectionData" runat="server" OnClick="lbDepartmentSectionData_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">بيانات شعب الاختصاص</asp:LinkButton>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">الخطة</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlPlan" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="PlanNum" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,PlanNum From [Plan] Where DepartmentID=@DepartmentID and IsDelete=0  union select -1,N'إختر رقم الخطة'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lbAccreditationPlans" runat="server" OnClick="lbAccreditationPlans_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">اعتماد الخطة الدراسية</asp:LinkButton>
                                </div>
                            </div>
                            <div class="form-group">

                                <label class="col-md-2 control-label">مساقات التخصص</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From [Course] Where DepartmentID=@DepartmentID and IsDelete=0  union select -1,N'إختر رقم المساق'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lbConstantsCourse" runat="server" OnClick="lbConstantsCourse_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">إدخال ثوابت مساق تخصص</asp:LinkButton>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 control-label">مساقات الكلية</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCourse2" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From [Course] Where DepartmentID in (select ID From Department where CollegeID=@CollegeID and IsDelete=0) and IsDelete=0  union select -1,N'إختر رقم المساق'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lbConstantsCourses" runat="server" OnClick="lbConstantsCourses_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">إدخال ثوابت مساق كلية</asp:LinkButton>
                                </div>
                            </div>
                            <hr />
                            <h1 class="inlineh"><i class="fa fa-paste (alias)" style="margin: 0 20px!important"></i>تقارير اخرى</h1>
                            <div class="form-group">
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lbSpecialtiesAvailablePDF" runat="server" OnClick="lbSpecialtiesAvailablePDF_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">التخصصات المتاحة للعام الدراسي</asp:LinkButton>
                                </div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lbUnacceptedStudents" runat="server" OnClick="lbUnacceptedStudents_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">طلبات التحاق غير مقبولة</asp:LinkButton>
                                </div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lbacceptedStudents" runat="server" OnClick="lbacceptedStudents_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">طلبات الالتحاق المقبولة</asp:LinkButton>
                                </div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lbGetDepartmentWishesCountReport" runat="server" OnClick="lbGetDepartmentWishesCountReport_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">احصائية رغبات الطلاب</asp:LinkButton>
                                </div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lbPlansAndDepartments" runat="server" OnClick="lbPlansAndDepartments_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">الاختصاصات والخطط السنوية</asp:LinkButton>
                                </div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">كشف بأسماء الطلاب المسددون الرسوم كاملة </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

