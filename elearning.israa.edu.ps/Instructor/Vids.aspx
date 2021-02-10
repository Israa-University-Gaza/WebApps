<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Vids.aspx.cs" ValidateRequest="false" Inherits="Instructor_Announcements" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
         <script>
    $(document).ready(function(){
        $("#exampleModal").modal('show');
    });
</script>
     
    <div class="modal fade" id= 'exampleModal' tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                          
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          
        <h5 class="modal-title" id="exampleModalLabel"> تنوية مهم </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body" style="direction:rtl">
       <span style="font-size:larger"> يرجى العلم ان الفيديوهات المسموح رفعها للطلبة لابد ان تكون  <span style="font-size:larger;color:red"> يوتيوب </span> </span>
         <br/>
           <span style="font-size:larger"> نود التنويه أن  خاصية فيديو إثرائي  تستخدم  لإضافة فيديو إثرائي للطلبة من مصدر خارجي .. </span>
          <br/>
           
    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn-danger"  data-dismiss="modal">إغلاق</button>

         
      </div>
    </div>
  </div>
</div>
    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-facetime-video"></span>الفيديو  </h4>
            <p class="text-justify">
            </p>
        </div>
    </div>

    
        
        <div runat="server" id="vids" class="well">
            <div class="row">
              <div class="col-sm-4 col-md-4">
            <div class="form-group">
                <label>المادة </label>

                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" OnDataBound="DropDownList2_DataBound"></asp:DropDownList>
                <asp:CheckBox  ID="CheckBox1" runat="server" Text=" .. اضف لكل الشعب الخاصة بهذا المساق  " ForeColor="Red" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            </div>
                  </div>
            
            <div class="col-sm-4 col-md-4">
             <div class="form-group">
                <label>العنوان </label>

                <asp:TextBox ID="tit" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tit" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
                </div>
             <div class="col-sm-4 col-md-4">
            <div class="form-group">
                <label>الاسبوع </label>

                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="id" Font-Names="Tahoma" OnDataBound="DropDownList1_DataBound"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT id, CONCAT(startdate, '-',enddate) FROM [e_crs_week] where sem=(select top 1 semester_id from e_semester );"></asp:SqlDataSource>

            </div>
                 </div>
                </div>
            
            <div class="row">
             <div class="col-sm-6 col-md-6">
            <div class="form-group">
                <label>رابط اليوتيوب </label>
                <div>

                    
                    <asp:TextBox ID="link" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="link" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="ادخل رابط يوتيوب" ControlToValidate="link" ForeColor="#FF3300" ValidationExpression="^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$"></asp:RegularExpressionValidator>
                     </div>

            </div>
                 </div>
                        <div class="col-sm-6 col-md-6">
                         
                            <div class="form-group">
                <label>نوع الفيديو </label>
                <div>

                    
                      <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control">
                          <asp:ListItem>داخلي</asp:ListItem>
                          <asp:ListItem Value="خارجي">فيديو إثرائي</asp:ListItem>
                      </asp:DropDownList>  </div>

            </div>
                            </div>
                 </div>
            <div dir="ltr">
                <asp:Button ID="Button1" CssClass="btn-warning focus" runat="server" Text="ادخال" OnClick="Button1_Click" />
            </div>

        </div>
        <div runat="server" id="Done" style="text-align: -webkit-center;" class="well">

                <asp:Image ID="Image1" ImageUrl="~/assets/true.png" runat="server" />
                <h3>تم اضافة الفيديو بنجاح</h3>
                <asp:HyperLink ID="HyperLink2" NavigateUrl="Default.aspx" runat="server">الصفحة الرئيسية</asp:HyperLink>
            </div>
    
</asp:Content>

