<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Stat_Ex.aspx.cs" Inherits="Instructor_Stat_Ex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
#chartdiv {
  width: 100%;
  height: 500px;
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

<!-- HTML -->
<div id="chartdiv" style="
    font-family: system-ui;
"></div>
</asp:Content>

