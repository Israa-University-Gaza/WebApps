<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="BookAddEdit.aspx.cs" Inherits="NewLibrary_BookAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#new-library').addClass("active open");
            $('#new-library2 a').css("background-color", "#575757");
            $('#new-library11 a').css("background-color", "#575757");
            $('#new-library a span.arrow').addClass("open");

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <i class="fa fa-book"></i>
        <a href="BookAddEdit.aspx" class="font-ha">إضافة/تعديل كتاب</a>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lbEmployeeID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblContainerID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblBookID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblBookCopyID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>اضافة/تعديل  كتاب  تحت عنوان
                    <asp:Label ID="lblContainerTitle" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">عنوان الموضوع</label>
                                <div class="col-md-10">
                                    <asp:Label ID="lblContainerTitle1" runat="server" CssClass="form-control"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">الرقم العام</label>
                                <div class="col-md-2">
                                    <asp:Label ID="lblContainerNo" runat="server" CssClass="form-control"></asp:Label>
                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">تصنيف الموضوع</label>
                                <div class="col-md-2">
                                    <asp:Label ID="lblContainerCategoryName" runat="server" CssClass="form-control"></asp:Label>
                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">لغة الموضوع</label>
                                <div class="col-md-2">
                                    <asp:Label ID="lblLanguage" runat="server" CssClass="form-control"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">الكتب المضافة</label>
                                <div class="col-md-2">
                                    <asp:Label ID="lblBookCount" runat="server" CssClass="form-control"></asp:Label>
                                </div>
                            </div>
                            <hr />
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">العنوان الرئيسي</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtBookTitle1" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div id="divNotPeriodical" class="form-group row" runat="server">
                                <label class="col-md-2 control-label isra-text-aling-right">العنوان الموازي</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtBookTitle2" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">العنوان الشارح</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtBookTitle3" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row" id="divSeries" runat="server">
                                <label class="col-md-2 control-label isra-text-aling-right">اسم السلسلة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtSeriesTitle" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">رقم السلسلة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtSeriesNo" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">رقم النسخة </label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtBookNo" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    <asp:PlaceHolder runat="server" ID="BHbarcode"></asp:PlaceHolder>
                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">حالة الكتاب</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlBookStatus" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="Select ID,Name From BookStatus Where IsDelete=0 union Select -1,N'اختر حالة الكتاب'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">رقم ISBN</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtISBN" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">عدد صفحات الكتاب</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtPageCount" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:RadioButton ID="rbIsBorrow1" runat="server" GroupName="Borrow" Text="يعار" Checked="true" />
                                    <asp:RadioButton ID="rbIsBorrow2" runat="server" GroupName="Borrow" Text="لا يعار" Checked="false" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">نوع الكتاب</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlBookType" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="Select ID,Name From BookType Where IsDelete=0 "></asp:SqlDataSource>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtEditionNo" runat="server" CssClass="form-control" placeholder="ادخل رقم الطبعة"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtPartNo" runat="server" CssClass="form-control" placeholder="ادخل رقم الجزء"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtCopyNo" runat="server" CssClass="form-control" placeholder="ادخل رقم نسخة الكتاب"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">طبيعة التوريد</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlBookGetType" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="Select ID,Name From BookGetType Where IsDelete=0 union Select -1,N'اختر طبيعة التوريد'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label isra-text-aling-right">جهة التوريد</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtBookGetName" runat="server" CssClass="form-control" placeholder="ادخل جهة التوريد"></asp:TextBox>
                                </div>
                                <label class="col-md-1 control-label isra-text-aling-right">تاريخ التوريد</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtBookGetDate" runat="server" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" placeholder="ادخل تاريخ التوريد"></asp:TextBox>
                                </div>
                                <label class="col-md-1 control-label isra-text-aling-right">السعر</label>
                                <div class="col-md-1">
                                    <asp:TextBox ID="txtBookPrice" runat="server" CssClass="form-control" placeholder="ادخل سعر الكتاب"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">موقع الكتاب</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlBranch" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="sdsBranch" DataTextField="ArName" DataValueField="ID" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="sdsBranch" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="Select ID, ArName From Branch Where IsDelete=0 union Select -1,N'اختر المقر'"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlBuilding" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="sdsBuilding" DataTextField="ArName" DataValueField="ID" OnSelectedIndexChanged="ddlBuilding_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="sdsBuilding" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="Select ID, ArName From Building Where BranchID=@BranchID and IsDelete=0 union Select -1,N'اختر المبنى'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlBranch" PropertyName="SelectedValue" Name="BranchID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlFloor" runat="server" CssClass="select2_category form-control" DataSourceID="sdsFloor" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="sdsFloor" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="Select ID, ArName From Floor Where BuildingID=@BuildingID and IsDelete=0 union Select -1,N'اختر الطابق'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlBuilding" PropertyName="SelectedValue" Name="BuildingID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div id="divPeriodical2" runat="server">
                                    <label class="col-md-1 control-label isra-text-aling-right">العدد</label>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtPeriodicalNumber" runat="server" CssClass="form-control form-control-inline input-meduim" placeholder="العدد"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div id="DivPerson" runat="server" visible="false">
                                        <div class="portlet box blue">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>مؤلفي الكتاب</div>
                                                <div class="tools">
                                                    <a class="collapse" href="javascript:;"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body">

                                                <% if (ListView1.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 10%">م</th>
                                                            <th style="width: 30%; text-align: center">اسم الشخص</th>
                                                            <th style="width: 30%; text-align: center">صفة الشخص</th>
                                                            <th style="width: 30%; text-align: center"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="BookPersonID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td><span><%# Eval("RowNum") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("PersonName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("PersonType") %></span></td>
                                                                    <td style="text-align: center">
                                                                        <asp:LinkButton ID="lbBookPersonEdit" runat="server" class="btn default btn-xs black" OnClick="lbBookPersonEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                        <asp:LinkButton ID="lbBookPersonDelete" runat="server" class="btn default btn-xs purple" OnClick="lbBookPersonDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaLibrary %>" SelectCommand="GetBookPerson" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblBookID" Name="BookID" PropertyName="Text" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>

                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <strong>لم يتم اضافة مؤلفي الكتاب بعد </strong>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="DivPeriodical" runat="server" visible="false">
                                        <div class="portlet box blue">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>عناوين الفرعية للدورية</div>
                                                <div class="tools">
                                                    <a class="collapse" href="javascript:;"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body">

                                                <% if (ListView3.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 10%">م</th>
                                                            <th style="width: 30%; text-align: center">العنوان الفرعي</th>
                                                            <th style="width: 30%; text-align: center">عدد المؤلفين</th>
                                                            <th style="width: 30%; text-align: center"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource7">
                                                            <ItemTemplate>
                                                                <asp:Label ID="PeriodicalTitleID" runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
                                                                <tr>
                                                                    <td><span><%# Eval("RowNum") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("PeriodicalSubTitle") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("PeriodicalSubTitlePersonCount") %></span></td>
                                                                    <td style="text-align: center">
                                                                        <asp:LinkButton ID="lbPeriodicalTitleEdit" runat="server" class="btn default btn-xs black" OnClick="lbPeriodicalTitleEdit_OnClick"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                        <asp:LinkButton ID="lbPeriodicalTitleDelete" runat="server" class="btn default btn-xs purple" OnClick="lbPeriodicalTitleDelete_OnClick" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                        <asp:LinkButton ID="lbPeriodicalSubTitlePersonManage" runat="server" class="btn default btn-xs blue" OnClick="lbPeriodicalSubTitlePersonManage_OnClick"><i class="fa fa-user"></i> إدارة المؤلفين</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaLibrary %>" SelectCommand="GetBookPeriodicalTitles" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblBookID" Name="BookID" PropertyName="Text" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>

                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <strong>لم يتم اضافة عنوان فرعي للدورية بعد </strong>
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
                                <div class="col-md-6">
                                    <div id="DivPublisher" runat="server" visible="false">
                                        <div class="portlet box green">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>ناشري الكتاب</div>
                                                <div class="tools">
                                                    <a class="collapse" href="javascript:;"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body">
                                                <% if (ListView2.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 5%">م</th>
                                                            <th style="width: 25%; text-align: center">اسم الناشر</th>
                                                            <th style="width: 25%; text-align: center">مكان الناشر</th>
                                                            <th style="width: 20%; text-align: center">سنة النشر</th>
                                                            <th style="width: 25%; text-align: center"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource5">
                                                            <ItemTemplate>
                                                                <asp:Label ID="BookPublisherID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td><span><%# Eval("RowNum") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("PublisherName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("PublisherPlace") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("PublisherYear") %></span></td>
                                                                    <td style="text-align: center">
                                                                        <asp:LinkButton ID="lbBookPublisherEdit" runat="server" class="btn default btn-xs black" OnClick="lbBookPublisherEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                        <asp:LinkButton ID="lbBookPublisherDelete" runat="server" class="btn default btn-xs purple" OnClick="lbBookPublisherDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaLibrary %>" SelectCommand="GetBookPublisher" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblBookID" Name="BookID" PropertyName="Text" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>

                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <strong>لم يتم اضافة ناشري الكتاب بعد </strong>
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
                            <div class="row">
                                <div class="col-md-6">
                                    <div id="DivAddPerson" runat="server" visible="false">
                                        <div class="portlet box blue">
                                            <asp:Label ID="lblBookPersonID" runat="server" Text="" Visible="False"></asp:Label>
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل مؤلفي الكتاب</div>
                                                <div class="tools">
                                                    <a class="collapse" href="javascript:;"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body form">
                                                <div class="form-horizontal">
                                                    <div class="form-body">
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label isra-text-aling-right">اسم الشخص</label>
                                                            <div class="col-md-9">
                                                                <asp:TextBox ID="txtPersonName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم الشخص"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label isra-text-aling-right">صفة الشخص</label>
                                                            <div class="col-md-9">
                                                                <asp:DropDownList ID="ddlPersonType" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="Select ID,Name From PersonType Where IsDelete=0 union Select -1,N'اختر صفة الشخص'"></asp:SqlDataSource>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="form-actions fluid">
                                                        <div class="col-md-offset-3 col-md-9">
                                                            <asp:Button ID="btnBookPersonSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnBookPersonSave_Click" />
                                                            <asp:Button ID="btnBookPersonCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnBookPersonCancel_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="DivAddPeriodical" runat="server" visible="false">
                                        <div class="portlet box blue">
                                            <asp:Label ID="lblBookPeriodicalID" runat="server" Text="" Visible="False"></asp:Label>
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل عناوين الفرعية للدورية</div>
                                                <div class="tools">
                                                    <a class="collapse" href="javascript:;"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body form">
                                                <div class="form-horizontal">
                                                    <div class="form-body">
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label isra-text-aling-right">العنوان الفرعي</label>
                                                            <div class="col-md-9">
                                                                <asp:TextBox ID="txtPeriodicalSubTitle" runat="server" CssClass="form-control" placeholder="الرجاء ادخال العنوان الفرعي"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-actions fluid">
                                                        <div class="col-md-offset-3 col-md-9">
                                                            <asp:Button ID="btnBookPeriodicalTitleSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnBookPeriodicalTitleSave_OnClick" />
                                                            <asp:Button ID="btnBookPeriodicalTitleCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnBookPeriodicalTitleCancel_OnClick" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div id="DivAddPublisher" runat="server" visible="false">
                                        <div class="portlet box green">
                                            <asp:Label ID="lblBookPublisherID" runat="server" Text="" Visible="false"></asp:Label>
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل ناشري الكتاب</div>
                                                <div class="tools">
                                                    <a class="collapse" href="javascript:;"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body form">
                                                <div class="form-horizontal">
                                                    <div class="form-body">
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label isra-text-aling-right">اسم الناشر</label>
                                                            <div class="col-md-9">
                                                                <asp:TextBox ID="txtPublisherName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم الناشر"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label isra-text-aling-right">مكان الناشر</label>
                                                            <div class="col-md-9">
                                                                <asp:TextBox ID="txtPublisherPlace" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم الناشر"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label isra-text-aling-right">سنة النشر</label>
                                                            <div class="col-md-9">
                                                                <asp:TextBox ID="txtPublisherYear" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم الناشر"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-actions fluid">
                                                        <div class="col-md-offset-3 col-md-9">
                                                            <asp:Button ID="btnPublisherSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnBookPublisherSave_Click" />
                                                            <asp:Button ID="btnPublisherCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnBookPublisherCancel_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div id="DivAddPeriodicalTitlePerson" runat="server" visible="false">
                                        <div class="portlet box red">
                                            <asp:Label ID="lblPeriodicalTitlePersonID" runat="server" Text="" Visible="false"></asp:Label>
                                            <div class="portlet-title">
                                                <div class="caption">
                                                    <i class="fa fa-cogs"></i>اضافة/تعديل المؤلفين تحت العنوان :
                                                    <asp:Label ID="lblPeriodicalTitle" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                                                </div>
                                                <div class="tools">
                                                    <a class="collapse" href="javascript:;"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body form">
                                                <div class="form-horizontal">
                                                    <div class="form-body">
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label isra-text-aling-right">اسم الشخص</label>
                                                            <div class="col-md-9">
                                                                <asp:TextBox ID="txtTitlePersonName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم الشخص"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label isra-text-aling-right">صفة الشخص</label>
                                                            <div class="col-md-9">
                                                                <asp:DropDownList ID="ddlPersonType2" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource9" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                                <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="Select ID,Name From PersonType Where IsDelete=0 union Select -1,N'اختر صفة الشخص'"></asp:SqlDataSource>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="form-actions fluid">
                                                        <div class="col-md-offset-3 col-md-9">
                                                            <asp:Button ID="btnPeriodicalTitlePersonSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnPeriodicalTitlePersonSave_OnClick" />
                                                            <asp:Button ID="btnPeriodicalTitlePersonCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnPeriodicalTitlePersonCancel_OnClick" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div id="DivPeriodicalTitlePerson" runat="server" visible="false">
                                        <div class="portlet box red">
                                            <div class="portlet-title">
                                                <div class="caption">
                                                    <i class="fa fa-cogs"></i>مؤلفي العنوان الفرعي :
                                                    <asp:Label ID="lblPeriodicalTitle2" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                                                </div>
                                                <div class="tools">
                                                    <a class="collapse" href="javascript:;"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body">

                                                <% if (ListView4.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 10%">م</th>
                                                            <th style="width: 30%; text-align: center">اسم الشخص</th>
                                                            <th style="width: 30%; text-align: center">صفة الشخص</th>
                                                            <th style="width: 30%; text-align: center"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView4" runat="server">
                                                            <ItemTemplate>
                                                                <asp:Label ID="PeriodicalTitlePersonID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td><span><%# Eval("RowNum") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("TitlePersonName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("PersonType") %></span></td>
                                                                    <td style="text-align: center">
                                                                        <asp:LinkButton ID="lbPeriodicalTitlePersonEdit" runat="server" class="btn default btn-xs black" OnClick="lbPeriodicalTitlePersonEdit_OnClick"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                        <asp:LinkButton ID="lbPeriodicalTitlePersonDelete" runat="server" class="btn default btn-xs purple" OnClick="lbPeriodicalTitlePersonDelete_OnClick" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <%--<asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaLibrary %>" SelectCommand="GetPeriodicalTitlePerson" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblBookPeriodicalID" Name="PeriodicalTitleID" PropertyName="Text" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>--%>
                                                    </tbody>
                                                </table>

                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <strong>لم يتم اضافة مؤلفي للعنوان الفرعي بعد </strong>
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
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">رؤوس الموضوعات</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtDetails" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">ملاحظات</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="1"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-6">
                                <asp:Button ID="btnBookSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnBookSave_Click" />
                                <asp:Button ID="btnNewBook" runat="server" Text="كتاب جديد" CssClass="btn default" OnClick="btnNewBook_Click" />
                                <asp:Button ID="btnBookCopy" runat="server" Text="نسخة جديدة" CssClass="btn default" OnClick="btnBookCopy_Click" Enabled="false" />
                            </div>
                            <div class="col-md-4 text-right">
                                <asp:Button ID="btnNewContainer" runat="server" Text="موضوع جديد" CssClass="btn green" OnClick="btnNewContainer_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

