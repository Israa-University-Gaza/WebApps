<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true"  EnableEventValidation="false" CodeFile="Std.aspx.cs" Inherits="Instructor_Std" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .cards-list {
            z-index: 0;
            width: 100%;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .card {
            margin: 30px auto;
            width: 170px;
            height: 170px;
            border-radius: 40px;
            box-shadow: 5px 5px 30px 7px rgba(0,0,0,0.25), -5px -5px 30px 7px rgba(0,0,0,0.22);
            cursor: pointer;
            transition: 0.4s;
        }

            .card .card_image {
                width: inherit;
                height: inherit;
                border-radius: 40px;
            }

                .card .card_image img {
                    width: inherit;
                    height: inherit;
                    border-radius: 40px;
                    object-fit: cover;
                }

            .card .card_title {
                text-align: center;
                border-radius: 0px 0px 40px 40px;
                /*font-family: sans-serif;*/
                font-weight: bold;
                /*font-size: 18px;*/
                margin-top: -27px;
                height: 40px;
            }

            .card:hover {
                transform: scale(0.9, 0.9);
                box-shadow: 5px 5px 30px 15px rgba(0,0,0,0.25), -5px -5px 30px 15px rgba(0,0,0,0.22);
            }

        .title-white {
            color: white;
        }

        .title-black {
            color: black;
        }

        @media all and (max-width: 500px) {
            .card-list {
                /* On small screens, we are no longer using row direction but column */
                flex-direction: column;
            }
        }


        /*
.card {
  margin: 30px auto;
  width: 300px;
  height: 300px;
  border-radius: 40px;
  background-image: url('https://i.redd.it/b3esnz5ra34y.jpg');
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  background-repeat: no-repeat;
box-shadow: 5px 5px 30px 7px rgba(0,0,0,0.25), -5px -5px 30px 7px rgba(0,0,0,0.22);
  transition: 0.4s;
}
*/
    </style>

    <div class="form-group">
        <label>المادة </label>

        <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" OnDataBound="DropDownList2_DataBound" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" ></asp:DropDownList>
    </div>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>


    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater_ItemDataBound">
        <ItemTemplate>
            <div class="col-sm-3 col-md-3">
                <div class="cards-list">
                    <div class="card 1">
                        <div class="card_image">
                            <img runat="server" id="img1" width="250" src="" />
                        </div>
                        <div class="card_title title-white">
                            <p><%# Eval("nameInfo") %></p>
                        </div>
                    </div>
                    <%--<asp:Button ID="show" runat="server" CssClass="btn-info"  Text='<%#  "مراسلة :"+ Eval("nameInfo") %>' data-toggle="modal"  data-target='<%# "#exampleModal"+Eval("studentNo") %>' />--%>
               <a href="#"  data-toggle="modal"  data-target='<%# "#exampleModal"+Eval("ROW") %>'> <%#  "مراسلة :"+ Eval("nameInfo").ToString().Split(' ')[0] %></a>
                     </div>
                 
            </div>
            
            <div class="modal fade" id= '<%# "exampleModal"+Eval("ROW") %>' tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                          
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">    <h4 style="text-align:center">مراسلة الطالب:   <%# Eval("nameInfo") %></h4>  </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
  <div id="mas" runat="server" >
      
 <div class="row" style=" padding-right: 24px;">
     <asp:Label ID="to_id" runat="server" Visible="false" Text=' <%# Eval("studentNo") %>'></asp:Label>
     <asp:Label ID="to_name" runat="server" Visible="false" Text=' <%# Eval("nameInfo") %>'></asp:Label>
         <div class="form-group">
                    <label>عنوان الرسالة </label>
        <asp:TextBox ID="title2" CssClass="form-control"  runat="server"></asp:TextBox>
        

                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="title" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ></asp:RequiredFieldValidator>--%>
                </div>
        <div class="form-group">
                    <label>نص الرسالة </label>
           <CKEditor:CKEditorControl ID="Editor2" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>

                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Editor2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ></asp:RequiredFieldValidator>--%>
                </div>
     </div>
         <div style="text-align:center">
    <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text=" ارسال1 " CommandArgument='<%# Eval("ROW") %>' OnClick="Button1_Click" />
        <br/>
         <br/>
        <hr/>
        </div>
    </div>
        <%--<div runat="server"  id="Done" style="text-align: -webkit-center;" class="well">

                <asp:Image ID="Image1" ImageUrl="~/assets/true.png" runat="server" />
                <h3>تم ارسال الرسالة بنجاح</h3>
                <asp:Button ID="Button2" CssClass="btn-danger" runat="server" Text="اغلاق " BackColor="Red" ForeColor="White" OnClick="Button2_Click" Width="40px" />
     </div>--%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn-danger" onclick="msg(<%# Eval("id") %>)" data-dismiss="modal">إغلاق</button>

          
      </div>
    </div>
  </div>
</div>
        </ItemTemplate>
    </asp:Repeater>





</asp:Content>

