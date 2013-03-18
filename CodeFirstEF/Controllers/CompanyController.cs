using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Specialized;
using CoreHelper.Checking;
using CoreHelper.Cookie;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using CoreHelper.Enum;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Filters;
using CodeFirstEF.Serivces;
using CodeFirstEF.Config;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

namespace CodeFirstEF.Controllers
{
    [BaseAuthorize]
    public class CompanyController : Controller
    {


        private IMemberService memberService;
        private IEmailService emailService;
        private IMember_ActionService member_ActionService;
        private ICompanyService companyService;
        private IAreaAttService areaAttService;
        private IOutDoorService outDoorService;
        public CompanyController(
              IMemberService _memberService
            , IEmailService _emailService
            , IMember_ActionService _member_ActionService
            , ICompanyService _companyService
            , IAreaAttService _areaAttService
            , IOutDoorService _outDoorService)
        {

            memberService = _memberService;
            emailService = _emailService;
            member_ActionService = _member_ActionService;
            companyService = _companyService;
            areaAttService = _areaAttService;
            outDoorService = _outDoorService;
        }


        public ActionResult Index()
        {

            int MemberID = Convert.ToInt32(CookieHelper.UID);
            var UserStatus = Convert.ToInt32(CookieHelper.Status);
            ViewBag.UserStatus = UserStatus;
            ViewBag.MenuItem = "company";

            if (UserStatus < (int)CoreHelper.Enum.MemberStatus.EmailActived)
            {
                return View(new CompanyReg());
            }
            else if (UserStatus == (int)CoreHelper.Enum.MemberStatus.EmailActived)
            {
                return View(new CompanyReg());
            }
            else if (UserStatus == (int)CoreHelper.Enum.MemberStatus.CompanyApply || UserStatus == (int)CoreHelper.Enum.MemberStatus.CompanyAuth)
            {
                Company cpy = companyService.Find(MemberID);
                CompanyReg cpr = new CompanyReg()
                {
                    Address = cpy.Address,
                    BussinessCode = cpy.BussinessCode,
                    CityCode = cpy.CityCode,
                    CompanyImg = cpy.CompanyImg.ImgUrls,
                    Description = cpy.Description,
                    Fax = cpy.Fax,
                    FundCode = cpy.FundCode,
                    LinkMan = cpy.LinkMan,
                    LinManImg = cpy.LinkManImg.ImgUrls,
                    Mobile = cpy.Mobile,
                    MSN = cpy.MSN,
                    Name = cpy.Name,
                    Phone = cpy.Phone,
                    Position = cpy.Lat + "|" + cpy.Lng,
                    QQ = cpy.QQ,
                    ScaleCode = cpy.ScaleCode,
                    Sex = cpy.Sex

                };
                return View(cpr);
            }
            else
            {
                return View(new CompanyReg());
            }

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(CompanyReg model)
        {
            ViewBag.MenuItem = "company";
            if (ModelState.IsValid)
            {
                try
                {
                    var memberID = Convert.ToInt32(CookieHelper.UID);

                    companyService.Create(model);

                    if (member_ActionService.HasAction(MemberActionType.CompanyApply))
                    {
                        member_ActionService.Create(MemberActionType.CompanyReApply);
                    }
                    else
                    {
                        member_ActionService.Create(MemberActionType.CompanyApply);
                    }
                    memberService.SaveMemberStatus(memberID, MemberStatus.CompanyApply);
                    return RedirectToAction("index");
                }
                catch (DbEntityValidationException ex)
                {
                    ViewBag.Error = ex.Message;
                    return View(model);
                }
            }
            else
            {
                return View(model);
            }


        }



    }
}
