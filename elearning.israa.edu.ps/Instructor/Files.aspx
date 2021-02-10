<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Files.aspx.cs" ValidateRequest="false" Inherits="Instructor_Announcements" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>الملفات  </h4>
            <p class="text-justify">
            </p>
        </div>
    </div>

    <div class="col-sm-12 col-md-12">
        <div runat="server" id="er" style="background-color: #ffe9dc; border-color: #31708f; padding: 15px; margin-bottom: 20px;  direction:rtl; border: 1px solid; border-radius: 4px;">
            <strong style="color: #7c3d18;">خطأ - Error</strong>
            <div runat="server" id="ertxt" style="color: #7c3d18;"></div>


        </div>
        <div runat="server" id="fil" class="well">
            <div class="form-group">
                <label>المادة </label>

                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" OnDataBound="DropDownList2_DataBound"></asp:DropDownList>
                <asp:CheckBox  ID="CheckBox1" runat="server" Text=" .. اضف لكل الشعب الخاصة بهذا المساق  " ForeColor="Red" />
                
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


                         <CKEditor:CKEditorControl ID="Editor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>



                </div>

            </div>
            <div class="form-group">
                <label>الاسبوع </label>

                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="id" Font-Names="Tahoma" OnDataBound="DropDownList1_DataBound"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT id, CONCAT(startdate, '-',enddate) FROM [e_crs_week] where sem=(select top 1 semester_id from e_semester );"></asp:SqlDataSource>

            </div>
            <div class="form-group">
                <label>الملف <span style="font-size: large">الملفات المسموحة  </span><span style="font-size: large; color: red">pdf,ppt,doc,xls </span><span style="font-size: large; color: darkgreen">الحجم المسموح 10 ميجابايت </span></label>
                <div>

                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileUpload1" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </div>

            </div>
            <div dir="ltr">
                <asp:Button ID="Button1" CssClass="btn-warning focus" runat="server" Text="ادخال" OnClick="Button1_Click" />
            </div>

        </div>
        <div runat="server" id="Done" style="text-align: -webkit-center;" class="well">

                <asp:Image ID="Image1" ImageUrl="~/assets/true.png" runat="server" />
                <h3>تم اضافة الملف بنجاح</h3>
                <asp:HyperLink ID="HyperLink2" NavigateUrl="Default.aspx" runat="server">الصفحة الرئيسية</asp:HyperLink>
            </div>
    </div>
</asp:Content>

