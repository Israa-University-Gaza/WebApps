<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<script runat="server">
string GetDialogQueryString;
override protected void OnInit(EventArgs args)
{
	if(Context.Request.QueryString["Dialog"]=="Standard")
	{	
	if(Context.Request.QueryString["IsFrame"]==null)
	{
		string FrameSrc="colorpicker_basic.aspx?IsFrame=1&"+Request.ServerVariables["QUERY_STRING"];
		CuteEditor.CEU.WriteDialogOuterFrame(Context,"[[MoreColors]]",FrameSrc);
		Context.Response.End();
	}
	}
	string s="";
	if(Context.Request.QueryString["Dialog"]=="Standard")	
		s="&Dialog=Standard";
	
	GetDialogQueryString="Theme="+Context.Request.QueryString["Theme"]+s;	
	base.OnInit(args);
}
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)" />
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)" />
		<script type="text/javascript" src="Load.ashx?type=dialogscript&verfix=1006&file=DialogHead.js"></script>
		<script type="text/javascript" src="Load.ashx?type=dialogscript&verfix=1006&file=Dialog_ColorPicker.js"></script>
		<link href='Load.ashx?type=themecss&file=dialog.css&theme=[[_Theme_]]' type="text/css"
			rel="stylesheet" />
		<style type="text/css">
			.colorcell
			{
				width:16px;
				height:17px;
				cursor:hand;
			}
			.colordiv,.customdiv
			{
				border:solid 1px #808080;
				width:16px;
				height:17px;
				font-size:1px;
			}
			#ajaxdiv{padding:10px;margin:0;text-align:center; background:#eeeeee;}
		</style>
		<title>[[NamedColors]]</title>
		<script>
								
		var OxO6bea=["Green","#008000","Lime","#00FF00","Teal","#008080","Aqua","#00FFFF","Navy","#000080","Blue","#0000FF","Purple","#800080","Fuchsia","#FF00FF","Maroon","#800000","Red","#FF0000","Olive","#808000","Yellow","#FFFF00","White","#FFFFFF","Silver","#C0C0C0","Gray","#808080","Black","#000000","DarkOliveGreen","#556B2F","DarkGreen","#006400","DarkSlateGray","#2F4F4F","SlateGray","#708090","DarkBlue","#00008B","MidnightBlue","#191970","Indigo","#4B0082","DarkMagenta","#8B008B","Brown","#A52A2A","DarkRed","#8B0000","Sienna","#A0522D","SaddleBrown","#8B4513","DarkGoldenrod","#B8860B","Beige","#F5F5DC","HoneyDew","#F0FFF0","DimGray","#696969","OliveDrab","#6B8E23","ForestGreen","#228B22","DarkCyan","#008B8B","LightSlateGray","#778899","MediumBlue","#0000CD","DarkSlateBlue","#483D8B","DarkViolet","#9400D3","MediumVioletRed","#C71585","IndianRed","#CD5C5C","Firebrick","#B22222","Chocolate","#D2691E","Peru","#CD853F","Goldenrod","#DAA520","LightGoldenrodYellow","#FAFAD2","MintCream","#F5FFFA","DarkGray","#A9A9A9","YellowGreen","#9ACD32","SeaGreen","#2E8B57","CadetBlue","#5F9EA0","SteelBlue","#4682B4","RoyalBlue","#4169E1","BlueViolet","#8A2BE2","DarkOrchid","#9932CC","DeepPink","#FF1493","RosyBrown","#BC8F8F","Crimson","#DC143C","DarkOrange","#FF8C00","BurlyWood","#DEB887","DarkKhaki","#BDB76B","LightYellow","#FFFFE0","Azure","#F0FFFF","LightGray","#D3D3D3","LawnGreen","#7CFC00","MediumSeaGreen","#3CB371","LightSeaGreen","#20B2AA","DeepSkyBlue","#00BFFF","DodgerBlue","#1E90FF","SlateBlue","#6A5ACD","MediumOrchid","#BA55D3","PaleVioletRed","#DB7093","Salmon","#FA8072","OrangeRed","#FF4500","SandyBrown","#F4A460","Tan","#D2B48C","Gold","#FFD700","Ivory","#FFFFF0","GhostWhite","#F8F8FF","Gainsboro","#DCDCDC","Chartreuse","#7FFF00","LimeGreen","#32CD32","MediumAquamarine","#66CDAA","DarkTurquoise","#00CED1","CornflowerBlue","#6495ED","MediumSlateBlue","#7B68EE","Orchid","#DA70D6","HotPink","#FF69B4","LightCoral","#F08080","Tomato","#FF6347","Orange","#FFA500","Bisque","#FFE4C4","Khaki","#F0E68C","Cornsilk","#FFF8DC","Linen","#FAF0E6","WhiteSmoke","#F5F5F5","GreenYellow","#ADFF2F","DarkSeaGreen","#8FBC8B","Turquoise","#40E0D0","MediumTurquoise","#48D1CC","SkyBlue","#87CEEB","MediumPurple","#9370DB","Violet","#EE82EE","LightPink","#FFB6C1","DarkSalmon","#E9967A","Coral","#FF7F50","NavajoWhite","#FFDEAD","BlanchedAlmond","#FFEBCD","PaleGoldenrod","#EEE8AA","Oldlace","#FDF5E6","Seashell","#FFF5EE","PaleGreen","#98FB98","SpringGreen","#00FF7F","Aquamarine","#7FFFD4","PowderBlue","#B0E0E6","LightSkyBlue","#87CEFA","LightSteelBlue","#B0C4DE","Plum","#DDA0DD","Pink","#FFC0CB","LightSalmon","#FFA07A","Wheat","#F5DEB3","Moccasin","#FFE4B5","AntiqueWhite","#FAEBD7","LemonChiffon","#FFFACD","FloralWhite","#FFFAF0","Snow","#FFFAFA","AliceBlue","#F0F8FF","LightGreen","#90EE90","MediumSpringGreen","#00FA9A","PaleTurquoise","#AFEEEE","LightCyan","#E0FFFF","LightBlue","#ADD8E6","Lavender","#E6E6FA","Thistle","#D8BFD8","MistyRose","#FFE4E1","Peachpuff","#FFDAB9","PapayaWhip","#FFEFD5"];var colorlist=[{n:OxO6bea[0],h:OxO6bea[1]},{n:OxO6bea[2],h:OxO6bea[3]},{n:OxO6bea[4],h:OxO6bea[5]},{n:OxO6bea[6],h:OxO6bea[7]},{n:OxO6bea[8],h:OxO6bea[9]},{n:OxO6bea[10],h:OxO6bea[11]},{n:OxO6bea[12],h:OxO6bea[13]},{n:OxO6bea[14],h:OxO6bea[15]},{n:OxO6bea[16],h:OxO6bea[17]},{n:OxO6bea[18],h:OxO6bea[19]},{n:OxO6bea[20],h:OxO6bea[21]},{n:OxO6bea[22],h:OxO6bea[23]},{n:OxO6bea[24],h:OxO6bea[25]},{n:OxO6bea[26],h:OxO6bea[27]},{n:OxO6bea[28],h:OxO6bea[29]},{n:OxO6bea[30],h:OxO6bea[31]}];var colormore=[{n:OxO6bea[32],h:OxO6bea[33]},{n:OxO6bea[34],h:OxO6bea[35]},{n:OxO6bea[36],h:OxO6bea[37]},{n:OxO6bea[38],h:OxO6bea[39]},{n:OxO6bea[40],h:OxO6bea[41]},{n:OxO6bea[42],h:OxO6bea[43]},{n:OxO6bea[44],h:OxO6bea[45]},{n:OxO6bea[46],h:OxO6bea[47]},{n:OxO6bea[48],h:OxO6bea[49]},{n:OxO6bea[50],h:OxO6bea[51]},{n:OxO6bea[52],h:OxO6bea[53]},{n:OxO6bea[54],h:OxO6bea[55]},{n:OxO6bea[56],h:OxO6bea[57]},{n:OxO6bea[58],h:OxO6bea[59]},{n:OxO6bea[60],h:OxO6bea[61]},{n:OxO6bea[62],h:OxO6bea[63]},{n:OxO6bea[64],h:OxO6bea[65]},{n:OxO6bea[66],h:OxO6bea[67]},{n:OxO6bea[68],h:OxO6bea[69]},{n:OxO6bea[70],h:OxO6bea[71]},{n:OxO6bea[72],h:OxO6bea[73]},{n:OxO6bea[74],h:OxO6bea[75]},{n:OxO6bea[76],h:OxO6bea[77]},{n:OxO6bea[78],h:OxO6bea[79]},{n:OxO6bea[80],h:OxO6bea[81]},{n:OxO6bea[82],h:OxO6bea[83]},{n:OxO6bea[84],h:OxO6bea[85]},{n:OxO6bea[86],h:OxO6bea[87]},{n:OxO6bea[88],h:OxO6bea[89]},{n:OxO6bea[90],h:OxO6bea[91]},{n:OxO6bea[92],h:OxO6bea[93]},{n:OxO6bea[94],h:OxO6bea[95]},{n:OxO6bea[96],h:OxO6bea[97]},{n:OxO6bea[98],h:OxO6bea[99]},{n:OxO6bea[100],h:OxO6bea[101]},{n:OxO6bea[102],h:OxO6bea[103]},{n:OxO6bea[104],h:OxO6bea[105]},{n:OxO6bea[106],h:OxO6bea[107]},{n:OxO6bea[108],h:OxO6bea[109]},{n:OxO6bea[110],h:OxO6bea[111]},{n:OxO6bea[112],h:OxO6bea[113]},{n:OxO6bea[114],h:OxO6bea[115]},{n:OxO6bea[116],h:OxO6bea[117]},{n:OxO6bea[118],h:OxO6bea[119]},{n:OxO6bea[120],h:OxO6bea[121]},{n:OxO6bea[122],h:OxO6bea[123]},{n:OxO6bea[124],h:OxO6bea[125]},{n:OxO6bea[126],h:OxO6bea[127]},{n:OxO6bea[128],h:OxO6bea[129]},{n:OxO6bea[130],h:OxO6bea[131]},{n:OxO6bea[132],h:OxO6bea[133]},{n:OxO6bea[134],h:OxO6bea[135]},{n:OxO6bea[136],h:OxO6bea[137]},{n:OxO6bea[138],h:OxO6bea[139]},{n:OxO6bea[140],h:OxO6bea[141]},{n:OxO6bea[142],h:OxO6bea[143]},{n:OxO6bea[144],h:OxO6bea[145]},{n:OxO6bea[146],h:OxO6bea[147]},{n:OxO6bea[148],h:OxO6bea[149]},{n:OxO6bea[150],h:OxO6bea[151]},{n:OxO6bea[152],h:OxO6bea[153]},{n:OxO6bea[154],h:OxO6bea[155]},{n:OxO6bea[156],h:OxO6bea[157]},{n:OxO6bea[158],h:OxO6bea[159]},{n:OxO6bea[160],h:OxO6bea[161]},{n:OxO6bea[162],h:OxO6bea[163]},{n:OxO6bea[164],h:OxO6bea[165]},{n:OxO6bea[166],h:OxO6bea[167]},{n:OxO6bea[168],h:OxO6bea[169]},{n:OxO6bea[170],h:OxO6bea[171]},{n:OxO6bea[172],h:OxO6bea[173]},{n:OxO6bea[174],h:OxO6bea[175]},{n:OxO6bea[176],h:OxO6bea[177]},{n:OxO6bea[178],h:OxO6bea[179]},{n:OxO6bea[180],h:OxO6bea[181]},{n:OxO6bea[182],h:OxO6bea[183]},{n:OxO6bea[184],h:OxO6bea[185]},{n:OxO6bea[186],h:OxO6bea[187]},{n:OxO6bea[188],h:OxO6bea[189]},{n:OxO6bea[190],h:OxO6bea[191]},{n:OxO6bea[192],h:OxO6bea[193]},{n:OxO6bea[194],h:OxO6bea[195]},{n:OxO6bea[196],h:OxO6bea[197]},{n:OxO6bea[198],h:OxO6bea[199]},{n:OxO6bea[200],h:OxO6bea[201]},{n:OxO6bea[202],h:OxO6bea[203]},{n:OxO6bea[204],h:OxO6bea[205]},{n:OxO6bea[206],h:OxO6bea[207]},{n:OxO6bea[208],h:OxO6bea[209]},{n:OxO6bea[210],h:OxO6bea[211]},{n:OxO6bea[212],h:OxO6bea[213]},{n:OxO6bea[214],h:OxO6bea[215]},{n:OxO6bea[216],h:OxO6bea[217]},{n:OxO6bea[218],h:OxO6bea[219]},{n:OxO6bea[220],h:OxO6bea[221]},{n:OxO6bea[156],h:OxO6bea[157]},{n:OxO6bea[222],h:OxO6bea[223]},{n:OxO6bea[224],h:OxO6bea[225]},{n:OxO6bea[226],h:OxO6bea[227]},{n:OxO6bea[228],h:OxO6bea[229]},{n:OxO6bea[230],h:OxO6bea[231]},{n:OxO6bea[232],h:OxO6bea[233]},{n:OxO6bea[234],h:OxO6bea[235]},{n:OxO6bea[236],h:OxO6bea[237]},{n:OxO6bea[238],h:OxO6bea[239]},{n:OxO6bea[240],h:OxO6bea[241]},{n:OxO6bea[242],h:OxO6bea[243]},{n:OxO6bea[244],h:OxO6bea[245]},{n:OxO6bea[246],h:OxO6bea[247]},{n:OxO6bea[248],h:OxO6bea[249]},{n:OxO6bea[250],h:OxO6bea[251]},{n:OxO6bea[252],h:OxO6bea[253]},{n:OxO6bea[254],h:OxO6bea[255]},{n:OxO6bea[256],h:OxO6bea[257]},{n:OxO6bea[258],h:OxO6bea[259]},{n:OxO6bea[260],h:OxO6bea[261]},{n:OxO6bea[262],h:OxO6bea[263]},{n:OxO6bea[264],h:OxO6bea[265]},{n:OxO6bea[266],h:OxO6bea[267]},{n:OxO6bea[268],h:OxO6bea[269]},{n:OxO6bea[270],h:OxO6bea[271]},{n:OxO6bea[272],h:OxO6bea[273]}];
		
		</script>
	</head>
	<body>
		<div id="ajaxdiv">
			<div class="tab-pane-control tab-pane" id="tabPane1">
				<div class="tab-row">
					<h2 class="tab">
						<a tabindex="-1" href='colorpicker.aspx?<%=GetDialogQueryString%>'>
							<span style="white-space:nowrap;">
								[[WebPalette]]
							</span>
						</a>
					</h2>
					<h2 class="tab selected">
							<a tabindex="-1" href='colorpicker_basic.aspx?<%=GetDialogQueryString%>'>
								<span style="white-space:nowrap;">
									[[NamedColors]]
								</span>
							</a>
					</h2>
					<h2 class="tab">
							<a tabindex="-1" href='colorpicker_more.aspx?<%=GetDialogQueryString%>'>
								<span style="white-space:nowrap;">
									[[CustomColor]]
								</span>
							</a>
					</h2>
				</div>
				<div class="tab-page">			
					<table class="colortable" align="center">
						<tr>
							<td colspan="16" height="16"><p align="left">Basic:
								</p>
							</td>
						</tr>
						<tr>
							<script>
								var OxOb150=["length","\x3Ctd class=\x27colorcell\x27\x3E\x3Cdiv class=\x27colordiv\x27 style=\x27background-color:","\x27 title=\x27"," ","\x27 cname=\x27","\x27 cvalue=\x27","\x27\x3E\x3C/div\x3E\x3C/td\x3E",""];var arr=[];for(var i=0;i<colorlist[OxOb150[0]];i++){arr.push(OxOb150[1]);arr.push(colorlist[i].n);arr.push(OxOb150[2]);arr.push(colorlist[i].n);arr.push(OxOb150[3]);arr.push(colorlist[i].h);arr.push(OxOb150[4]);arr.push(colorlist[i].n);arr.push(OxOb150[5]);arr.push(colorlist[i].h);arr.push(OxOb150[6]);} ;document.write(arr.join(OxOb150[7]));
							</script>
						</tr>
						<tr>
							<td colspan="16" height="12"><p align="left"></p>
							</td>
						</tr>
						<tr>
							<td colspan="16"><p align="left">Additional:
								</p>
							</td>
						</tr>
						<script>
							var OxO20d4=["length","\x3Ctr\x3E","\x3Ctd class=\x27colorcell\x27\x3E\x3Cdiv class=\x27colordiv\x27 style=\x27background-color:","\x27 title=\x27"," ","\x27 cname=\x27","\x27 cvalue=\x27","\x27\x3E\x3C/div\x3E\x3C/td\x3E","\x3C/tr\x3E",""];var arr=[];for(var i=0;i<colormore[OxO20d4[0]];i++){if(i%16==0){arr.push(OxO20d4[1]);} ;arr.push(OxO20d4[2]);arr.push(colormore[i].n);arr.push(OxO20d4[3]);arr.push(colormore[i].n);arr.push(OxO20d4[4]);arr.push(colormore[i].h);arr.push(OxO20d4[5]);arr.push(colormore[i].n);arr.push(OxO20d4[6]);arr.push(colormore[i].h);arr.push(OxO20d4[7]);if(i%16==15){arr.push(OxO20d4[8]);} ;} ;if(colormore%16>0){arr.push(OxO20d4[8]);} ;document.write(arr.join(OxO20d4[9]));
						</script>
						<tr>
							<td colspan="16" height="8">
							</td>
						</tr>
						<tr>
							<td colspan="16" height="12">
								<input checked id="CheckboxColorNames" style="width: 16px; height: 20px" type="checkbox">
								<span style="width: 118px;">Use color names</span>
							</td>
						</tr>
						<tr>
							<td colspan="16" height="12">
							</td>
						</tr>
						<tr>
							<td colspan="16" valign="middle" height="24">
							<span style="height:24px;width:50px;vertical-align:middle;">Color : </span>&nbsp;
							<input type="text" id="divpreview" size="7" maxlength="7" style="width:180px;height:24px;border:#a0a0a0 1px solid; Padding:4;"/>
					
							</td>
						</tr>
				</table>
			</div>
		</div>
		<div id="container-bottom">
			<input type="button" id="buttonok" value="[[OK]]" class="formbutton" style="width:70px"	onclick="do_insert();" /> 
			&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="button" id="buttoncancel" value="[[Cancel]]" class="formbutton" style="width:70px"	onclick="do_Close();" />	
		</div>
	</div>
	</body>
</html>

