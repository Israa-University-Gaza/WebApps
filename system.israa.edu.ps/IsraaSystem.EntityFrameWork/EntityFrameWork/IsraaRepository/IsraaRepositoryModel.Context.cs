﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class IsraaRepositoryEntities : DbContext
    {
        public IsraaRepositoryEntities()
            : base("name=IsraaRepositoryEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CustodyDetails> CustodyDetails { get; set; }
        public virtual DbSet<CustodyType> CustodyType { get; set; }
        public virtual DbSet<Material> Material { get; set; }
        public virtual DbSet<MaterialType> MaterialType { get; set; }
        public virtual DbSet<MaterialUnit> MaterialUnit { get; set; }
        public virtual DbSet<RepositoryBalance> RepositoryBalance { get; set; }
        public virtual DbSet<RepositoryCustody> RepositoryCustody { get; set; }
        public virtual DbSet<RepositoryDepartment> RepositoryDepartment { get; set; }
        public virtual DbSet<RequestStatus> RequestStatus { get; set; }
        public virtual DbSet<Supplier> Supplier { get; set; }
        public virtual DbSet<Transaction> Transaction { get; set; }
        public virtual DbSet<TransactionDetails> TransactionDetails { get; set; }
        public virtual DbSet<TransactionType> TransactionType { get; set; }
    }
}
