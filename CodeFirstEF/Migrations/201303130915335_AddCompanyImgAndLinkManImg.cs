namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddCompanyImgAndLinkManImg : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CompanyImg",
                c => new
                    {
                        CompanyID = c.Int(nullable: false),
                        ID = c.Int(nullable: false, identity: true),
                        MemberID = c.Int(nullable: false),
                        ImgUrls = c.String(nullable: false, maxLength: 2000),
                        FocusImgUrl = c.String(maxLength: 200),
                    })
                .PrimaryKey(t => t.CompanyID)
                .ForeignKey("dbo.Company", t => t.CompanyID)
                .Index(t => t.CompanyID);
            
            CreateTable(
                "dbo.LinkManImg",
                c => new
                    {
                        CompanyID = c.Int(nullable: false),
                        ID = c.Int(nullable: false, identity: true),
                        MemberID = c.Int(nullable: false),
                        ImgUrls = c.String(nullable: false, maxLength: 2000),
                        FocusImgUrl = c.String(maxLength: 200),
                    })
                .PrimaryKey(t => t.CompanyID)
                .ForeignKey("dbo.Company", t => t.CompanyID)
                .Index(t => t.CompanyID);
            
        }
        
        public override void Down()
        {
            DropIndex("dbo.LinkManImg", new[] { "CompanyID" });
            DropIndex("dbo.CompanyImg", new[] { "CompanyID" });
            DropForeignKey("dbo.LinkManImg", "CompanyID", "dbo.Company");
            DropForeignKey("dbo.CompanyImg", "CompanyID", "dbo.Company");
            DropTable("dbo.LinkManImg");
            DropTable("dbo.CompanyImg");
        }
    }
}
