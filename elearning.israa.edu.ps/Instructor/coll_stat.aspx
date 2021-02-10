<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="coll_stat.aspx.cs" Inherits="Instructor_coll_stat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style>
#chartdiv {
  width: 100%;
  height: 500px;
}
         table * {
                 text-align: center;
         }

</style>

<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.PieChart3D);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

     
chart.data = [
                <%  System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
          System.Data.SqlClient.SqlDataAdapter DA = new System.Data.SqlClient.SqlDataAdapter("select dbo.calc_coll(name),name from coll1", conn);
          System.Data.DataTable DT = new   System.Data.DataTable();
          DA.Fill(DT);
         %> 
       <% {
              for(int i=0;i<DT.Rows.Count;i++)
              Response.Write("{country: \""+DT.Rows[i][1]+"\",litres: "+DT.Rows[i][0]+"},");
          }%>
       ];
       //{
                //    "year": 2010,
                //    "income": 26.2,

//chart.data = [
//  {
//      country: "كلية العلوم الإدارية والمالية",
//    litres: 501.9
//  },
//  {
//    country: "Czech Republic",
//    litres: 301.9
//  },
//  {
//    country: "Ireland",
//    litres: 201.1
//  },
//  {
//    country: "Germany",
//    litres: 165.8
//  },
//  {
//    country: "Australia",
//    litres: 139.9
//  },
//  {
//    country: "Austria",
//    litres: 128.3
//  }
//];

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


    <%--<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>--%>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv1", am4charts.XYChart);
chart.scrollbarX = new am4core.Scrollbar();

    chart.data = [
                <%  
         
         %> 
       <% {
              for(int i=0;i<DT.Rows.Count;i++)
              Response.Write("{country: \""+DT.Rows[i][1]+"\",visits: "+DT.Rows[i][0]+"},");
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
</script>


      <div class="col-sm-12 col-md-12">
            <div class="well">
                <h4 ><span style="font-size: 18px;" class="glyphicon glyphicon-bell">
                   
                    </span>&nbsp;&nbsp;
                نشاط الكليات خلال الفصل الدراسي الحالي 
                </h4>
                
            </div>
        </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" CssClass="table">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="الكلية" SortExpression="name" />
            <asp:BoundField DataField="crs" HeaderText="عدد المساقات"  SortExpression="crs" />
            <asp:BoundField DataField="vids_external" HeaderText="الفيديو الخارجي" ReadOnly="True" SortExpression="vids_external" />
            <asp:BoundField DataField="vids_internal" HeaderText="الفيديو الداخلي" ReadOnly="True" SortExpression="vids_internal" />
            <asp:BoundField DataField="Announcements" HeaderText="الاعلانات" ReadOnly="True" SortExpression="Announcements" />
            <asp:BoundField DataField="dialog" HeaderText="النقاشات" ReadOnly="True" SortExpression="dialog" />
            <asp:BoundField DataField="files" HeaderText="الملفات" ReadOnly="True" SortExpression="files" />
            <asp:BoundField DataField="HomeWork" HeaderText="الواجبات" ReadOnly="True" SortExpression="HomeWork" />
            <asp:BoundField DataField="links" HeaderText="الروابط" ReadOnly="True" SortExpression="links" />
            <asp:BoundField DataField="all_act" HeaderText="جميع الانشطة" ReadOnly="True" SortExpression="all_act" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="select name, dbo.calc_coll_crs(name) crs,dbo.calc_coll_vids_external(name)vids_external,dbo.calc_coll_vids_internal(name)vids_internal,dbo.calc_coll_Announcements(name)Announcements,dbo.calc_coll_dialog(name)dialog,dbo.calc_coll_files(name)files,dbo.calc_coll_HomeWork(name)HomeWork,dbo.calc_coll_links(name)links,dbo.calc_coll(name)all_act from coll1"></asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    
     <div class="col-sm-6 col-md-6">
         <div id="chartdiv" style="
    font-family: system-ui;
"></div>
         </div>
    <div class="col-sm-6 col-md-6">
         <div id="chartdiv1" style="
    font-family: system-ui;    height: 553px;

"></div>
         </div>
</asp:Content>

