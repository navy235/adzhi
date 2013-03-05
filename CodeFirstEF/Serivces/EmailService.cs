using System;
using System.Web;
using CoreHelper.Mail;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;
namespace CodeFirstEF.Serivces
{
    public class EmailService : IEmailService
    {
        public bool SendMail(ViewModels.EmailModel model)
        {
            return MailHelper.SendMail(model.Email, model.Title, model.Content);
        }


        public EmailModel GetResetPasswordMail(int MemberID, string Email, string NickName, string userKey)
        {
            EmailModel em = new EmailModel();
            em.Email = Email;
            em.Title = NickName + " 您好！找回www.dotaeye.com的密码!";
            em.Content = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("~/Content/emailTemplate/getpwd.htm"), System.Text.Encoding.Default);
            em.Content = em.Content.Replace("{ukey}", userKey)
                .Replace("{nid}", NickName)
                .Replace("{uid}", MemberID.ToString())
                .Replace("{time}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
                .Replace("{email}", Email);
            return em;
        }
    }
}