<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="Room.aspx.cs" Inherits="Academic_Room" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu1').addClass("active open");
            $('#menu1_2 a').css("background-color", "#575757");
            $('#menu1 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">منشآت الجامعة</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>القاعات الدراسية</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="Building.aspx">عرض المباني</a></li>
                <li class="font-ha"><a href="Room.aspx">عرض القاعات الدراسية</a></li>
                <li class="font-ha"><a href="RoomType.aspx">عرض أنواع القاعات الدراسية</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("RoomView"))
           { %>
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>القاعات الدراسية</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                       <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">المبنى</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlBuilding" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlBuilding_SelectedIndexChanged" DataSourceID="SqlDataSource7" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT ID, Name from Building Where IsDelete=0  union select -1,N'الكل'"></asp:SqlDataSource>
                        </div>
                    </div>
                    <% if (ListView1.Items.Count > 0)
                       { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="text-align: center; width: 15%">رقم القاعة</th>
                                <th style="text-align: center; width: 11%">القاعة</th>
                                <th style="text-align: center; width: 13%">المبنى</th>
                                <th style="text-align: center; width: 12%; text-align: center">سعة (محاضرات)</th>
                                <th style="text-align: center; width: 12%; text-align: center">سعة (إمتحانات)</th>
                                <th style="text-align: center; width: 12%; text-align: center">نوع القاعة</th>
                                <th style="text-align: center; width: 7%; text-align: center">فعال</th>
                                <th style="text-align: center; width: 18%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="RoomID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr <%# (lblRoomID.Text==Eval("ID").ToString())?"style='background-color:#F5F5F5'":"" %>>
                                        <td style="text-align: center"><span><%# Eval("RoomNum") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Name") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Building") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("LectureCapacity") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ExamCapacity") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("RoomType") %></span></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" Checked='<%# Eval("IsActive") %>' OnCheckedChanged="cbIsActive_CheckedChanged" Enabled='<%# (Permissions.Contains("RoomActivate"))? true:false %>' />
                                        </td>
                                        <td style="text-align: center">
                                            <% if (Permissions.Contains("RoomEdit"))
                                               { %>
                                            <asp:LinkButton ID="LinkButton1" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <% } %>
                                            <asp:LinkButton ID="LinkButton3" runat="server" class="btn default btn-xs black" OnClick="LinkButton3_Click">عرض الجدول</asp:LinkButton>

                                             <asp:LinkButton ID="lbPdf" runat="server" class="btn default btn-xs black" OnClick="lbPdf_Click">pdf</asp:LinkButton>
                                            <% if (Permissions.Contains("RoomDelete"))
                                               { %>
                                            <asp:LinkButton ID="LinkButton2" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i></a></asp:LinkButton>
                                            <% } %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="SELECT *,(Select Name from Building Where ID=BuildingID)as Building,(Select Name from RoomType Where ID=RoomTypeID)as RoomType FROM [Room] where [IsDelete]=0 and BuildingID=@BuildingID or @BuildingID=-1 order by [RoomNum]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlBuilding" PropertyName="Text" Name="BuildingID" Type="Int32" DefaultValue="-1" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <div class="col-md-8" style="float: left!important; direction: ltr!important;">
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
                    <% }
                       else
                       {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لم يتم إضافة قاعات دراسية بعد</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <% } %>
        <% if (Permissions.Contains("RoomAdd") || Permissions.Contains("RoomEdit"))
           { %>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:Label ID="lblRoomID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل قاعة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-4 control-label">رقم القاعة</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtRoomNum" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال رقم القاعة"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">القاعة</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم القاعة"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">المبني</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlBuildingID" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, Name FROM [Building] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر المبنى'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">الطابق</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtFloor" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم القاعة"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">المساحة (م2)</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtArea" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم القاعة"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">سعة (محاضرات)</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtLectureCapacity" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال سعة (محاضرات)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">سعة (إمتحانات)</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtExamCapacity" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال سعة (إمتحانات)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">نوع القاعة</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlRoomTypeID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, Name FROM [RoomType] WHERE ([IsDelete] = 0) union select -1,N'إختر نوع القاعة'"></asp:SqlDataSource>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">نوع الإستخدام</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtUseType" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">ملاحظات</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label"></label>
                                <div class="col-md-8">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-4 col-md-8">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</asp:Content>
