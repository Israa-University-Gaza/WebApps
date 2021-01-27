﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="SyllabusRequestAddEdit.aspx.cs" Inherits="Academic_SyllabusRequestAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Syllabus').addClass("active open");
            $('#Syllabus_1 a').css("background-color", "#575757");
            $('#Syllabus a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>طلبات توصيف المساق</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblSyllabusID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lbEmployeeID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلبات توصيف المساق</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">المحاضر</label>
                        <div class="col-md-4">
                              <asp:DropDownList ID="ddlFilterInstructor" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="EmployeeID"></asp:DropDownList>
                        </div>
                        <label class="col-md-2 control-label isra-text-aling-right">المساق</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlFilterCourse" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource8" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterCourse_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Course] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر المساق'">
                                <SelectParameters>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 20%">رقم المساق</th>
                                <th style="text-align: center; width: 25%">المساق</th>
                                <th style="text-align: center; width: 25%">القسم</th>
                                <th style="text-align: center; width: 25%">المحاضر</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="SyllabusID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <td><span><%# Eval("Coursecode") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("DepartmentName") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("InstructorName") %></span></td>
                                    <td style="text-align: center">
                                        <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click" Visible='<%# ( (Eval("SyllabusAccredit").ToString() == "0")) ? true:false %>'><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                        <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" Visible='<%# ( (Eval("SyllabusAccredit").ToString() == "0")) ? true:false %>' OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i>  حذف</a></asp:LinkButton>
                                    </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetSyllabus" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlFilterInstructor" PropertyName="SelectedValue" DefaultValue="-1" Name="InstructorID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlFilterCourse" PropertyName="SelectedValue" DefaultValue="-1" Name="CourseID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>

                    <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                            <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                            <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                    <div class="clearfix"></div>
                    <% }
                        else
                        {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center;">
                            <strong>لم يتم إضافة طلبات توصيف مساق بعد</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:Label ID="lblPlanID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل طلب توصيف مساق</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">


                            <div class="form-group row">
                                <label class="col-md-3 control-label isra-text-aling-right">البرنامج</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlProgram" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Program] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label isra-text-aling-right">الكلية</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [College] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (ProgramID=@ProgramID or @ProgramID=-1)) union select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label isra-text-aling-right">القسم</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Department] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (CollegeID=@CollegeID or @CollegeID=-1)) union select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 control-label isra-text-aling-right">المساق</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ('(' + CourseCode + ') ' + (CASE WHEN DepartmentID<>23 THEN ArName ELSE EnName END)) as ArName FROM [Course] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (DepartmentID=@DepartmentID or @DepartmentID=-1)) union select -1,N'إختر المساق'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label isra-text-aling-right">المحاضر</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlInstructor" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="EmployeeID"></asp:DropDownList>
                                   
                                </div>
                            </div>

                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                         <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlCollegeInstructors" SelectCommandType="StoredProcedure">
                                          <SelectParameters>
                                                <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                <asp:Parameter DefaultValue="12" Name="SemesterID" Type="Int32" />
                                            </SelectParameters>
                                    </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

