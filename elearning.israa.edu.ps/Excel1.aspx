<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Excel1.aspx.cs" Inherits="Excel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <link rel="stylesheet" type="text/css" href="temp_files/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="temp_files/bootstrap-rtl.css"/>
    <title></title>
    <style>
#chartdiv {
  width: 100%;
  height: 500px;
}
#chartdiv2 {
  width: 100%;
  height: 500px;
}
#chartdiv3 {
  width: 100%;
  height: 500px;
}
         table * {
                 text-align: center;
         }

</style>
    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
    
    <script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv2", am4charts.PieChart3D);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

     
chart.data = [
                <%  
        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
          System.Data.SqlClient.SqlDataAdapter DA1 = new System.Data.SqlClient.SqlDataAdapter("select c1,c2 from e_excel", conn);
          System.Data.DataTable DT1 = new   System.Data.DataTable();
          DA1.Fill(DT1);
         %> 
       <% {
              for(int i=0;i<DT1.Rows.Count;i++)
              Response.Write("{country: \""+DT1.Rows[i][1]+"\",litres: "+DT1.Rows[i][0]+"},");
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
          System.Data.SqlClient.SqlDataAdapter DA = new System.Data.SqlClient.SqlDataAdapter("select c1,c2 from e_excel", conn);
          System.Data.DataTable DT = new   System.Data.DataTable();
          DA.Fill(DT);
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
    <script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

    // Create chart instance



var chart = am4core.create("chartdiv3", am4charts.XYChart);

     chart.data = [
                    <%  
          System.Data.SqlClient.SqlDataAdapter DA2 = new System.Data.SqlClient.SqlDataAdapter("select c1,c2 from e_excel", conn);
          System.Data.DataTable DT2 = new   System.Data.DataTable();
          DA2.Fill(DT2);
         %> 
       <% {
              for(int i=0;i<DT2.Rows.Count;i++)
              Response.Write("{year: \""+DT2.Rows[i][1]+"\",value: "+DT2.Rows[i][0]+"},");
          }%>
         
         
       
       ];



// Set input format for the dates
//chart.dateFormatter.inputDateFormat = "yyyy-MM-dd";

    var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
    categoryAxis.dataFields.category = "year";
    categoryAxis.renderer.minGridDistance = 50;
    categoryAxis.renderer.grid.template.location = 0.5;
    categoryAxis.startLocation = 0.5;
    categoryAxis.endLocation = 0.5;

    // Create value axis
    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
    valueAxis.baseValue = 0;

    // Create series
    var series = chart.series.push(new am4charts.LineSeries());
    series.dataFields.valueY = "value";
    series.dataFields.categoryX = "year";
    series.strokeWidth = 2;
    series.tensionX = 0.77;

    // bullet is added because we add tooltip to a bullet for it to change color
    var bullet = series.bullets.push(new am4charts.Bullet());
    bullet.tooltipText = "{valueY}";

    bullet.adapter.add("fill", function (fill, target) {
        if (target.dataItem.valueY < 0) {
            return am4core.color("#FF0000");
        }
        return fill;
    })
    var range = valueAxis.createSeriesRange(series);
    range.value = 0;
    range.endValue = -1000;
    range.contents.stroke = am4core.color("#FF0000");
    range.contents.fill = range.contents.stroke;

    // Add scrollbar
    var scrollbarX = new am4charts.XYChartScrollbar();
    scrollbarX.series.push(series);
    chart.scrollbarX = scrollbarX;

    chart.cursor = new am4charts.XYCursor();


}); // end am4core.ready()
</script>
</head>
<body>
    <form id="form1" runat="server">
      <div class="col-sm-6 col-md-6">
         <div id="chartdiv1" style="height: 550px;
    font-family: system-ui;
"></div>
         </div>
    <div class="col-sm-6 col-md-6">
         <div id="chartdiv2" style="
    font-family: system-ui;    height: 553px;

"></div>
         </div>
        <div class="col-sm-12 col-md-12">
         <div id="chartdiv3" style="height: 550px;
    font-family: system-ui;
"></div>
         </div>
    </form>
</body>
</html>
