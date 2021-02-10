var _ms_XMLHttpRequest_ActiveX="";var _ajax;var _logger=true;var _status_area;BASE_URL="."
if(!window.Node||!window.Node.ELEMENT_NODE){var Node={ELEMENT_NODE:1,ATTRIBUTE_NODE:2,TEXT_NODE:3,CDATA_SECTION_NODE:4,ENTITY_REFERENCE_NODE:5,ENTITY_NODE:6,PROCESSING_INSTRUCTION_NODE:7,COMMENT_NODE:8,DOCUMENT_NODE:9,DOCUMENT_TYPE_NODE:10,DOCUMENT_FRAGMENT_NODE:11,NOTATION_NODE:12};}
function $(){var elements=new Array();for(var i=0;i<arguments.length;i++){var element=arguments[i];if(typeof element=='string')
element=document.getElementById(element);if(arguments.length==1)
return element;elements.push(element);}
return elements;}
function getTextFromXML(oNode,deep){var s="";var nodes=oNode.childNodes;for(var i=0;i<nodes.length;i++){var node=nodes[i];if(node.nodeType==Node.TEXT_NODE){s+=node.data;}else if(deep==true&&(node.nodeType==Node.ELEMENT_NODE||node.nodeType==Node.DOCUMENT_NODE||node.nodeType==Node.DOCUMENT_FRAGMENT_NODE)){s+=getTextFromXML(node,true);};};return s;};function encode(uri){if(encodeURIComponent){return encodeURIComponent(uri);}
if(escape){return escape(uri);}}
function decode(uri){uri=uri.replace(/\+/g,' ');if(decodeURIComponent){return decodeURIComponent(uri);}
if(unescape){return unescape(uri);}
return uri;}
function logger(text,clear){if(_logger){if(!_status_area){_status_area=document.getElementById("status_area");}
if(_status_area){if(clear){_status_area.value="";}
var old=_status_area.value;_status_area.value=text+((old)?"\r\n":"")+old;}}}
function executeReturn(AJAX){if(AJAX.readyState==4){if(AJAX.status==200){logger('AJAXRequest is complete: '+AJAX.readyState+"/"+AJAX.status+"/"+AJAX.statusText);if(AJAX.responseText){logger(AJAX.responseText);logger("-----------------------------------------------------------");eval(AJAX.responseText);}}}}
function AJAXRequest(method,url,data,process,async,dosend){var self=this;if(window.XMLHttpRequest){self.AJAX=new XMLHttpRequest();}else if(window.ActiveXObject){if(_ms_XMLHttpRequest_ActiveX){self.AJAX=new ActiveXObject(_ms_XMLHttpRequest_ActiveX);}else{var versions=["Msxml2.XMLHTTP.7.0","Msxml2.XMLHTTP.6.0","Msxml2.XMLHTTP.5.0","Msxml2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"];for(var i=0;i<versions.length;i++){try{self.AJAX=new ActiveXObject(versions[i]);if(self.AJAX){_ms_XMLHttpRequest_ActiveX=versions[i];break;}}
catch(objException){};};}}
if(typeof process=='undefined'||process==null){process=executeReturn;}
self.process=process;self.AJAX.onreadystatechange=function(){self.process(self.AJAX);}
if(!method){method="POST";}
method=method.toUpperCase();if(typeof async=='undefined'||async==null){async=true;}
logger("----------------------------------------------------------------------");logger("AJAX Request: "+((async)?"Async":"Sync")+" "+method+": URL: "+url+", Data: "+data);self.AJAX.open(method,url,async);if(method=="POST"){self.AJAX.setRequestHeader("Connection","close");self.AJAX.setRequestHeader("Content-Type","application/x-www-form-urlencoded");self.AJAX.setRequestHeader("Method","POST "+url+"HTTP/1.1");}
if(dosend||typeof dosend=='undefined'){if(!data)data="";self.AJAX.send(data);}
return self.AJAX;}
function get_select_data(dataset,key1,key2,key3,key4,key5,target){return new AJAXRequest("POST","/getSelectData","dataset="+dataset+"&key1="+key1+"&key2="+key2+"&key3="+key3+"&key4="+key4+"&key5="+key5+"&target="+target);}
function getJournalsComboList(key1,target){clearSelect(target);return new get_select_data("get_journals_combo_list",key1,"k2","k3","k4","k5",target);}
function getJournalsVerComboList(key1,key2,target){clearSelect(target);return new get_select_data("get_journals-ver_combo_list",key1,key2,"k3","k4","k5",target);}
function getActionsOptainList(key1,target){clearSelect(target);return new get_select_data("get_action_optain_list",key1,"k2","k3","k4","k5",target);}
function getActionsNotOptainList(key1,target){clearSelect(target);return new get_select_data("get_action_not_optain_list",key1,"k2","k3","k4","k5",target);}
function getSpecComboList(key1,target){clearSelect(target);return new get_select_data("get_spec_combo_list",key1,"k2","k3","k4","k5",target);}
function clearSelect(){for(var i=0;i<arguments.length;i++){var element=arguments[i];if(typeof element=='string')
element=document.getElementsByName(element)[0];if(element&&element.options){element.options.length=0;element.selectedIndex=-1;}}}
function getSelectData(dataset,key1,key2,key3,key4,target){return new AJAXRequest("POST",BASE_URL+"/getCombosData","dataset="+dataset+"&key1="+key1+"&key2="+key2+"&key3="+key3+"&key4="+key4+"&target="+target);}
function getCourses(key1,key2,target){return getSelectData("courses",key1,key2,"3","4",target);}
function getCourses1(key1,key2,target){return getSelectData1("courses",key1,key2,target);}
function getSelectData1(dataset,key1,key2,target){worker_start("Loading...");var ajaxResult=AJAXRequest("POST","/cmaa/getCombosData","dataset="+dataset+"&key1="+key1+"&key2="+key2+"&target="+target);worker_stop("");return ajaxResult;}
function clearTableTermCoursesTable(){var theTable=(document.all)?document.all.termCoursesTable:document.getElementById("termCoursesTable");var theTableBody=theTable.tBodies[0];if(theTableBody.rows.length>0)
{var length=theTableBody.rows.length
for(var k=length;k>0;k--)
{theTableBody.deleteRow(k-1)}}}
function clearTableTermSummaryTable(){var theTable=(document.all)?document.all.termSummaryTable:document.getElementById("termSummaryTable");var theTableBody=theTable.tBodies[0];if(theTableBody.rows.length>0)
{var length=theTableBody.rows.length
for(var k=length;k>0;k--)
{theTableBody.deleteRow(k-1)}}}
function clearTableStudentTermStatus(){var theTable=(document.all)?document.all.studentTermStatus:document.getElementById("studentTermStatus");var theTableBody=theTable.tBodies[0];if(theTableBody.rows.length>0)
{var length=theTableBody.rows.length
for(var k=length;k>0;k--)
{theTableBody.deleteRow(k-1)}}}
function getTermCourses(key1,key2){worker_start("Loading...");clearTableStudentTermStatus();clearTableTermCoursesTable();clearTableTermSummaryTable();var ajaxResult=getTermCoursesData("studen",key1,key2);worker_stop("");return ajaxResult;}
function getTermCoursesData(dataset,key1,key2){return new AJAXRequest("POST","/cmaa/getStudentInfo","dataset="+dataset+"&key1="+key1+"&key2="+key2);}
function getTutorTermCourses(key1,key2){worker_start("Loading...");clearTableTermCoursesTable();var ajaxResult=getTutorTermCoursesData("tutor",key1,key2);worker_stop("");return ajaxResult;}
function getTutorTermCoursesData(dataset,key1,key2){return new AJAXRequest("POST","/cmaa/getTutorInfo","dataset="+dataset+"&key1="+key1+"&key2="+key2);}
function worker_start(status)
{var w=document.getElementById("worker");w.style.visibility='visible'
w.innerHTML="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+status}
function worker_stop(status)
{document.getElementById("worker").style.visibility='hidden'}