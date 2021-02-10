<%@ Page Title="" Language="C#" MasterPageFile="~/Students1/MasterPage.master" AutoEventWireup="true" CodeFile="TimeTable.aspx.cs" Inherits="Students_TimeTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        table * {
            text-align: center;
        }


        .main-timeline {
            /*font-family: 'Roboto', sans-serif;*/
            padding: 25px 0 0;
        }

            .main-timeline:after {
                content: '';
                display: block;
                clear: both;
            }

            .main-timeline .timeline {
                width: 50%;
                padding: 0 15px;
                margin: -25px 10px 0 0;
                float: left;
                position: relative;
            }

            .main-timeline .timeline-content {
                color: #555;
                background: #fff;
                padding: 10px 20px 20px;
                text-align: center;
                border: 5px solid #7e401b;
                border-radius: 20px;
                display: block;
                position: relative;
                z-index: 1;
            }

                .main-timeline .timeline-content:after {
                    content: '';
                    background-color: #f9f9f9;
                    height: 94%;
                    width: 97.5%;
                    border-radius: 15px;
                    box-shadow: 3px 3px 5px #dbdbdb;
                    position: absolute;
                    right: 5px;
                    bottom: 5px;
                    z-index: -1;
                }

                .main-timeline .timeline-content:hover {
                    text-decoration: none;
                }

            .main-timeline .timeline-icon {
                font-size: 45px;
                text-shadow: 3px 3px 0 rgba(0,0,0,0.15);
                margin: 0 0 7px;
            }

            .main-timeline .title {
                color: #fae7bf;
                background-color: #7e401b;
                font-size: 15px;
                font-weight: 700;
                letter-spacing: 1px;
                text-transform: uppercase;
                padding: 10px 10px;
                text-shadow: 3px 3px 0 rgba(0,0,0,0.2);
                margin: 0 -40px 15px;
                position: relative;
            }

                .main-timeline .title:before,
                .main-timeline .title:after {
                    /*content: '';
                    background: linear-gradient(-45deg, #0e85a0 49%, transparent 50%);
                    height: 15px;
                    width: 15px;
                    position: absolute;
                    left: 0;
                    top: -15px;*/
                }

                .main-timeline .title:after {
                    left: auto;
                    right: 0;
                    top: auto;
                    bottom: -15px;
                    transform: rotate(180deg);
                }

            .main-timeline .description {
                font-size: 15px;
                letter-spacing: 1px;
                margin: 0;
            }

            .main-timeline .timeline:nth-child(even) {
                margin: -25px 0 0 10px;
                float: right;
            }

            .main-timeline .timeline:nth-child(4n+2) .timeline-content {
                border-color: #F86C6B;
            }

            .main-timeline .timeline:nth-child(4n+2) .title {
                background-color: #F86C6B;
            }

                .main-timeline .timeline:nth-child(4n+2) .title:before,
                .main-timeline .timeline:nth-child(4n+2) .title:after {
                    background: linear-gradient(-45deg,#bc4343 49%, transparent 50%);
                }

            .main-timeline .timeline:nth-child(4n+3) .timeline-content {
                border-color: #B2D360;
            }

            .main-timeline .timeline:nth-child(4n+3) .title {
                background-color: #B2D360;
            }

                .main-timeline .timeline:nth-child(4n+3) .title:before,
                .main-timeline .timeline:nth-child(4n+3) .title:after {
                    background: linear-gradient(-45deg,#95a56b 49%, transparent 50%);
                }

            .main-timeline .timeline:nth-child(4n+4) .timeline-content {
                border-color: #32BBB4;
            }

            .main-timeline .timeline:nth-child(4n+4) .title {
                background-color: #32BBB4;
            }

                .main-timeline .timeline:nth-child(4n+4) .title:before,
                .main-timeline .timeline:nth-child(4n+4) .title:after {
                    background: linear-gradient(-45deg,#51938f 49%, transparent 50%);
                }

        @media screen and (max-width:767px) {
            .main-timeline .timeline,
            .main-timeline .timeline:nth-child(even) {
                width: 100%;
                margin: 0 0 30px;
                float: none;
            }
        }

        @media screen and (max-width:567px) {
            .main-timeline .title {
                font-size: 18px;
            }
        }
    </style>
    <style>
        .main-timeline {
            /*font-family: 'Roboto', sans-serif;*/
        }

            .main-timeline:after {
                content: '';
                display: block;
                clear: both;
            }

            .main-timeline .timeline {
                width: 49.5%;
                padding: 50px 0 0;
                margin: 0 10px 0 0;
                float: initial;
                position: relative;
            }

                .main-timeline .timeline:before {
                    /*content: '';
                    background-color: #7F45E8;
                    height: 11px;
                    width: 40%;
                    border-radius: 20px;
                    position: absolute;
                    right: 5px;
                    top: 30px;*/
                }

            .main-timeline .timeline-content {
                background: #fff;
                padding: 30px 20px 20px 40px;
                /*border-radius: 5px 0 0 5px;*/
                /*border-left: 15px solid #7F45E8;*/
                /*box-shadow: 7px 7px 0 0 rgba(0,0,0,0.15);*/
                display: block;
                position: relative;
            }

                .main-timeline .timeline-content:hover {
                    text-decoration: none;
                }

            .main-timeline .timeline-year {
                color: #7e401b;
                background-color: #fae7bf;
                font-size: 24px;
                font-weight: 600;
                text-align: center;
                height: 100px;
                width: 100px;
                line-height: 100px;
                border-radius: 50%;
                position: absolute;
                /*left: 30px;*/
                top: -50px;
                border: dotted;
                z-index: 1;
            }

                .main-timeline .timeline-year:before {
                    content: '';
                    background: linear-gradient(155deg,rgba(255,255,255,0.9),rgba(255,255,255,0.05),transparent);
                    height: 70%;
                    width: 70%;
                    border-radius: 50%;
                    position: absolute;
                    left: 10px;
                    top: 6px;
                    z-index: -1;
                }

            .main-timeline .timeline-icon {
                color: #7F45E8;
                font-size: 25px;
                position: absolute;
                top: 10px;
                right: 12px;
            }

            .main-timeline .title {
                /*color: #7F45E8;*/
                font-size: 20px;
                font-weight: 700;
                letter-spacing: 1px;
                text-transform: capitalize;
                margin: 0 0 5px;
            }

            .main-timeline .description {
                color: #333;
                font-size: 15px;
                letter-spacing: 1px;
                margin: 0;
            }

            .main-timeline .timeline:nth-child(even) {
                margin: 0 0 0 10px;
                float: right;
            }

            .main-timeline .timeline:nth-child(4n+2) .timeline-content {
                border-left-color: #FE5EE6;
            }

            .main-timeline .timeline:nth-child(4n+2):before,
            .main-timeline .timeline:nth-child(4n+2) .timeline-year {
                background-color: #FE5EE6;
            }

            .main-timeline .timeline:nth-child(4n+2) .timeline-icon,
            .main-timeline .timeline:nth-child(4n+2) .title {
                color: #FE5EE6;
            }

            .main-timeline .timeline:nth-child(4n+3) .timeline-content {
                border-left-color: #03B2EC;
            }

            .main-timeline .timeline:nth-child(4n+3):before,
            .main-timeline .timeline:nth-child(4n+3) .timeline-year {
                background-color: #03B2EC;
            }

            .main-timeline .timeline:nth-child(4n+3) .timeline-icon,
            .main-timeline .timeline:nth-child(4n+3) .title {
                color: #03B2EC;
            }

            .main-timeline .timeline:nth-child(4n+4) .timeline-content {
                border-left-color: #00E984;
            }

            .main-timeline .timeline:nth-child(4n+4):before,
            .main-timeline .timeline:nth-child(4n+4) .timeline-year {
                background-color: #00E984;
            }

            .main-timeline .timeline:nth-child(4n+4) .timeline-icon,
            .main-timeline .timeline:nth-child(4n+4) .title {
                color: #00E984;
            }

        @media screen and (max-width:767px) {
            .main-timeline .timeline,
            .main-timeline .timeline:nth-child(even) {
                width: 100%;
                margin: 0 0 30px;
                float: none;
            }

                .main-timeline .timeline-content,
                .main-timeline .timeline:nth-child(even) .timeline-content {
                    padding: 70px 15px 15px 20px;
                }

            .main-timeline .timeline-year { /*left: 10px;*/
            }
        }

        @media screen and (max-width:567px) {
            .main-timeline .title {
                font-size: 18px;
            }
        }

        License Terms
    </style>
    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;    جدول المحاضرات الافتراضية عبر تقنية ال zoom للفصل الدراسي الثاني للعام الجامعي 2020/2021 </h4>
            <span style="color: red">لجميع المساقات  Pass Code=123456 </span>
            <br />
            <span style="color: green">طلابنا الأعزاء جداول المحاضرات الافتراضية عبر تقنية الزوم هي نفسها لجميع الفصل الدراسي </span>
            <br />
            <span style="color: red">يفضل عمل دوران للشاشة لعرض الجدول بكافة التفاصيل </span>
        </div>

        <div class="col-sm-12 col-md-12">
            <div class="well">
                <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" text-align="center"  OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSource1" Width="100%" AllowSorting="True" CellPadding="10" CellSpacing="3" ForeColor="#333333" HorizontalAlign="Center" CssClass="table-responsive" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="day" HeaderText="اليوم" SortExpression="day" />
                <asp:BoundField DataField="crs_name" HeaderText="اسم المساق" SortExpression="crs_name" />
                <asp:TemplateField HeaderText="المحاضر">
                    <ItemTemplate>
                        <asp:Label ID="lec" runat="server" style="font-size: 10px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="mettingID" SortExpression="mettingID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("mettingID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div style="direction:initial">
   <asp:Label ID="Label1" runat="server" Text='<%# Bind("mettingID") %>'></asp:Label>
                        </div>
                     
                   
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="time" HeaderText="الساعة" SortExpression="time" />
                <asp:BoundField DataField="sectionid" HeaderText="sectionid" SortExpression="sectionid" Visible="False" />
                <asp:TemplateField HeaderText=" Zoom" SortExpression="url">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink8" runat="server" CssClass="bg-danger" NavigateUrl='<%# Eval("url") %>'>الانتقال الى منصة  Zoom</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" Wrap="True" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>--%>
                <asp:Repeater runat="server" OnItemDataBound="Unnamed_ItemDataBound" DataSourceID="SqlDataSource1">
                    <ItemTemplate>


                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="main-timeline">

                                        <div class="timeline">
                                            <a href="<%# Eval("url") %>" class="timeline-content">
                                                <div class="timeline-year" runat="server" id="day1"><%# Eval("day") %></div>
                                              <span style="font-weight: bold"> الساعة:</span>  <%# Eval("time") %>
                                                <h3 class="title"><%# Eval("courseCode") %> - <%# Eval("crs_name") %></h3>
                                                 <span style="font-weight: bold">  المحاضر:</span>  
                                                
                                                <asp:Label ID="lec" runat="server" Style="font-size: 10px"></asp:Label>
                                                <br />
                                                <span style="font-weight: bold">  mettingID:</span>      <%# Eval("mettingID") %>
                                                



                                            </a>
                                            <div style="text-align-last: center">
 <asp:HyperLink ID="HyperLink8" runat="server" CssClass="bg-danger" NavigateUrl='https://zoom.us/signin'>الانتقال الى منصة  Zoom</asp:HyperLink>
                           
                                            </div>
                                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>







                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT dbo.std_crs.courseCode, dbo.zoom.crs_name, dbo.zoom.url, dbo.zoom.mettingID, dbo.zoom.time, dbo.zoom.day, dbo.std_crs.sectionNum, dbo.std_crs.sectionid FROM dbo.days INNER JOIN dbo.zoom ON dbo.days.day = dbo.zoom.day INNER JOIN dbo.timee ON dbo.zoom.time = dbo.timee.time  INNER JOIN dbo.std_crs ON dbo.zoom.crs_id = dbo.std_crs.courseCode WHERE (dbo.std_crs.std_id = @std_id)  and std_crs.sectionNum=zoom.section ORDER BY dbo.days.id, dbo.timee.id">
            <SelectParameters>
                <asp:SessionParameter Name="std_id" SessionField="log" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <hr />
    <div class="col-sm-12 col-md-12">
        <div class="well">
        </div>
    </div>
    <br />
</asp:Content>

