﻿

using System.Data.Entity;
/// <summary>
/// Descripción breve de Mapeo
/// </summary>
public class Mapeo : DbContext
{
    static Mapeo()
    {
        Database.SetInitializer<Mapeo>(null);
    }

    public Mapeo() : base("name=bd_inicial")
    {

    }

    public DbSet<Usuario> user { get; set; }
    public DbSet<Rol> rol { get; set; }
    public DbSet<Videojuego> videojuego { get; set; }
    public DbSet<EstadoVideojuego> estado { get; set; }
    public DbSet<Biblioteca> lib { get; set; }
    public DbSet<Categorias> cat { get; set; }
    public DbSet<Pedido> ped { get; set; }
    public DbSet<DetallePedido> detPed { get; set; }
    public DbSet<Denuncias> Denuncias { get; set; }
    public DbSet<EstadoDenuncia> estadoDenuncias { get; set; }
    public DbSet<Comentario> comentario { get; set; }
    public DbSet<token> token { get; set; }

    public DbSet<Plataforma> plat { get; set; }




    protected override void OnModelCreating(DbModelBuilder builder)
    {
        builder.HasDefaultSchema("public");

        base.OnModelCreating(builder);
    }
}