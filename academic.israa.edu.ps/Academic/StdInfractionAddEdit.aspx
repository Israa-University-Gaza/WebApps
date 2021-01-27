<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StdInfractionAddEdit.aspx.cs" Inherits="Academic_StdInfractionAddEdit" %>
<%@ Register TagPrefix="uc1" TagName="StudentSideBar" Src="~/Academic/UserControls/StudentSideBar.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStdInfractionID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStdStatusID" runat="server" Visible="true"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الطالب</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <uc1:StudentSideBar ActiveTab="StdInfractionAddEdit" runat="server" ID="StudentSideBar" />

                    <div style="width: 81%; float: right;">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-10">
                                    <h4>إضافة /تعديل مخالفة</h4>
                                </div>
                            </div>
                            <hr style="margin: 10px 0 15px 0" />

                            <div class="form-group row">
                                <label class="col-md-2 control-label">الفصل الدراسي : </label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlSemester" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                </div>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="Select ID, ArName From Semester Where Code<>'111111111' and IsActive=1 and IsDelete=0 Order by ID DESC"></asp:SqlDataSource>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-2 control-label">نوع المخالفة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlInfractionTypeID" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlInfractionTypeID_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, Name FROM [InfractionType] WHERE [IsDelete] = 0 union select -1,N'إختر نوع المخالفة'"></asp:SqlDataSource>
                                </div>

                                <label class="col-md-2 control-label isra-text-aling-right">المخالفة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlInfraction" CssClass="select2_category form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Title" DataValueField="ID">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="Select ID,Title From Infraction  where IsDelete=0 and InfractionTypeID=@InfractionTypeID union Select -1,N'اختر المخالفة' ">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlInfractionTypeID" PropertyName="SelectedValue" DefaultValue="-1" Name="InfractionTypeID"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">تفاصيل المخالفة</label>

                                <div class="col-md-10">
                                    <asp:TextBox ID="txtInfractionDetails" runat="server" class="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">

                                <label class="col-md-2 control-label isra-text-aling-right">تفاصيل العقوبة</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtPenaltyDetails" runat="server" class="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 15px;">
                                <div class="form-group row">

                                    <label class="col-md-2 control-label isra-text-aling-right"></label>
                                    <div class="col-md-10">
                                        <asp:Button ID="btnSave" runat="server" Text="حفظ" OnClick="btnSave_Click" CssClass="btn green" />
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">
                                    <h4>مخالفات الطالب</h4>
                                </div>
                            </div>
                            <hr style="margin: 10px 0 15px 0" />

                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-striped table-hover" id="sample_editable_1 ">
                                <thead>
                                    <tr>
                                        <th style="width: 2%;">م</th>
                                        <th style="width: 20%; text-align: center;">الفصل الدراسي</th>
                                        <th style="width: 15%; text-align: center;">المخالفة</th>
                                        <th style="width: 15%; text-align: center;">نوع المخالفة</th>
                                        <th style="width: 20%; text-align: center;">تفاصيل المخالفة </th>
                                        <th style="width: 20%; text-align: center;">تفاصيل العقوبة</th>

                                        <th style="width: 3%; text-align: center;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                        <ItemTemplate>
                                            <tr>
                                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <td><%# Eval("RowNo") %></td>
                                                <td style="text-align: center"><%# Eval("SemesterName") %></td>
                                                <td style="text-align: center"><%# Eval("Infraction") %></td>
                                                <td style="text-align: center"><%# Eval("InfractionType") %></td>
                                                <td style="text-align: center"><%# Eval("InfractionDetails") %></td>
                                                <td style="text-align: center"><%# Eval("PenaltyDetails") %></td>

                                                <td>
                                                    <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                    <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i>  حذف</a></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetStdInfraction" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <div class="clearfix"></div>
                            <div class="col-md-12">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                        <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                        <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                                        <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                        <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                            <div class="clearfix"></div>
                            <% } %>
                            <%  else
                                { %>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد مخالفات على الطالب للعرض  </strong>
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
        </div>
    </div>

</asp:Content>

