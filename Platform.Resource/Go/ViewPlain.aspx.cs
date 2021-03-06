﻿using System;
using System.IO;
using System.Linq;
using System.ServiceModel.Activities;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI.HtmlControls;
using Homory.Model;
using System.Text;

namespace Go
{
    public partial class GoViewPlain : HomoryResourcePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogOp(ResourceLogType.浏览资源);
                cg.Visible = CanCombineCourse() || CanCombineGrade();
                tag.Visible = CanCombineTags();
                var url = string.Format("../Document/web/PdfViewer.aspx?Id={0}&Random={1}", Request.QueryString["Id"],
                    Guid.NewGuid());
                publish_preview_pdf.Attributes["src"] = url;
                catalog.Visible = CurrentResource.Type == ResourceType.文章 && CurrentResource.ResourceCatalog.Count(y => y.State < State.审核 && y.Catalog.State< State.审核 && y.Catalog.Type == CatalogType.文章) > 0;
                var p =
                    TargetUser.Resource.Where(
                        o => o.State == State.启用 && o.Type == CurrentResource.Type && o.Time > CurrentResource.Time)
                        .OrderByDescending(o => o.Time).FirstOrDefault();
                if (p != null)
                {
                    previous.Visible = true;
                    previousLink.InnerText = p.Title;
                    previousLink.HRef = string.Format("../Go/ViewPlain?Id={0}", p.Id);
                }
                var n =
                    TargetUser.Resource.Where(
                        o => o.State == State.启用 && o.Type == CurrentResource.Type && o.Time < CurrentResource.Time)
                        .OrderByDescending(o => o.Time)
                        .FirstOrDefault();
                if (n != null)
                {
                    next.Visible = true;
                    nextLink.InnerText = n.Title;
                    nextLink.HRef = string.Format("../Go/ViewPlain?Id={0}", n.Id);
                }
                if (IsOnline)
                {
                    var rate = HomoryContext.Value.Action.FirstOrDefault(o => o.Id2 == CurrentResource.Id && o.Id3 == CurrentUser.Id && o.Type == ActionType.用户评分资源 && o.State == State.启用);
                    if (rate != null)
                    {
                        rating.Enabled = false;
                        rating.Value = decimal.Parse(rate.Content1);
                    }
                }
                HomoryContext.Value.ST_Resource(CurrentResource.Id, ResourceOperationType.View, 1);
                if (IsOnline)
                {
                    var action = HomoryContext.Value.Action.FirstOrDefault(o => o.Id1 == TargetUser.Id && o.Id2 == CurrentResource.Id && o.Id3 == CurrentUser.Id && o.Type == ActionType.用户访问资源);
                    if (action == null)
                    {
                        action = new Homory.Model.Action
                        {
                            Id = HomoryContext.Value.GetId(),
                            Id1 = TargetUser.Id,
                            Id2 = CurrentResource.Id,
                            Id3 = CurrentUser.Id,
                            Type = ActionType.用户访问资源,
                            State = State.启用,
                            Time = DateTime.Now,
                        };
                        HomoryContext.Value.Action.Add(action);
                    }
                    else
                    {
                        action.Time = DateTime.Now;
                    }
                    if (HomoryContext.Value.Action.Count(o => o.Id2 == CurrentResource.Id && o.Id3 == CurrentUser.Id && o.Type == ActionType.用户收藏资源 && o.State == State.启用) == 0)
                    {
                        favourite.Attributes["Class"] = "homory0";
                    }
                    else
                    {
                        favourite.Attributes["Class"] = "homory1";
                    }
                }
                else
                {
                    favourite.Attributes["Class"] = "homory0";
                }
                CurrentResource.View += 1;
                HomoryContext.Value.SaveChanges();
                downloadCount.InnerText = CurrentResource.Download.ToString();
                favouriteCount.InnerText = CurrentResource.Favourite.ToString();
                icon.ImageUrl = TargetUser.Icon;
                name.Text = UC(TargetUser.Id).Replace("无锡市", "").Replace("无锡", "");
                nameX.Text = TargetUser.DisplayName;
                viewCount.Text = CurrentResource.View.ToString();
                viewList.DataSource = HomoryContext.Value.Action.Where(o => o.Id2 == CurrentResource.Id && o.Type == ActionType.用户访问资源).OrderByDescending(q => q.Time)
                        .Take(9)
                        .ToList();
                viewList.DataBind();
                var rt = CurrentResource.Type;
                latest.DataSource =
                    TargetUser.Resource.Where(o => o.State == State.启用 && o.Type == rt)
                        .OrderByDescending(o => o.Time)
                        .Take(9)
                        .ToList();
                latest.DataBind();
                popular.DataSource =
                TargetUser.Resource.Where(o => o.State == State.启用 && o.Type == rt)
                    .OrderByDescending(o => o.View)
                    .Take(9)
                    .ToList();
                popular.DataBind();
                best.DataSource =
        TargetUser.Resource.Where(o => o.State == State.启用 && o.Type == rt)
            .OrderByDescending(o => o.Grade)
            .Take(9)
            .ToList();
                best.DataBind();
                BindComment();
                score.InnerText = CurrentResource.Grade.ToString();
            }
        }

        private Resource _resource;

        protected static string QueryType(CatalogType type)
        {
            switch (type)
            {
                case CatalogType.年级_幼儿园:
                case CatalogType.年级_小学:
                case CatalogType.年级_初中:
                case CatalogType.年级_高中:
                    {
                        return "Grade";
                    }
                case CatalogType.课程:
                    {
                        return "Course";
                    }
                default:
                    {
                        return "Catalog";
                    }
            }
        }

        protected void publish_attachment_list_OnNeedDataSource(object sender, Telerik.Web.UI.RadListViewNeedDataSourceEventArgs e)
        {
            var resource = CurrentResource;
            var files = HomoryContext.Value.Resource.Single(o => o.Id == resource.Id).ResourceAttachment.OrderBy(o => o.Id).ToList();
            publish_attachment_list.DataSource = files;
            pppp1.Visible = pppp2.Visible = HomoryContext.Value.Resource.Single(o => o.Id == resource.Id).ResourceAttachment.Count > 0;
        }

        protected Func<string, ResourceCatalog, string> Combine = (a, o) => string.Format("{0}<a target='_blank' href='../Go/Search?{2}={3}'>{1}</a>、", a, o.Catalog.Name, QueryType(o.Catalog.Type), o.CatalogId);

        protected bool CanCombineGrade()
        {
            return CurrentResource.GradeId.HasValue;
        }

        protected string CombineGrade()
        {
            return CanCombineGrade() ? string.Format("年级：<a target='_blank' href='../Go/Search?{1}={2}'>{0}</a>", HomoryContext.Value.Catalog.First(o=>o.Id==CurrentResource.GradeId).Name, QueryType(HomoryContext.Value.Catalog.First(o => o.Id == CurrentResource.GradeId).Type), CurrentResource.GradeId) : "";
        }

        protected bool CanCombineCourse()
        {
            return CurrentResource.CourseId.HasValue;
        }

        protected string CombineCourse()
        {
            return CanCombineCourse() ? string.Format("学科：<a target='_blank' href='../Go/Search?{1}={2}'>{0}</a>", HomoryContext.Value.Catalog.First(o => o.Id == CurrentResource.CourseId).Name, QueryType(CatalogType.课程), CurrentResource.CourseId) : "";
        }

        protected bool CanCombineTags()
        {
            return CurrentResource.ResourceTag.Count(o => o.State < State.审核) > 0;
        }

        protected string CombineTags()
        {
            var format = "、<a target='_blank' href='../Go/Search?Content={1}'>{0}</a>";
            var sb = new StringBuilder();
            foreach (var t in CurrentResource.ResourceTag.Where(o => o.State < State.审核).ToList())
                sb.Append(string.Format(format, t.Tag, Server.UrlEncode(t.Tag)));
            return CanCombineTags() ? sb.ToString().Substring(1) : "";
        }

        protected Resource CurrentResource
        {
            get
            {
                if (_resource == null)
                {
                    var id = Guid.Parse(Request.QueryString["Id"]);
                    _resource = HomoryContext.Value.Resource.Single(o => o.Id == id);
                }
                return _resource;
            }
        }

        private User _user;

        protected User TargetUser
        {
            get
            {
                if (_user == null)
                {
                    _user = CurrentResource.User;
                }
                return _user;
            }
        }

        protected override bool ShouldOnline
        {
            get { return false; }
        }

        protected void rating_OnRate(object sender, EventArgs e)
        {
            if (!IsOnline)
            {
                SignOn();
                return;
            }
            HomoryContext.Value.ST_Resource(CurrentResource.Id, ResourceOperationType.Rate, 1);
            HomoryContext.Value.ST_Resource(CurrentResource.Id, ResourceOperationType.Grade, rating.Value);
            // 1次3.5分
	        int low = CurrentResource.Rate;
	        decimal lowV = CurrentResource.Grade;
            CurrentResource.Rate += 1;
            CurrentResource.Grade = decimal.Divide(low * lowV + rating.Value,
                low+1);
            // (3.5*1+4.5)/(1+1)
            var action = new Homory.Model.Action
            {
                Id = HomoryContext.Value.GetId(),
                Id1 = TargetUser.Id,
                Id2 = CurrentResource.Id,
                Id3 = CurrentUser.Id,
                Content1 = rating.Value.ToString(),
                Type = ActionType.用户评分资源,
                State = State.启用,
                Time = DateTime.Now,
            };
            HomoryContext.Value.Action.Add(action);
            HomoryContext.Value.SaveChanges();
            LogOp(ResourceLogType.评定资源, 1);
            rating.Enabled = false;
            bestPanel.RaisePostBackEvent("Refresh");
            scorePanel.RaisePostBackEvent("Refresh");
        }

        protected void download_OnServerClick(object sender, EventArgs e)
        {
            HomoryContext.Value.ST_Resource(CurrentResource.Id, ResourceOperationType.Download, 1);
            if (IsOnline)
            {
                var action = new Homory.Model.Action
                {
                    Id = HomoryContext.Value.GetId(),
                    Id1 = TargetUser.Id,
                    Id2 = CurrentResource.Id,
                    Id3 = CurrentUser.Id,
                    Type = ActionType.用户下载资源,
                    State = State.启用,
                    Time = DateTime.Now,
                };
                HomoryContext.Value.Action.Add(action);
            }
            CurrentResource.Download += 1;
            LogOp(ResourceLogType.下载资源, 1);
            HomoryContext.Value.SaveChanges();
            downloadCount.InnerText = CurrentResource.Download.ToString();
            downloadPanel.ResponseScripts.Add(string.Format("window.open('{0}');", CurrentResource.Source));
        }

        protected void favourite_OnServerClick(object sender, EventArgs e)
        {
            if (!IsOnline)
            {
                SignOn();
                return;
            }
            if (HomoryContext.Value.Action.Count(o => o.Id2 == CurrentResource.Id && o.Id3 == CurrentUser.Id && o.Type == ActionType.用户收藏资源 && o.State == State.启用) == 0)
            {
                HomoryContext.Value.ST_Resource(CurrentResource.Id, ResourceOperationType.Favourite, 1);
                var action = new Homory.Model.Action
                {
                    Id = HomoryContext.Value.GetId(),
                    Id1 = TargetUser.Id,
                    Id2 = CurrentResource.Id,
                    Id3 = CurrentUser.Id,
                    Type = ActionType.用户收藏资源,
                    State = State.启用,
                    Time = DateTime.Now,
                };
                HomoryContext.Value.Action.Add(action);
                CurrentResource.Favourite += 1;
                LogOp(ResourceLogType.收藏资源, 1);
                HomoryContext.Value.SaveChanges();
                favourite.Attributes["Class"] = "homory1";
            }
            favouriteCount.InnerText = CurrentResource.Favourite.ToString();
        }

        protected void BindComment()
        {
            commentList.DataSource = CurrentResource.ResourceComment.Where(o => o.State == State.启用).ToList();
            commentList.DataBind();
            commentList.ExpandAllNodes();
        }

        protected void doComment_OnServerClick(object sender, EventArgs e)
        {
            if (!IsOnline)
            {
                SignOn();
                return;
            }
            if (string.IsNullOrWhiteSpace(comment.Value.Trim()))
                return;
            var c = new ResourceComment
            {
                Id = HomoryContext.Value.GetId(),
                ParentId = null,
                ResourceId = CurrentResource.Id,
                UserId = CurrentUser.Id,
                Content = comment.Value.Trim(),
                Timed = false,
                Level = 0,
                Time = DateTime.Now,
                State = State.启用
            };
            HomoryContext.Value.ResourceComment.Add(c);
            HomoryContext.Value.ST_Resource(CurrentResource.Id, ResourceOperationType.Comment, 1);
            CurrentResource.Comment += 1;
            var action = new Homory.Model.Action
            {
                Id = HomoryContext.Value.GetId(),
                Id1 = TargetUser.Id,
                Id2 = CurrentResource.Id,
                Id3 = CurrentUser.Id,
                Content1 = comment.Value.Trim(),
                Type = ActionType.用户评论资源,
                State = State.启用,
                Time = DateTime.Now,
            };
            HomoryContext.Value.Action.Add(action);
            HomoryContext.Value.SaveChanges();
            LogOp(ResourceLogType.评论资源, 1);
            comment.Value = string.Empty;
            BindComment();
        }

        protected void goReply_OnServerClick(object sender, EventArgs e)
        {
            if (!IsOnline)
            {
                SignOn();
                return;
            }
            var x = (sender as HtmlAnchor).Parent.FindControl("reply");
            x.Visible = true;
        }

        protected void noReply_OnServerClick(object sender, EventArgs e)
        {
            if (!IsOnline)
            {
                SignOn();
                return;
            }
            var x = (sender as HtmlAnchor).Parent;
            x.Visible = false;
        }

        protected void replyReply_OnServerClick(object sender, EventArgs e)
        {
            if (!IsOnline)
            {
                SignOn();
                return;
            }
            var x = (sender as HtmlAnchor).Parent.FindControl("replyContent") as HtmlTextArea;
            var id = Guid.Parse(((sender as HtmlAnchor).Parent.FindControl("replyId") as HtmlInputHidden).Value);
            if (string.IsNullOrWhiteSpace(x.Value.Trim()))
            {
                return;
            }
            if (string.IsNullOrWhiteSpace(x.Value.Trim()))
                return;
            var c = new ResourceComment
            {
                Id = HomoryContext.Value.GetId(),
                ParentId = id,
                ResourceId = CurrentResource.Id,
                UserId = CurrentUser.Id,
                Content = x.Value.Trim(),
                Timed = false,
                Level = HomoryContext.Value.ResourceComment.First(o => o.Id == id).Level + 1,
                Time = DateTime.Now,
                State = State.启用
            };
            HomoryContext.Value.ResourceComment.Add(c);
            HomoryContext.Value.ST_Resource(CurrentResource.Id, ResourceOperationType.Comment, 1);
            CurrentResource.Comment += 1;
            var action = new Homory.Model.Action
            {
                Id = HomoryContext.Value.GetId(),
                Id1 = TargetUser.Id,
                Id2 = CurrentResource.Id,
                Id3 = CurrentUser.Id,
                Id4 = id,
                Content1 = x.Value.Trim(),
                Type = ActionType.用户回复评论,
                State = State.启用,
                Time = DateTime.Now,
            };
            LogOp(ResourceLogType.回复评论, 1);
            HomoryContext.Value.Action.Add(action);
            HomoryContext.Value.SaveChanges();
            BindComment();

        }

        protected void bestPanel_AjaxRequest(object sender, Telerik.Web.UI.AjaxRequestEventArgs e)
        {
            var rt = CurrentResource.Type;
            best.DataSource =
TargetUser.Resource.Where(o => o.State == State.启用 && o.Type == rt)
    .OrderByDescending(o => o.Grade)
    .Take(9)
    .ToList();
            best.DataBind();
        }

        protected void scorePanel_AjaxRequest(object sender, Telerik.Web.UI.AjaxRequestEventArgs e)
        {
            score.InnerText = CurrentResource.Grade.ToString("F2");
        }
		protected void goDelP_ServerClick(object sender, EventArgs e)
		{
			try
			{
				HtmlAnchor a = (HtmlAnchor)sender;
				var id = Guid.Parse(a.Attributes["alt"]);
				var rc = HomoryContext.Value.ResourceComment.First(o => o.Id == id);
				rc.State = State.删除;
				HomoryContext.Value.ST_Resource(CurrentResource.Id, ResourceOperationType.Comment, -1);
				CurrentResource.Comment -= 1;
				HomoryContext.Value.SaveChanges();
				BindComment();
			}
			catch
			{

			}
		}
	}
}
