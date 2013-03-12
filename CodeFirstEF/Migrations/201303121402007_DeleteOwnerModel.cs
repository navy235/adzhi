namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DeleteOwnerModel : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Owner", "OwnerCode", "dbo.Category");
            DropForeignKey("dbo.Owner", "MediaID", "dbo.OutDoor");
            DropForeignKey("dbo.CredentialsImg", "OwnerID", "dbo.Owner");
            DropIndex("dbo.Owner", new[] { "OwnerCode" });
            DropIndex("dbo.Owner", new[] { "MediaID" });
            DropIndex("dbo.CredentialsImg", new[] { "OwnerID" });
            AddColumn("dbo.OutDoor", "OwnerCode", c => c.String(nullable: false, maxLength: 20));
            AddColumn("dbo.OutDoor", "Deadline", c => c.DateTime(nullable: false));
            AddColumn("dbo.CredentialsImg", "MediaID", c => c.Int(nullable: false));
            DropPrimaryKey("dbo.CredentialsImg", new[] { "OwnerID" });
            AddPrimaryKey("dbo.CredentialsImg", "MediaID");
            AddForeignKey("dbo.OutDoor", "OwnerCode", "dbo.Category", "CateCode");
            AddForeignKey("dbo.CredentialsImg", "MediaID", "dbo.OutDoor", "MediaID");
            CreateIndex("dbo.OutDoor", "OwnerCode");
            CreateIndex("dbo.CredentialsImg", "MediaID");
            DropColumn("dbo.CredentialsImg", "OwnerID");
            DropTable("dbo.Owner");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.Owner",
                c => new
                    {
                        MediaID = c.Int(nullable: false),
                        OwnerID = c.Int(nullable: false, identity: true),
                        OwnerCode = c.String(nullable: false, maxLength: 20),
                        Deadline = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.MediaID);
            
            AddColumn("dbo.CredentialsImg", "OwnerID", c => c.Int(nullable: false));
            DropIndex("dbo.CredentialsImg", new[] { "MediaID" });
            DropIndex("dbo.OutDoor", new[] { "OwnerCode" });
            DropForeignKey("dbo.CredentialsImg", "MediaID", "dbo.OutDoor");
            DropForeignKey("dbo.OutDoor", "OwnerCode", "dbo.Category");
            DropPrimaryKey("dbo.CredentialsImg", new[] { "MediaID" });
            AddPrimaryKey("dbo.CredentialsImg", "OwnerID");
            DropColumn("dbo.CredentialsImg", "MediaID");
            DropColumn("dbo.OutDoor", "Deadline");
            DropColumn("dbo.OutDoor", "OwnerCode");
            CreateIndex("dbo.CredentialsImg", "OwnerID");
            CreateIndex("dbo.Owner", "MediaID");
            CreateIndex("dbo.Owner", "OwnerCode");
            AddForeignKey("dbo.CredentialsImg", "OwnerID", "dbo.Owner", "MediaID");
            AddForeignKey("dbo.Owner", "MediaID", "dbo.OutDoor", "MediaID");
            AddForeignKey("dbo.Owner", "OwnerCode", "dbo.Category", "CateCode");
        }
    }
}
