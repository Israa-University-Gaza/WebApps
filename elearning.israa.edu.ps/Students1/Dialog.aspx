<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" validateRequest="false" CodeFile="Dialog.aspx.cs" Inherits="Instructor_Dialog_" %>
<%@ Register TagPrefix="RTE" Namespace="RTE" Assembly="RichTextEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=deadline.ClientID %>").dynDateTime({
            showsTime: true,
            ifFormat: "%Y/%m/%d %H:%M",
            daFormat: "%l;%M %p, %e %m,  %Y",
            align: "BR",
            electric: false,
            singleClick: false,
            displayArea: ".siblings('.dtcDisplayArea')",
            button: ".next()"
        });
    });
    </script>
     <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer"></span> الحوار الاسبوعي  </h4>
            <p class="text-justify">
            </p>
        </div>
    </div>
    <div runat="server" id="dig" class="well">
        <div class="col-sm-4 col-md-4">
            <div class="form-group">
                <label>المادة </label>

                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" ></asp:DropDownList>
                <asp:CheckBox  ID="CheckBox1" runat="server" Text=" .. اضف لكل الشعب الخاصة بهذا المساق  " ForeColor="Red" />
                
            </div>
            </div>
          <div class="col-sm-4 col-md-4">
        <div class="form-group">
                <label>الاسبوع </label>

                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="id" Font-Names="Tahoma" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT id, CONCAT(startdate, '-',enddate) FROM [e_crs_week];"></asp:SqlDataSource>

            </div>
              </div>
        <div class="col-sm-4 col-md-4">
            <div class="form-group">
                    <label>متاح حتى </label>
                    <asp:TextBox ID="deadline" runat="server"  Width="90%" ReadOnly="true"></asp:TextBox>
                    <img src="calender.png" />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="deadline" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            <div class="form-group">
                <label>العنوان </label>

                <asp:TextBox ID="tit" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tit" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label>تفاصيل </label>
                <div>


                    <RTE:Editor runat="server" ID="Editor2" ContentCss="example.css" Height="200px" Skin="officexpblue" Toolbar="email" />







                </div>

            </div>
            
            
            <div dir="ltr">
                <asp:Button ID="Button1" CssClass="btn-warning focus" runat="server" Text="ادخال" OnClick="Button1_Click" />
            </div>

        </div>
    <div runat="server" id="Done" style="text-align: -webkit-center;" class="well">

                <asp:Image ID="Image1" ImageUrl="~/assets/true.png" runat="server" />
                <h3>تم اضافة الحوار بنجاح</h3>
                <asp:HyperLink ID="HyperLink2" NavigateUrl="Default.aspx" runat="server">الصفحة الرئيسية</asp:HyperLink>
            </div>
</asp:Content>

