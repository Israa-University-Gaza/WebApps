var OxO30b5=["","sel_align","sel_valign","sel_justify","sel_letter","tb_letter","sel_letter_unit","sel_line","tb_line","sel_line_unit","tb_indent","sel_indent_unit","sel_direction","sel_writingmode","outer","div_demo","disabled","selectedIndex","cssText","style","value","textAlign","verticalAlign","textJustify","letterSpacing","length","options","lineHeight","textIndent","direction","writingMode"];function ParseFloatToString(Ox24){var Ox8=parseFloat(Ox24);if(isNaN(Ox8)){return OxO30b5[0];} ;return Ox8+OxO30b5[0];} ;var sel_align=Window_GetElement(window,OxO30b5[1],true);var sel_valign=Window_GetElement(window,OxO30b5[2],true);var sel_justify=Window_GetElement(window,OxO30b5[3],true);var sel_letter=Window_GetElement(window,OxO30b5[4],true);var tb_letter=Window_GetElement(window,OxO30b5[5],true);var sel_letter_unit=Window_GetElement(window,OxO30b5[6],true);var sel_line=Window_GetElement(window,OxO30b5[7],true);var tb_line=Window_GetElement(window,OxO30b5[8],true);var sel_line_unit=Window_GetElement(window,OxO30b5[9],true);var tb_indent=Window_GetElement(window,OxO30b5[10],true);var sel_indent_unit=Window_GetElement(window,OxO30b5[11],true);var sel_direction=Window_GetElement(window,OxO30b5[12],true);var sel_writingmode=Window_GetElement(window,OxO30b5[13],true);var outer=Window_GetElement(window,OxO30b5[14],true);var div_demo=Window_GetElement(window,OxO30b5[15],true);UpdateState=function UpdateState_Text(){tb_letter[OxO30b5[16]]=sel_letter_unit[OxO30b5[16]]=(sel_letter[OxO30b5[17]]>0);tb_line[OxO30b5[16]]=sel_line_unit[OxO30b5[16]]=(sel_line[OxO30b5[17]]>0);div_demo[OxO30b5[19]][OxO30b5[18]]=element[OxO30b5[19]][OxO30b5[18]];} ;SyncToView=function SyncToView_Text(){sel_align[OxO30b5[20]]=element[OxO30b5[19]][OxO30b5[21]];sel_valign[OxO30b5[20]]=element[OxO30b5[19]][OxO30b5[22]];sel_justify[OxO30b5[20]]=element[OxO30b5[19]][OxO30b5[23]];sel_letter[OxO30b5[20]]=element[OxO30b5[19]][OxO30b5[24]];sel_letter_unit[OxO30b5[17]]=0;if(sel_letter[OxO30b5[17]]==-1){if(ParseFloatToString(element[OxO30b5[19]].letterSpacing)){tb_letter[OxO30b5[20]]=ParseFloatToString(element[OxO30b5[19]].letterSpacing);for(var i=0;i<sel_letter_unit[OxO30b5[26]][OxO30b5[25]];i++){var Ox142=sel_letter_unit[OxO30b5[26]][i][OxO30b5[20]];if(Ox142&&element[OxO30b5[19]][OxO30b5[24]].indexOf(Ox142)!=-1){sel_letter_unit[OxO30b5[17]]=i;break ;} ;} ;} ;} ;sel_line[OxO30b5[20]]=element[OxO30b5[19]][OxO30b5[27]];sel_line_unit[OxO30b5[17]]=0;if(sel_line[OxO30b5[17]]==-1){if(ParseFloatToString(element[OxO30b5[19]].lineHeight)){tb_line[OxO30b5[20]]=ParseFloatToString(element[OxO30b5[19]].lineHeight);for(var i=0;i<sel_line_unit[OxO30b5[26]][OxO30b5[25]];i++){var Ox142=sel_line_unit[OxO30b5[26]][i][OxO30b5[20]];if(Ox142&&element[OxO30b5[19]][OxO30b5[27]].indexOf(Ox142)!=-1){sel_line_unit[OxO30b5[17]]=i;break ;} ;} ;} ;} ;sel_indent_unit[OxO30b5[17]]=0;if(!isNaN(ParseFloatToString(element[OxO30b5[19]].textIndent))){tb_indent[OxO30b5[20]]=ParseFloatToString(element[OxO30b5[19]].textIndent);for(var i=0;i<sel_indent_unit[OxO30b5[26]][OxO30b5[25]];i++){var Ox142=sel_indent_unit[OxO30b5[26]][i][OxO30b5[20]];if(Ox142&&element[OxO30b5[19]][OxO30b5[28]].indexOf(Ox142)!=-1){sel_indent_unit[OxO30b5[17]]=i;break ;} ;} ;} ;sel_direction[OxO30b5[20]]=element[OxO30b5[19]][OxO30b5[29]];sel_writingmode[OxO30b5[20]]=element[OxO30b5[19]][OxO30b5[30]];} ;SyncTo=function SyncTo_Text(element){element[OxO30b5[19]][OxO30b5[21]]=sel_align[OxO30b5[20]];element[OxO30b5[19]][OxO30b5[22]]=sel_valign[OxO30b5[20]];element[OxO30b5[19]][OxO30b5[23]]=sel_justify[OxO30b5[20]];if(sel_letter[OxO30b5[17]]>0){element[OxO30b5[19]][OxO30b5[24]]=sel_letter[OxO30b5[20]];} else {if(ParseFloatToString(tb_letter.value)){element[OxO30b5[19]][OxO30b5[24]]=ParseFloatToString(tb_letter.value)+sel_letter_unit[OxO30b5[20]];} else {element[OxO30b5[19]][OxO30b5[24]]=OxO30b5[0];} ;} ;if(sel_line[OxO30b5[17]]>0){element[OxO30b5[19]][OxO30b5[27]]=sel_line[OxO30b5[20]];} else {if(ParseFloatToString(tb_line.value)){element[OxO30b5[19]][OxO30b5[27]]=ParseFloatToString(tb_line.value)+sel_line_unit[OxO30b5[20]];} else {element[OxO30b5[19]][OxO30b5[27]]=OxO30b5[0];} ;} ;if(ParseFloatToString(tb_indent.value)){element[OxO30b5[19]][OxO30b5[28]]=ParseFloatToString(tb_indent.value)+sel_indent_unit[OxO30b5[20]];} else {element[OxO30b5[19]][OxO30b5[28]]=OxO30b5[0];} ;element[OxO30b5[19]][OxO30b5[29]]=sel_direction[OxO30b5[20]]||OxO30b5[0];element[OxO30b5[19]][OxO30b5[30]]=sel_writingmode[OxO30b5[20]]||OxO30b5[0];} ;