﻿using Homory.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Go_PlayVideo : HomoryPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Guid.Parse(Request.QueryString[0]);
        var comment = HomoryContext.Value.ResourceComment.Single(o => o.Id == id);
        var resource = comment.Resource;
        player.StartSeconds = comment.Start;
        player.EndSeconds = comment.End;
        player.Comment = comment.Content;
        player.Video = resource.Preview;
    }
}