var OxO73ab=["inp_class","inp_width","inp_height","sel_align","sel_textalign","sel_float","inp_forecolor","img_forecolor","inp_backcolor","img_backcolor","inp_tooltip","value","className","width","style","height","align","styleFloat","cssFloat","textAlign","title","backgroundColor","color","","class","onclick"];var inp_class=Window_GetElement(window,OxO73ab[0],true);var inp_width=Window_GetElement(window,OxO73ab[1],true);var inp_height=Window_GetElement(window,OxO73ab[2],true);var sel_align=Window_GetElement(window,OxO73ab[3],true);var sel_textalign=Window_GetElement(window,OxO73ab[4],true);var sel_float=Window_GetElement(window,OxO73ab[5],true);var inp_forecolor=Window_GetElement(window,OxO73ab[6],true);var img_forecolor=Window_GetElement(window,OxO73ab[7],true);var inp_backcolor=Window_GetElement(window,OxO73ab[8],true);var img_backcolor=Window_GetElement(window,OxO73ab[9],true);var inp_tooltip=Window_GetElement(window,OxO73ab[10],true);UpdateState=function UpdateState_Common(){} ;SyncToView=function SyncToView_Common(){inp_class[OxO73ab[11]]=element[OxO73ab[12]];inp_width[OxO73ab[11]]=element[OxO73ab[14]][OxO73ab[13]];inp_height[OxO73ab[11]]=element[OxO73ab[14]][OxO73ab[15]];sel_align[OxO73ab[11]]=element[OxO73ab[16]];if(Browser_IsWinIE()){sel_float[OxO73ab[11]]=element[OxO73ab[14]][OxO73ab[17]];} else {sel_float[OxO73ab[11]]=element[OxO73ab[14]][OxO73ab[18]];} ;sel_textalign[OxO73ab[11]]=element[OxO73ab[14]][OxO73ab[19]];inp_tooltip[OxO73ab[11]]=element[OxO73ab[20]];inp_forecolor[OxO73ab[11]]=revertColor(element[OxO73ab[14]].color);inp_forecolor[OxO73ab[14]][OxO73ab[21]]=inp_forecolor[OxO73ab[11]];img_forecolor[OxO73ab[14]][OxO73ab[21]]=inp_forecolor[OxO73ab[11]];inp_backcolor[OxO73ab[11]]=revertColor(element[OxO73ab[14]].backgroundColor);inp_backcolor[OxO73ab[14]][OxO73ab[21]]=inp_backcolor[OxO73ab[11]];img_backcolor[OxO73ab[14]][OxO73ab[21]]=inp_backcolor[OxO73ab[11]];} ;SyncTo=function SyncTo_Common(element){element[OxO73ab[12]]=inp_class[OxO73ab[11]];try{element[OxO73ab[14]][OxO73ab[13]]=inp_width[OxO73ab[11]];element[OxO73ab[14]][OxO73ab[15]]=inp_height[OxO73ab[11]];} catch(x){} ;element[OxO73ab[16]]=sel_align[OxO73ab[11]];if(Browser_IsWinIE()){element[OxO73ab[14]][OxO73ab[17]]=sel_float[OxO73ab[11]];} else {element[OxO73ab[14]][OxO73ab[18]]=sel_float[OxO73ab[11]];} ;element[OxO73ab[14]][OxO73ab[19]]=sel_textalign[OxO73ab[11]];element[OxO73ab[20]]=inp_tooltip[OxO73ab[11]];element[OxO73ab[14]][OxO73ab[22]]=inp_forecolor[OxO73ab[11]];element[OxO73ab[14]][OxO73ab[21]]=inp_backcolor[OxO73ab[11]];if(element[OxO73ab[12]]==OxO73ab[23]){element.removeAttribute(OxO73ab[12]);} ;if(element[OxO73ab[12]]==OxO73ab[23]){element.removeAttribute(OxO73ab[24]);} ;if(element[OxO73ab[20]]==OxO73ab[23]){element.removeAttribute(OxO73ab[20]);} ;if(element[OxO73ab[16]]==OxO73ab[23]){element.removeAttribute(OxO73ab[16]);} ;} ;img_forecolor[OxO73ab[25]]=inp_forecolor[OxO73ab[25]]=function inp_forecolor_onclick(){SelectColor(inp_forecolor,img_forecolor);} ;img_backcolor[OxO73ab[25]]=inp_backcolor[OxO73ab[25]]=function inp_backcolor_onclick(){SelectColor(inp_backcolor,img_backcolor);} ;