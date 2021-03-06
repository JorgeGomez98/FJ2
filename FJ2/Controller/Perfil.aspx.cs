﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Perfil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null )
        {
            Response.Redirect("Login.aspx");

        }
        else
        {
            TB_Nickname.ReadOnly = true;
            TB_Nombre.ReadOnly = true;
            TB_Correo.ReadOnly = true;
            B_Guardar.Visible = false;
            B_Editar.Visible = true;
            FU_ImagenPerfil.Visible = false;

            if (!IsPostBack)
            {
                I_Perfil.ImageUrl = ((Usuario)Session["user"]).Imagen;
                TB_Nombre.Text = ((Usuario)Session["user"]).Nombre;
                TB_Nickname.Text = ((Usuario)Session["user"]).Nickname;
                TB_Correo.Text = ((Usuario)Session["user"]).Correo;
            }
        }
        /*TB_Nickname.ReadOnly = true;
        TB_Nombre.ReadOnly = true;
        TB_Correo.ReadOnly = true;
        B_Guardar.Visible = false;
        B_Editar.Visible = true;
        FU_ImagenPerfil.Visible = false;*/
        //I_Perfil.ImageUrl = ((Usuario)Session["user"]).Imagen;

        /*if (((Usuario)Session["user"]).Imagen == null)
        {
            L_Imagen.Text = "No tiene imagen guardada";
        }
        else
        {
            I_Perfil.ImageUrl = ((Usuario)Session["user"]).Imagen;
        }*/

        /*if (!IsPostBack)
        {
            I_Perfil.ImageUrl = ((Usuario)Session["user"]).Imagen;
            TB_Nombre.Text = ((Usuario)Session["user"]).Nombre;
            TB_Nickname.Text = ((Usuario)Session["user"]).Nickname;
            TB_Correo.Text = ((Usuario)Session["user"]).Correo;
        }*/
    }

    protected void B_Editar_Click(object sender, EventArgs e)
    {
        TB_Nickname.ReadOnly = false;
        TB_Nombre.ReadOnly = false;
        TB_Correo.ReadOnly = false;
        B_Guardar.Visible = true;
        B_Editar.Visible = false;
        FU_ImagenPerfil.Visible = true;
    }

    protected void B_Guardar_Click(object sender, EventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        
        string nombreArchivo = System.IO.Path.GetFileName(FU_ImagenPerfil.PostedFile.FileName);
        if (nombreArchivo.Equals(""))
        {
            Usuario usuario = new Usuario();
            usuario.Id_usuario = ((Usuario)Session["user"]).Id_usuario;
            usuario.Correo = TB_Correo.Text;
            usuario.Nickname = TB_Nickname.Text;
            usuario.Nombre = TB_Nombre.Text;

            //usuario.Precio = Double.Parse(TB_Precio.Text);

            new DAOUsuario().updateUsuario(usuario);
        }
        else
        {
            string extension = System.IO.Path.GetExtension(FU_ImagenPerfil.PostedFile.FileName);

            string saveLocation = Server.MapPath("~\\Imagenes\\ImagenesPerfil") + "\\" + nombreArchivo;


            if (!(extension.Equals(".jpg") || extension.Equals(".gif") || extension.Equals(".jpeg") || extension.Equals(".png")))
            {
                cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Tipo de archivo no valido');</script>");
                return;
            }

            if (System.IO.File.Exists(saveLocation))
            {
                cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Ya existe un archivo en el servidor con ese nombre');</script>");
                return;
            }

            try
            {
                FU_ImagenPerfil.PostedFile.SaveAs(saveLocation);
                cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El archivo ha sido cargado');</script>");

                Usuario usuario = new Usuario();
                usuario.Id_usuario = ((Usuario)Session["user"]).Id_usuario;
                usuario.Imagen = "~\\Imagenes\\ImagenesPerfil" + "\\" + nombreArchivo;
                usuario.Correo = TB_Correo.Text;
                usuario.Nickname = TB_Nickname.Text;
                usuario.Nombre = TB_Nombre.Text;

                //usuario.Precio = Double.Parse(TB_Precio.Text);

                new DAOUsuario().updateUsuario(usuario);
                I_Perfil.ImageUrl = usuario.Imagen;
            }
            catch (Exception ex)
            {
                cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Error: ');</script>");
                return;
            }
        }
        
    }
}