namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddCompany_PCategory : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Company",
                c => new
                    {
                        MemberID = c.Int(nullable: false),
                        CompanyID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 50),
                        LinkMan = c.String(maxLength: 50),
                        Sex = c.Boolean(nullable: false),
                        Address = c.String(maxLength: 150),
                        Phone = c.String(maxLength: 50),
                        Mobile = c.String(maxLength: 50),
                        Fax = c.String(maxLength: 50),
                        QQ = c.String(maxLength: 50),
                        MSN = c.String(maxLength: 50),
                        Lat = c.Double(nullable: false),
                        Lng = c.Double(nullable: false),
                        CityCode = c.String(nullable: false, maxLength: 20),
                        ScaleCode = c.String(nullable: false, maxLength: 20),
                        FundCode = c.String(nullable: false, maxLength: 20),
                        BussinessCode = c.String(nullable: false, maxLength: 20),
                        LastTime = c.DateTime(nullable: false),
                        LastIP = c.String(maxLength: 50),
                        AddTime = c.DateTime(nullable: false),
                        AddIP = c.String(maxLength: 50),
                        Unapprovedlog = c.String(maxLength: 500),
                        Status = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.MemberID)
                .ForeignKey("dbo.Member", t => t.MemberID)
                .ForeignKey("dbo.Category", t => t.CityCode)
                .ForeignKey("dbo.Category", t => t.ScaleCode)
                .ForeignKey("dbo.Category", t => t.FundCode)
                .ForeignKey("dbo.Category", t => t.BussinessCode)
                .Index(t => t.MemberID)
                .Index(t => t.CityCode)
                .Index(t => t.ScaleCode)
                .Index(t => t.FundCode)
                .Index(t => t.BussinessCode);
            
            AddColumn("dbo.Member", "CompanyID", c => c.Int());
            AddForeignKey("dbo.Category", "PCateCode", "dbo.Category", "CateCode");
            AddForeignKey("dbo.Member", "CompanyID", "dbo.Company", "MemberID");
            CreateIndex("dbo.Category", "PCateCode");
            CreateIndex("dbo.Member", "CompanyID");
        }
        
        public override void Down()
        {
            DropIndex("dbo.Company", new[] { "BussinessCode" });
            DropIndex("dbo.Company", new[] { "FundCode" });
            DropIndex("dbo.Company", new[] { "ScaleCode" });
            DropIndex("dbo.Company", new[] { "CityCode" });
            DropIndex("dbo.Company", new[] { "MemberID" });
            DropIndex("dbo.Member", new[] { "CompanyID" });
            DropIndex("dbo.Category", new[] { "PCateCode" });
            DropForeignKey("dbo.Company", "BussinessCode", "dbo.Category");
            DropForeignKey("dbo.Company", "FundCode", "dbo.Category");
            DropForeignKey("dbo.Company", "ScaleCode", "dbo.Category");
            DropForeignKey("dbo.Company", "CityCode", "dbo.Category");
            DropForeignKey("dbo.Company", "MemberID", "dbo.Member");
            DropForeignKey("dbo.Member", "CompanyID", "dbo.Company");
            DropForeignKey("dbo.Category", "PCateCode", "dbo.Category");
            DropColumn("dbo.Member", "CompanyID");
            DropTable("dbo.Company");
        }
    }
}
