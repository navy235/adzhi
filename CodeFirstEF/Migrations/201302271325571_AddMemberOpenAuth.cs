namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;

    public partial class AddMemberOpenAuth : DbMigration
    {
        public override void Up()
        {
            AddColumn("Member", "OpenType", a => a.Int(nullable: false, defaultValue: 0));
            AddColumn("Member", "OpenID", a => a.String(nullable: true, maxLength: 50));
        }

        public override void Down()
        {
            DropColumn("Member", "OpenType");
            DropColumn("Member", "OpenID");
        }
    }
}
