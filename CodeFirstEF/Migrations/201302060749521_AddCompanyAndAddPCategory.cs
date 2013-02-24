namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddCompanyAndAddPCategory : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Company", "CompanyScale_CateCode", "dbo.Category");
            DropForeignKey("dbo.Company", "CompanyFund_CateCode", "dbo.Category");
            DropForeignKey("dbo.Company", "CompanyBussiness_CateCode", "dbo.Category");
            DropIndex("dbo.Company", new[] { "CompanyScale_CateCode" });
            DropIndex("dbo.Company", new[] { "CompanyFund_CateCode" });
            DropIndex("dbo.Company", new[] { "CompanyBussiness_CateCode" });
            RenameColumn(table: "dbo.Company", name: "Area_CateCode", newName: "CityCode");
            AlterColumn("dbo.Company", "CityCode", c => c.String(nullable: false, maxLength: 20));
            AlterColumn("dbo.Company", "ScaleCode", c => c.String(nullable: false, maxLength: 20));
            AlterColumn("dbo.Company", "FundCode", c => c.String(nullable: false, maxLength: 20));
            AlterColumn("dbo.Company", "BussinessCode", c => c.String(nullable: false, maxLength: 20));
            AddForeignKey("dbo.Company", "ScaleCode", "dbo.Category", "CateCode");
            AddForeignKey("dbo.Company", "FundCode", "dbo.Category", "CateCode");
            AddForeignKey("dbo.Company", "BussinessCode", "dbo.Category", "CateCode");
            CreateIndex("dbo.Company", "ScaleCode");
            CreateIndex("dbo.Company", "FundCode");
            CreateIndex("dbo.Company", "BussinessCode");
            DropColumn("dbo.Company", "CompanyScale_CateCode");
            DropColumn("dbo.Company", "CompanyFund_CateCode");
            DropColumn("dbo.Company", "CompanyBussiness_CateCode");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Company", "CompanyBussiness_CateCode", c => c.String(maxLength: 20));
            AddColumn("dbo.Company", "CompanyFund_CateCode", c => c.String(maxLength: 20));
            AddColumn("dbo.Company", "CompanyScale_CateCode", c => c.String(maxLength: 20));
            DropIndex("dbo.Company", new[] { "BussinessCode" });
            DropIndex("dbo.Company", new[] { "FundCode" });
            DropIndex("dbo.Company", new[] { "ScaleCode" });
            DropForeignKey("dbo.Company", "BussinessCode", "dbo.Category");
            DropForeignKey("dbo.Company", "FundCode", "dbo.Category");
            DropForeignKey("dbo.Company", "ScaleCode", "dbo.Category");
            AlterColumn("dbo.Company", "BussinessCode", c => c.String(maxLength: 20));
            AlterColumn("dbo.Company", "FundCode", c => c.String(maxLength: 20));
            AlterColumn("dbo.Company", "ScaleCode", c => c.String(maxLength: 20));
            AlterColumn("dbo.Company", "CityCode", c => c.String(maxLength: 20));
            RenameColumn(table: "dbo.Company", name: "CityCode", newName: "Area_CateCode");
            CreateIndex("dbo.Company", "CompanyBussiness_CateCode");
            CreateIndex("dbo.Company", "CompanyFund_CateCode");
            CreateIndex("dbo.Company", "CompanyScale_CateCode");
            AddForeignKey("dbo.Company", "CompanyBussiness_CateCode", "dbo.Category", "CateCode");
            AddForeignKey("dbo.Company", "CompanyFund_CateCode", "dbo.Category", "CateCode");
            AddForeignKey("dbo.Company", "CompanyScale_CateCode", "dbo.Category", "CateCode");
        }
    }
}
