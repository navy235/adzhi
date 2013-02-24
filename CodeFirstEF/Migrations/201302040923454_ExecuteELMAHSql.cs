namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    using System.IO;

    public partial class ExecuteELMAHSql : DbMigration
    {
        private static readonly string[] Go = new[] { "GO" };

        public override void Up()
        {
            using (Stream stream = typeof(ExecuteELMAHSql).Assembly.GetManifestResourceStream("CodeFirstEF.App_Data.Elmah.SqlServer.sql"))
            {
                using (var streamReader = new StreamReader(stream))
                {
                    var statements = streamReader.ReadToEnd().Split(Go, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var statement in statements)
                    {
                        if (String.IsNullOrWhiteSpace(statement))
                        {
                            continue;
                        }

                        Sql(statement);
                    }
                }
            }
        }

        public override void Down()
        {
        }
    }
}
