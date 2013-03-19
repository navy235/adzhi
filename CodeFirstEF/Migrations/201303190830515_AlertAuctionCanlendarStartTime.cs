namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AlertAuctionCanlendarStartTime : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AuctionCalendar", "StartTime", c => c.DateTime(nullable: false));
            DropColumn("dbo.AuctionCalendar", "AddTime");
        }
        
        public override void Down()
        {
            AddColumn("dbo.AuctionCalendar", "AddTime", c => c.DateTime(nullable: false));
            DropColumn("dbo.AuctionCalendar", "StartTime");
        }
    }
}
