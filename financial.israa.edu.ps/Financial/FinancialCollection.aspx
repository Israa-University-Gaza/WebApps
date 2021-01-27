<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="FinancialCollection.aspx.cs" Inherits="Financial_FinancialCollection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">التحصيل المالي</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>التحصيل المالي</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="alert alert-success alert-dismissable">
                        <asp:Label ID="lblMsg" runat="server" Text="الطالب : واجد بسام إسليم"></asp:Label>
                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label class="col-md-2 control-label">رقم الطالب</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <asp:TextBox ID="txtStudentNo" runat="server" class="form-control" placeholder="الرجاء ادخال رقم الطالب"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:Button ID="btnChechStudent" runat="server" Text="فحص" class="btn green" OnClick="btnChechStudent_Click" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div id="std" runat="server" visible="false">

                        <!-- BEGIN PAGE CONTENT-->
                        <div class="row profile">
                            <div class="col-md-12">
                                <!--BEGIN TABS-->
                                <div class="tabbable tabbable-custom tabbable-full-width">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#tab_1_1" data-toggle="tab">التحصيل المالي</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab_1_1">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <ul class="list-unstyled profile-nav">
                                                        <img src="../assets/img/profile/profile.jpg" class="img-responsive" alt="" />
                                                    </ul>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="row">
                                                        <div class="col-md-8 profile-info">
                                                            <asp:Label ID="lblStudentID" runat="server" Text="" Visible="false"></asp:Label>
                                                            <h1>
                                                                <asp:Label ID="lblStudentName" runat="server" Text=""></asp:Label>
                                                            </h1>
                                                            <span>بيانات الطالب</span>.
                                                        </div>
                                                        <!--end col-md-8-->
                                                        <div class="col-md-4">
                                                            <div class="portlet sale-summary">
                                                                <div class="portlet-title">
                                                                    <div class="caption">بيانات مالية</div>
                                                                </div>
                                                                <div class="portlet-body">
                                                                    <ul class="list-unstyled">
                                                                        <li>
                                                                            <span class="sale-info">الرصيد : </span>
                                                                            <span class="sale-num">50</span>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--end col-md-4-->
                                                    </div>
                                                    <!--end row-->
                                                    <div class="tabbable tabbable-custom tabbable-custom-profile">
                                                        <ul class="nav nav-tabs">
                                                            <li class="active"><a href="#tab_1_11" data-toggle="tab">تحصيل نقدي</a></li>
                                                            <li><a href="#tab_1_22" data-toggle="tab">أخر حركات الطالب المالية</a></li>
                                                        </ul>
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="tab-content">
                                                            <ContentTemplate>

                                                                <div class="tab-pane active" id="tab_1_11">
                                                                    <div class="tab-pane active" id="tab_1_1_1">
                                                                        <div class="scroller" data-height="290px" data-always-visible="1" data-rail-visible1="1">
                                                                            <div class="col-md-12">
                                                                                <div class="form-horizontal">
                                                                                    <div class="form-body">
                                                                                        <asp:Label ID="lblDocumentID" runat="server"></asp:Label>
                                                                                        <div class="form-group">
                                                                                            <label class="col-md-3 control-label">الحركة المالية</label>
                                                                                            <div class="col-md-7">
                                                                                                <asp:DropDownList ID="ddlAction" runat="server" class="form-control" Width="268px" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlAction_SelectedIndexChanged"></asp:DropDownList>
                                                                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Action] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND ([CDType]=-1) AND ([IsScholarship]=0)) union select -1,N'إختر نوع الحركة المالية'"></asp:SqlDataSource>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label class="col-md-3 control-label">المبلغ المدفوع</label>
                                                                                            <div class="col-md-7">
                                                                                                <div class="input-group">
                                                                                                    <asp:TextBox ID="txtAmount1" runat="server" class="form-control" placeholder="الرجاء ادخال المبلغ بالدينار" Text="0"></asp:TextBox>
                                                                                                    <span class="input-group-addon" style="width: 60px"><i style="font-size: 11px;">دينار</i></span>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label class="col-md-3 control-label">المبلغ المدفوع</label>
                                                                                            <div class="col-md-7">
                                                                                                <div class="input-group">
                                                                                                    <asp:TextBox ID="txtAmount2" runat="server" class="form-control" placeholder="الرجاء ادخال المبلغ بالدولار" Text="0"></asp:TextBox>
                                                                                                    <span class="input-group-addon" style="width: 60px"><i style="font-size: 11px;">دولار</i></span>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label class="col-md-3 control-label">المبلغ المدفوع</label>
                                                                                            <div class="col-md-7">
                                                                                                <div class="input-group">
                                                                                                    <asp:TextBox ID="txtAmount3" runat="server" class="form-control" placeholder="الرجاء ادخال المبلغ بالشيكل" Text="0"></asp:TextBox>
                                                                                                    <span class="input-group-addon" style="width: 60px"><i style="font-size: 11px;">شيكل</i></span>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label class="col-md-3 control-label"></label>
                                                                                            <div class="col-md-1">
                                                                                                <asp:Button ID="btnConfirmation" runat="server" Text="حفظ" class="btn green" OnClick="btnConfirmation_Click" />
                                                                                            </div>
                                                                                            <div class="col-md-1">
                                                                                                <asp:Button ID="btnDocument" runat="server" Text="سند القبض" class="btn blue" OnClick="btnDocument_Click" Visible="false" />
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--tab-pane-->
                                                                <div class="tab-pane" id="tab_1_22">
                                                                    <div class="portlet-body">
                                                                        <table class="table table-striped table-bordered table-advance table-hover">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>الفصل الدراسي</th>
                                                                                    <th>مدين</th>
                                                                                    <th>دائن</th>
                                                                                    <th>الحركة المالية</th>
                                                                                    <th>الرصيد</th>
                                                                                    <th>تاريخ الحركة</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                                                                    <ItemTemplate>
                                                                                        <tr>
                                                                                            <td><%# Eval("SemesterCode") %></td>
                                                                                            <td><%# Eval("Amount1") %></td>
                                                                                            <td><%# Eval("Amount2") %></td>
                                                                                            <td><%# Eval("ActionArName") %></td>
                                                                                            <td><%# Eval("Balance") %></td>
                                                                                            <td><%# Eval("InsertDate","{0: yyyy/MM/dd hh:mm tt}") %></td>
                                                                                        </tr>
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>
                                                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                    SelectCommand="GetLastTenStdTransaction" SelectCommandType="StoredProcedure">
                                                                                    <SelectParameters>
                                                                                        <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                                                                    </SelectParameters>
                                                                                </asp:SqlDataSource>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <!--tab-pane-->
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--END TABS-->
                        </div>
                    </div>
                    <!-- END PAGE CONTENT-->
                </div>
            </div>
        </div>
    </div>
</asp:Content>

