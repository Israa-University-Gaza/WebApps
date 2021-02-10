<%@ Page Title="" Language="C#" MasterPageFile="~/Students/MasterPage1.master" AutoEventWireup="true" CodeFile="LocationStudy.aspx.cs" Inherits="Students_LocationStudy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-sm-12 col-md-12" runat="server" id="std">
  
<h3><span style="font-size:18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp;إعلان هام </h3>
<p class="text-center">
    
    
     &nbsp;</p>
        <p class="text-center">
    
الرجاء اختيار رغبة مكان الدراسة من القائمة الفرع الرئيس - الزهراء أو فرع شمال غزة - شارع يافا ..   
</p>
        
        
    
        
         <div class="col-sm-12 col-md-12">
                <div class="form-group">
                    <label>اختر مكان الدراسة </label>
                    <asp:dropdownlist runat="server" ID="dROP" CssClass="form-control">
                        <asp:ListItem Value="-1">اختر</asp:ListItem>
                        <asp:ListItem>المقر الرئيس - الزهراء</asp:ListItem>
                        <asp:ListItem>فرع شمال غزة - شارع يافا</asp:ListItem>
                    </asp:dropdownlist>
                  

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dROP" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
                </div>
            </div>
           <div class="col-sm-12 col-md-12" style="
    direction: initial;
">
               <asp:Button ID="btm" CssClass="btn-primary" runat="server" Text="موافق" OnClick="btm_Click" />
               </div>

            
  </div>
       
    <div runat="server" id="Done" style="text-align: -webkit-center;" class="well">

            <asp:Image ID="Image1" ImageUrl="~/assets/true.png" runat="server" Height="250px" Width="255px" />
            <h3>تم اختيار الرغبة بنجاح </h3>
            <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Students/Default.aspx" runat="server">الصفحة الرئيسية</asp:HyperLink>
        </div>
        

</asp:Content>

