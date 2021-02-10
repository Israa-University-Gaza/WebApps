<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="books.aspx.cs"  validateRequest="false" Inherits="Instructor_Announcements" %>
<%@ Register TagPrefix="RTE" Namespace="RTE" Assembly="RichTextEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-sm-12 col-md-12">
<div class="well">
<h4><span style="font-size:18px;" class="glyphicon glyphicon-book"></span>كتب المساقات </h4>
<p class="text-justify">

</p>
</div>
</div>

      <div class="col-sm-12 col-md-12">
          <div runat="server" id="er" style="background-color: #ffe9dc;border-color: #31708f;padding: 15px;
    margin-bottom: 20px;
    border: 1px solid ;
    border-radius: 4px;">
                                    <strong style="color: #7c3d18;">خطأ - Error</strong>
                                    <div runat="server" id="ertxt" style="color: #7c3d18;"></div>
                                    
                                    
                                </div>
<div class="well">
    <div class="form-group">
            <label>المادة </label>

        <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" OnDataBound="DropDownList2_DataBound" AutoPostBack="True" OnTextChanged="DropDownList2_TextChanged"></asp:DropDownList>        </div>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1" ></asp:RequiredFieldValidator>
    
    
    <div class="form-group">
            <label>رفع الكتاب </label>
      <div>
       
          <asp:FileUpload ID="FileUpload1" runat="server" />    
      
        
        
        
    
    </div>
      
        </div>
    <div dir="ltr">
<asp:Button ID="Button1" CssClass="btn-warning focus" runat="server" Text="ادخال" OnClick="Button1_Click" />
    </div>
    

</div>
</div>
</asp:Content>

