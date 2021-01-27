<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form id="form1" runat="server">
    
   <div class="portlet light ">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-share font-red-sunglo"></i>
                                        <span class="caption-subject font-red-sunglo bold uppercase">اعلانات الوظائف المتاحة</span>
                                    </div>
                                    
                                </div>
                                <div class="portlet-body" style="direction:rtl">
                                    <%--<div class="note note-warning">
                                        <h4 class="block">Cross-browser compatibility</h4>
                                        <p> Progress bars use CSS3 transitions and animations to achieve some of their effects. These features are not supported in Internet Explorer 9 and below or older versions of Firefox. Opera 12 does not support animations.
                                            </p>
                                    </div>--%>
                                  <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="table" DataKeyNames="adv_id" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="لا يوجد اعلانات مطروحة حاليا ">
                                      <Columns>
                                          <asp:BoundField DataField="adv_id" HeaderText="رقم الاعلان" ReadOnly="True" SortExpression="adv_id" >
                                          <ItemStyle Width="15%" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="adv_name" HeaderText="الاعلان" SortExpression="adv_name" >
                                          <ItemStyle Width="20%" />
                                          </asp:BoundField>
                                          <asp:TemplateField HeaderText="تفاصيل الاعلان" SortExpression="det">
                                              <EditItemTemplate>
                                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("det") %>'></asp:TextBox>
                                              </EditItemTemplate>
                                              <ItemTemplate>
                                                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("det") %>'></asp:Label>
                                              </ItemTemplate>
                                              <ItemStyle Width="50%" />
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="اخر موعد للتقديم" SortExpression="Deadline">
                                              <EditItemTemplate>
                                                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Deadline") %>'></asp:TextBox>
                                              </EditItemTemplate>
                                              <ItemTemplate>
                                                  <asp:Label ID="Label2" runat="server" ></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField>
                                              <ItemTemplate>
                                                  <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn red" NavigateUrl="~/JobsAvailable.aspx">عرض الوظائف</asp:HyperLink>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                    </asp:GridView>




                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [hr_adv] WHERE ([Deadline] &gt; getdate()) ORDER BY [adv_id] DESC">
                                        
                                    </asp:SqlDataSource>




                                </div>
                            </div>
    
    </form>
    
</asp:Content>

