﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Error : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SendError("خطأ في برنامج القبول والتسجيل");
    }
}