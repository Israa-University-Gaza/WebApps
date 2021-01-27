<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowData.aspx.cs" Inherits="Administrator_Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Tajawal" rel="stylesheet"/>


    <style type="text/css">
        .auto-style2 {
            width: 323px;
            background-color: #999999;
        }
        .auto-style3 {
            width: 247px;
        }
        .auto-style4 {
            width: 155px;
            background-color: #999999;
        }
        .auto-style6 {
            position: relative;
            min-height: 1px;
            float: right;
            width: 50%;
            right: 0px;
            top: 0px;
            padding-left: 15px;
        }
        .auto-style7 {
            height: 75px;
        }
    </style>
       <link href="../assets/global/plugins/bootstrap/css/bootstrap-rtl.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <form id="form1" style="direction:rtl; font-family:Tajawal"  runat="server">

 
     <div class="col-md-12" style="direction: rtl;font-size: large;">
         <img src="1.PNG" />
        <img src="../images/logo.png" class="auto-style7" />  
         <img runat="server" id="img" src="../images/logo.png"  width="150" height="200" style="margin-right: 270px;" />
    </div>
        
   
          
    <div class="row" style="margin:15px" >
     <div class="col-md-12" style="direction: rtl;">
         <h3> أولا : البيانات الشخصية:</h3>
         
        <table align="right" class="table"  dir="rtl" style="border: thin groove #000000; width:100%">
            <tr>
                <td class="auto-style2">الاسم رباعي&nbsp;:</td>
                <td class="auto-style3">
                    <asp:Label ID="name" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">العمر:</td>
                <td>
                    <asp:Label ID="age" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">البطاقة الشخصية:</td>
                <td class="auto-style3">
                    <asp:Label ID="id" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">مكان وتاريخ الاصدار:</td>
                <td>
                    <asp:Label ID="p_id" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">العنوان كاملا:</td>
                <td class="auto-style3">
                    <asp:Label ID="addres" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">الحالة الإجتماعية:</td>
                <td>
                    <asp:Label ID="stat" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">الهاتف / الجوال:</td>
                <td class="auto-style3">
                    <asp:Label ID="tel" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">البريد الإلكتروني:</td>
                <td>
                    <asp:Label ID="email" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">الجنسية الاصلية:</td>
                <td class="auto-style3">
                    <asp:Label ID="nat" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">الجنسية الحالية:</td>
                <td>
                    <asp:Label ID="nat1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">مكان وتاريخ الميلاد:</td>
                <td class="auto-style3">
                    <asp:Label ID="pob" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">الديانة:</td>
                <td>
                    <asp:Label ID="rel" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">اسم الزوج / الزوجة:</td>
                <td class="auto-style3">
                    <asp:Label ID="n_has" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">عمل الزوج / الزوجة:</td>
                <td>
                    <asp:Label ID="w_has" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">تاريخ الزواج:</td>
                <td class="auto-style3">
                    <asp:Label ID="d_mar" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">الحالة الصحية :</td>
                <td>
                    <asp:Label ID="h_stat" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">نوع العمل الحالي:</td>
                <td class="auto-style3">
                    <asp:Label ID="w_c_type" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">مكانة:</td>
                <td>
                    <asp:Label ID="w_c_place" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">تاريخ الالتحاق بالعمل الحالي:</td>
                <td colspan="3">
                    <asp:Label ID="w_c_date" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">هل يمكن ترك العمل الحالي في اي وقت والالتحاق بالجامعة:</td>
                <td colspan="3">
                    <asp:Label ID="w_leav" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">اذا كانت الاجابة نعم فما التاريخ المتوقع لترك العمل الحالي :</td>
                <td colspan="3">
                    <asp:Label ID="d_leave" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </div>

       
    <hr/>

        <div class="row" style="margin:15px">
     <div class="col-md-12" style="direction: rtl;">
     <h3> البيانات العلمية:</h3>
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table"  EmptyDataText="لا يوجد بيانات " OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="uni" HeaderText="اسم الجامعة او المؤسسة" SortExpression="uni" />
                        <asp:BoundField DataField="place" HeaderText="عنوانها" SortExpression="place" />
                        <asp:BoundField DataField="from" HeaderText="التاريخ من " SortExpression="from" />
                        <asp:BoundField DataField="to" HeaderText="الى" SortExpression="to" />
                        <asp:BoundField DataField="degree" HeaderText="الدرجة العلمية" SortExpression="degree" />
                        <asp:BoundField DataField="date_degree" HeaderText="تاريخ الحصول عليها" SortExpression="date_degree" />
                        <asp:BoundField DataField="gpa" HeaderText="التقدير" SortExpression="gpa" />
                        <asp:TemplateField HeaderText="التخصص" SortExpression="cer">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cer") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("cer") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [uni], [place], [from], [to], [degree], [date_degree], [gpa], [cer] FROM [hr_emp_cer] WHERE ([emp_id] = @emp_id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="emp_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
    </div>
    </div>
          
    <hr/>

        <div class="row" style="margin:15px">
     <div class="col-md-12" style="direction: rtl;">
     <h3> اللغات:</h3>
          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" CssClass="table"  EmptyDataText="لا يو جد بيانات ">
                    <Columns>
                        <asp:BoundField DataField="lan_name" HeaderText="اللغة" SortExpression="lan_name" />
                        <asp:BoundField DataField="lan_conversation" HeaderText="المحادثة" SortExpression="lan_conversation" />
                        <asp:BoundField DataField="lan_write" HeaderText="الكتابة" SortExpression="lan_write" />
                        <asp:BoundField DataField="lan_read" HeaderText="القراءة" SortExpression="lan_read" />
                        <asp:BoundField DataField="lan_notes" HeaderText="ملاحظات" SortExpression="lan_notes" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [lan_name], [lan_conversation], [lan_write], [lan_read], [lan_notes] FROM [hr_emp_lang] WHERE ([emp_id] = @emp_id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="emp_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
          </asp:SqlDataSource>
    </div>
    </div>
         
    <hr/>

        <div class="row" style="margin:15px">
     <div class="col-md-12" style="direction: rtl;">
     <h3> الخبرات العملية:</h3>
          <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table"  EmptyDataText="لا يوجد بيانات ">
                    <Columns>
                        <asp:BoundField DataField="exp_name" HeaderText="اسم المؤسسة" SortExpression="exp_name" />
                        <asp:BoundField DataField="exp_addr" HeaderText="عنوانها" SortExpression="exp_addr" />
                        <asp:BoundField DataField="exp_from" HeaderText="مدة العمل من " SortExpression="exp_from" />
                        <asp:BoundField DataField="exp_to" HeaderText="الى" SortExpression="exp_to" />
                        <asp:BoundField DataField="exp_type" HeaderText="نوع العمل" SortExpression="exp_type" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [exp_name], [exp_addr], [exp_from], [exp_to], [exp_type] FROM [hr_emp_exp] WHERE ([emp_id] = @emp_id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="emp_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
          </asp:SqlDataSource>
    </div>
    </div>
           
    <hr/>

        <div class="row" style="margin:15px">
     <div class="col-md-12" style="direction: rtl;">
     <h3> القدرات والمهارات الشخصية:</h3>
          <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CssClass="table"  ShowHeader="False" EmptyDataText="لا يوجد بيانات ">
                    <Columns>
                        <asp:BoundField DataField="skills_name" HeaderText="القدرات والمهارات الشخصية" SortExpression="skills_name" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [skills_name] FROM [hr_emp_skills] WHERE ([emp_id] = @emp_id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="emp_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
          </asp:SqlDataSource>
    </div>
    </div>
       
    <hr/>

        <div class="row" style="margin:15px">
     <div class="col-md-12" style="direction: rtl;">
     <h3>   أية خبرات اخرى:</h3>
          <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" CssClass="table"  ShowHeader="False" EmptyDataText="لا يوجد بيانات ">
              <Columns>
                  <asp:BoundField DataField="extra" HeaderText="أية خبرات اخرى" SortExpression="extra" />
              </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [extra] FROM [hr_emp_extra] WHERE ([emp_id] = @emp_id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="emp_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
          </asp:SqlDataSource>
    </div>
    </div>

         <hr/>

        <div class="row" style="margin:15px">
     <div class="col-md-12" style="direction: rtl;">
      <h3>   المعرفون  :</h3>
          <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" CssClass="table"  EmptyDataText="لا يوجد بيانات ">
              <Columns>
                  <asp:BoundField DataField="name" HeaderText="الاسم" SortExpression="name" />
                  <asp:BoundField DataField="job" HeaderText="المهنة" SortExpression="job" />
                  <asp:BoundField DataField="add" HeaderText="العنوان" SortExpression="add" />
              </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [job], [add] FROM [hr_emp_identifier] WHERE ([emp_id] = @emp_id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="emp_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
          </asp:SqlDataSource>
    </div>
    </div>
        <hr/>

        <div class="row" style="margin:15px">
     <div class="col-md-12" style="direction: rtl;">
       <h3>  اكتب نبذة عن حياتك العملية وطموحاتك وخططك المستقبلية  :</h3>
         <%--<asp:TextBox ID="life"  runat="server" Width="100%"></asp:TextBox>--%>
         <asp:Label ID="life" runat="server" Width="100%" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Image ID="Image2" runat="server" ImageUrl="http://jobs.israa.edu.ps/administrator/h4.PNG" />     
    </div>
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
