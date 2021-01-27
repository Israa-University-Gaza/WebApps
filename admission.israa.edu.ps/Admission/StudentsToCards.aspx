﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsToCards.aspx.cs" Inherits="Admission_StudentsToCards" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentsToCards').addClass("active open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("StudentsView"))
            { %>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلاب الجامعة</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="control-label col-md-2">رقم الطالب : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtStudentNo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <label class="control-label col-md-2">رقم الملف : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtFileNumber" runat="server" class="form-control"></asp:TextBox>
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
                    <div class="form-group">
                        <label class="control-label col-md-offset-4 col-md-4"></label>
                        <div class="col-md-3 col-lg-offset-2">
                            <asp:Button ID="btnFilter" runat="server" Text="بحث" class="btn green" OnClick="btnFilter_Click" />
                        </div>
                        <div class="col-md-7" style="text-align: left;">
                            <asp:Button ID="btnPrintStudentCards" runat="server" Text="بطاقات الطلاب" class="btn green" OnClick="btnPrintStudentCards_Click" />
                            <asp:Button ID="btnPrintStudentCards2" runat="server" Text="خلفية البطاقة" class="btn green" OnClick="btnPrintStudentCards2_Click" />
                            <asp:Button ID="btnPrintSpecialStudentCard" runat="server" Text="بطاقات الطلاب1" class="btn blue" OnClick="btnPrintSpecialStudentCard_Click" />
                            <asp:Button ID="btnPrintSpecialStudentCard2" runat="server" Text="خلفية البطاقة1" class="btn blue" OnClick="btnPrintSpecialStudentCard2_Click" />

                            <asp:Button ID="btnAddToCard" runat="server" Text="إضافة المحدد الي قائمة بطاقات الطلاب" class="btn green" OnClick="btnAddToCard_Click" />
                            <asp:Button ID="btnStudentCardDelete" runat="server" Text="إلغاء المحدد" class="btn red" OnClick="btnStudentCardDelete_Click" />
                            <asp:Button ID="btnDeleteAllCards" runat="server" Text="إلغاء الكل" class="btn red" OnClick="btnDeleteAllCards_Click" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="text-align: center; width: 10%">رقم</th>
                                        <th style="text-align: center; width: 10%">رقم الطالب</th>
                                        <th style="text-align: center; width: 15%">إسم الطالب</th>
                                        <th style="text-align: center; width: 15%">نوع الطالب</th>
                                        <th style="text-align: center; width: 18%">الكلية</th>
                                        <th style="text-align: center; width: 16%">القسم</th>
                                        <th style="text-align: center; width: 10%">رقم الملف</th>
                                        <th style="text-align: center; width: 5%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                        <ItemTemplate>
                                            <tr>
                                                <asp:Label ID="StudentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <td style="text-align: center;"><%# Eval("No") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentNo") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentName") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentType") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentCollege") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentDepartment") %></td>
                                                <td style="text-align: center;"><%# Eval("FileNumber") %></td>
                                                <td style="text-align: center;">
                                                    <asp:CheckBox ID="cbAddToCard" runat="server" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetStudents" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtStudentNo" DefaultValue="%" PropertyName="Text" Name="StudentNo" Type="String" />
                                            <asp:ControlParameter ControlID="txtFileNumber" DefaultValue="%" PropertyName="Text" Name="FileNumber" Type="String" />
                                            <asp:ControlParameter ControlID="txtArFirstName" DefaultValue="%" PropertyName="Text" Name="ArFirstName" Type="String" />
                                            <asp:ControlParameter ControlID="txtSecoundName" DefaultValue="%" PropertyName="Text" Name="ArSecoundName" Type="String" />
                                            <asp:ControlParameter ControlID="txtArThirdName" DefaultValue="%" PropertyName="Text" Name="ArThirdName" Type="String" />
                                            <asp:ControlParameter ControlID="txtArFamilyName" DefaultValue="%" PropertyName="Text" Name="ArFamilyName" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <div class="clearfix"></div>
                            <div style="float: left!important; direction: ltr!important;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager col-md-12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                        <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                        <asp:NumericPagerField ButtonType="Link" />
                                        <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                        <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                            <div class="clearfix"></div>
                            <% }
                                else
                                {%>
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
        </div>
        <% } %>
    </div>
</asp:Content>

