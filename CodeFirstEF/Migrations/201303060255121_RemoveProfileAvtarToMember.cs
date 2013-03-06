namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RemoveProfileAvtarToMember : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Member", "AvtarUrl", c => c.String(maxLength: 500));
            DropColumn("dbo.Member_Profile", "AvtarUrl");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Member_Profile", "AvtarUrl", c => c.String(maxLength: 500));
            DropColumn("dbo.Member", "AvtarUrl");
        }
    }
}
