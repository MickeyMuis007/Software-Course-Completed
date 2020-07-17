﻿// <auto-generated />
using System;
using ConfArch.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ConfArch.Data.Migrations
{
    [DbContext(typeof(ConfArchDbContext))]
    [Migration("20191220114004_Initial")]
    partial class Initial
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.0")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("ConfArch.Data.EntityFramework.Entities.Attendee", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("ConferenceId")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(250)")
                        .HasMaxLength(250);

                    b.HasKey("Id");

                    b.HasIndex("ConferenceId");

                    b.ToTable("Attendees");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            ConferenceId = 1,
                            Name = "Lisa Overthere"
                        },
                        new
                        {
                            Id = 2,
                            ConferenceId = 1,
                            Name = "Robin Eisenberg"
                        },
                        new
                        {
                            Id = 3,
                            ConferenceId = 2,
                            Name = "Sue Mashmellow"
                        });
                });

            modelBuilder.Entity("ConfArch.Data.EntityFramework.Entities.Conference", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Location")
                        .HasColumnType("nvarchar(250)")
                        .HasMaxLength(250);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(250)")
                        .HasMaxLength(250);

                    b.Property<DateTime>("Start")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.ToTable("Conferences");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Location = "Salt Lake City",
                            Name = "Pluralsight Live",
                            Start = new DateTime(2019, 10, 12, 0, 0, 0, 0, DateTimeKind.Unspecified)
                        },
                        new
                        {
                            Id = 2,
                            Location = "London",
                            Name = "Pluralsight Live",
                            Start = new DateTime(2019, 3, 18, 0, 0, 0, 0, DateTimeKind.Unspecified)
                        });
                });

            modelBuilder.Entity("ConfArch.Data.EntityFramework.Entities.Proposal", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<bool>("Approved")
                        .HasColumnType("bit");

                    b.Property<int>("ConferenceId")
                        .HasColumnType("int");

                    b.Property<string>("Speaker")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Title")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("ConferenceId");

                    b.ToTable("Proposals");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Approved = false,
                            ConferenceId = 1,
                            Speaker = "Roland Guijt",
                            Title = "Authentication and Authorization in ASP.NET Core"
                        },
                        new
                        {
                            Id = 2,
                            Approved = false,
                            ConferenceId = 2,
                            Speaker = "Cindy Reynolds",
                            Title = "Starting Your Developer Career"
                        },
                        new
                        {
                            Id = 3,
                            Approved = false,
                            ConferenceId = 2,
                            Speaker = "Heather Lipens",
                            Title = "ASP.NET Core TagHelpers"
                        });
                });

            modelBuilder.Entity("ConfArch.Data.EntityFramework.Entities.Attendee", b =>
                {
                    b.HasOne("ConfArch.Data.EntityFramework.Entities.Conference", "Conference")
                        .WithMany()
                        .HasForeignKey("ConferenceId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("ConfArch.Data.EntityFramework.Entities.Proposal", b =>
                {
                    b.HasOne("ConfArch.Data.EntityFramework.Entities.Conference", "Conference")
                        .WithMany()
                        .HasForeignKey("ConferenceId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
