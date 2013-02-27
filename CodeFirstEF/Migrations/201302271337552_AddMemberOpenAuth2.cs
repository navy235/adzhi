namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddMemberOpenAuth2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Member", "OpenType", c => c.Int(nullable: false));
            AddColumn("dbo.Member", "OpenID", c => c.String(maxLength: 50));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Member", "OpenID");
            DropColumn("dbo.Member", "OpenType");
        }
    }
}
