var flagDisableBtns=true;var flagDisableFooterFixedBottom=false;function disableFooterFixedBottom()
{flagDisableFooterFixedBottom=true;}
$(document).ready(function(){$('form').submit(function(){if(flagDisableBtns)
$('input:submit').attr("disabled",'disabled');});});function enableSubmitButtons()
{flagDisableBtns=false;}
function showLookupVal(currentDomain,lookupId,lookupValue,lookupValue2)
{var $iframe=$('#modelLookupIFrame');if($iframe.length)
{$iframe.attr('src',"../../../"+currentDomain+"/workFlowLookupInfoModal.do?.rv=<%=edu.qou.common.tools.Randomizer.shortRandom()%>&lookupId="+lookupId+"&lookupValue="+lookupValue+"&lookupValue2="+lookupValue2);}
$("#modelLookup").modal('show');}
function setColumnLabel(dataTableId)
{try{var headerVal,indx=0,numCols=jQuery(dataTableId).find('tr')[0].cells.length;jQuery(dataTableId+" tr td").each(function(){if(indx>=numCols)
indx=0;indx++;headerVal=jQuery(dataTableId+" tr").find("th:eq("+(indx-1)+")").html();if(headerVal!='undefined'&&headerVal.trim()!='')
jQuery(this).attr("col_"+indx,jQuery(dataTableId+" tr").find("th:eq("+(indx-1)+")").html()+" : ")});}
catch(e)
{}}
function setColumnLabelFormIndex(dataTableId,beginIndx)
{try{var headerVal,indx=0,numCols=jQuery(dataTableId).find('tr')[0].cells.length;jQuery(dataTableId+" tr td").each(function(){if(indx>=numCols)
indx=0;if(indx<beginIndx)
{indx++;}
else
{indx++;headerVal=jQuery(dataTableId+" tr").find("th:eq("+(indx-1)+")").html();if(headerVal!='undefined'&&headerVal.trim()!='')
jQuery(this).attr("col_"+indx,jQuery(dataTableId+" tr").find("th:eq("+(indx-1)+")").html()+" : ");}});}
catch(e)
{}}
function newTab(url,paramName,paramValue)
{var form=document.createElement("form");form.setAttribute("action",url);form.setAttribute("method","POST");form.setAttribute("target","_blank");for(var i=0;i<paramName.length;i++)
{var hiddenField=document.createElement("input");hiddenField.setAttribute('type',"hidden");hiddenField.setAttribute("name",paramName[i]);hiddenField.setAttribute("value",paramValue[i]);form.appendChild(hiddenField);}
document.body.appendChild(form);form.submit();document.body.removeChild(form);}
function sameTab(url,paramName,paramValue)
{var form=document.createElement("form");form.setAttribute("action",url);form.setAttribute("method","POST");form.setAttribute("target","_self");for(var i=0;i<paramName.length;i++)
{var hiddenField=document.createElement("input");hiddenField.setAttribute('type',"hidden");hiddenField.setAttribute("name",paramName[i]);hiddenField.setAttribute("value",paramValue[i]);form.appendChild(hiddenField);}
document.body.appendChild(form);form.submit();document.body.removeChild(form);}
function setSelectedValueForCombo(comboName,val)
{try{var dl=document.getElementsByName(comboName)[0];var el=0;for(var i=0;i<dl.options.length;i++){if(dl.options[i].value==val){el=i;break;}}
dl.selectedIndex=el;}
catch(e)
{}}
function getSelectedValueForCombo(comboName)
{try{var e=document.getElementsByName(comboName)[0];var val=e.options[e.selectedIndex].value;return val;}
catch(e)
{}}
function clearCombo(comboName)
{try
{var comboBox=document.getElementsByName(comboName)[0];while(comboBox.options.length>0){comboBox.remove(0);}}
catch(e)
{}}
function setTextFeildValue(feildName,val)
{try
{if(val!=''&&val!='null'&&val!='NULL')
document.getElementsByName(feildName)[0].value=val;}
catch(e)
{}}
function cloneDropDownListCombo(comboSrc,comboDest)
{try
{var first=document.getElementsByName(comboSrc)[0];var options=first.innerHTML;var second=document.getElementsByName(comboDest)[0];second.innerHTML=options;second.selectedIndex=0;}
catch(e)
{}}