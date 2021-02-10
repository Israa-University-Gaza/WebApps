<%@ Page Title="" Language="C#" MasterPageFile="~/Students/MasterPage.master" AutoEventWireup="true" CodeFile="HomeworkReport.aspx.cs" Inherits="Students_HomeworkReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>تقرير الواجبات  </h4>
          
        </div>
    </div>
    <div class="row">
    <asp:gridview runat="server" autogeneratecolumns="False" datasourceid="SqlDataSource1" CssClass="table" OnRowDataBound="Unnamed1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="Row_Number" HeaderText="#" SortExpression="Row_Number" />
            <asp:TemplateField HeaderText="الاسبوع">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("enddate") %>'></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("startdate") %>'></asp:Label>
                    &nbsp;-
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EnterDate" HeaderText="تاريخ الامتحان" />
           
            <asp:TemplateField HeaderText="الحالة">
                <ItemTemplate>
                    <asp:Label ID="stat" runat="server" Text="Label"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:gridview>
        </div>
    <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:conn %>" selectcommand="SELECT ROW_NUMBER() OVER(ORDER BY e_HomeWork.id desc) AS Row_Number ,e_HomeWork.id,e_crs_week.startdate, e_crs_week.enddate, e_HomeWork.EnterDate FROM e_HomeWork INNER JOIN e_crs_week ON e_HomeWork.week_id = e_crs_week.id
where e_HomeWork.crs_id=@crs and e_HomeWork.section=@sec ORDER BY e_HomeWork.id desc">
        <SelectParameters>
            <asp:QueryStringParameter Name="crs" QueryStringField="crs" />
            <asp:QueryStringParameter Name="sec" QueryStringField="section" />
        </SelectParameters>
    </asp:sqldatasource>
</asp:Content>

