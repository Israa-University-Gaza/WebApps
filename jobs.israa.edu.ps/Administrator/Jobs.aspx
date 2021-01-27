<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage.master" AutoEventWireup="true" CodeFile="Jobs.aspx.cs" Inherits="Administrator_Jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                     
                    <span class="caption-subject bold uppercase">المتقدمين للوظائف </span>
                 
                </div>

            </div>
            <div class="portlet-body form" style="padding-bottom: 181px;">


                <div class="col-md-3" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="adv_name" DataValueField="adv_id" AutoPostBack="True"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [adv_id], [adv_name], [Deadline] FROM [hr_adv]"></asp:SqlDataSource>
                                <label for="form_control_1">رقم الاعلان  </label>
                              
                            </div>
                        </div>
                    </div>

                  <div class="col-md-3" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon" style="text-align: center">
                 <asp:Label ID="toto" runat="server" style="color: #FFFF00; font-size: x-large; background-color: #CC0000" Width="69px"></asp:Label>
</div>
                        </div>
                    </div>

              <div class="col-md-12" style="direction: rtl;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" CssClass="table" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="job_name" HeaderText="اسم الوظيفة" SortExpression="job_name" />
                            <asp:BoundField DataField="adv_id" HeaderText="رقم الاعلان" SortExpression="adv_id" />
                            <asp:TemplateField HeaderText="عدد المتقدمين">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("count") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <strong>
                                 
                                        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Bind("count") %>' NavigateUrl='<%# "UserJobs.aspx?id="+Eval("id") %>' style="color: #FF0000; font-size: large"></asp:HyperLink>
                                         </strong>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                        
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT *, dbo.count_job(id) AS count FROM [hr_jobs_addv] WHERE ([adv_id] = @adv_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="adv_id" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        
                    </div>


             

            </div>
        </div>
    </form>
</asp:Content>

