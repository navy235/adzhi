namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AlertOutDoorMemberID : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.OutDoor", "MemberID", c => c.Int(nullable: false));
            DropColumn("dbo.OutDoor", "MeberID");
        }
        
        public override void Down()
        {
            AddColumn("dbo.OutDoor", "MeberID", c => c.Int(nullable: false));
            DropColumn("dbo.OutDoor", "MemberID");
        }
    }
}
