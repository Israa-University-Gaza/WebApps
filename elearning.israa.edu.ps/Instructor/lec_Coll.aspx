<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="lec_Coll.aspx.cs" Inherits="Instructor_lec_Coll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style type="text/css">
        path[Attributes Style] {
    d: path('M 125 100 L 125 90 A 10 10 0 1 1 119.763 91.4808 L 125 100 Z');
    fill: rgb(255, 15, 0);
    stroke: rgb(255, 255, 255);
    stroke-width: 2;
    stroke-opacity: 0.8;
    fill-opacity: 0.9;
}
        </style>

        <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

     <script src="https://israa.edu.ps/Contracts/assets/scripts/amcharts.js"></script>
    <script src="https://israa.edu.ps/Contracts/assets/scripts/serial.js"></script>
      <script src="https://israa.edu.ps/Contracts/assets/scripts/pie.js" type="text/javascript"></script>
    
    <script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv10", am4charts.PieChart3D);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

     
chart.data = [
                
       <% {
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                    Response.Write("{country: \"" + dt.Rows[i][1] + "\",litres: " + dt.Rows[i][0] + "},");
            }
        }%>
       ];


chart.innerRadius = am4core.percent(40);
chart.depth = 120;

chart.legend = new am4charts.Legend();

var series = chart.series.push(new am4charts.PieSeries3D());
series.dataFields.value = "litres";
series.dataFields.depthValue = "litres";
series.dataFields.category = "country";
series.slices.template.cornerRadius = 5;
series.colors.step = 3;

}); // end am4core.ready()
</script>
    <%--<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv10", am4charts.XYChart);
chart.scrollbarX = new am4core.Scrollbar();

    chart.data = [
                
       <% {
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                    Response.Write("{country: \"" + dt.Rows[i][1] + "\",visits: " + dt.Rows[i][0] + "},");
            }
        }%>
         
         
       
       ];

// Add data
//chart.data = [{
//  "country": "USA",
//  "visits": 3025
//}, {
//  "country": "China",
//  "visits": 1882
//}, {
//  "country": "Japan",
//  "visits": 1809
//}, {
//  "country": "Germany",
//  "visits": 1322
//}, {
//  "country": "UK",
//  "visits": 1122
//}, {
//  "country": "France",
//  "visits": 1114
//}, {
//  "country": "India",
//  "visits": 984
//}, {
//  "country": "Spain",
//  "visits": 711
//}, {
//  "country": "Netherlands",
//  "visits": 665
//}];

prepareParetoData();

function prepareParetoData(){
    var total = 0;

    for(var i = 0; i < chart.data.length; i++){
        var value = chart.data[i].visits;
        total += value;
    }

    var sum = 0;
    for(var i = 0; i < chart.data.length; i++){
        var value = chart.data[i].visits;
        sum += value;   
        chart.data[i].pareto = sum / total * 100;
    }    
}

// Create axes
var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.renderer.minGridDistance = 60;
categoryAxis.tooltip.disabled = true;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.renderer.minWidth = 50;
valueAxis.min = 0;
valueAxis.cursorTooltipEnabled = false;

// Create series
var series = chart.series.push(new am4charts.ColumnSeries());
series.sequencedInterpolation = true;
series.dataFields.valueY = "visits";
series.dataFields.categoryX = "country";
series.tooltipText = "[{categoryX}: bold]{valueY}[/]";
series.columns.template.strokeWidth = 0;

series.tooltip.pointerOrientation = "vertical";

series.columns.template.column.cornerRadiusTopLeft = 10;
series.columns.template.column.cornerRadiusTopRight = 10;
series.columns.template.column.fillOpacity = 0.8;

// on hover, make corner radiuses bigger
var hoverState = series.columns.template.column.states.create("hover");
hoverState.properties.cornerRadiusTopLeft = 0;
hoverState.properties.cornerRadiusTopRight = 0;
hoverState.properties.fillOpacity = 1;

series.columns.template.adapter.add("fill", function(fill, target) {
  return chart.colors.getIndex(target.dataItem.index);
})


var paretoValueAxis = chart.yAxes.push(new am4charts.ValueAxis());
paretoValueAxis.renderer.opposite = true;
paretoValueAxis.min = 0;
paretoValueAxis.max = 100;
paretoValueAxis.strictMinMax = true;
paretoValueAxis.renderer.grid.template.disabled = true;
paretoValueAxis.numberFormatter = new am4core.NumberFormatter();
paretoValueAxis.numberFormatter.numberFormat = "#'%'"
paretoValueAxis.cursorTooltipEnabled = false;

var paretoSeries = chart.series.push(new am4charts.LineSeries())
paretoSeries.dataFields.valueY = "pareto";
paretoSeries.dataFields.categoryX = "country";
paretoSeries.yAxis = paretoValueAxis;
paretoSeries.tooltipText = "pareto: {valueY.formatNumber('#.0')}%[/]";
paretoSeries.bullets.push(new am4charts.CircleBullet());
paretoSeries.strokeWidth = 2;
paretoSeries.stroke = new am4core.InterfaceColorSet().getFor("alternativeBackground");
paretoSeries.strokeOpacity = 0.5;

// Cursor
chart.cursor = new am4charts.XYCursor();
chart.cursor.behavior = "panX";

}); // end am4core.ready()
</script>--%>
    <script>
       
            var chart;
            var chartData = [
               
       <% {
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                   // Response.Write("{country: \"" + dt.Rows[i][1] + "\",visits: " + dt.Rows[i][0] + "},");
                  Response.Write("{\"year\": "+dt.Rows[i][0]+",\"income\": "+dt.Rows[i][4]+",},");
            }
        }%>
                //{"year": 2009,"income": 23.5,},


                //{
                //    "year": 2010,
                //    "income": 26.2,
                //},
                //{
                //    "year": 2011,
                //    "income": 30.1,
                //},
                //{
                //    "year": 2012,
                //    "income": 29.5,
                //},
                //{
                //    "year": 2013,
                //    "income": 30.6,
                //}
            ];


            AmCharts.ready(function () {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();

                chart.dataProvider = chartData;
                chart.categoryField = "year";
                chart.startDuration = 1;

                chart.handDrawn = true;
                chart.handDrawnScatter = 3;

                // AXES
                // category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.gridPosition = "start";

                // value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.axisAlpha = 0;
                chart.addValueAxis(valueAxis);

                // GRAPHS
                // column graph
                var graph1 = new AmCharts.AmGraph();
                graph1.type = "column";
                graph1.title = "Contracts ";
                graph1.lineColor = "#4eb250";
                graph1.valueField = "income";
                graph1.lineAlpha = 1;
                graph1.fillAlphas = 1;
                graph1.dashLengthField = "dashLengthColumn";
                graph1.alphaField = "alpha";
                graph1.balloonText = "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b> [[additional]]</span>";
                chart.addGraph(graph1);

                // line
                var graph2 = new AmCharts.AmGraph();
                graph2.type = "line";
                graph2.title = "Expenses";
                graph2.lineColor = "#fcd202";
                graph2.valueField = "expenses";
                graph2.lineThickness = 3;
                graph2.bullet = "round";
                graph2.bulletBorderThickness = 3;
                graph2.bulletBorderColor = "#fcd202";
                graph2.bulletBorderAlpha = 1;
                graph2.bulletColor = "#ffffff";
                graph2.dashLengthField = "dashLengthLine";
                graph2.balloonText = "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b> [[additional]]</span>";
                chart.addGraph(graph2);

                // LEGEND
                var legend = new AmCharts.AmLegend();
                legend.useGraphSettings = true;
                chart.addLegend(legend);

                // WRITE
                chart.write("chartdiv");
            });
        </script>

    <div class="row">
              <div class="col-sm-5 col-md-5">
            <div class="form-group">
                <label>الكلية </label>

                <asp:DropDownList ID="coll" CssClass="form-control" runat="server" OnDataBound="DropDownList1_DataBound" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" AutoPostBack="True"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="select * from coll where id in (select coll_id from dept where id in (select d_id from dept_pre where emp=@emp))
union 
select * from coll where id in (select c_id from c_pre where emp=@emp)">
                    <SelectParameters>
                        <asp:SessionParameter Name="emp" SessionField="log" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="coll" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            </div>
                  </div>
            <div class="col-sm-5 col-md-5">
            <div class="form-group">
                <label>التخصص </label>

                <asp:DropDownList ID="dept" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="dept" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="select * from dept where coll_id=@c and id in (select d_id from dept_pre where emp=@emp)
union 
select * from dept where coll_id=@c and coll_id in (select c_id from c_pre where emp=@emp) ">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="coll" Name="c" PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="emp" SessionField="log" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </div>
                  </div>
            <div class="col-sm-2 col-md-2">
            <div class="form-group">
                <asp:Button ID="Button1" CssClass="btn-success" runat="server" Text="عرض" OnClick="Button1_Click" />
            </div>
                  </div>
             
                </div>

    <div class="row">
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="#" />
                <asp:BoundField DataField="employeeNo" HeaderText="رقم الموظف" />
                <asp:BoundField DataField="instructor" HeaderText="المحاضر" />
                <asp:BoundField DataField="courseDepartment" HeaderText="القسم" />
                <asp:BoundField DataField="lastLogin" HeaderText="اخر تسجيل دخول" />
                <asp:TemplateField HeaderText="عدد المساقات" SortExpression="crs_count">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("crs_count") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <strong>
                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text='<%# Bind("crs_count") %>'></asp:Label>
                        </strong>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="اجمالي النشاطات">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("count") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <strong  style="align-content:center">
                        <asp:Label ID="Label1" runat="server"  Text='<%# Bind("count") %>' ForeColor="#009900"></asp:Label>
                        </strong>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>

    </div>
    <hr/>
    <div class="row" >

       <div class="col-sm-12 col-md-12">
          
          <div id="chartdiv" class="col-lg-6 col-xs-12 col-sm-12"  style="width: 100%; height: 400px;"></div>
            </div>
        
        </div>
    <br/>
    <hr>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        <div class="col-sm-12 col-md-12">
          
          <div id="chartdiv10" <%--class="col-lg-6 col-xs-12 col-sm-12"--%>  style="width: 100%; height: 400px;"></div>
            </div>
</asp:Content>

