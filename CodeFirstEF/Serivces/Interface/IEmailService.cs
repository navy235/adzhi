using System;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;
namespace CodeFirstEF.Serivces
{
    public interface IEmailService
    {
        bool SendMail(EmailModel model);

        EmailModel GetResetPasswordMail(int MemberID, string Email, string NickName, string userKey);

        EmailModel GetActiveEmailMail(int MemberID, string Email, string NickName, string emailKey);
    }
}