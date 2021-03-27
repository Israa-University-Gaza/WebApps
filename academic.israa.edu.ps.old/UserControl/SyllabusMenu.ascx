<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SyllabusMenu.ascx.cs" Inherits="UserControl_SyllabusMenu" %>
<asp:Label ID="lblSyllabusID" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblCourseName" runat="server" Visible="false"></asp:Label>
 <asp:Label ID="lblAccreditationDepartmentID" runat="server" Visible="false"></asp:Label>

<ul class="nav nav-pills nav-justified steps font-ha">
    <li id="SyllabusGeneralDescription">
        <asp:LinkButton ID="lbMenu1" runat="server" CssClass="step" OnClick="lbMenu1_Click">
            <span class="number">1</span>
            <br />
            <span class="desc">
                <i class="fa fa-check"></i>الوصف العام</span>
        </asp:LinkButton>
    </li>
    <li id="SyllabusGoals">
        <asp:LinkButton ID="lbMenu2" runat="server" CssClass="step" OnClick="lbMenu2_Click">
            <span class="number">2</span>
            <br />
            <span class="desc">
                <i class="fa fa-check"></i>أهداف المساق</span>
        </asp:LinkButton>
    </li>
    <li id="SyllabusBookReference">
        <asp:LinkButton ID="lbMenu3" runat="server" CssClass="step" OnClick="lbMenu3_Click">
            <span class="number">3</span>
            <br />
            <span class="desc">
                <i class="fa fa-check"></i>الكتب والمراجع</span>
        </asp:LinkButton>
    </li>
    <li id="SyllabusDetailedDescriptions">
        <asp:LinkButton ID="lbMenu4" runat="server" CssClass="step" OnClick="lbMenu4_Click">
            <span class="number">4</span>
            <br />
            <span class="desc">
                <i class="fa fa-check"></i>الوصف التفصيلي</span>
        </asp:LinkButton>
    </li>
    <li id="SyllabusActivities">
        <asp:LinkButton ID="lbMenu5" runat="server" CssClass="step" OnClick="lbMenu5_Click">
            <span class="number">5</span>
            <br />
            <span class="desc">
                <i class="fa fa-check"></i>الأنشطة التعليمية</span>
        </asp:LinkButton>
    </li>
    <li id="SyllabusOutcomes">
        <asp:LinkButton ID="lbMenu6" runat="server" CssClass="step" OnClick="lbMenu6_Click">
            <span class="number">6</span>
            <br />
            <span class="desc">
                <i class="fa fa-check"></i>المخرجات التعليمية</span>
        </asp:LinkButton>
    </li>
    <li id="SyllabusEvaluation">
        <asp:LinkButton ID="lbMenu7" runat="server" CssClass="step" OnClick="lbMenu7_Click">
            <span class="number">7</span>
            <br />
            <span class="desc">
                <i class="fa fa-check"></i>وسائل التقييم</span>
        </asp:LinkButton>
    </li>

    <li id="SyllabusAccreditation">
        <asp:LinkButton ID="lbMenu8" runat="server" CssClass="step" OnClick="lbMenu8_Click">
            <span class="number">8</span>
            <br />
            <span class="desc">
                <i class="fa fa-check"></i>إعتماد التوصيف</span>
        </asp:LinkButton>
    </li>
</ul>
