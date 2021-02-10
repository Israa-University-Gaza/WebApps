<%@ Page Title="" Language="C#" MasterPageFile="~/Students1/MasterPage1.master" AutoEventWireup="true" CodeFile="Eva.aspx.cs" Inherits="Students_Eva" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .radio label, .checkbox label {
            padding-right: 39px;
           
        }
        .checkbox, .radio 
        {
             margin-top: unset; 
     margin-bottom: unset;
        }

        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th
      {vertical-align: inherit;}  
        
    </style>

    <div class="row">
<div class="col-sm-12 col-md-12">
                          
                                
                                
                                <div style="background-color: #ffe9dc;border-color: #31708f;padding: 15px;
    margin-bottom: 20px;
    border: 1px solid ;
    border-radius: 4px;">
                                   <div>
        عزيزي الطالب/عزيزتي الطالبة:
السلام عليكم ورحمة الله وبركاته..<br />
                                       تقوم الجامعة بإجراء دراسة حول قياس مستوى رضا الطلبة حول الخدمات التي تقدمها جامعة الاسراء وذلك خلال الفصل الدراسي الاول من العام الجامعي   2020/   2021، حيث ستبنى على نتائج هذه الدراسة العديد من الجوانب التطويرية لذا نرجو التكرم من حضراتكم بالإجابة على كل سؤال لما لإجاباتكم من أهمية بالغة في نتائج هذا الاستطلاع وستكون اجاباتكم سرية فقط لغرض الدراسة والتطوير.

    </div>
                                </div>
                                
                              
                         
                        </div>
    </div>
    
    <div class="row">
<div id="delv" runat="server" class="alert alert-danger" role="alert">
 تم التقييم قبل ذلك شكرا لكم 
</div>
    </div>
    

    
    
   <h3> أ‌-	رضا الطلبة عن دائرة شؤون الطلبة:</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource1" GridLines="Horizontal">
        <Columns>
            <asp:TemplateField HeaderText="#">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="qes" HeaderText="العبارة" SortExpression="qes" >
            <ItemStyle Width="60%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="التقييم">
                <ItemTemplate>
                    <div >
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server"   Font-Size="12px" RepeatLayout="Flow" CssClass="radio radio-accent radio-danger" style="right: 0px; top: 0px">
                        <asp:ListItem Value="1">موافق بشدة</asp:ListItem>
                        <asp:ListItem Value="2">موافق</asp:ListItem>
                        <asp:ListItem Value="3">محايد</asp:ListItem>
                        <asp:ListItem Value="4">غير موافق</asp:ListItem>
                        <asp:ListItem Value="5">غير موافق بشدة</asp:ListItem>
                    </asp:RadioButtonList>
                        
                        </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ادخل النتيجة" ControlToValidate="RadioButtonList1" SetFocusOnError="True" Font-Bold="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <h3> ب‌-	رضا الطلبة عن دائرة القبول والتسجيل:</h3>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource2" GridLines="Horizontal">
        <Columns>
            <asp:TemplateField HeaderText="#">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="qes" HeaderText="العبارة" SortExpression="qes" >
            <ItemStyle Width="60%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="التقييم">
                <ItemTemplate>
                    <div >
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server"   Font-Size="12px" RepeatLayout="Flow" CssClass="radio radio-accent radio-danger" style="right: 0px; top: 0px">
                        <asp:ListItem Value="1">موافق بشدة</asp:ListItem>
                        <asp:ListItem Value="2">موافق</asp:ListItem>
                        <asp:ListItem Value="3">محايد</asp:ListItem>
                        <asp:ListItem Value="4">غير موافق</asp:ListItem>
                        <asp:ListItem Value="5">غير موافق بشدة</asp:ListItem>
                    </asp:RadioButtonList>
                        
                        </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ادخل النتيجة" ControlToValidate="RadioButtonList1" SetFocusOnError="True" Font-Bold="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
   <h3> ت‌-	رضا الطلبة عن الخدمات العامة التي تقدمها الجامعة:</h3>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource3" GridLines="Horizontal">
        <Columns>
            <asp:TemplateField HeaderText="#">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="qes" HeaderText="العبارة" SortExpression="qes" >
            <ItemStyle Width="60%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="التقييم">
                <ItemTemplate>
                    <div >
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server"   Font-Size="12px" RepeatLayout="Flow" CssClass="radio radio-accent radio-danger" style="right: 0px; top: 0px">
                        <asp:ListItem Value="1">موافق بشدة</asp:ListItem>
                        <asp:ListItem Value="2">موافق</asp:ListItem>
                        <asp:ListItem Value="3">محايد</asp:ListItem>
                        <asp:ListItem Value="4">غير موافق</asp:ListItem>
                        <asp:ListItem Value="5">غير موافق بشدة</asp:ListItem>
                    </asp:RadioButtonList>
                        
                        </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ادخل النتيجة" ControlToValidate="RadioButtonList1" SetFocusOnError="True" Font-Bold="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        <h3>ث‌-	رضا الطلبة عن مرافق الجامعة:</h3>
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource4" GridLines="Horizontal">
        <Columns>
            <asp:TemplateField HeaderText="#">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="qes" HeaderText="العبارة" SortExpression="qes" >
            <ItemStyle Width="60%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="التقييم">
                <ItemTemplate>
                    <div >
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server"   Font-Size="12px" RepeatLayout="Flow" CssClass="radio radio-accent radio-danger" style="right: 0px; top: 0px">
                        <asp:ListItem Value="1">موافق بشدة</asp:ListItem>
                        <asp:ListItem Value="2">موافق</asp:ListItem>
                        <asp:ListItem Value="3">محايد</asp:ListItem>
                        <asp:ListItem Value="4">غير موافق</asp:ListItem>
                        <asp:ListItem Value="5">غير موافق بشدة</asp:ListItem>
                    </asp:RadioButtonList>
                        
                        </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ادخل النتيجة" ControlToValidate="RadioButtonList1" SetFocusOnError="True" Font-Bold="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
      <h3> ج‌-	رضا الطلبة عن عمادة الكليات في الجامعة</h3>
    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource5" GridLines="Horizontal">
        <Columns>
            <asp:TemplateField HeaderText="#">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="qes" HeaderText="العبارة" SortExpression="qes" >
            <ItemStyle Width="60%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="التقييم">
                <ItemTemplate>
                    <div >
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server"   Font-Size="12px" RepeatLayout="Flow" CssClass="radio radio-accent radio-danger" style="right: 0px; top: 0px">
                        <asp:ListItem Value="1">موافق بشدة</asp:ListItem>
                        <asp:ListItem Value="2">موافق</asp:ListItem>
                        <asp:ListItem Value="3">محايد</asp:ListItem>
                        <asp:ListItem Value="4">غير موافق</asp:ListItem>
                        <asp:ListItem Value="5">غير موافق بشدة</asp:ListItem>
                    </asp:RadioButtonList>
                        
                        </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ادخل النتيجة" ControlToValidate="RadioButtonList1" SetFocusOnError="True" Font-Bold="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
      <h3> خ-رضا الطلبة عن خدمات الأمن:</h3>
    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource6" GridLines="Horizontal">
        <Columns>
            <asp:TemplateField HeaderText="#">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="qes" HeaderText="العبارة" SortExpression="qes" >
            <ItemStyle Width="60%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="التقييم">
                <ItemTemplate>
                    <div >
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server"   Font-Size="12px" RepeatLayout="Flow" CssClass="radio radio-accent radio-danger" style="right: 0px; top: 0px">
                        <asp:ListItem Value="1">موافق بشدة</asp:ListItem>
                        <asp:ListItem Value="2">موافق</asp:ListItem>
                        <asp:ListItem Value="3">محايد</asp:ListItem>
                        <asp:ListItem Value="4">غير موافق</asp:ListItem>
                        <asp:ListItem Value="5">غير موافق بشدة</asp:ListItem>
                    </asp:RadioButtonList>
                        
                        </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ادخل النتيجة" ControlToValidate="RadioButtonList1" SetFocusOnError="True" Font-Bold="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
      <h3> د-انتماء الطلبة إلى الجامعة:</h3>
    <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource7" GridLines="Horizontal">
        <Columns>
            <asp:TemplateField HeaderText="#">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="qes" HeaderText="العبارة" SortExpression="qes" >
            <ItemStyle Width="60%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="التقييم">
                <ItemTemplate>
                    <div >
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server"   Font-Size="12px" RepeatLayout="Flow" CssClass="radio radio-accent radio-danger" style="right: 0px; top: 0px">
                        <asp:ListItem Value="1">موافق بشدة</asp:ListItem>
                        <asp:ListItem Value="2">موافق</asp:ListItem>
                        <asp:ListItem Value="3">محايد</asp:ListItem>
                        <asp:ListItem Value="4">غير موافق</asp:ListItem>
                        <asp:ListItem Value="5">غير موافق بشدة</asp:ListItem>
                    </asp:RadioButtonList>
                        
                        </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ادخل النتيجة" ControlToValidate="RadioButtonList1" SetFocusOnError="True" Font-Bold="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br/>
    <div class="row"> 
          <div class="col-sm-12 col-md-12">
                <div class="form-group">
                    <label>ما أهم العقبات التي واجهتك داخل الحرم الجامعي: </label>


                    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="143px" Width="517px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ادخل النتيجة" ControlToValidate="TextBox1" SetFocusOnError="True" Font-Bold="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                </div>
            </div>
        <hr />
            <br/>
    <div class="col-sm-12 col-md-12">
                <div class="form-group" style="margin-right: 67PX;">
                    <label>أي اقتراحات تطلبها من إدارة الجامعة: </label>


                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Height="143px" Width="517px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="ادخل النتيجة" ControlToValidate="TextBox1" SetFocusOnError="True" Font-Bold="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                </div>
            </div>
    </div>
    <asp:Button ID="Button1" runat="server" Text="ادخل" OnClick="Button1_Click" CssClass="bg-danger" Width="100%" />
  
     <br/>
     <br/>
     <br/>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [qes], [id] FROM [eva_qes] WHERE ([cat] = @cat)">
        <SelectParameters>
            <asp:Parameter DefaultValue="A" Name="cat" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [qes], [id] FROM [eva_qes] WHERE ([cat] = @cat)">
        <SelectParameters>
            <asp:Parameter DefaultValue="B" Name="cat" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [qes], [id] FROM [eva_qes] WHERE ([cat] = @cat)">
        <SelectParameters>
            <asp:Parameter DefaultValue="C" Name="cat" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [qes], [id] FROM [eva_qes] WHERE ([cat] = @cat)">
        <SelectParameters>
            <asp:Parameter DefaultValue="D" Name="cat" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [qes], [id] FROM [eva_qes] WHERE ([cat] = @cat)">
        <SelectParameters>
            <asp:Parameter DefaultValue="E" Name="cat" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [qes], [id] FROM [eva_qes] WHERE ([cat] = @cat)">
        <SelectParameters>
            <asp:Parameter DefaultValue="F" Name="cat" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [qes], [id] FROM [eva_qes] WHERE ([cat] = @cat)">
        <SelectParameters>
            <asp:Parameter DefaultValue="G" Name="cat" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

