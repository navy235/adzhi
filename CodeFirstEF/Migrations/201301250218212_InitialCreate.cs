namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Category",
                c => new
                    {
                        CateCode = c.String(nullable: false, maxLength: 20),
                        ID = c.Int(nullable: false, identity: true),
                        CateName = c.String(nullable: false, maxLength: 50),
                        Length = c.Int(nullable: false),
                        PCateCode = c.String(maxLength: 20),
                        OrderIndex = c.Int(nullable: false),
                        CategoryType = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => t.CateCode);
            
            CreateTable(
                "dbo.OutDoor",
                c => new
                    {
                        MediaID = c.Int(nullable: false, identity: true),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                        PriceExten = c.String(maxLength: 100),
                        Location = c.String(nullable: false, maxLength: 100),
                        Lng = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Lat = c.Decimal(nullable: false, precision: 18, scale: 2),
                        HasLight = c.Boolean(nullable: false),
                        LightStrat = c.String(maxLength: 50),
                        LightEnd = c.String(maxLength: 50),
                        Wdith = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Height = c.Decimal(nullable: false, precision: 18, scale: 2),
                        TotalFaces = c.Int(nullable: false),
                        TrafficAuto = c.Int(nullable: false),
                        TrafficPerson = c.Int(nullable: false),
                        CityCode = c.String(nullable: false, maxLength: 20),
                        FormatCode = c.String(nullable: false, maxLength: 20),
                        MeidaCode = c.String(nullable: false, maxLength: 20),
                        PeriodCode = c.String(nullable: false, maxLength: 20),
                        Name = c.String(nullable: false, maxLength: 50),
                        Description = c.String(nullable: false, maxLength: 2500),
                        Integrity = c.Int(nullable: false),
                        Hit = c.Int(nullable: false),
                        AddTime = c.DateTime(nullable: false),
                        LastTime = c.DateTime(nullable: false),
                        Favorite = c.Int(nullable: false),
                        Message = c.Int(nullable: false),
                        MeberID = c.Int(nullable: false),
                        AddIP = c.String(maxLength: 50),
                        AdminUser = c.Int(nullable: false),
                        LastIP = c.String(maxLength: 50),
                        Unapprovedlog = c.String(maxLength: 500),
                        SeoTitle = c.String(maxLength: 100),
                        SeoDes = c.String(maxLength: 250),
                        Seokeywords = c.String(maxLength: 100),
                    })
                .PrimaryKey(t => t.MediaID)
                .ForeignKey("dbo.Category", t => t.CityCode)
                .ForeignKey("dbo.Category", t => t.MeidaCode)
                .ForeignKey("dbo.Category", t => t.PeriodCode)
                .ForeignKey("dbo.Category", t => t.FormatCode)
                .Index(t => t.CityCode)
                .Index(t => t.MeidaCode)
                .Index(t => t.PeriodCode)
                .Index(t => t.FormatCode);
            
            CreateTable(
                "dbo.Owner",
                c => new
                    {
                        MediaID = c.Int(nullable: false),
                        OwnerID = c.Int(nullable: false, identity: true),
                        OwnerCode = c.String(nullable: false, maxLength: 20),
                        Deadline = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.MediaID)
                .ForeignKey("dbo.Category", t => t.OwnerCode, cascadeDelete: true)
                .ForeignKey("dbo.OutDoor", t => t.MediaID)
                .Index(t => t.OwnerCode)
                .Index(t => t.MediaID);
            
            CreateTable(
                "dbo.CredentialsImg",
                c => new
                    {
                        OwnerID = c.Int(nullable: false),
                        ID = c.Int(nullable: false, identity: true),
                        MemberID = c.Int(nullable: false),
                        ImgUrls = c.String(nullable: false, maxLength: 2000),
                        FocusImgUrl = c.String(maxLength: 200),
                    })
                .PrimaryKey(t => t.OwnerID)
                .ForeignKey("dbo.Owner", t => t.OwnerID)
                .Index(t => t.OwnerID);
            
            CreateTable(
                "dbo.AreaAtt",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        AttName = c.String(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.TopBase",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        MediaID = c.Int(nullable: false),
                        TopStart = c.DateTime(nullable: false),
                        TopEnd = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.OutDoor", t => t.MediaID, cascadeDelete: true)
                .Index(t => t.MediaID);
            
            CreateTable(
                "dbo.SaleBase",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        MediaID = c.Int(nullable: false),
                        SaleStart = c.DateTime(nullable: false),
                        SaleEnd = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.OutDoor", t => t.MediaID, cascadeDelete: true)
                .Index(t => t.MediaID);
            
            CreateTable(
                "dbo.MapImg",
                c => new
                    {
                        MediaID = c.Int(nullable: false),
                        ID = c.Int(nullable: false, identity: true),
                        MemberID = c.Int(nullable: false),
                        ImgUrls = c.String(nullable: false, maxLength: 2000),
                        FocusImgUrl = c.String(maxLength: 200),
                    })
                .PrimaryKey(t => t.MediaID)
                .ForeignKey("dbo.OutDoor", t => t.MediaID)
                .Index(t => t.MediaID);
            
            CreateTable(
                "dbo.MediaImg",
                c => new
                    {
                        MediaID = c.Int(nullable: false),
                        ID = c.Int(nullable: false, identity: true),
                        MemberID = c.Int(nullable: false),
                        ImgUrls = c.String(nullable: false, maxLength: 2000),
                        FocusImgUrl = c.String(maxLength: 200),
                    })
                .PrimaryKey(t => t.MediaID)
                .ForeignKey("dbo.OutDoor", t => t.MediaID)
                .Index(t => t.MediaID);
            
            CreateTable(
                "dbo.OutDoor_AreaAtt",
                c => new
                    {
                        OutDoorID = c.Int(nullable: false),
                        AreaAttID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.OutDoorID, t.AreaAttID })
                .ForeignKey("dbo.OutDoor", t => t.OutDoorID, cascadeDelete: true)
                .ForeignKey("dbo.AreaAtt", t => t.AreaAttID, cascadeDelete: true)
                .Index(t => t.OutDoorID)
                .Index(t => t.AreaAttID);
            
        }
        
        public override void Down()
        {
            DropIndex("dbo.OutDoor_AreaAtt", new[] { "AreaAttID" });
            DropIndex("dbo.OutDoor_AreaAtt", new[] { "OutDoorID" });
            DropIndex("dbo.MediaImg", new[] { "MediaID" });
            DropIndex("dbo.MapImg", new[] { "MediaID" });
            DropIndex("dbo.SaleBase", new[] { "MediaID" });
            DropIndex("dbo.TopBase", new[] { "MediaID" });
            DropIndex("dbo.CredentialsImg", new[] { "OwnerID" });
            DropIndex("dbo.Owner", new[] { "MediaID" });
            DropIndex("dbo.Owner", new[] { "OwnerCode" });
            DropIndex("dbo.OutDoor", new[] { "FormatCode" });
            DropIndex("dbo.OutDoor", new[] { "PeriodCode" });
            DropIndex("dbo.OutDoor", new[] { "MeidaCode" });
            DropIndex("dbo.OutDoor", new[] { "CityCode" });
            DropForeignKey("dbo.OutDoor_AreaAtt", "AreaAttID", "dbo.AreaAtt");
            DropForeignKey("dbo.OutDoor_AreaAtt", "OutDoorID", "dbo.OutDoor");
            DropForeignKey("dbo.MediaImg", "MediaID", "dbo.OutDoor");
            DropForeignKey("dbo.MapImg", "MediaID", "dbo.OutDoor");
            DropForeignKey("dbo.SaleBase", "MediaID", "dbo.OutDoor");
            DropForeignKey("dbo.TopBase", "MediaID", "dbo.OutDoor");
            DropForeignKey("dbo.CredentialsImg", "OwnerID", "dbo.Owner");
            DropForeignKey("dbo.Owner", "MediaID", "dbo.OutDoor");
            DropForeignKey("dbo.Owner", "OwnerCode", "dbo.Category");
            DropForeignKey("dbo.OutDoor", "FormatCode", "dbo.Category");
            DropForeignKey("dbo.OutDoor", "PeriodCode", "dbo.Category");
            DropForeignKey("dbo.OutDoor", "MeidaCode", "dbo.Category");
            DropForeignKey("dbo.OutDoor", "CityCode", "dbo.Category");
            DropTable("dbo.OutDoor_AreaAtt");
            DropTable("dbo.MediaImg");
            DropTable("dbo.MapImg");
            DropTable("dbo.SaleBase");
            DropTable("dbo.TopBase");
            DropTable("dbo.AreaAtt");
            DropTable("dbo.CredentialsImg");
            DropTable("dbo.Owner");
            DropTable("dbo.OutDoor");
            DropTable("dbo.Category");
        }
    }
}
