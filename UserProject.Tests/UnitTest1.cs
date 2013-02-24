using System;
using System.Linq;
using System.Web.Mvc;
using CoreHelper.Checking;
using CoreHelper.Http;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using CoreHelper.Data.Interface;
using CoreHelper.Data.Infrastructure;
using UserProject.Concrete;
using UserProject.Models;
using System.Data.Entity;
namespace UserProject.Tests
{
    [TestClass]
    public class UnitTest1
    {
        private IUnitOfWork _IUnitOfWork;

        public UnitTest1()
        {
            _IUnitOfWork = new CoreUserContext();
        }

        [TestMethod]
        public void TestMethod1()
        {
        }
    }
}
