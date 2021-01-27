<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="Infraction.aspx.cs" Inherits="Affairs_Infraction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Infraction').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
      <ul class="page-breadcrumb breadcrumb  isra2-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">شؤون الطلبة</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Infraction.aspx" class="font-ha">مخالفات الطلاب</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>عرض مخالفات الطلاب 
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-group row">
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label">الفصل الدراسي</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                SelectCommand="Select ID, ArName From Semester Where ID<>1 and IsDelete=0 union Select -1,N'الكل'"></asp:SqlDataSource>
                        </div>
                        <label class="control-label col-md-2">المخالفة </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlInfraction" CssClass="select2_category form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Search_Click" DataSourceID="SqlDataSource2" DataTextField="Title" DataValueField="ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:isra2 %>' SelectCommand="SELECT[ID],[Title]FROM [Infraction] where IsDelete=0 union select -1,N'الكل'"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group row">

                        <label class="control-label col-md-2">نوع المخالفة </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlInfractionType" CssClass="select2_category form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Search_Click" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:isra2 %>' SelectCommand="SELECT[ID],[Name]FROM [InfractionType] where IsDelete=0 union select -1,N'الكل'"></asp:SqlDataSource>
                        </div>
                        <label class="control-label col-md-2">رقم الطالب </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="StudentNo" runat="server" placeholder="" CssClass="form-control" AutoPostBack="true" OnTextChanged="Search_Click"></asp:TextBox>
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


                    <div class="form-group row">
                        <label class="control-label col-md-offset-4 col-md-4"></label>
                        <div class="col-md-8 col-lg-offset-2">
                            <asp:Button ID="Search" runat="server" Text="بحث" class="btn green" OnClick="Search_Click" />
                        </div>
                    </div>

                    <hr />
                    <div class="row table-responsive">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 2%;">رقم</th>
                                    <th style="width: 10%; text-align: center;">رقم الطالب</th>
                                    <th style="width: 10%; text-align: center;">اسم الطالب</th>
                                    <th style="width: 15%; text-align: center;">المخالفة</th>
                                    <th style="width: 10%; text-align: center;">نوع المخالفة  </th>
                                    <th style="width: 20%; text-align: center;">تفاصيل المخالفة </th>
                                    <th style="width: 15%; text-align: center;">تفاصيل العقوبة</th>
                                    <th style="width: 8%; text-align: center;">تاريخ المخالفة</th>
                                    <th style="width: 10%; text-align: center;">ملاحظات</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblStudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                            <td><span><%# Eval("RowNo") %></span></td>

                                            <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                            <td style="text-align: center">
                                            <asp:LinkButton ID="lbGoStudent1" runat="server" OnClick="lbGoStudent1_Click"><%# Eval("StudentName") %></asp:LinkButton></td>
                                            <td style="text-align: center"><span><%# Eval("Infraction") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("InfractionType") %></span></td>
                                            <td style="text-align: center"><%# Eval("InfractionDetails") %></td>
                                            <td style="text-align: center"><%# Eval("PenaltyDetails") %></td>
                                            <td style="text-align: center"><span><%# Eval("InfractionDate") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Nots") %></span></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:isra2 %>' SelectCommand="GetStdInfraction" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlInfraction" PropertyName="SelectedValue" DefaultValue="-1" Name="InfractionID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlInfractionType" PropertyName="SelectedValue" DefaultValue="-1" Name="InfractionTypeID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="txtArFirstName" PropertyName="Text" DefaultValue="%" Name="ArFirstName" Type="String"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="txtSecoundName" PropertyName="Text" DefaultValue="%" Name="ArSecoundName" Type="String"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="txtArThirdName" PropertyName="Text" DefaultValue="%" Name="ArThirdName" Type="String"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="txtArFamilyName" PropertyName="Text" DefaultValue="%" Name="ArFamilyName" Type="String"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="StudentNo" PropertyName="Text" DefaultValue="-1" Name="StudentNO" Type="Int32"></asp:ControlParameter>

                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>

                        <div class="clearfix"></div>
                        <% }
                            else
                            {%>
                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                            <div class="col-xs-11" style="text-align: center">
                                <strong>لا يوجد مخالفات طلاب في هذا الفصل الدراسي</strong>
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
    
</asp:Content>

