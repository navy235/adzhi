namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddMembersAPI : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Member_Profile",
                c => new
                    {
                        MemberID = c.Int(nullable: false),
                        ID = c.Int(nullable: false, identity: true),
                        AvtarUrl = c.String(maxLength: 500),
                        Sex = c.Boolean(nullable: false),
                        Borthday = c.DateTime(nullable: false),
                        CityCode = c.String(nullable: false, maxLength: 20),
                        Description = c.String(maxLength: 150),
                    })
                .PrimaryKey(t => t.MemberID)
                .ForeignKey("dbo.Category", t => t.CityCode, cascadeDelete: true)
                .ForeignKey("dbo.Member", t => t.MemberID)
                .Index(t => t.CityCode)
                .Index(t => t.MemberID);
            
            CreateTable(
                "dbo.Member",
                c => new
                    {
                        MemberID = c.Int(nullable: false, identity: true),
                        Email = c.String(maxLength: 50),
                        NickName = c.String(maxLength: 50),
                        Password = c.String(maxLength: 50),
                        GroupID = c.Int(nullable: false),
                        LastTime = c.DateTime(nullable: false),
                        LastIP = c.String(maxLength: 50),
                        AddTime = c.DateTime(nullable: false),
                        AddIP = c.String(maxLength: 50),
                        LoginCount = c.Int(nullable: false),
                        Status = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.MemberID)
                .ForeignKey("dbo.Group", t => t.GroupID, cascadeDelete: true)
                .Index(t => t.GroupID);
            
            CreateTable(
                "dbo.Group",
                c => new
                    {
                        GroupID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 50),
                        Description = c.String(maxLength: 150),
                    })
                .PrimaryKey(t => t.GroupID);
            
            CreateTable(
                "dbo.Roles",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 50),
                        Description = c.String(maxLength: 150),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Permissions",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 50),
                        Description = c.String(maxLength: 150),
                        Controller = c.String(maxLength: 50),
                        Action = c.String(maxLength: 50),
                        Namespace = c.String(maxLength: 50),
                        DepartmentID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.Department", t => t.DepartmentID, cascadeDelete: true)
                .Index(t => t.DepartmentID);
            
            CreateTable(
                "dbo.Department",
                c => new
                    {
                        DepartmentID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 50),
                        Description = c.String(maxLength: 150),
                        Leader = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.DepartmentID);
            
            CreateTable(
                "dbo.Member_Action",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        ActionType = c.Int(nullable: false),
                        MemberID = c.Int(nullable: false),
                        Description = c.String(maxLength: 150),
                        AddTime = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.Member", t => t.MemberID, cascadeDelete: true)
                .Index(t => t.MemberID);
            
            CreateTable(
                "dbo.Role_Permissions",
                c => new
                    {
                        RoleID = c.Int(nullable: false),
                        PermissionID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.RoleID, t.PermissionID })
                .ForeignKey("dbo.Roles", t => t.RoleID, cascadeDelete: true)
                .ForeignKey("dbo.Permissions", t => t.PermissionID, cascadeDelete: true)
                .Index(t => t.RoleID)
                .Index(t => t.PermissionID);
            
            CreateTable(
                "dbo.Group_Roles",
                c => new
                    {
                        GroupID = c.Int(nullable: false),
                        RoleID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.GroupID, t.RoleID })
                .ForeignKey("dbo.Group", t => t.GroupID, cascadeDelete: true)
                .ForeignKey("dbo.Roles", t => t.RoleID, cascadeDelete: true)
                .Index(t => t.GroupID)
                .Index(t => t.RoleID);
            
        }
        
        public override void Down()
        {
            DropIndex("dbo.Group_Roles", new[] { "RoleID" });
            DropIndex("dbo.Group_Roles", new[] { "GroupID" });
            DropIndex("dbo.Role_Permissions", new[] { "PermissionID" });
            DropIndex("dbo.Role_Permissions", new[] { "RoleID" });
            DropIndex("dbo.Member_Action", new[] { "MemberID" });
            DropIndex("dbo.Permissions", new[] { "DepartmentID" });
            DropIndex("dbo.Member", new[] { "GroupID" });
            DropIndex("dbo.Member_Profile", new[] { "MemberID" });
            DropIndex("dbo.Member_Profile", new[] { "CityCode" });
            DropForeignKey("dbo.Group_Roles", "RoleID", "dbo.Roles");
            DropForeignKey("dbo.Group_Roles", "GroupID", "dbo.Group");
            DropForeignKey("dbo.Role_Permissions", "PermissionID", "dbo.Permissions");
            DropForeignKey("dbo.Role_Permissions", "RoleID", "dbo.Roles");
            DropForeignKey("dbo.Member_Action", "MemberID", "dbo.Member");
            DropForeignKey("dbo.Permissions", "DepartmentID", "dbo.Department");
            DropForeignKey("dbo.Member", "GroupID", "dbo.Group");
            DropForeignKey("dbo.Member_Profile", "MemberID", "dbo.Member");
            DropForeignKey("dbo.Member_Profile", "CityCode", "dbo.Category");
            DropTable("dbo.Group_Roles");
            DropTable("dbo.Role_Permissions");
            DropTable("dbo.Member_Action");
            DropTable("dbo.Department");
            DropTable("dbo.Permissions");
            DropTable("dbo.Roles");
            DropTable("dbo.Group");
            DropTable("dbo.Member");
            DropTable("dbo.Member_Profile");
        }
    }
}
