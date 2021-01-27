<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeBorrowBook.aspx.cs" Inherits="NewLibrary_EmployeeBorrowBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/css/pages/profile-rtl.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/custom-rtl.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#new-library').addClass("active open");
            $('#new-library5 a').css("background-color", "#575757");
            $('#new-library a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <i class="fa fa-book"></i>
        <a href="StudentBorrowedBooks.aspx" class="font-ha">استعارة كتاب</a>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الموظف</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div style="width: 19%; float: right;">
                        <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                            <li style="margin-bottom: 0;">
                                <div class="input-group">
                                    <asp:TextBox ID="txtEmployeeNo" runat="server" class="form-control" placeholder="الرجاء ادخال رقم الموظف" Style="font-family: Tahoma; font-size: 12px !important;"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:Button ID="btnChechEmployee" runat="server" Text="بحث" class="btn green" OnClick="btnChechEmployee_Click" Style="height: 34px;" />
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <h5><%# Eval("EmployeeName") %></h5>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:IsraaHumanResource %>' SelectCommand="GetEmployeeByEmployeeID" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <%--<asp:SqlDataSource ID="SqlDataSource10" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT [dbo].[GetEmployeeNO](Emp_ID) as EmployeeNo,*  FROM [dbo].[Employee_TB] WHERE Emp_ID=@Emp_ID ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>--%>
                            </li>
                            <li><a href="Employee.aspx"><i class="fa fa-home"></i>الصفحة الرئيسية</a></li>
                            <li class="active"><a href="EmployeeBorrowBook.aspx"><i class="fa fa-edit"></i>استعارة كتاب</a></li>
                            <li><a href="EmployeeBorrowedBooks.aspx"><i class="fa fa-edit"></i>الكتب المستعارة</a></li>
                            <li><a href="EmployeeSMS.aspx"><i class="fa fa-edit"></i>ارسال SMS</a></li>
                        </ul>
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-10">
                                        <h4>استعارة كتاب</h4>
                                    </div>
                                </div>
                                <hr style="margin: 10px 0 15px 0" />
                                <div class="form-group row">
                                    <label class="col-md-2 control-label isra-text-aling-right">الرقم العام</label>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtContainerNo" runat="server" CssClass="form-control" placeholder="بحث برقم الموضوع العام"></asp:TextBox>
                                    </div>
                                    <label class="col-md-2 control-label isra-text-aling-right">رقم النسخة </label>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtBookNo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <label class="col-md-2 control-label isra-text-aling-right">رقم ISBN</label>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtISBN" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2 control-label isra-text-aling-right">عنوان الموضوع</label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtContainerTitle" runat="server" CssClass="form-control" placeholder="بحث بعنوان الموضوع"></asp:TextBox>
                                    </div>
                                    <label class="col-md-2 control-label isra-text-aling-right">العنوان الرئيسي</label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtBookTitle" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2 control-label isra-text-aling-right">المؤلف</label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtPersonName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <label class="col-md-2 control-label isra-text-aling-right">سنة النشر</label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtPublisherYear" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2 control-label isra-text-aling-right"></label>
                                    <div class="col-md-10">
                                        <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn green" OnClick="btnSearch_Click" />
                                    </div>
                                </div>
                                <hr style="margin: 10px 0 15px 0" />
                                <% if (ListView1.Items.Count > 0)
                                        { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%; font-size: 12px">الرقم العام </th>
                                            <th style="text-align: center; width: 10%; font-size: 12px">رقم النسخة </th>
                                            <th style="text-align: center; width: 10%; font-size: 12px">ISBN </th>
                                            <th style="text-align: center; width: 20%; font-size: 12px">عنوان الموضوع</th>
                                            <th style="text-align: center; width: 20%; font-size: 12px">العنوان الرئيسي</th>
                                            <th style="text-align: center; width: 5%; font-size: 12px">النوع</th>
                                            <th style="text-align: center; width: 15%; font-size: 12px"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <asp:Label ID="ContainerID" runat="server" Text='<%# Eval("ContainerID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="BookID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <tr>
                                                    <td><span><%# Eval("ContainerNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("BookNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("ISBN") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("ContainerTitel") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("BookTitle1") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("BookType") %></span></td>
                                                    <td style="text-align: center">
                                                        <span id="td2" style="text-align: center; color: red" runat="server" visible='<%# ((Eval("IsBookBorrowed").ToString() == "1")) ? true:false %>'>الكتاب مستعار</span>
                                                        <asp:LinkButton ID="lbBorrowBook" runat="server" class="btn default btn-xs green" OnClick="lbBorrowBook_Click" Visible='<%# ((Eval("IsBookBorrowed").ToString() == "0")) ? true:false %>'><i class="fa fa-beer"></i> إعارة الكتاب</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="GetFilterdBooks" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txtContainerNo" PropertyName="Text" DefaultValue="%" Name="ContainerNo" Type="String"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="txtBookNo" PropertyName="Text" DefaultValue="%" Name="BookNo" Type="String"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="txtISBN" PropertyName="Text" DefaultValue="%" Name="ISBN" Type="String"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="txtContainerTitle" PropertyName="Text" DefaultValue="%" Name="ContainerTitel" Type="String"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="txtBookTitle" PropertyName="Text" DefaultValue="%" Name="BookTitlel1" Type="String"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="txtPersonName" PropertyName="Text" DefaultValue="%" Name="PersonName" Type="String"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="txtPublisherYear" PropertyName="Text" DefaultValue="%" Name="PublisherYear" Type="String"></asp:ControlParameter>
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
                                        <strong>لا يوجد بيانات لعرضها</strong>
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
    </div>
</asp:Content>

