<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="BookAddEdit.aspx.cs" Inherits="NewLibrary_BookAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#new-library').addClass("active open");
            $('#new-library2 a').css("background-color", "#575757");
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
    <asp:Label ID="lblPersonID" runat="server" Text="" Visible="false"></asp:Label>
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
                            <div class="form-group row">
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
                                    <asp:TextBox ID="txtBookNo" runat="server" CssClass="form-control"></asp:TextBox>
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
                                <label class="col-md-2 control-label isra-text-aling-right">جهة التوريد</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtBookGetName" runat="server" CssClass="form-control" placeholder="ادخل جهة التوريد"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">السعر</label>
                                <div class="col-md-2">
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
                            <div class="col-md-4 pull-left">
                                <asp:Button ID="btnNewContainer" runat="server" Text="موضوع جديد" CssClass="btn green" OnClick="btnNewContainer_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div id="DivPerson" runat="server" visible="false">
                <div class="portlet box green">
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
                                        <asp:Label ID="PersonID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Rownum") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("PersonName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("PersonType") %></span></td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbPersonEdit" runat="server" class="btn default btn-xs black" OnClick="lbPersonEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbPersonDelete" runat="server" class="btn default btn-xs purple" OnClick="lbPersonDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
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
        </div>
        <div class="col-md-6">
            <div id="DivAddPerson" runat="server" visible="false">
                <div class="portlet box blue">
                    <asp:Label ID="lblPlanID" runat="server" Text="" Visible="false"></asp:Label>
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
                                        <asp:TextBox ID="txtPersonName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال عنوان الموضوع"></asp:TextBox>
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
                                    <asp:Button ID="btnPersonSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnPersonSave_Click" />
                                    <asp:Button ID="btnPersoncancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnPersoncancel_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

