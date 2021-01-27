<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="AddDegreeBasicSalary.aspx.cs" Inherits="Finanical_AddDegreeBasicSalary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script type="text/javascript">
        $('document').ready(function () {
                $('.page-sidebar-menu li').removeClass("active").removeClass("open");
                $('.page-sidebar-menu li ul li').css("background-color", "");
                $('#menu6').addClass("active open");
                $('#menu6_9 a').css("background-color", "#575757");
                $('#menu6 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">سلم الرواتب</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>ادخال راتب الدرجة  </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                        <label class="col-md-1 control-label" style="text-align: right">الكادر </label>
                        <div class="col-md-5">
                            <asp:DropDownList ID="ddlCaderFilter" class="form-control" runat="server" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1" AutoPostBack="true" OnSelectedIndexChanged="ddlCader_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Cader] union select -1,N'الكل'"></asp:SqlDataSource>

                        </div>

                        <label class="col-md-1 control-label" style="text-align: right">الفئة </label>
                        <div class="col-md-5">
                            <asp:DropDownList ID="ddlGradeFilter" class="form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1" AutoPostBack="true" OnSelectedIndexChanged="ddlGrade_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Grade] where CaderID=@CaderID union select -1,N'الكل'">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlCaderFilter" Name="CaderID" DbType="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 15%">الكادر  </th>
                                    <th style="width: 15%">الفئة  </th>
                                    <th style="width: 15%; text-align: center">الدرجة  </th>
                                    <th style="width: 10%; text-align: center">الراتب  </th>
                                    <th style="width: 20%; text-align: center">نوع العملة </th>
                                    <th style="width: 25%; text-align: left">تاريخ الاضافة</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <tr>
                                            <td><span><%# Eval("CaderName") %></td>
                                            <td><span><%# Eval("GradeName") %></td>
                                            <td style="text-align: center"><span><%# Eval("DegreeName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("SalaryAmount") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("CurrencyName") %></span></td>
                                            <td style="text-align: left"><span><%# Eval("InsertDate") %></span></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="GetCaderGradeDegreeBasicSalary" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlCaderFilter" PropertyName="SelectedValue" Name="CaderID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlGradeFilter" PropertyName="SelectedValue" Name="GradeID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>

                        </table>
                        <div class="clearfix"></div>
                        <div class="col-md-10" style="float: left!important; direction: ltr!important;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager col-md-6">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link"
                                        PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false"
                                        ShowPreviousPageButton="true" />
                                    <asp:NumericPagerField ButtonType="Link" />
                                    <asp:NextPreviousPagerField ButtonType="Link" NextPageText=" التالي" ShowFirstPageButton="false"
                                        ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                </Fields>

                            </asp:DataPager>

                        </div>
                        <div class="clearfix"></div>

                    </div>

                </div>

            </div>
        </div>


        <div class="col-md-5">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>سلم الرواتب</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                                <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
                                <label class="col-md-2 control-label" style="text-align: right">الكادر </label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlCader" runat="server" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="ID" CssClass="form-control" data-placeholder="Choose a Category" TabIndex="1" AutoPostBack="true" OnSelectedIndexChanged="ddlCader_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Cader] union select -1,N'  اختر الكادر'"></asp:SqlDataSource>

                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" style="text-align: right">الفئة </label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlGrade" runat="server" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="ID" CssClass="form-control" data-placeholder="Choose a Category" TabIndex="1" AutoPostBack="true" OnSelectedIndexChanged="ddlGrade_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Grade] where CaderID=@CaderID union select -1,N'  اختر الفئة'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCader" Name="CaderID" DbType="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" style="text-align: right">الدرجة </label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlDegree" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" CssClass="form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Degree] where GradeID=@GradeID union select -1,N' اختر الدرجة '">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlGrade" Name="GradeID" DbType="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" style="text-align: right">الراتب </label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" placeholder="ادخل الراتب"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" style="text-align: right">العملة </label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlCurrency"  runat="server" DataSourceID="SqlDataSource2" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID" CssClass="form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select -1,N'اختر العملة'"></asp:SqlDataSource>

                                </div>

                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="form-actions">
                        <div class="col-md-offset-2 col-md-9">
                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="تفريغ الحقول" CssClass="btn default" OnClick="btnCancel_Click" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>

