<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="MCQestion.aspx.cs" Inherits="Instructor_MCQestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>بنك اسئلة الاختيار المتعدد  </h4>
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
            <div class="row">
                <div class="col-sm-6 col-md-6">
<div class="form-group">
                <label>A </label>
       
       <asp:TextBox ID="a" CssClass="form-control" runat="server"></asp:TextBox>
        
               
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="a" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            
            </div>
                      </div>
                <div class="col-sm-6 col-md-6">
                     <div class="form-group">
                <label>B </label>
       
       <asp:TextBox ID="b" CssClass="form-control" runat="server"></asp:TextBox>
        
               
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="b" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            
            </div>
                    </div>
                <div class="col-sm-6 col-md-6">
                     <div class="form-group">
                <label>C </label>
       
       <asp:TextBox ID="c" CssClass="form-control" runat="server"></asp:TextBox>
        
               
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="c" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            
            </div>
                    </div>
                <div class="col-sm-6 col-md-6">
                     <div class="form-group">
                <label>D </label>
       
       <asp:TextBox ID="d" CssClass="form-control" runat="server"></asp:TextBox>
        
               
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="d" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            
            </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                     <div class="form-group">
                <label> الصحيحة  الاجابة</label>
       
                         <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                             <asp:ListItem>A</asp:ListItem>
                             <asp:ListItem>B</asp:ListItem>
                             <asp:ListItem>C</asp:ListItem>
                             <asp:ListItem>D</asp:ListItem>
                         </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="d" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            
            </div>
                    </div>
            </div>
    
            <div dir="ltr">
                <asp:Button ID="Button1" CssClass="btn-warning focus" runat="server" Text="ادخال" OnClick="Button1_Click" />
            </div>
            </div>
        </div>
    <div class="col-sm-12 col-md-12">
        <div class="well">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource1" EmptyDataText="لا يوجد اسئلة مدخلة" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="crs_id" HeaderText="رقم المساق" SortExpression="crs_id" />
                    <asp:BoundField DataField="crs_name" HeaderText="المساق" SortExpression="crs_name" />
                    <asp:BoundField DataField="section" HeaderText="الشعبة" SortExpression="section" />
                    <asp:BoundField DataField="qas" HeaderText="السؤال" SortExpression="qas" />
                    <asp:TemplateField HeaderText="A" SortExpression="c1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("c1") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("c1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="B" SortExpression="c2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("c2") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("c2") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="C" SortExpression="c3">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("c3") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("c3") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="D" SortExpression="c4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("c4") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("c4") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('هلل انت متأكد')" Text="حذف" CssClass="btn-danger" OnClick="Button2_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [MCQestion] WHERE ([lec] = @lec) and isdeleted=0">
                <SelectParameters>
                    <asp:SessionParameter Name="lec" SessionField="log" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

