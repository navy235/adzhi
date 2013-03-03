namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddMember_Profile_Field : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Member_Profile", "RealName", c => c.String(maxLength: 20));
            AddColumn("dbo.Member_Profile", "Mobile", c => c.String(maxLength: 20));
            AddColumn("dbo.Member_Profile", "Phone", c => c.String(maxLength: 20));
            AddColumn("dbo.Member_Profile", "QQ", c => c.String(maxLength: 20));
            AddColumn("dbo.Member_Profile", "MSN", c => c.String(maxLength: 50));
            AddColumn("dbo.Member_Profile", "Address", c => c.String(maxLength: 50));
            AddColumn("dbo.Member_Profile", "Lat", c => c.Double(nullable: false));
            AddColumn("dbo.Member_Profile", "Lng", c => c.Double(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Member_Profile", "Lng");
            DropColumn("dbo.Member_Profile", "Lat");
            DropColumn("dbo.Member_Profile", "Address");
            DropColumn("dbo.Member_Profile", "MSN");
            DropColumn("dbo.Member_Profile", "QQ");
            DropColumn("dbo.Member_Profile", "Phone");
            DropColumn("dbo.Member_Profile", "Mobile");
            DropColumn("dbo.Member_Profile", "RealName");
        }
    }
}
