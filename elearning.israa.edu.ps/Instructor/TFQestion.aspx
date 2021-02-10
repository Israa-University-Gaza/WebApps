<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="TFQestion.aspx.cs" Inherits="Instructor_TFQestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>بنك اسئلة صح ام خطأ  </h4>
            <p class="text-justify">
            </p>
        </div>
    </div>
    <div class="col-sm-12 col-md-12">
        <div class="well">
     <div class="form-group">
                <label>المساق </label>

                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" ></asp:DropDownList>
                <asp:CheckBox  ID="CheckBox1" runat="server" Text=" .. اضف لكل الشعب الخاصة بهذا المساق  " ForeColor="Red" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            
            </div>
    <div class="form-group">
                <label>السؤال </label>
        
      <asp:TextBox ID="qes" CssClass="form-control" runat="server"></asp:TextBox>
               
               
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="qes" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            
            </div>
    <div class="form-group">
                <label>الإجابة </label>
       
      
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem Value="1"> صح </asp:ListItem>
            <asp:ListItem Value="0"> خطأ </asp:ListItem>
        </asp:RadioButtonList>
               
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            
            </div>
            <div dir="ltr">
                <asp:Button ID="Button1" CssClass="btn-warning focus" runat="server" Text="ادخال" OnClick="Button1_Click" />
            </div>
            </div>
        </div>
     <div class="col-sm-12 col-md-12">
        <div class="well">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource1" EmptyDataText="لا يوجد اسئلة مدخلة" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="crs_id" HeaderText="رقم المساق" SortExpression="crs_id" />
                    <asp:BoundField DataField="crs_name" HeaderText="المساق" SortExpression="crs_name" />
                    <asp:BoundField DataField="section" HeaderText="الشعبة" SortExpression="section" />
                    <asp:BoundField DataField="qas" HeaderText="السؤال" SortExpression="qas" />
                    <asp:TemplateField HeaderText="الاجابة" SortExpression="answer">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("answer") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="37px" ImageUrl="~/assets/truee.png" Width="38px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('هلل انت متأكد')" Text="حذف" CssClass="btn-danger" OnClick="Button2_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [id],[qas], [answer], [crs_id], [section], [crs_name] FROM [TFQestion] WHERE ([lec] = @lec) and isdeleted=0">
                <SelectParameters>
                    <asp:SessionParameter Name="lec" SessionField="log" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
        </div>
            
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

