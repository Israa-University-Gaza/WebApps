<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudentMenu.ascx.cs" Inherits="Financial_UserControl_StudentMenu" %>

<asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>

<ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
    <li style="margin-bottom: 0;">
        <div class="input-group">
            <asp:TextBox ID="txtStudentNo" runat="server" class="form-control" placeholder="الرجاء ادخال رقم الطالب" Style="font-family: Tahoma; font-size: 12px !important;"></asp:TextBox>
            <span class="input-group-btn">
                <asp:Button ID="btnChechStudent" runat="server" Text="بحث" class="btn green" OnClick="btnChechStudent_Click" Style="height: 34px;" />
            </span>
        </div>
    </li>
    <li>
        <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
        <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource10">
            <ItemTemplate>
                <h5 style="text-align: center;"><%# Eval("DisplayName") %> (<%# Eval("StudentNo") %>)</h5>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource10" runat="server"
            ConnectionString="<%$ ConnectionStrings:isra %>"
            SelectCommand="GetStudentData" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </li>
    <li class="active"><a data-toggle="tab" href="#tab1"><i class="fa fa-home"></i>الصفحة الرئيسية<span class="after"></span></a></li>
    <li><a href="StudentPlan.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-home"></i>الخطة الدراسية</a></li>
    <li><a href="StudentFinancialProfile.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>الملف المالي</a></li>
    <li><a href="StudentScholarship.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>منح الطالب</a></li>
    <li><a href="StudentFromAccount.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>تحويل من حساب</a></li>
    <li><a href="StudentFinancialReturn.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>عكس قيد مالي للطالب</a></li>
    <li><a href="StudentFinancialReturnAmount.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>عكس قيد مالي للطالب بمبلغ</a></li>
    <li><a href="StudentInstallment.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>أقساط الطالب</a></li>
    <li><a href="StudentBook.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-book"></i>الكتب الدراسية</a></li>
    <li><a href="StudentVoucher.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-book"></i>السندات المالية</a></li>
    <li><a href="StudentBlockExceptionAdd.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-book"></i>فتح صفحة الطالب</a></li>
	<li><a target="_blank" href="https://api.israa.edu.ps/students/GetStudentTransactions.php?StudentID=<%= lblStudentID.Text %>"><i class="fa fa-book"></i>طباعة حولات من حساب</a></li>
</ul>
