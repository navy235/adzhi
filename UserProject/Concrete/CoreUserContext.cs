using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using CoreHelper.Data.Interface;
using CoreHelper.Data.Infrastructure;
using UserProject.Models;

namespace UserProject.Concrete
{
    public class CoreUserContext : BaseEfUnitOfWork, IUnitOfWork
    {
        public CoreUserContext()
            : base("CoreUser")
        {

        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {


            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            modelBuilder.Entity<Member>().HasOptional(m => m.Member_Profile).WithRequired(x => x.Member);

            modelBuilder.Entity<Department>().HasMany(b => b.Permissions);
            //多对多关系
            modelBuilder.Entity<Roles>()
                .HasMany(b => b.Permissions)
                .WithMany(c => c.Roles)
                .Map
                (
                    m =>
                    {
                        m.MapLeftKey("RoleID");
                        m.MapRightKey("PermissionID");
                        m.ToTable("Role_Permissions");
                    }
                );

            modelBuilder.Entity<Group>()
            .HasMany(g => g.Roles)
            .WithMany(r => r.Group)
            .Map
            (
                m =>
                {
                    m.MapLeftKey("GroupID");
                    m.MapRightKey("RoleID");
                    m.ToTable("Group_Roles");
                }
            );

            base.OnModelCreating(modelBuilder);
        }
    }
}