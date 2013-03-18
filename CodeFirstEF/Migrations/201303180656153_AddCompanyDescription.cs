namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddCompanyDescription : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Company", "Description", c => c.String(maxLength: 500));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Company", "Description");
        }
    }
}
