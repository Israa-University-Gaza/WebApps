<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="HomeWork.aspx.cs" Inherits="Instructor_Announcements" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-paperclip"></span>الواجبات  </h4>
            <p class="text-justify">
            </p>
        </div>
        <div class="alert alert-danger" role="alert">
  بالنسبة لموعد التسليم يرجى احتيار الوقت تم اليوم
</div>
    </div>

    <div class="row">
        <div runat="server" id="hw" class="well">
            <div class="col-sm-3 col-md-3">
                <div class="form-group">
                    <label>المادة </label>

                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" OnDataBound="DropDownList2_DataBound"></asp:DropDownList>
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="اضف لكل الشعب الخاصة بهذا المساق  " style="
    font-size: 10px;
" ForeColor="Red" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-sm-2 col-md-2">
                <div class="form-group">
                    <label>الاسبوع </label>

                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="id" Font-Names="Tahoma" OnDataBound="DropDownList1_DataBound"></asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT id, CONCAT(startdate, '-',enddate) FROM [e_crs_week] where sem=(select top 1 semester_id from e_semester );"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-sm-3 col-md-3">
                <div class="form-group">
                    <label>التسليم </label>
                    <asp:TextBox ID="deadline" runat="server"  Width="90%" ReadOnly="true"></asp:TextBox>
                    <img src="calender.png" />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="deadline" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="col-sm-2 col-md-2">
                <div class="form-group">
                    <label>ملف </label>

                    <asp:FileUpload ID="FileUpload1" runat="server" />

                    
                    
                </div>
            </div>
          
            <div class="col-sm-2 col-md-2">
                <div class="form-group">
                    <label>درجة الواجب </label>
                    <asp:TextBox ID="mark" Width="50%" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="mark" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                
                    
                    
                </div>
            </div>





            <div class="col-sm-12 col-md-12">
                <div class="form-group">
                    <label>الواجب </label>
                    <div>
  <CKEditor:CKEditorControl ID="Editor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>



                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Editor1" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>




                    </div>

                </div>
            </div>

<asp:Button ID="Button1" CssClass="btn-warning focus" runat="server" Text="ادخال" OnClick="Button1_Click" />
        </div>
        <div runat="server" id="Done" style="text-align: -webkit-center;" class="well">

                <asp:Image ID="Image1" ImageUrl="~/assets/true.png" runat="server" />
                <h3>تم اضافة الواجب بنجاح</h3>
                <asp:HyperLink ID="HyperLink2" NavigateUrl="Default.aspx" runat="server">الصفحة الرئيسية</asp:HyperLink>
            </div>
    </div>
    
</asp:Content>

