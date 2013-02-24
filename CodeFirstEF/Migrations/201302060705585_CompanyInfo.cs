namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CompanyInfo : DbMigration
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
                        CityCode = c.String(maxLength: 20),
                        ScaleCode = c.String(maxLength: 20),
                        FundCode = c.String(maxLength: 20),
                        BussinessCode = c.String(maxLength: 20),
                        LastTime = c.DateTime(nullable: false),
                        LastIP = c.String(maxLength: 50),
                        AddTime = c.DateTime(nullable: false),
                        AddIP = c.String(maxLength: 50),
                        Unapprovedlog = c.String(maxLength: 500),
                        Status = c.Int(nullable: false),
                        Area_CateCode = c.String(maxLength: 20),
                        CompanyScale_CateCode = c.String(maxLength: 20),
                        CompanyFund_CateCode = c.String(maxLength: 20),
                        CompanyBussiness_CateCode = c.String(maxLength: 20),
                    })
                .PrimaryKey(t => t.MemberID)
                .ForeignKey("dbo.Member", t => t.MemberID)
                .ForeignKey("dbo.Category", t => t.Area_CateCode)
                .ForeignKey("dbo.Category", t => t.CompanyScale_CateCode)
                .ForeignKey("dbo.Category", t => t.CompanyFund_CateCode)
                .ForeignKey("dbo.Category", t => t.CompanyBussiness_CateCode)
                .Index(t => t.MemberID)
                .Index(t => t.Area_CateCode)
                .Index(t => t.CompanyScale_CateCode)
                .Index(t => t.CompanyFund_CateCode)
                .Index(t => t.CompanyBussiness_CateCode);
            
            AddColumn("dbo.Member", "CompanyID", c => c.Int());
            AddForeignKey("dbo.Category", "PCateCode", "dbo.Category", "CateCode");
            AddForeignKey("dbo.Member", "CompanyID", "dbo.Company", "MemberID");
            CreateIndex("dbo.Category", "PCateCode");
            CreateIndex("dbo.Member", "CompanyID");
        }
        
        public override void Down()
        {
            DropIndex("dbo.Company", new[] { "CompanyBussiness_CateCode" });
            DropIndex("dbo.Company", new[] { "CompanyFund_CateCode" });
            DropIndex("dbo.Company", new[] { "CompanyScale_CateCode" });
            DropIndex("dbo.Company", new[] { "Area_CateCode" });
            DropIndex("dbo.Company", new[] { "MemberID" });
            DropIndex("dbo.Member", new[] { "CompanyID" });
            DropIndex("dbo.Category", new[] { "PCateCode" });
            DropForeignKey("dbo.Company", "CompanyBussiness_CateCode", "dbo.Category");
            DropForeignKey("dbo.Company", "CompanyFund_CateCode", "dbo.Category");
            DropForeignKey("dbo.Company", "CompanyScale_CateCode", "dbo.Category");
            DropForeignKey("dbo.Company", "Area_CateCode", "dbo.Category");
            DropForeignKey("dbo.Company", "MemberID", "dbo.Member");
            DropForeignKey("dbo.Member", "CompanyID", "dbo.Company");
            DropForeignKey("dbo.Category", "PCateCode", "dbo.Category");
            DropColumn("dbo.Member", "CompanyID");
            DropTable("dbo.Company");
        }
    }
}
