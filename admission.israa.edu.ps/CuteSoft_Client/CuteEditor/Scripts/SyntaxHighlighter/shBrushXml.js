var OxO524a=["Xml","Brushes","sh","CssClass","dp-xml","Style",".dp-xml .cdata { color: #ff1493; }",".dp-xml .tag, .dp-xml .tag-name { color: #069; font-weight: bold; }",".dp-xml .attribute { color: red; }",".dp-xml .attribute-value { color: blue; }","prototype","Aliases","xml","xhtml","xslt","html","ProcessRegexList","length","(\x26lt;|\x3C)\x5C!\x5C[[\x5Cw\x5Cs]*?\x5C[(.|\x5Cs)*?\x5C]\x5C](\x26gt;|\x3E)","gm","cdata","(\x26lt;|\x3C)!--\x5Cs*.*?\x5Cs*--(\x26gt;|\x3E)","comments","([:\x5Cw-.]+)\x5Cs*=\x5Cs*(\x22.*?\x22|\x27.*?\x27|\x5Cw+)*|(\x5Cw+)","attribute","index","attribute-value","(\x26lt;|\x3C)/*\x5C?*(?!\x5C!)|/*\x5C?*(\x26gt;|\x3E)","tag","(?:\x26lt;|\x3C)/*\x5C?*\x5Cs*([:\x5Cw-.]+)","tag-name"];dp[OxO524a[2]][OxO524a[1]][OxO524a[0]]=function (){this[OxO524a[3]]=OxO524a[4];this[OxO524a[5]]=OxO524a[6]+OxO524a[7]+OxO524a[8]+OxO524a[9];} ;dp[OxO524a[2]][OxO524a[1]][OxO524a[0]][OxO524a[10]]= new dp[OxO524a[2]].Highlighter();dp[OxO524a[2]][OxO524a[1]][OxO524a[0]][OxO524a[11]]=[OxO524a[12],OxO524a[13],OxO524a[14],OxO524a[15],OxO524a[13]];dp[OxO524a[2]][OxO524a[1]][OxO524a[0]][OxO524a[10]][OxO524a[16]]=function (){function Oxb6a(Oxb6b,Ox4f){Oxb6b[Oxb6b[OxO524a[17]]]=Ox4f;} ;var Ox1fc=0;var Ox938=null;var Oxb6c=null;this.GetMatches( new RegExp(OxO524a[18],OxO524a[19]),OxO524a[20]);this.GetMatches( new RegExp(OxO524a[21],OxO524a[19]),OxO524a[22]);Oxb6c= new RegExp(OxO524a[23],OxO524a[19]);while((Ox938=Oxb6c.exec(this.code))!=null){if(Ox938[1]==null){continue ;} ;Oxb6a(this.matches, new dp[OxO524a[2]].Match(Ox938[1],Ox938.index,OxO524a[24]));if(Ox938[2]!=undefined){Oxb6a(this.matches, new dp[OxO524a[2]].Match(Ox938[2],Ox938[OxO524a[25]]+Ox938[0].indexOf(Ox938[2]),OxO524a[26]));} ;} ;this.GetMatches( new RegExp(OxO524a[27],OxO524a[19]),OxO524a[28]);Oxb6c= new RegExp(OxO524a[29],OxO524a[19]);while((Ox938=Oxb6c.exec(this.code))!=null){Oxb6a(this.matches, new dp[OxO524a[2]].Match(Ox938[1],Ox938[OxO524a[25]]+Ox938[0].indexOf(Ox938[1]),OxO524a[30]));} ;} ;