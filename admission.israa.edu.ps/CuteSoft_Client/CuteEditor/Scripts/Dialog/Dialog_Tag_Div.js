var OxO1113=["SetStyle","length","","GetStyle","GetText",":",";","cssText","tblBorderStyle","sel_style","sel_border","sel_part","bordercolor","bordercolor_Preview","inp_color","inp_color_Preview","inp_shade","inp_shade_Preview","inp_MarginLeft","inp_MarginRight","inp_MarginTop","inp_MarginBottom","inp_PaddingLeft","inp_PaddingRight","inp_PaddingTop","inp_PaddingBottom","inp_width","sel_width_unit","inp_height","sel_height_unit","inp_id","inp_class","sel_align","sel_textalign","sel_float","inp_tooltip","value","borderColor","style"," ","backgroundColor","color","id","className","width","height","inp_","sel_","_unit","selectedIndex","options","align","styleFloat","cssFloat","textAlign","title","borderWidth","borderLeftWidth","borderTopWidth","borderRightWidth","borderBottomWidth","borderLeftStyle","borderTopStyle","borderRightStyle","borderBottomStyle","none","border","-","red","paddingLeft","paddingRight","paddingTop","paddingBottom","marginLeft","marginRight","marginTop","marginBottom","[[ValidID]]","class","onclick"];function pause(Ox4a3){var Oxa8= new Date();var Ox4a4=Oxa8.getTime()+Ox4a3;while(true){Oxa8= new Date();if(Oxa8.getTime()>Ox4a4){return ;} ;} ;} ;function StyleClass(Ox201){var Ox4a6=[];var Ox4a7={};if(Ox201){Ox4ac();} ;this[OxO1113[0]]=function SetStyle(name,Ox4f,Ox4a9){name=name.toLowerCase();for(var i=0;i<Ox4a6[OxO1113[1]];i++){if(Ox4a6[i]==name){break ;} ;} ;Ox4a6[i]=name;Ox4a7[name]=Ox4f?(Ox4f+(Ox4a9||OxO1113[2])):OxO1113[2];} ;this[OxO1113[3]]=function GetStyle(name){name=name.toLowerCase();return Ox4a7[name]||OxO1113[2];} ;this[OxO1113[4]]=function Ox4ab(){var Ox201=OxO1113[2];for(var i=0;i<Ox4a6[OxO1113[1]];i++){var Ox27=Ox4a6[i];var p=Ox4a7[Ox27];if(p){Ox201+=Ox27+OxO1113[5]+p+OxO1113[6];} ;} ;return Ox201;} ;function Ox4ac(){var arr=Ox201.split(OxO1113[6]);for(var i=0;i<arr[OxO1113[1]];i++){var p=arr[i].split(OxO1113[5]);var Ox27=p[0].replace(/^\s+/g,OxO1113[2]).replace(/\s+$/g,OxO1113[2]).toLowerCase();Ox4a6[Ox4a6[OxO1113[1]]]=Ox27;Ox4a7[Ox27]=p[1];} ;} ;} ;function GetStyle(Ox137,name){return  new StyleClass(Ox137.cssText).GetStyle(name);} ;function SetStyle(Ox137,name,Ox4f,Ox4ad){var Ox4ae= new StyleClass(Ox137.cssText);Ox4ae.SetStyle(name,Ox4f,Ox4ad);Ox137[OxO1113[7]]=Ox4ae.GetText();} ;function ParseFloatToString(Ox24){if(!Ox24){return OxO1113[2];} ;var Ox8=parseFloat(Ox24);if(isNaN(Ox8)){return OxO1113[2];} ;return Ox8+OxO1113[2];} ;var tblBorderStyle=Window_GetElement(window,OxO1113[8],true);var sel_style=Window_GetElement(window,OxO1113[9],true);var sel_border=Window_GetElement(window,OxO1113[10],true);var sel_part=Window_GetElement(window,OxO1113[11],true);var bordercolor=Window_GetElement(window,OxO1113[12],true);var bordercolor_Preview=Window_GetElement(window,OxO1113[13],true);var inp_color=Window_GetElement(window,OxO1113[14],true);var inp_color_Preview=Window_GetElement(window,OxO1113[15],true);var inp_shade=Window_GetElement(window,OxO1113[16],true);var inp_shade_Preview=Window_GetElement(window,OxO1113[17],true);var inp_MarginLeft=Window_GetElement(window,OxO1113[18],true);var inp_MarginRight=Window_GetElement(window,OxO1113[19],true);var inp_MarginTop=Window_GetElement(window,OxO1113[20],true);var inp_MarginBottom=Window_GetElement(window,OxO1113[21],true);var inp_PaddingLeft=Window_GetElement(window,OxO1113[22],true);var inp_PaddingRight=Window_GetElement(window,OxO1113[23],true);var inp_PaddingTop=Window_GetElement(window,OxO1113[24],true);var inp_PaddingBottom=Window_GetElement(window,OxO1113[25],true);var inp_width=Window_GetElement(window,OxO1113[26],true);var sel_width_unit=Window_GetElement(window,OxO1113[27],true);var inp_height=Window_GetElement(window,OxO1113[28],true);var sel_height_unit=Window_GetElement(window,OxO1113[29],true);var inp_id=Window_GetElement(window,OxO1113[30],true);var inp_class=Window_GetElement(window,OxO1113[31],true);var sel_align=Window_GetElement(window,OxO1113[32],true);var sel_textalign=Window_GetElement(window,OxO1113[33],true);var sel_float=Window_GetElement(window,OxO1113[34],true);var inp_tooltip=Window_GetElement(window,OxO1113[35],true);UpdateState=function UpdateState_Div(){} ;function doBorderStyle(Ox120){sel_style[OxO1113[36]]=Ox120;} ;function doPart(Ox120){sel_part[OxO1113[36]]=Ox120;} ;function doWidth(Ox120){sel_border[OxO1113[36]]=Ox120;} ;SyncToView=function SyncToView_Div(){if(Browser_IsWinIE()){bordercolor[OxO1113[36]]=element[OxO1113[38]][OxO1113[37]];} else {var arr=revertColor(element[OxO1113[38]].borderColor).split(OxO1113[39]);bordercolor[OxO1113[36]]=arr[0];} ;bordercolor[OxO1113[38]][OxO1113[40]]=bordercolor[OxO1113[36]];bordercolor_Preview[OxO1113[38]][OxO1113[40]]=bordercolor[OxO1113[36]];inp_color[OxO1113[36]]=revertColor(element[OxO1113[38]].color);inp_color[OxO1113[38]][OxO1113[40]]=element[OxO1113[38]][OxO1113[41]];inp_color_Preview[OxO1113[38]][OxO1113[40]]=element[OxO1113[38]][OxO1113[41]];inp_shade[OxO1113[36]]=revertColor(element[OxO1113[38]].backgroundColor);inp_shade[OxO1113[38]][OxO1113[40]]=element[OxO1113[38]][OxO1113[40]];inp_shade_Preview[OxO1113[38]][OxO1113[40]]=element[OxO1113[38]][OxO1113[40]];inp_id[OxO1113[36]]=element[OxO1113[42]];if(ParseFloatToString(element[OxO1113[38]].marginLeft)){inp_MarginLeft[OxO1113[36]]=ParseFloatToString(element[OxO1113[38]].marginLeft);} ;if(ParseFloatToString(element[OxO1113[38]].marginRight)){inp_MarginRight[OxO1113[36]]=ParseFloatToString(element[OxO1113[38]].marginRight);} ;if(ParseFloatToString(element[OxO1113[38]].marginTop)){inp_MarginTop[OxO1113[36]]=ParseFloatToString(element[OxO1113[38]].marginTop);} ;if(ParseFloatToString(element[OxO1113[38]].marginBottom)){inp_MarginBottom[OxO1113[36]]=ParseFloatToString(element[OxO1113[38]].marginBottom);} ;if(ParseFloatToString(element[OxO1113[38]].paddingLeft)){inp_PaddingLeft[OxO1113[36]]=ParseFloatToString(element[OxO1113[38]].paddingLeft);} ;if(ParseFloatToString(element[OxO1113[38]].paddingRight)){inp_PaddingRight[OxO1113[36]]=ParseFloatToString(element[OxO1113[38]].paddingRight);} ;if(ParseFloatToString(element[OxO1113[38]].paddingTop)){inp_PaddingTop[OxO1113[36]]=ParseFloatToString(element[OxO1113[38]].paddingTop);} ;if(ParseFloatToString(element[OxO1113[38]].paddingBottom)){inp_PaddingBottom[OxO1113[36]]=ParseFloatToString(element[OxO1113[38]].paddingBottom);} ;inp_class[OxO1113[36]]=element[OxO1113[43]];var arr=[OxO1113[44],OxO1113[45]];for(var Ox1fc=0;Ox1fc<arr[OxO1113[1]];Ox1fc++){var Ox27=arr[Ox1fc];var Ox43=Window_GetElement(window,OxO1113[46]+Ox27,true);var Ox120=Window_GetElement(window,OxO1113[47]+Ox27+OxO1113[48],true);Ox120[OxO1113[49]]=0;if(ParseFloatToString(element[OxO1113[38]][Ox27])){Ox43[OxO1113[36]]=ParseFloatToString(element[OxO1113[38]][Ox27]);for(var i=0;i<Ox120[OxO1113[50]][OxO1113[1]];i++){var Ox142=Ox120[OxO1113[50]][i][OxO1113[36]];if(Ox142&&element[OxO1113[38]][Ox27].indexOf(Ox142)!=-1){Ox120[OxO1113[49]]=i;break ;} ;} ;} ;} ;sel_align[OxO1113[36]]=element[OxO1113[51]];if(Browser_IsWinIE()){sel_float[OxO1113[36]]=element[OxO1113[38]][OxO1113[52]];} else {sel_float[OxO1113[36]]=element[OxO1113[38]][OxO1113[53]];} ;sel_textalign[OxO1113[36]]=element[OxO1113[38]][OxO1113[54]];inp_tooltip[OxO1113[36]]=element[OxO1113[55]];try{sel_border[OxO1113[36]]=element[OxO1113[38]][OxO1113[56]];if(element[OxO1113[38]][OxO1113[57]]==element[OxO1113[38]][OxO1113[58]]&&element[OxO1113[38]][OxO1113[57]]==element[OxO1113[38]][OxO1113[59]]&&element[OxO1113[38]][OxO1113[57]]==element[OxO1113[38]][OxO1113[60]]){sel_border[OxO1113[36]]=element[OxO1113[38]][OxO1113[57]];} ;if(element[OxO1113[38]][OxO1113[61]]==element[OxO1113[38]][OxO1113[62]]&&element[OxO1113[38]][OxO1113[61]]==element[OxO1113[38]][OxO1113[63]]&&element[OxO1113[38]][OxO1113[61]]==element[OxO1113[38]][OxO1113[64]]){sel_style[OxO1113[36]]=element[OxO1113[38]][OxO1113[61]];} ;} catch(x){} ;} ;SyncTo=function SyncTo_Div(element){var Ox4c6=sel_part[OxO1113[36]];if(Ox4c6==OxO1113[65]){element[OxO1113[38]][OxO1113[66]]=OxO1113[65];} else {var Ox4c7=Ox4c6?OxO1113[67]+Ox4c6:Ox4c6;var Oxdc=OxO1113[68];var Ox137=sel_style[OxO1113[36]]||OxO1113[2];var Ox4c8=sel_border[OxO1113[36]];element[OxO1113[38]][OxO1113[66]]=OxO1113[65];if(Ox4c8||Ox137){SetStyle(element.style,OxO1113[66]+Ox4c7,Ox4c8+OxO1113[39]+Ox137+OxO1113[39]+Oxdc);} else {SetStyle(element.style,OxO1113[66]+Ox4c7,OxO1113[2]);} ;SetStyle(element.style,OxO1113[66]+Ox4c7,Ox4c8+OxO1113[39]+Ox137+OxO1113[39]+Oxdc);} ;try{element[OxO1113[38]][OxO1113[41]]=inp_color[OxO1113[36]]||OxO1113[2];} catch(x){element[OxO1113[38]][OxO1113[41]]=OxO1113[2];} ;try{element[OxO1113[38]][OxO1113[40]]=inp_shade[OxO1113[36]]||OxO1113[2];} catch(x){element[OxO1113[38]][OxO1113[40]]=OxO1113[2];} ;try{element[OxO1113[38]][OxO1113[37]]=bordercolor[OxO1113[36]]||OxO1113[2];} catch(x){element[OxO1113[38]][OxO1113[37]]=OxO1113[2];} ;element[OxO1113[38]][OxO1113[69]]=inp_PaddingLeft[OxO1113[36]];element[OxO1113[38]][OxO1113[70]]=inp_PaddingRight[OxO1113[36]];element[OxO1113[38]][OxO1113[71]]=inp_PaddingTop[OxO1113[36]];element[OxO1113[38]][OxO1113[72]]=inp_PaddingBottom[OxO1113[36]];element[OxO1113[38]][OxO1113[73]]=inp_MarginLeft[OxO1113[36]];element[OxO1113[38]][OxO1113[74]]=inp_MarginRight[OxO1113[36]];element[OxO1113[38]][OxO1113[75]]=inp_MarginTop[OxO1113[36]];element[OxO1113[38]][OxO1113[76]]=inp_MarginBottom[OxO1113[36]];element[OxO1113[43]]=inp_class[OxO1113[36]];var arr=[OxO1113[44],OxO1113[45]];for(var Ox1fc=0;Ox1fc<arr[OxO1113[1]];Ox1fc++){var Ox27=arr[Ox1fc];var Ox43=Window_GetElement(window,OxO1113[46]+Ox27,true);var Ox4c9=Window_GetElement(window,OxO1113[47]+Ox27+OxO1113[48],true);if(ParseFloatToString(Ox43.value)){element[OxO1113[38]][Ox27]=ParseFloatToString(Ox43.value)+Ox4c9[OxO1113[36]];} else {element[OxO1113[38]][Ox27]=OxO1113[2];} ;} ;var Ox376=/[^a-z\d]/i;if(Ox376.test(inp_id.value)){alert(OxO1113[77]);return ;} ;element[OxO1113[51]]=sel_align[OxO1113[36]];element[OxO1113[42]]=inp_id[OxO1113[36]];if(Browser_IsWinIE()){element[OxO1113[38]][OxO1113[52]]=sel_float[OxO1113[36]];} else {element[OxO1113[38]][OxO1113[53]]=sel_float[OxO1113[36]];} ;element[OxO1113[38]][OxO1113[54]]=sel_textalign[OxO1113[36]];element[OxO1113[55]]=inp_tooltip[OxO1113[36]];if(element[OxO1113[55]]==OxO1113[2]){element.removeAttribute(OxO1113[55]);} ;if(element[OxO1113[43]]==OxO1113[2]){element.removeAttribute(OxO1113[43]);} ;if(element[OxO1113[43]]==OxO1113[2]){element.removeAttribute(OxO1113[78]);} ;if(element[OxO1113[51]]==OxO1113[2]){element.removeAttribute(OxO1113[51]);} ;if(element[OxO1113[42]]==OxO1113[2]){element.removeAttribute(OxO1113[42]);} ;} ;bordercolor[OxO1113[79]]=bordercolor_Preview[OxO1113[79]]=function bordercolor_onclick(){SelectColor(bordercolor,bordercolor_Preview);} ;inp_color[OxO1113[79]]=inp_color_Preview[OxO1113[79]]=function inp_color_onclick(){SelectColor(inp_color,inp_color_Preview);} ;inp_shade[OxO1113[79]]=inp_shade_Preview[OxO1113[79]]=function inp_shade_onclick(){SelectColor(inp_shade,inp_shade_Preview);} ;