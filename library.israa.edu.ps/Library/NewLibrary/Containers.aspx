<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="Containers.aspx.cs" Inherits="NewLibrary_Containers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#new-library').addClass("active open");
            $('#new-library1 a').css("background-color", "#575757");
            $('#new-library a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <i class="fa fa-book"></i>
        <a href="Containers.aspx" class="font-ha">إضافة/تعديل أوعية الكتب</a>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lbEmployeeID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblContainerID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل أوعية الكتب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">

                            <div class="form-group row">
                                <label class="col-md-3 control-label isra-text-aling-right">العنوان</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtContainerTitle" runat="server" CssClass="form-control" placeholder="الرجاء ادخال عنوان الموضوع"></asp:TextBox>
                                </div>

                                <label class="col-md-3 control-label isra-text-aling-right">الرقم العام</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtContainerNo" runat="server" CssClass="form-control numeric" placeholder=" الرجاء ادخال رقم الموضوع العام"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">


                                <label class="col-md-3 control-label isra-text-aling-right">رقم تصنيف الموضوع</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtContainerCategory" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال رقم تصنيف الموضوع"></asp:TextBox>
                                </div>

                                <label class="col-md-3 control-label isra-text-aling-right">ح.ع.المؤلف</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtKTR" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 control-label">تصنيف الموضوع</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlContainerCategory" runat="server" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="Select ID,Name From ContainerCategory Where IsDelete=0 union Select -1,N'اختر تصنيف الموضوع'"></asp:SqlDataSource>
                                </div>

                                <label class="col-md-3 control-label isra-text-aling-right">نوع الموضوع</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlContainerType" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="ID"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="Select ID,Name From ContainerType Where IsDelete=0 union Select -1,N'اختر نوع الموضوع'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label isra-text-aling-right">اللغة</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="Select ID,Name From Language Where IsDelete=0 union Select -1,N'اختر اللغة'"></asp:SqlDataSource>
                                </div>

                                <%--                                <label class="col-md-3 control-label isra-text-aling-right">جهة النشر</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlPublisher" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="Select ID,Name From Publisher Where IsDelete=0 union Select -1,N'اختر جهة النشر'"></asp:SqlDataSource>
                                </div>--%>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="موضوع جديد" CssClass="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>أوعية الكتب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">الرقم العام</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtContainerNo1" runat="server" CssClass="form-control" placeholder="بحث بالرقم العام" AutoPostBack="true" OnTextChanged="txtContainerNo1_TextChanged"></asp:TextBox>
                        </div>
                        <label class="col-md-2 control-label isra-text-aling-right">عنوان الموضوع</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtContainerTitle1" runat="server" CssClass="form-control" placeholder="بحث بعنوان الموضوع" AutoPostBack="true" OnTextChanged="txtContainerTitle1_TextChanged"></asp:TextBox>

                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn green" OnClick="btnSearch_Click" />
                             <asp:Button ID="btnPdf" runat="server" Text="طباعة" CssClass="btn blue" OnClick="btnPdf_Click" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">رقم التصنيف من</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtContainerCategoryFrom" runat="server" CssClass="form-control"  AutoPostBack="true"></asp:TextBox>
                        </div>
                        <label class="col-md-2 control-label isra-text-aling-right">رقم التصنيف  الى</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtContainerCategoryTo" runat="server" CssClass="form-control"  AutoPostBack="true"></asp:TextBox>

                        </div>
                        <div class="col-md-2">
                             <asp:Button ID="btnContanersBookNoPdf" runat="server" Text="عناوين أكثر من نسخة" CssClass="btn blue" OnClick="btnContanersBookNoPdf_Click"/>
                        </div>
                    </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 10%">الرقم العام </th>
                                <th style="text-align: center; width: 35%;">العنوان</th>
                                <th style="text-align: center; width: 14%;">رقم التصنيف</th>
                                <th style="text-align: center; width: 14%;">تصنيف الموضوع </th>
                                <th style="text-align: center; width: 5%;">ع.الكتب</th>
                                <th style="text-align: center; width: 15%;"></th>
                                <th style="text-align: center; width: 5%;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <asp:Label ID="ContainerID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("ContainerNo") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Title") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ContainerCategory") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ContainerCategoryName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ContainerBookNo") %></span></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbAddBook" runat="server" class="btn default btn-xs black" OnClick="lbAddBook_Click"><i class="fa fa-plus"></i> إضافة كتاب</asp:LinkButton>
                                            <a href='Books.aspx?ID=<%# Eval("ID") %>' target="_blank" class="btn default btn-xs blue">عرض الكتب</a>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i></a></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="GetFilterdContainers" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtContainerNo1" PropertyName="Text" DefaultValue="%" Name="ContainerNo" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtContainerTitle1" PropertyName="Text" DefaultValue="%" Name="Title" Type="String"></asp:ControlParameter>

                                    <asp:ControlParameter ControlID="txtContainerCategoryFrom" PropertyName="Text" DefaultValue="0.0" Name="ContainerCategoryFrom" Type="Double"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtContainerCategoryTo" PropertyName="Text" DefaultValue="0.0" Name="ContainerCategoryTo" Type="Double"></asp:ControlParameter>
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
                            <strong>لا يوجد بيانات للعرض </strong>
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
</asp:Content>

