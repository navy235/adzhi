namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddMember_Action_IP_Field : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Member_Action", "IP", c => c.String(maxLength: 50));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Member_Action", "IP");
        }
    }
}
