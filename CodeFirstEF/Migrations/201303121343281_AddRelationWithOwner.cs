namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddRelationWithOwner : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Owner", "OwnerCode", "dbo.Category");
            DropIndex("dbo.Owner", new[] { "OwnerCode" });
            AddForeignKey("dbo.Owner", "OwnerCode", "dbo.Category", "CateCode");
            CreateIndex("dbo.Owner", "OwnerCode");
        }
        
        public override void Down()
        {
            DropIndex("dbo.Owner", new[] { "OwnerCode" });
            DropForeignKey("dbo.Owner", "OwnerCode", "dbo.Category");
            CreateIndex("dbo.Owner", "OwnerCode");
            AddForeignKey("dbo.Owner", "OwnerCode", "dbo.Category", "CateCode", cascadeDelete: true);
        }
    }
}
