﻿using Homory.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Go_Disk : HomoryPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		string name = Server.UrlDecode(Request.QueryString["name"]);
		string password = Server.UrlDecode(Request.QueryString["password"]);
		var c = HomoryContext.Value.User.Count(o => o.Account == name && o.State < State.审核);
		bool succeeded = false;
		if (c > 0)
		{
			var u = HomoryContext.Value.User.First(o => o.Account == name && o.State < State.审核);
			string passwordX = HomoryCryptor.Decrypt(u.Password, u.CryptoKey, u.CryptoSalt);
			if(password.Equals(passwordX))
			{
				succeeded = true;
			}
		}
		if (succeeded)
		{
			Response.Write(string.Format("{{\"success\":true, \"nick\":\"{0}\"}}", name));
			Response.End();
		}
		else
		{
			Response.Write(string.Format("{{\"success\":false, \"msg\":\"{0}\"}}", "用户名或密码错误！"));
			Response.End();
		}
    }
}