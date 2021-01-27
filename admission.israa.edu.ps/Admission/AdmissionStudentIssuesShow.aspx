<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="AdmissionStudentIssuesShow.aspx.cs" Inherits="Admission_AdmissionStudentIssuesShow" %>

<%@ Register Src="~/Admission/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="../assets/stdimage/css/jquery.Jcrop.css" type="text/css" />
    <script src="../assets/stdimage/js/jquery.cropit.min.js"></script>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.holder-style').removeClass('holder-active');
            $('#StudentImage').addClass('holder-active');

            $('.image-editor').cropit({
                imageBackground: true,
                imageBackgroundBorderWidth: 15
            });
            $('.crop').click(function () {
                // Move cropped image data to hidden input
                var imageData = $('.image-editor').cropit('export');
                $('.hidden-image-data').val(imageData);
                $('#btnUpload').show();
            });
        });
    </script>
    <style>
        label.filebutton {
            width: 120px;
            height: 40px;
            overflow: hidden;
            position: relative;
            background-color: #ccc;
        }

        label span input {
            z-index: 999;
            line-height: 0;
            font-size: 50px;
            position: absolute;
            top: -2px;
            left: -700px;
            opacity: 0;
            filter: alpha(opacity = 0);
            -ms-filter: "alpha(opacity=0)";
            cursor: pointer;
            _cursor: hand;
            margin: 0;
            padding: 0;
        }

        .fileUpload {
            position: relative;
            overflow: hidden;
            padding: 7px;
            width: 20%;
        }

            .fileUpload input.upload {
                position: absolute;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                font-size: 20px;
                cursor: pointer;
                opacity: 0;
                filter: alpha(opacity=0);
            }

        .dropdown-menu li > a {
            clear: both;
            color: #333;
            display: block;
            font-weight: normal;
            line-height: 18px;
            padding: 0;
            text-decoration: none;
            white-space: nowrap;
        }

        .dropdown.open .dropdown-toggle {
            background: #e0eaf0 !important;
            color: #121212;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">قضايا الطالب
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
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

                    <uc1:StudentSideBar runat="server" ID="StudentSideBar" ActiveTab="AdmissionStudentIssuesShow" />
                    <div style="width: 81%; float: right;">
                        <div id="tab2" class="tab-pane" runat="server" clientidmode="Static">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <h4>قضايا الطالب</h4>
                                        </div>
                                    </div>
                                    <hr style="margin: 10px 0 15px 0" />
                                    <% if (ListView1.Items.Count > 0)
                                        { %>
                                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                                        <thead>
                                            <tr>
                                                <th style="width: 10%; text-align: center;">التاريخ </th>
                                                <th style="width: 20%; text-align: center;">القضية</th>
                                                <th style="width: 40%; text-align: center;">الجهة الإدارية المخولة بالاجراء</th>
                                                <th style="width: 20%; text-align: center;">حالة القضية  </th>
                                                <th style="width: 15%; text-align: center;"></th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>
                                                    <tr>
                                                        <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="lblStudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="Place" runat="server" Text='<%# Eval("Place") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="MinOrderDepartment" runat="server" Text='<%# Eval("MinOrderDepartment") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="TopIssueAccerdation" runat="server" Text='<%# Eval("TopIssueAccerdation") %>' Visible="false"></asp:Label>
                                                        <td style="text-align: center"><%# Eval("RequestDate","{0:yyyy/MM/dd}") %></td>
                                                        <td style="text-align: center"><%# Eval("IsuueName") %></td>
                                                        <td style="text-align: center"><%# Eval("PlaceName") %></td>
                                                        <td style="text-align: center"><%# Eval("IsuueStatus") %></td>
                                                        <td>
                                                            <asp:LinkButton ID="BtnViewIssueDetails" runat="server" CssClass="btn green" Style="font-size: 11px; padding: 4px 10px;" OnClick="BtnViewIssueDetails_Click">تفاصيل القضية</asp:LinkButton></td>
                                                        <td>
                                                            <asp:LinkButton ID="lbPDF" runat="server" CssClass="btn blue" Style="font-size: 11px; padding: 4px 10px;" OnClick="lbPDF_Click">طباعة القضية </asp:LinkButton>

                                                        </td>

                                                        <td>
                                                            <asp:LinkButton ID="BtnAcceptReject" runat="server" CssClass="btn green" Style="font-size: 11px; padding: 4px 10px;" OnClick="BtnAcceptReject_Click" Visible='<%#((Eval("IsValied").ToString() == "1")) ? true:false %>'>الإجراء الإداري</asp:LinkButton>
                                                            <% if (Permissions.Contains("ReAccredationIssue"))
                                                                { %>
                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" Visible='<%# ( (Eval("CanDelete").ToString() == "1")) ? true:false %>' OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> التراجع عن الإجراء</a></asp:LinkButton>
                                                            <% } %>

                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaStudentIssue %>' SelectCommand="StudentIssuesShow" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
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
                                            <strong>لا يوجد قضايا للعرض  </strong>
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
    </div>
</asp:Content>

