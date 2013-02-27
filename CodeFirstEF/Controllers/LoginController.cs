using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Specialized;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;


namespace CodeFirstEF.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/

        //
        // GET: /Register/
        private IUnitOfWork DB_Service;

        public LoginController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        public ActionResult Index()
        {
            return View(new LogOnModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(LogOnModel model, string ReturnUrl)
        {

            if (ModelState.IsValid)
            {
                try
                {
                    string Md5Password = CheckHelper.StrToMd5(model.Password);

                    if (DB_Service.Set<Member>().Count(x => x.Email == model.Email && x.Password == Md5Password) == 1)
                    {
                        Member LoginUser = DB_Service.Set<Member>().Single(x => x.Email == model.Email);
                        DB_Service.Attach<Member>(LoginUser);
                        LoginUser.LastIP = HttpHelper.IP;
                        LoginUser.LastTime = DateTime.Now;
                        LoginUser.LoginCount = LoginUser.LoginCount + 1;
                        Member_Action ma = new Member_Action();
                        ma.ActionType = 3;
                        ma.AddTime = DateTime.Now;
                        ma.Description = "登录";
                        LoginUser.Member_Action.Add(ma);
                        DB_Service.Commit();
                        CookieHelper.LoginCookieSave(LoginUser.MemberID.ToString(),
                            LoginUser.Email,
                            LoginUser.NickName,
                            "AvtarUrl",
                            LoginUser.GroupID.ToString(),
                            LoginUser.LoginCount.ToString(),
                            LoginUser.Password,
                            "1");
                        ViewBag.Message = null;
                        if (Url.IsLocalUrl(ReturnUrl) && ReturnUrl.Length > 1 && ReturnUrl.StartsWith("/")
                       && !ReturnUrl.StartsWith("//") && !ReturnUrl.StartsWith("/\\"))
                        {
                            return Redirect(ReturnUrl);
                        }
                        else
                        {
                            return Redirect(Url.Action("Index"));
                        }

                    }
                    else
                    {
                        ViewBag.Message = "您的用户名和密码不匹配";
                        return View(model);
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            else
            {
                ViewBag.Message = "您的输入有误请确认后提交";
                return View(model);
            }
        }


        public ActionResult Design()
        {
            return View();
        }

        public ActionResult Sina()
        {
            //应用的APPID 
            string app_id = "536362505";
            //应用的APPKEY 
            string app_secret = "0378c9aabc8a757d124cb01c1e9c04bf";
            //成功授权后的回调地址 
            string my_url = "http://www.dotaeye.com/login/sina";

            //Step1：获取Authorization Code 
            //session_start(); 
            string code = Request.QueryString["code"];
            if (string.IsNullOrEmpty(code))
            {
                //state参数用于防止CSRF攻击，成功授权后回调时会原样带回 
                Session["state"] = Guid.NewGuid();//md5(uniqid(rand(), TRUE));  
                //拼接URL      
                string dialog_url = "https://api.weibo.com/oauth2/authorize?response_type=code&client_id="
                   + app_id + "&redirect_uri=" + Server.UrlEncode(my_url) + "&state="
                   + Session["state"];
                return Content("<script> location.href='" + dialog_url + "'</script>");
            }
            if (Request["state"].ToString().Equals(Session["state"].ToString()))
            {
                Session["state"] = null;
                //拼接URL    
                string token_url = "https://api.weibo.com/oauth2/access_token";
                string data = "grant_type=authorization_code&client_id=" + app_id + "&redirect_uri=" + Server.UrlEncode(my_url)
                + "&client_secret=" + app_secret + "&code=" + code;
                string response = HttpHelper.WebPagePostGet(token_url, data, System.Text.Encoding.UTF8);

                NameValueCollection user = ParseJson(response);
                if (!string.IsNullOrEmpty(user["error"]))
                {
                    return View(new OpenLoginStatus()
                    {
                        Success = false,
                        Error = user["error"].ToString(),
                        Message = user["error_description"].ToString()
                    });
                }
                OpenLoginStatus OpenUser = new OpenLoginStatus()
                {
                    Success = true,
                    OpenType = 2,
                    Uid = user["uid"].ToString(),
                    OpenId = user["access_token"].ToString()
                };
                if (DB_Service.Set<Member>().Count(x => x.OpenID.Equals(OpenUser.OpenId) && x.OpenType == 2) == 1)
                {
                    Member LoginUser = DB_Service.Set<Member>().Single(x => x.OpenID.Equals(OpenUser.OpenId) && x.OpenType == 2);
                    DB_Service.Attach<Member>(LoginUser);
                    LoginUser.LastIP = HttpHelper.IP;
                    LoginUser.LastTime = DateTime.Now;
                    LoginUser.LoginCount = LoginUser.LoginCount + 1;
                    Member_Action ma = new Member_Action();
                    ma.ActionType = 3;
                    ma.AddTime = DateTime.Now;
                    ma.Description = "登录";
                    LoginUser.Member_Action.Add(ma);
                    DB_Service.Commit();
                    CookieHelper.LoginCookieSave(LoginUser.MemberID.ToString(),
                        LoginUser.Email,
                        LoginUser.NickName,
                        "AvtarUrl",
                        LoginUser.GroupID.ToString(),
                        LoginUser.LoginCount.ToString(),
                        LoginUser.Password,
                        "1");
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    string user_profile_url = "https://api.weibo.com/2/users/show.json?access_token=" + OpenUser.OpenId + "&uid=" + OpenUser.Uid;
                    string response_profile = HttpHelper.WebPageContentGet(user_profile_url, System.Text.Encoding.UTF8);
                    NameValueCollection userProfile = ParseJson(response_profile);
                    OpenUser.NickName = userProfile["screen_name"].ToString();
                    Session["registerAuto"] = OpenUser;
                    return RedirectToAction("RegAuto", "Register");
                }
            }
            else
            {
                return View(new OpenLoginStatus()
                {
                    Success = false,
                    Error = "The state does not match. You may be a victim of CSRF",
                    Message = "request=" + Request["state"] + ",session=" + Session["state"]
                });

            }
        }
        NameValueCollection ParseJson(string json_code)
        {
            NameValueCollection mc = new NameValueCollection();
            Regex regex = new Regex(@"(\s*\""?([^""]*)\""?\s*\:\s*\""?([^""]*)\""?\,?)");
            json_code = json_code.Trim();
            if (json_code.StartsWith("{"))
            {
                json_code = json_code.Substring(1, json_code.Length - 2);
            }
            foreach (Match m in regex.Matches(json_code))
            {
                mc.Add(m.Groups[2].Value, m.Groups[3].Value);
                //Response.Write(m.Groups[2].Value + "=" + m.Groups[3].Value + "<br/>"); 
            }
            return mc;
        }
        NameValueCollection ParseUrlParameters(string str_params)
        {
            NameValueCollection nc = new NameValueCollection();
            foreach (string p in str_params.Split('&'))
            {
                string[] p_s = p.Split('=');
                nc.Add(p_s[0], p_s[1]);
            }
            return nc;
        }
    }
}
