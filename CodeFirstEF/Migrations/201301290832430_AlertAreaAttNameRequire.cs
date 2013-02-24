namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;

    public partial class AlertAreaAttNameRequire : DbMigration
    {
        public override void Up()
        {
            AlterColumn("AreaAtt", "AttName", a => a.String(nullable: false, maxLength: 50));
        }

        public override void Down()
        {
            AlterColumn("AreaAtt", "AttName", a => a.String());
        }
    }
}
