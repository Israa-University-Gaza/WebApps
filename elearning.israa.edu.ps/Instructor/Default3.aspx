<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Instructor_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script>
    $(document).ready(function(){
        $("#exampleModal").modal('show');
    });
</script>
     
    <div class="modal fade" id= 'exampleModal' tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                          
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          
        <h5 class="modal-title" id="exampleModalLabel"> إعلان هام </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <span> جدول المحاضرات التفاعلية عبر منصة ZOOM للفصل
الصيفي</span>
          <a style="color:red" href="https://elearning.israa.edu.ps/SummerSem.pdf">من هنا </a>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn-danger"  data-dismiss="modal">إغلاق</button>

         
      </div>
    </div>
  </div>
</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

