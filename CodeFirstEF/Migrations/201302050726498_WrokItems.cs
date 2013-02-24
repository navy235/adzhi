namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;

    public partial class WrokItems : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "WorkItems",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        JobName = c.String(maxLength: 64),
                        WorkerId = c.String(maxLength: 64),
                        Started = c.DateTime(nullable: false),
                        Completed = c.DateTime(),
                        ExceptionInfo = c.String(),
                    })
                .PrimaryKey(t => t.Id);

            Sql("ALTER TABLE WorkItems ADD CONSTRAINT DF_WorkItems_Started DEFAULT getutcdate() FOR Started");
            Sql("ALTER TABLE WorkItems ADD CONSTRAINT DF_WorkItems_Completed DEFAULT getutcdate() FOR Completed");
        }

        public override void Down()
        {
            DropTable("WorkItems");
        }
    }
}
