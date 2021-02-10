<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cards2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <%--<link href="https://fonts.googleapis.com/css?family=Tajawal" rel="stylesheet"/>--%>
    <style type="text/css">

        .auto-style1 {
            width: 348px;
            height: 215px;
            border-spacing: 0px;
        }
 
@font-face {
    font-family: 'alqabas';
    src: url('css/alqabas.ttf') format('truetype');
}
@font-face {
    font-family: 'alqabasR';
    src: url('css/alqabasR.ttf') format('truetype');
}
@font-face {
    font-family: 'alqabasL';
    src: url('css/alqabasL.ttf') format('truetype');
}
@font-face {
    font-family: 'Bah';
    src: url('css/Bah.ttf') format('truetype');
}

        .auto-style20 {
            height: 29px;
        }
        .auto-style21 {
            width: 84px;
            height: 29px;
        }
        .auto-style22 {
            height: 26px;
           
           vertical-align: baseline;
            text-align: center;
        }
        .auto-style23 {
            color:#a21011;
             font-size: 12px;
          font-family:'Bah';
            text-align: -webkit-right;
    width: 240px;
        padding-right:14px;
        padding-top: 25px;
           
        }
        </style>
</head>
<body>
  
    <form id="form1" runat="server">
        <asp:DataList ID="DataList1" runat="server" Font-Names="Tajawal" Font-Size="Small" RepeatColumns="2" Width="105%" OnItemDataBound="DataList1_ItemDataBound" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                 <asp:Panel ID="Panel1" runat="server">
                <table class="auto-style1"  cellpadding="0" cellspacing="0" dir="auto" style="background-image: url('https://elearning.israa.edu.ps/2.jpg');background-size: 100% 100%; background-repeat: no-repeat;">
                    <tr>
                        <td class="auto-style21"></td>
                        <td class="auto-style20">
                            </td>
                        <td rowspan="3" style="vertical-align: top">
                              
                            &nbsp;</td>
                          
                    </tr>
                    <tr>
                        <td class="auto-style23" style="vertical-align: middle; ">
                            &nbsp;</td>
                     
                    </tr>
                    <tr>
                        <td class="auto-style22" colspan="2" style="padding-bottom: 13px;">
                            &nbsp;&nbsp;&nbsp;
                            </td>
                    </tr>
                </table>
                     </asp:Panel>
               <hr />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT top 10 *, dbo.full_name(StudentNo) AS NAME,ROW_NUMBER() OVER(order by coll,ArName1,dbo.full_name(StudentNo)) AS Row# FROM [std]  ">
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="select * from (
SELECT ROW_NUMBER() OVER(order by coll,ArName1,dbo.full_name(StudentNo)) AS Row# , StudentID, StudentNo, ArFirstName, ArSecoundName, ArThirdName, ArFamilyName, ssn, ArName, coll, ArName1, Mobile, dbo.full_name(StudentNo) AS NAME FROM dbo.std
 WHERE  coll LIKE '%' + @coll + '%') a 
 where Row# BETWEEN @s and @e 
ORDER BY coll, ArName1, NAME">
            <SelectParameters>
                <asp:QueryStringParameter Name="coll" QueryStringField="coll" Type="String" />
                <asp:QueryStringParameter Name="s" QueryStringField="s" />
                <asp:QueryStringParameter Name="e" QueryStringField="e" />
            </SelectParameters>
        </asp:SqlDataSource>
           <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="select * from (
SELECT ROW_NUMBER() OVER(order by coll,ArName1,dbo.full_name(StudentNo)) AS Row# , StudentID, StudentNo, ArFirstName, ArSecoundName, ArThirdName, ArFamilyName, ssn, ArName, coll, ArName1, Mobile, dbo.full_name(StudentNo) AS NAME FROM dbo.std
 WHERE   ArName1 LIKE '%' + @dept + '%')a
  where Row# BETWEEN  @s and @e
ORDER BY coll, ArName1, NAME">
            <SelectParameters>
                <asp:QueryStringParameter Name="dept" QueryStringField="dept" Type="String" />
                <asp:QueryStringParameter Name="s" QueryStringField="s" />
                <asp:QueryStringParameter Name="e" QueryStringField="e" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
  
</body>
</html>
