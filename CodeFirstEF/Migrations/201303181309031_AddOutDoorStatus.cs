namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddOutDoorStatus : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.OutDoor", "Status", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.OutDoor", "Status");
        }
    }
}
