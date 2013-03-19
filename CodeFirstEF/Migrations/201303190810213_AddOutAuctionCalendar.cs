namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddOutAuctionCalendar : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.AuctionCalendar",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        AddTime = c.DateTime(nullable: false),
                        EndTime = c.DateTime(nullable: false),
                        MediaID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.OutDoor", t => t.MediaID, cascadeDelete: true)
                .Index(t => t.MediaID);
            
        }
        
        public override void Down()
        {
            DropIndex("dbo.AuctionCalendar", new[] { "MediaID" });
            DropForeignKey("dbo.AuctionCalendar", "MediaID", "dbo.OutDoor");
            DropTable("dbo.AuctionCalendar");
        }
    }
}
