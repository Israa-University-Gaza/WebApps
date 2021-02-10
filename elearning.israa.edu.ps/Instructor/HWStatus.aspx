<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="HWStatus.aspx.cs" Inherits="Students_HWStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        table * {
            text-align: center;
        }
    </style>
    <div class="well">
        <h4><span style="font-size: 18px;" class="glyphicon glyphicon-bell"></span>&nbsp;&nbsp;
                تقارير الواجبات للمواد المسجلة للفصل الدراسي الحالي 
        </h4>

    </div>
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table">
            <Columns>
                <asp:BoundField DataField="courseCode" HeaderText="رقم المساق" SortExpression="courseCode" />
                <asp:BoundField DataField="arName" HeaderText="اسم المساق" SortExpression="arName" />
                <asp:BoundField DataField="sectionNum" HeaderText="الشعبة" SortExpression="sectionNum" />
                <asp:TemplateField HeaderText="الواجبات">
                    <ItemTemplate>
                        <asp:Label ID="sec" runat="server" Text='<%# Eval("sectionNum") %>' Visible="False"></asp:Label>
                        <asp:Label ID="crs" runat="server" Text='<%# Eval("courseCode") %>' Visible="False"></asp:Label>
                        <br />
                        <div class="table-responsive">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowSorting="True" CssClass="table" EmptyDataText="لا يوجد واجبات لهذا المساق" OnRowDataBound="GridView2_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="تاريخ الواجب" SortExpression="EnterDate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EnterDate") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "Viewhomework.aspx?id="+Eval("id") %>' Text='<%# Eval("EnterDate") %>'></asp:HyperLink>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DeadLine" HeaderText="آخر موعد للتسليم" SortExpression="DeadLine" />
                                    <asp:TemplateField HeaderText="المتبقي" SortExpression="remin_day">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("remin_day") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>

                                            <asp:Label ID="rem" runat="server" Text='<%# Bind("remin_day") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="mark" HeaderText="الدرجة" SortExpression="mark" />
                                    <asp:TemplateField HeaderText="الحالة">
                                        <ItemTemplate>

                                         التسليم:   <asp:Label ID="hw_stat" runat="server"></asp:Label>
                                            بحاجة الى تقييم:   <asp:Label ID="hw_stat1" runat="server"></asp:Label>
                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT DATEDIFF(day, getdate(),CONVERT(datetime, dbo.e_HomeWork.DeadLine)) AS remin_day,DATEDIFF(hour, getdate(),CONVERT(datetime, dbo.e_HomeWork.DeadLine)) AS remin_hour,DATEDIFF(Minute, getdate(),CONVERT(datetime, dbo.e_HomeWork.DeadLine)) AS remin_Minute,
                          convert(varchar, EnterDate, 105)	EnterDate, convert(varchar, CONVERT(datetime, dbo.e_HomeWork.DeadLine), 20) DeadLine, [mark], [id] FROM [e_HomeWork] WHERE (([crs_id] = @crs_id) AND ([section] = @section) AND ([sem] = @sem))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="crs" Name="crs_id" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="sec" Name="section" PropertyName="Text" Type="String" />
                                <asp:Parameter DefaultValue="20" Name="sem" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br>
    <hr/>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [courseCode], [arName], [sectionNum] FROM [std_crs] WHERE ([std_id] = @std_id)">
        <SelectParameters>
            <asp:SessionParameter Name="std_id" SessionField="log" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br>
    <hr/>
</asp:Content>

