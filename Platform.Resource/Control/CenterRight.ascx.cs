﻿using Homory.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Migrations;

public partial class Control_CenterRight : Homory.Model.HomoryResourceControl
{
    protected void addFavourite_OnClick(object sender, ImageClickEventArgs e)
    {
        var id = Guid.Parse(((ImageButton)sender).CommandArgument);
        HomoryContext.Value.UserFavourite.AddOrUpdate(new UserFavourite { UserId = CurrentUser.Id, FavouriteUserId = id, State = State.启用 });
        HomoryContext.Value.SaveChanges();
        var favouritesSource = CurrentUser.MeFavourite.Where(o => o.State == State.启用).ToList();
        var favouritesSourceId = favouritesSource.Select(o => o.FavouriteUserId).ToList();
        favourites.DataSource = favouritesSource.Select(o => o.FavouriteUser).ToList();
        favourites.DataBind();
        relatives.DataSource =
            HomoryContext.Value.User.Where(o => o.State < State.审核).ToList().Where(o => !favouritesSourceId.Contains(o.Id)).ToList();
        relatives.DataBind();
    }

    protected void removeFavourite_OnClick(object sender, ImageClickEventArgs e)
    {
        var id = Guid.Parse(((ImageButton)sender).CommandArgument);
        HomoryContext.Value.UserFavourite.AddOrUpdate(new UserFavourite { UserId = CurrentUser.Id, FavouriteUserId = id, State = State.删除 });
        HomoryContext.Value.SaveChanges();
        var favouritesSource = CurrentUser.MeFavourite.Where(o => o.State == State.启用).ToList();
        var favouritesSourceId = favouritesSource.Select(o => o.FavouriteUserId).ToList();
        favourites.DataSource = favouritesSource.Select(o => o.FavouriteUser).ToList();
        favourites.DataBind();
        relatives.DataSource =
            HomoryContext.Value.User.Where(o => o.State < State.审核).ToList().Where(o => !favouritesSourceId.Contains(o.Id)).ToList();
        relatives.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitializeHomoryPage();
        }
    }

    protected void InitializeHomoryPage()
    {
        var user = CurrentUser;

        //visit.ImageUrl = user.Icon;
        //visitTime.InnerText = DateTime.Now.ToString("HH:mm");
        time.Text = string.Format("{0} {1}", DateTime.Today.ToString("MM月dd日"),
            DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")));
        board.DataSource = user.Resource.Where(o => o.State == State.启用).OrderByDescending(o => o.Rate).Take(5).ToList();
        board.DataBind();
        var favouritesSource = CurrentUser.MeFavourite.Where(o => o.State == State.启用).ToList();
        var favouritesSourceId = favouritesSource.Select(o => o.FavouriteUserId).ToList();
        favourites.DataSource = favouritesSource.Select(o => o.FavouriteUser).Take(3).ToList();
        favourites.DataBind();
        relatives.DataSource =
            HomoryContext.Value.User.Where(o => o.State < State.审核 && o.Type == UserType.教师 || o.Type == UserType.内置 || o.Type == UserType.注册).ToList().Where(o => !favouritesSourceId.Contains(o.Id)).Take(3).ToList();
        relatives.DataBind();

	    var t1 = CurrentUser.GroupUser.Where(o => o.State < State.审核).ToList();
	    var t2 = t1.Where(o => o.Group.Type == GroupType.教研团队 && o.State < State.审核).ToList().Select(o=>o.GroupId).ToList();
		var t3 = new List<Guid>();
	    foreach (var g in t2)
	    {
		    t3.AddRange(HomoryContext.Value.Catalog.Where(o=>o.TopId==g).Select(o=>o.Id).ToList());
	    }
	    var t4 = t3.Join(HomoryContext.Value.ViewResourceX, o => o, o => o.CatalogId, (a, b) => b.Id).ToList().Distinct();
	    groupRes.DataSource =
		    t4.Join(HomoryContext.Value.Resource, o => o, o => o.Id, (a, b) => b)
			    .OrderByDescending(o => o.Time)
			    .Take(5)
			    .ToList();
		groupRes.DataBind();
    }

    protected void refreshFavourite_OnServerClick(object sender, EventArgs e)
    {
    }

    protected override bool ShouldOnline
    {
        get { return true; }
    }
}