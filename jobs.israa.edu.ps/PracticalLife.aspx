<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PracticalLife.aspx.cs" Inherits="Default8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form runat="server">
        <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                    <span class="caption-subject bold uppercase">نبذة عن الحياة العملية  </span>
                </div>

            </div>
            <div class="portlet-body form" style="padding-bottom: 181px;">



                <div runat="server" id="not_found">
                    <div class="col-md-12" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="fut" TextMode="MultiLine" CssClass="form-control" Height="150px" runat="server"></asp:TextBox>
                                <label for="form_control_1">اكتب نبذة عن حياتك العملية وطموحاتك وخططك المستقبلية  </label>

                            </div>
                        </div>
                    </div>
                  
                </div>
                
                
              

                
                <br />
                <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="Button1_Click" Text="تحديث" />
            </div>
        </div>
    </form>
</asp:Content>

