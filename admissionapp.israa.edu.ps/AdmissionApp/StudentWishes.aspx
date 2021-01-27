<%@ Page Title="" Language="C#" MasterPageFile="~/AdmissionApp/MasterPage.master" AutoEventWireup="true" CodeFile="StudentWishes.aspx.cs" Inherits="AdmissionApp_StudentWishes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.holder-style').removeClass('holder-active');
            $('#StudentWishes').addClass('holder-active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="portlet-body form">
        <div class="form-horizontal">
            <div class="form-body">
                <div class="form-group">
                    <div class="row col-md-9">
                        <asp:Label ID="msg" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row col-md-9">
                        الرجاء إختيار رغبات الدراسة من القائمة أدناه
                    </div>
                </div>
                <div class="form-group">
                    <div class="row col-md-12">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-3">رغبة مكان الدراسة :</div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlPlacesOfStudy" runat="server" DataSourceID="SqlDataSource9" DataTextField="ArName" DataValueField="ID" CssClass="form-control" AutoPostBack="False"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT [ID], [ArName] FROM [PlaceOfStudy] WHERE ([IsDelete] = 0) union Select -1 , N'إختر مكان الدراسة'"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row col-md-12">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-3">الرغبة الأولى :</div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlCollege1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" CssClass="form-control dropdown-control w200" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableCollege" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlDepartment1" runat="server" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" CssClass="form-control" class="dropdown-control w200"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableDepartment" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlCollege1" Name="CollegeID" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row col-md-12">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-3">الرغبة الثانية :</div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlCollege2" runat="server" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" CssClass="form-control dropdown-control w200" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableCollege" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlDepartment2" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" CssClass="form-control" class="dropdown-control w200"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableDepartment" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlCollege2" Name="CollegeID" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlDepartment1" Name="DepartmentID1" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row col-md-12">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-3">الرغبة الثالثة :</div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlCollege3" runat="server" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID" CssClass="form-control dropdown-control w200" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableCollege" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlDepartment3" runat="server" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" CssClass="form-control" class="dropdown-control w200"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableDepartment" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlCollege3" Name="CollegeID" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlDepartment1" Name="DepartmentID1" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlDepartment2" Name="DepartmentID2" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-md-5">
                        <a href="ContactData.aspx" class="btn btn-rounded green default">السابق</a>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnSave" runat="server" class="btn blue btn btn-rounded default btn-block w80" OnClick="btnSave_Click" Text="حفظ" />
                    </div>
                    <div class="col-md-5" style="direction: ltr">
                        <asp:LinkButton ID="lbStudentImage" runat="server" CssClass="btn btn-rounded green default" Visible="false" OnClick="lbStudentImage_Click">التالي</asp:LinkButton>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>
