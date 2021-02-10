<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="OverVeiw.aspx.cs"  validateRequest="false" Inherits="Instructor_Announcements" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-sm-12 col-md-12">
<div class="well">
<h4><span style="font-size:18px;" class="glyphicon glyphicon-flag"></span>نبذة عن المساق  </h4>
<p class="text-justify">

</p>
</div>
</div>

      <div class="col-sm-12 col-md-12">
<div class="well">
    <div class="form-group">
            <label>المادة </label>

        <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" OnDataBound="DropDownList2_DataBound" AutoPostBack="True" OnTextChanged="DropDownList2_TextChanged"></asp:DropDownList>        </div>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1" ></asp:RequiredFieldValidator>
    
    
    <div class="form-group">
            <label>النبذة </label>
      <div>
       
         <<CKEditor:CKEditorControl ID="Editor2" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>

            
        
        
        
    
    </div>
      
        </div>
    <div dir="ltr">
<asp:Button ID="Button1" CssClass="btn-warning focus" runat="server" Text="ادخال" OnClick="Button1_Click" />
    </div>
    

</div>
</div>
</asp:Content>

