﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="AdmissionIssueSearch1.aspx.cs" Inherits="Admission_AdmissionIssueSearch1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../assets/plugins/ckeditor/ckeditor.js"></script>
    <script src="../assets/scripts/form-validation.js"></script>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu3').addClass("active open");
            $('#menu3_2 a').css("background-color", "#575757");
            $('#menu3 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="AdmissionIssueSearch.aspx" class="font-ha">قضايا الطلاب 
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="UserID" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="Place" runat="server" Text="" Visible="false"></asp:Label>
    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض القضايا
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">البرنامج</label>
                        <div class="col-md-2"><%--OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged" AutoPostBack="true"--%>
                            <asp:DropDownList ID="ddlProgram" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID"  ></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Program] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1,N'الكل'"></asp:SqlDataSource>
                        </div>

                        <label class="col-md-2 control-label isra-text-aling-right">الكلية</label>
                        <div class="col-md-2"><%--OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged" AutoPostBack="true"--%>
                            <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID"  ></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [College] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (ProgramID=@ProgramID or @ProgramID=-1)) union select -1,N'الكل'">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <label class="col-md-2 control-label isra-text-aling-right">القسم</label>
                        <div class="col-md-2"><%--OnSelectedIndexChanged="DataBind_Click" AutoPostBack="true"--%>
                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID"  ></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Department] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (CollegeID=@CollegeID or @CollegeID=-1)) union select -1,N'الكل'">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-2">القضية : </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="Issues" CssClass="select2_category form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DataBind_Click" DataSourceID="SqlDataSource2" DataTextField="IsuueName" DataValueField="ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IsraaStudentIssue %>' SelectCommand="ddlIssues" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>

                        <label class="control-label col-md-2">حالة القضية </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="DataBind_Click">
                                <asp:ListItem Value="-1" Selected="True">الكل</asp:ListItem>
                                <asp:ListItem Value="0">طلب مقدم</asp:ListItem>
                                <asp:ListItem Value="1">مقبول من الكلية</asp:ListItem>
                                <asp:ListItem Value="2">مقبول من الشؤون الاكاديمية</asp:ListItem>
                                <asp:ListItem Value="3">مقبول من القبول والتسجيل</asp:ListItem>
                                <asp:ListItem Value="4">مقبول من متطلبات الجامعة</asp:ListItem>
                                <asp:ListItem Value="5">مرفوض من الكلية</asp:ListItem>
                                <asp:ListItem Value="6">مرفوض من الشؤون الاكاديمية</asp:ListItem>
                                <asp:ListItem Value="7">مرفوض من القبول والتسجيل</asp:ListItem>
                                <asp:ListItem Value="8">مرفوض متطلبات الجامعة</asp:ListItem>
                                <asp:ListItem Value="9">مرجع من الكلية</asp:ListItem>
                                <asp:ListItem Value="10">مرجع من الشؤون الاكاديمية</asp:ListItem>
                                <asp:ListItem Value="11">مرجع من القبول والتسجيل</asp:ListItem>
                                <asp:ListItem Value="12">مرجع من متطلبات الجامعة</asp:ListItem>
                                <asp:ListItem Value="13">غير مجاب عليها من الكلية</asp:ListItem>
                                <asp:ListItem Value="14">غير مجاب عليها الشؤون الاكاديمية</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <label class="control-label col-md-2">رقم الطالب : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="c" runat="server" placeholder="" CssClass="form-control" AutoPostBack="true" OnTextChanged="DataBind_Click"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="control-label col-md-2">إسم الطالب : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArFirstName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtSecoundName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArThirdName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArFamilyName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-actions ">
                    <div class="col-md-8 col-lg-offset-2">
                        <asp:Button ID="Search" runat="server" Text="بحث" OnClick="DataBind_Click" CssClass="btn green" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12 ">
        <div id="loginResponse1" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg1" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض قضايا الطلاب 
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th style="width: 5%;">التاريخ</th>
                                <th style="width: 15%; text-align: center;">رقم الطالب</th>
                                <th style="width: 15%; text-align: center;">اسم الطالب</th>
                                <th style="width: 15%; text-align: center;">القضية</th>
                                <th style="width: 20%; text-align: center;">حالة القضية  </th>
                                <th style="width: 35%; text-align: center;">الجهة المخولة بالإجراء الإداري</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:DataList ID="ListView1" runat="server">
                                <ItemTemplate>
                                   <tr>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblStudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="Place" runat="server" Text='<%# Eval("PlaceID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="MinOrderDepartment" runat="server" Text='<%# Eval("MinOrderDepartment") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="TopIssueAccerdation" runat="server" Text='<%# Eval("TopIssueAccerdation") %>' Visible="false"></asp:Label>
                                        <td><%# Eval("RequestDate","{0:yyyy/MM/dd}") %></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbGoStudent" runat="server" OnClick="lbGoStudent_Click"><%# Eval("StudentNo") %></asp:LinkButton></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbGoStudent1" runat="server" OnClick="lbGoStudent1_Click"><%# Eval("StudentName") %></asp:LinkButton></td>
                                        <td style="text-align: center"><%# Eval("IssueName") %></td>
                                        <td style="text-align: center"><%# Eval("IssueStatus") %></td>
                                        <td style="text-align: center"><%# Eval("PlaceName") %></td>
                                        <td>
                                            <asp:LinkButton ID="lbPDF" runat="server" CssClass="btn blue" Style="font-size: 11px; padding: 4px 10px;" OnClick="lbPDF_Click">PDF </asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="BtnViewIssueDetails" runat="server" CssClass="btn green" Style="font-size: 11px; padding: 4px 10px;" OnClick="BtnViewIssueDetails_Click">تفاصيل القضية</asp:LinkButton>
                                            <% if (Permissions.Contains("ReAccredationIssue"))
                                                { %>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" Visible='<%# ( (Eval("CanDelete").ToString() == "1")) ? true:false %>' OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> التراجع عن الإجراء</a></asp:LinkButton>
                                            <% } %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:DataList>
                            <%--<asp:ListView ID="ListView1" runat="server" >
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblStudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="Place" runat="server" Text='<%# Eval("PlaceID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="MinOrderDepartment" runat="server" Text='<%# Eval("MinOrderDepartment") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="TopIssueAccerdation" runat="server" Text='<%# Eval("TopIssueAccerdation") %>' Visible="false"></asp:Label>
                                        <td><%# Eval("RequestDate","{0:yyyy/MM/dd}") %></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbGoStudent" runat="server" OnClick="lbGoStudent_Click"><%# Eval("StudentNo") %></asp:LinkButton></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbGoStudent1" runat="server" OnClick="lbGoStudent1_Click"><%# Eval("StudentName") %></asp:LinkButton></td>
                                        <td style="text-align: center"><%# Eval("IssueName") %></td>
                                        <td style="text-align: center"><%# Eval("IssueStatus") %></td>
                                        <td style="text-align: center"><%# Eval("PlaceName") %></td>
                                        <td>
                                            <asp:LinkButton ID="lbPDF" runat="server" CssClass="btn blue" Style="font-size: 11px; padding: 4px 10px;" OnClick="lbPDF_Click">PDF </asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="BtnViewIssueDetails" runat="server" CssClass="btn green" Style="font-size: 11px; padding: 4px 10px;" OnClick="BtnViewIssueDetails_Click">تفاصيل القضية</asp:LinkButton>
                                            <% if (Permissions.Contains("ReAccredationIssue"))
                                                { %>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" Visible='<%# ( (Eval("CanDelete").ToString() == "1")) ? true:false %>' OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> التراجع عن الإجراء</a></asp:LinkButton>
                                            <% } %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>--%>
                            <%--                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaStudentIssue %>' SelectCommand="IssuesSearch" SelectCommandType="StoredProcedure" >
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" DefaultValue="-1" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlStatus" PropertyName="SelectedValue" DefaultValue="-1" Name="IssueStatusID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtArFirstName" PropertyName="Text" DefaultValue="%" Name="ArFirstName" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtSecoundName" PropertyName="Text" DefaultValue="%" Name="ArSecoundName" Type="String"></asp:ControlParameter>

                                    <asp:ControlParameter ControlID="txtArThirdName" PropertyName="Text" DefaultValue="%" Name="ArThirdName" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtArFamilyName" PropertyName="Text" DefaultValue="%" Name="ArFamilyName" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="Issues" PropertyName="SelectedValue" DefaultValue="-1" Name="IssueID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="StudentNo" PropertyName="Text" DefaultValue="-1" Name="StudentNO" Type="Int32"></asp:ControlParameter>
                                    <asp:Parameter DefaultValue="-1" Name="EmployeeID" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                            </asp:SqlDataSource>--%>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>
                    <div class="col-md-12">
                        <div class="col-md-2">الصفحة الحالية: </div>
                        <div class="col-md-2">
                            <asp:Label ID="lblCurrentPage" runat="server" Text="1"></asp:Label></div>
                            
                        <div class="col-md-2">
                            <asp:LinkButton ID="btnNextPage" OnClick="btnNext_Click" runat="server">التالي</asp:LinkButton>
                        </div>
                        <div class="col-md-2">
                            عدد الصفحات: 
                        </div>
                        <div class="col-md-2">
                       <asp:Label ID="lblPageCount" runat="server" Text=""></asp:Label></div>

                        </div>
                        <%--<asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                                <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            </Fields>
                        </asp:DataPager>--%>

                    </div>
                    <div class="clearfix"></div>
                    <% } %>
                    <%  else
                        { %>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يوجد قضايا للعرض  </strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <%  } %>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

