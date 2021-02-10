<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Exam.aspx.cs" Inherits="Instructor_Exam" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
    
     <div class="col-sm-12 col-md-12">
<div class="well">
<h4><span style="font-size:18px;" class="glyphicon glyphicon-flag"></span> الإمتحانات القصيرة  </h4>
<p class="text-justify">

</p>
</div>
         
<div runat="server" id="exam" class="well">
    <div class="col-sm-6 col-md-6">
    <div class="form-group">
            <label>المادة </label>

        <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" ></asp:DropDownList>  
        <asp:CheckBox  ID="CheckBox1" runat="server" Text=" .. اضف لكل الشعب الخاصة بهذا المساق  " ForeColor="Red" />
    </div>
        </div>
   <div class="col-sm-6 col-md-6">
    <div class="form-group">
            <label>الاسبوع </label>

        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="id" Font-Names="Tahoma"></asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT id, CONCAT(startdate, '-',enddate) FROM [e_crs_week];"></asp:SqlDataSource>

        </div>
       </div>
    <div class="form-group">
            <label>العنوان </label>

        <asp:TextBox ID="tit" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tit" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"  ></asp:RequiredFieldValidator>
        </div>
    <div class="form-group">
            <label>تفاصيل الامتحان </label>
      <div>
             
         <CKEditor:CKEditorControl ID="Editor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
        
        
    
    </div>
      
        </div>
    
     <div class="col-sm-12 col-md-12">
     <div class="form-group">
                    <label>رابط الموودل  </label>
                    <asp:TextBox ID="link" runat="server"  CssClass="form-control" Width="80%" ></asp:TextBox>
                  

                    
     </div>
        </div>
    <div class="col-sm-12 col-md-12">
     <div class="form-group">
                    <label>كلمة المرور الامتحان </label>
                    <asp:TextBox ID="pass" runat="server"  CssClass="form-control" Width="80%" Font-Size="X-Large" ForeColor="Red" ></asp:TextBox>
                  

                    
     </div>
        </div>


   

    <div dir="ltr">
<asp:Button ID="Button1" CssClass="btn-warning focus" runat="server" Text="ادخال" OnClick="Button1_Click" />
    </div>
    


         <div class="well">
<h4><span style="font-size:18px;" class="glyphicon glyphicon-flag"></span> الامتحانات السابقة  </h4>
<p class="text-justify">

</p>
</div>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" CssClass="table" EmptyDataText="لا  يوجد امتحانات قصيرة ">
             <Columns>
                 <asp:BoundField DataField="title" HeaderText="اسم الاختبار" SortExpression="title" />
                 <asp:BoundField DataField="crs_name_ar" HeaderText="المادة" SortExpression="crs_name_ar" />
                 <asp:BoundField DataField="section" HeaderText="الشعبة" SortExpression="section" />
                 <asp:TemplateField ShowHeader="False">
                     <ItemTemplate>
                         <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn-danger" OnClientClick="return confirm ('هل انت متأكد ؟؟')" Text="حذف" />
                     </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
         </asp:GridView>

         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conn %>" 
             DeleteCommand="DELETE FROM [e_exams] WHERE [id] = @original_id " InsertCommand="INSERT INTO [e_exams] ([title], [crs_name_ar], [section], [start_dt], [interval], [c1], [c2], [c3]) VALUES (@title, @crs_name_ar, @section, @start_dt, @interval, @c1, @c2, @c3)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [title], [crs_name_ar], [section], [start_dt], [interval], [c1], [c2], [c3] FROM [e_exams] WHERE ([lec] = @lec)" UpdateCommand="UPDATE [e_exams] SET [title] = @title, [crs_name_ar] = @crs_name_ar, [section] = @section, [start_dt] = @start_dt, [interval] = @interval, [c1] = @c1, [c2] = @c2, [c3] = @c3 WHERE [id] = @original_id AND (([title] = @original_title) OR ([title] IS NULL AND @original_title IS NULL)) AND (([crs_name_ar] = @original_crs_name_ar) OR ([crs_name_ar] IS NULL AND @original_crs_name_ar IS NULL)) AND (([section] = @original_section) OR ([section] IS NULL AND @original_section IS NULL)) AND (([start_dt] = @original_start_dt) OR ([start_dt] IS NULL AND @original_start_dt IS NULL)) AND (([interval] = @original_interval) OR ([interval] IS NULL AND @original_interval IS NULL)) AND (([c1] = @original_c1) OR ([c1] IS NULL AND @original_c1 IS NULL)) AND (([c2] = @original_c2) OR ([c2] IS NULL AND @original_c2 IS NULL)) AND (([c3] = @original_c3) OR ([c3] IS NULL AND @original_c3 IS NULL))">
             <DeleteParameters>
                 <asp:Parameter Name="original_id" Type="Int32" />
                 <asp:Parameter Name="original_title" Type="String" />
                 <asp:Parameter Name="original_crs_name_ar" Type="String" />
                 <asp:Parameter Name="original_section" Type="String" />
                 <asp:Parameter Name="original_start_dt" Type="String" />
                 <asp:Parameter Name="original_interval" Type="Int32" />
                 <asp:Parameter Name="original_c1" Type="Int32" />
                 <asp:Parameter Name="original_c2" Type="Int32" />
                 <asp:Parameter Name="original_c3" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="title" Type="String" />
                 <asp:Parameter Name="crs_name_ar" Type="String" />
                 <asp:Parameter Name="section" Type="String" />
                 <asp:Parameter Name="start_dt" Type="String" />
                 <asp:Parameter Name="interval" Type="Int32" />
                 <asp:Parameter Name="c1" Type="Int32" />
                 <asp:Parameter Name="c2" Type="Int32" />
                 <asp:Parameter Name="c3" Type="Int32" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="lec" SessionField="log" Type="String" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="title" Type="String" />
                 <asp:Parameter Name="crs_name_ar" Type="String" />
                 <asp:Parameter Name="section" Type="String" />
                 <asp:Parameter Name="start_dt" Type="String" />
                 <asp:Parameter Name="interval" Type="Int32" />
                 <asp:Parameter Name="c1" Type="Int32" />
                 <asp:Parameter Name="c2" Type="Int32" />
                 <asp:Parameter Name="c3" Type="Int32" />
                 <asp:Parameter Name="original_id" Type="Int32" />
                 <asp:Parameter Name="original_title" Type="String" />
                 <asp:Parameter Name="original_crs_name_ar" Type="String" />
                 <asp:Parameter Name="original_section" Type="String" />
                 <asp:Parameter Name="original_start_dt" Type="String" />
                 <asp:Parameter Name="original_interval" Type="Int32" />
                 <asp:Parameter Name="original_c1" Type="Int32" />
                 <asp:Parameter Name="original_c2" Type="Int32" />
                 <asp:Parameter Name="original_c3" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
    </div>

    <div runat="server" id="Done" style="text-align: -webkit-center;" class="well">

                <asp:Image ID="Image1" ImageUrl="~/assets/true.png" runat="server" />
                <h3>تم اضافة الامتحان  بنجاح</h3>
                <asp:HyperLink ID="HyperLink2" NavigateUrl="Default.aspx" runat="server">الصفحة الرئيسية</asp:HyperLink>
            </div>
</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

