PGDMP          6                y            proyecto_fj2    12.4    12.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    35279    proyecto_fj2    DATABASE     �   CREATE DATABASE proyecto_fj2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE proyecto_fj2;
                postgres    false            	            2615    35280 
   financiero    SCHEMA        CREATE SCHEMA financiero;
    DROP SCHEMA financiero;
                postgres    false            �           0    0    SCHEMA financiero    COMMENT     b   COMMENT ON SCHEMA financiero IS 'Schema para utilizar modelo relacional entre tablas de pedidos';
                   postgres    false    9                        2615    35281    fj2    SCHEMA        CREATE SCHEMA fj2;
    DROP SCHEMA fj2;
                postgres    false            �            1259    35282    detalle_pedido    TABLE       CREATE TABLE financiero.detalle_pedido (
    id integer NOT NULL,
    id_pedido integer NOT NULL,
    id_videojuego integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario double precision NOT NULL,
    precio_total double precision NOT NULL
);
 &   DROP TABLE financiero.detalle_pedido;
    
   financiero         heap    postgres    false    9            �            1259    35285    detalle_pedido_id_seq    SEQUENCE     �   CREATE SEQUENCE financiero.detalle_pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE financiero.detalle_pedido_id_seq;
    
   financiero          postgres    false    204    9            �           0    0    detalle_pedido_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE financiero.detalle_pedido_id_seq OWNED BY financiero.detalle_pedido.id;
       
   financiero          postgres    false    205            �            1259    35287    pedido    TABLE     �   CREATE TABLE financiero.pedido (
    id_pedido integer NOT NULL,
    fecha timestamp without time zone NOT NULL,
    id_usuario integer NOT NULL,
    valor_total double precision NOT NULL
);
    DROP TABLE financiero.pedido;
    
   financiero         heap    postgres    false    9            �            1259    35290    pedido_id_venta_seq    SEQUENCE     �   CREATE SEQUENCE financiero.pedido_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE financiero.pedido_id_venta_seq;
    
   financiero          postgres    false    206    9            �           0    0    pedido_id_venta_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE financiero.pedido_id_venta_seq OWNED BY financiero.pedido.id_pedido;
       
   financiero          postgres    false    207            �            1259    35292    estadoVenta    TABLE     l   CREATE TABLE fj2."estadoVenta" (
    "id_estadoVen" integer NOT NULL,
    "descripcionVen" text NOT NULL
);
    DROP TABLE fj2."estadoVenta";
       fj2         heap    postgres    false    5            �            1259    35298    EstadoVenta_id_estadoVen_seq    SEQUENCE     �   CREATE SEQUENCE fj2."EstadoVenta_id_estadoVen_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE fj2."EstadoVenta_id_estadoVen_seq";
       fj2          postgres    false    208    5            �           0    0    EstadoVenta_id_estadoVen_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE fj2."EstadoVenta_id_estadoVen_seq" OWNED BY fj2."estadoVenta"."id_estadoVen";
          fj2          postgres    false    209            �            1259    35300    rol    TABLE     U   CREATE TABLE fj2.rol (
    id_rol integer NOT NULL,
    descripcion text NOT NULL
);
    DROP TABLE fj2.rol;
       fj2         heap    postgres    false    5            �            1259    35306    Rol_id_rol_seq    SEQUENCE     �   CREATE SEQUENCE fj2."Rol_id_rol_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE fj2."Rol_id_rol_seq";
       fj2          postgres    false    5    210            �           0    0    Rol_id_rol_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE fj2."Rol_id_rol_seq" OWNED BY fj2.rol.id_rol;
          fj2          postgres    false    211            �            1259    35308    usuario    TABLE     �   CREATE TABLE fj2.usuario (
    id_usuario integer NOT NULL,
    correo text NOT NULL,
    nickname text NOT NULL,
    "contraseña" text NOT NULL,
    nombre text,
    id_rol integer NOT NULL,
    imagen text
);
    DROP TABLE fj2.usuario;
       fj2         heap    postgres    false    5            �            1259    35314    Usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE fj2."Usuario_id_usuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE fj2."Usuario_id_usuario_seq";
       fj2          postgres    false    5    212            �           0    0    Usuario_id_usuario_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE fj2."Usuario_id_usuario_seq" OWNED BY fj2.usuario.id_usuario;
          fj2          postgres    false    213            �            1259    35316 
   biblioteca    TABLE     �   CREATE TABLE fj2.biblioteca (
    favorito boolean,
    deseado boolean,
    id_usuario integer NOT NULL,
    id_videojuego integer NOT NULL,
    poseido boolean,
    id bigint NOT NULL,
    cantidad integer
);
    DROP TABLE fj2.biblioteca;
       fj2         heap    postgres    false    5            �            1259    35319    biblioteca_id_seq    SEQUENCE     w   CREATE SEQUENCE fj2.biblioteca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE fj2.biblioteca_id_seq;
       fj2          postgres    false    214    5            �           0    0    biblioteca_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE fj2.biblioteca_id_seq OWNED BY fj2.biblioteca.id;
          fj2          postgres    false    215            �            1259    35321 	   categoria    TABLE     _   CREATE TABLE fj2.categoria (
    id_categoria integer NOT NULL,
    categoria text NOT NULL
);
    DROP TABLE fj2.categoria;
       fj2         heap    postgres    false    5            �            1259    35327    categoria_id_categoria_seq    SEQUENCE     �   CREATE SEQUENCE fj2.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE fj2.categoria_id_categoria_seq;
       fj2          postgres    false    5    216            �           0    0    categoria_id_categoria_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE fj2.categoria_id_categoria_seq OWNED BY fj2.categoria.id_categoria;
          fj2          postgres    false    217            �            1259    35329 
   comentario    TABLE     �   CREATE TABLE fj2.comentario (
    id_usuario integer NOT NULL,
    id_videojuego integer NOT NULL,
    mensaje text NOT NULL
);
    DROP TABLE fj2.comentario;
       fj2         heap    postgres    false    5            �            1259    35335    denuncia    TABLE     �   CREATE TABLE fj2.denuncia (
    id_denuncia integer NOT NULL,
    "id_estadoDenuncia" integer NOT NULL,
    mensaje text NOT NULL,
    id_usuario integer NOT NULL,
    id_videojuego integer NOT NULL
);
    DROP TABLE fj2.denuncia;
       fj2         heap    postgres    false    5            �            1259    35341    denuncia_id_denuncia_seq    SEQUENCE     �   CREATE SEQUENCE fj2.denuncia_id_denuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE fj2.denuncia_id_denuncia_seq;
       fj2          postgres    false    5    219            �           0    0    denuncia_id_denuncia_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE fj2.denuncia_id_denuncia_seq OWNED BY fj2.denuncia.id_denuncia;
          fj2          postgres    false    220            �            1259    35343    estadoDenuncia    TABLE     o   CREATE TABLE fj2."estadoDenuncia" (
    "id_estadoDenuncia" integer NOT NULL,
    descripcion text NOT NULL
);
 !   DROP TABLE fj2."estadoDenuncia";
       fj2         heap    postgres    false    5            �            1259    35349 $   estadoDenuncia_id_estadoDenuncia_seq    SEQUENCE     �   CREATE SEQUENCE fj2."estadoDenuncia_id_estadoDenuncia_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE fj2."estadoDenuncia_id_estadoDenuncia_seq";
       fj2          postgres    false    221    5            �           0    0 $   estadoDenuncia_id_estadoDenuncia_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE fj2."estadoDenuncia_id_estadoDenuncia_seq" OWNED BY fj2."estadoDenuncia"."id_estadoDenuncia";
          fj2          postgres    false    222            �            1259    35351    estadoVideojuego    TABLE     j   CREATE TABLE fj2."estadoVideojuego" (
    "id_estadoV" integer NOT NULL,
    descripcion text NOT NULL
);
 #   DROP TABLE fj2."estadoVideojuego";
       fj2         heap    postgres    false    5            �            1259    35357 
   plataforma    TABLE     b   CREATE TABLE fj2.plataforma (
    id_plataforma integer NOT NULL,
    plataforma text NOT NULL
);
    DROP TABLE fj2.plataforma;
       fj2         heap    postgres    false    5            �            1259    35363    plataforma_id_plataforma_seq    SEQUENCE     �   CREATE SEQUENCE fj2.plataforma_id_plataforma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE fj2.plataforma_id_plataforma_seq;
       fj2          postgres    false    5    224            �           0    0    plataforma_id_plataforma_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE fj2.plataforma_id_plataforma_seq OWNED BY fj2.plataforma.id_plataforma;
          fj2          postgres    false    225            �            1259    35365 
   rolUsuario    TABLE     g   CREATE TABLE fj2."rolUsuario" (
    "id_rolUsuario" integer NOT NULL,
    descripcion text NOT NULL
);
    DROP TABLE fj2."rolUsuario";
       fj2         heap    postgres    false    5            �            1259    35371    rolUsuario_id_rolUsuario_seq    SEQUENCE     �   CREATE SEQUENCE fj2."rolUsuario_id_rolUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE fj2."rolUsuario_id_rolUsuario_seq";
       fj2          postgres    false    5    226            �           0    0    rolUsuario_id_rolUsuario_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE fj2."rolUsuario_id_rolUsuario_seq" OWNED BY fj2."rolUsuario"."id_rolUsuario";
          fj2          postgres    false    227            �            1259    35373    venta    TABLE     �   CREATE TABLE fj2.venta (
    id_venta integer NOT NULL,
    id_videojuego integer NOT NULL,
    fecha date NOT NULL,
    "id_estadoVen" integer NOT NULL,
    id_usuario integer NOT NULL
);
    DROP TABLE fj2.venta;
       fj2         heap    postgres    false    5            �            1259    35376    venta_id_venta_seq    SEQUENCE     �   CREATE SEQUENCE fj2.venta_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE fj2.venta_id_venta_seq;
       fj2          postgres    false    5    228            �           0    0    venta_id_venta_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE fj2.venta_id_venta_seq OWNED BY fj2.venta.id_venta;
          fj2          postgres    false    229            �            1259    35378 
   videojuego    TABLE     7  CREATE TABLE fj2.videojuego (
    id_videojuego integer NOT NULL,
    nom_juego text NOT NULL,
    "id_estadoV" integer,
    descripcion text NOT NULL,
    cantidad integer NOT NULL,
    imagen text NOT NULL,
    id_categoria integer NOT NULL,
    precio double precision NOT NULL,
    id_plataforma integer
);
    DROP TABLE fj2.videojuego;
       fj2         heap    postgres    false    5            �            1259    35384    videojuego_id_videojuego_seq    SEQUENCE     �   CREATE SEQUENCE fj2.videojuego_id_videojuego_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE fj2.videojuego_id_videojuego_seq;
       fj2          postgres    false    230    5            �           0    0    videojuego_id_videojuego_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE fj2.videojuego_id_videojuego_seq OWNED BY fj2.videojuego.id_videojuego;
          fj2          postgres    false    231            �
           2604    35386    detalle_pedido id    DEFAULT     ~   ALTER TABLE ONLY financiero.detalle_pedido ALTER COLUMN id SET DEFAULT nextval('financiero.detalle_pedido_id_seq'::regclass);
 D   ALTER TABLE financiero.detalle_pedido ALTER COLUMN id DROP DEFAULT;
    
   financiero          postgres    false    205    204            �
           2604    35387    pedido id_pedido    DEFAULT     {   ALTER TABLE ONLY financiero.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('financiero.pedido_id_venta_seq'::regclass);
 C   ALTER TABLE financiero.pedido ALTER COLUMN id_pedido DROP DEFAULT;
    
   financiero          postgres    false    207    206            �
           2604    35388    biblioteca id    DEFAULT     h   ALTER TABLE ONLY fj2.biblioteca ALTER COLUMN id SET DEFAULT nextval('fj2.biblioteca_id_seq'::regclass);
 9   ALTER TABLE fj2.biblioteca ALTER COLUMN id DROP DEFAULT;
       fj2          postgres    false    215    214            �
           2604    35389    categoria id_categoria    DEFAULT     z   ALTER TABLE ONLY fj2.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('fj2.categoria_id_categoria_seq'::regclass);
 B   ALTER TABLE fj2.categoria ALTER COLUMN id_categoria DROP DEFAULT;
       fj2          postgres    false    217    216            �
           2604    35390    denuncia id_denuncia    DEFAULT     v   ALTER TABLE ONLY fj2.denuncia ALTER COLUMN id_denuncia SET DEFAULT nextval('fj2.denuncia_id_denuncia_seq'::regclass);
 @   ALTER TABLE fj2.denuncia ALTER COLUMN id_denuncia DROP DEFAULT;
       fj2          postgres    false    220    219            �
           2604    35391     estadoDenuncia id_estadoDenuncia    DEFAULT     �   ALTER TABLE ONLY fj2."estadoDenuncia" ALTER COLUMN "id_estadoDenuncia" SET DEFAULT nextval('fj2."estadoDenuncia_id_estadoDenuncia_seq"'::regclass);
 P   ALTER TABLE fj2."estadoDenuncia" ALTER COLUMN "id_estadoDenuncia" DROP DEFAULT;
       fj2          postgres    false    222    221            �
           2604    35392    estadoVenta id_estadoVen    DEFAULT     �   ALTER TABLE ONLY fj2."estadoVenta" ALTER COLUMN "id_estadoVen" SET DEFAULT nextval('fj2."EstadoVenta_id_estadoVen_seq"'::regclass);
 H   ALTER TABLE fj2."estadoVenta" ALTER COLUMN "id_estadoVen" DROP DEFAULT;
       fj2          postgres    false    209    208            �
           2604    35393    plataforma id_plataforma    DEFAULT     ~   ALTER TABLE ONLY fj2.plataforma ALTER COLUMN id_plataforma SET DEFAULT nextval('fj2.plataforma_id_plataforma_seq'::regclass);
 D   ALTER TABLE fj2.plataforma ALTER COLUMN id_plataforma DROP DEFAULT;
       fj2          postgres    false    225    224            �
           2604    35394 
   rol id_rol    DEFAULT     d   ALTER TABLE ONLY fj2.rol ALTER COLUMN id_rol SET DEFAULT nextval('fj2."Rol_id_rol_seq"'::regclass);
 6   ALTER TABLE fj2.rol ALTER COLUMN id_rol DROP DEFAULT;
       fj2          postgres    false    211    210            �
           2604    35395    rolUsuario id_rolUsuario    DEFAULT     �   ALTER TABLE ONLY fj2."rolUsuario" ALTER COLUMN "id_rolUsuario" SET DEFAULT nextval('fj2."rolUsuario_id_rolUsuario_seq"'::regclass);
 H   ALTER TABLE fj2."rolUsuario" ALTER COLUMN "id_rolUsuario" DROP DEFAULT;
       fj2          postgres    false    227    226            �
           2604    35396    usuario id_usuario    DEFAULT     t   ALTER TABLE ONLY fj2.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('fj2."Usuario_id_usuario_seq"'::regclass);
 >   ALTER TABLE fj2.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       fj2          postgres    false    213    212            �
           2604    35397    venta id_venta    DEFAULT     j   ALTER TABLE ONLY fj2.venta ALTER COLUMN id_venta SET DEFAULT nextval('fj2.venta_id_venta_seq'::regclass);
 :   ALTER TABLE fj2.venta ALTER COLUMN id_venta DROP DEFAULT;
       fj2          postgres    false    229    228            �
           2604    35398    videojuego id_videojuego    DEFAULT     ~   ALTER TABLE ONLY fj2.videojuego ALTER COLUMN id_videojuego SET DEFAULT nextval('fj2.videojuego_id_videojuego_seq'::regclass);
 D   ALTER TABLE fj2.videojuego ALTER COLUMN id_videojuego DROP DEFAULT;
       fj2          postgres    false    231    230            �          0    35282    detalle_pedido 
   TABLE DATA           s   COPY financiero.detalle_pedido (id, id_pedido, id_videojuego, cantidad, precio_unitario, precio_total) FROM stdin;
 
   financiero          postgres    false    204   4�       �          0    35287    pedido 
   TABLE DATA           O   COPY financiero.pedido (id_pedido, fecha, id_usuario, valor_total) FROM stdin;
 
   financiero          postgres    false    206   ��       �          0    35316 
   biblioteca 
   TABLE DATA           f   COPY fj2.biblioteca (favorito, deseado, id_usuario, id_videojuego, poseido, id, cantidad) FROM stdin;
    fj2          postgres    false    214   >�       �          0    35321 	   categoria 
   TABLE DATA           9   COPY fj2.categoria (id_categoria, categoria) FROM stdin;
    fj2          postgres    false    216   ��       �          0    35329 
   comentario 
   TABLE DATA           E   COPY fj2.comentario (id_usuario, id_videojuego, mensaje) FROM stdin;
    fj2          postgres    false    218   
�       �          0    35335    denuncia 
   TABLE DATA           e   COPY fj2.denuncia (id_denuncia, "id_estadoDenuncia", mensaje, id_usuario, id_videojuego) FROM stdin;
    fj2          postgres    false    219   6�       �          0    35343    estadoDenuncia 
   TABLE DATA           I   COPY fj2."estadoDenuncia" ("id_estadoDenuncia", descripcion) FROM stdin;
    fj2          postgres    false    221   S�       �          0    35292    estadoVenta 
   TABLE DATA           F   COPY fj2."estadoVenta" ("id_estadoVen", "descripcionVen") FROM stdin;
    fj2          postgres    false    208   ��       �          0    35351    estadoVideojuego 
   TABLE DATA           D   COPY fj2."estadoVideojuego" ("id_estadoV", descripcion) FROM stdin;
    fj2          postgres    false    223   ��       �          0    35357 
   plataforma 
   TABLE DATA           <   COPY fj2.plataforma (id_plataforma, plataforma) FROM stdin;
    fj2          postgres    false    224   �       �          0    35300    rol 
   TABLE DATA           /   COPY fj2.rol (id_rol, descripcion) FROM stdin;
    fj2          postgres    false    210   '�       �          0    35365 
   rolUsuario 
   TABLE DATA           A   COPY fj2."rolUsuario" ("id_rolUsuario", descripcion) FROM stdin;
    fj2          postgres    false    226   n�       �          0    35308    usuario 
   TABLE DATA           c   COPY fj2.usuario (id_usuario, correo, nickname, "contraseña", nombre, id_rol, imagen) FROM stdin;
    fj2          postgres    false    212   ��       �          0    35373    venta 
   TABLE DATA           X   COPY fj2.venta (id_venta, id_videojuego, fecha, "id_estadoVen", id_usuario) FROM stdin;
    fj2          postgres    false    228   �       �          0    35378 
   videojuego 
   TABLE DATA           �   COPY fj2.videojuego (id_videojuego, nom_juego, "id_estadoV", descripcion, cantidad, imagen, id_categoria, precio, id_plataforma) FROM stdin;
    fj2          postgres    false    230   �       �           0    0    detalle_pedido_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('financiero.detalle_pedido_id_seq', 34, true);
       
   financiero          postgres    false    205            �           0    0    pedido_id_venta_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('financiero.pedido_id_venta_seq', 41, true);
       
   financiero          postgres    false    207            �           0    0    EstadoVenta_id_estadoVen_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('fj2."EstadoVenta_id_estadoVen_seq"', 1, false);
          fj2          postgres    false    209            �           0    0    Rol_id_rol_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('fj2."Rol_id_rol_seq"', 1, true);
          fj2          postgres    false    211            �           0    0    Usuario_id_usuario_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('fj2."Usuario_id_usuario_seq"', 23, true);
          fj2          postgres    false    213            �           0    0    biblioteca_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('fj2.biblioteca_id_seq', 83, true);
          fj2          postgres    false    215            �           0    0    categoria_id_categoria_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('fj2.categoria_id_categoria_seq', 9, true);
          fj2          postgres    false    217            �           0    0    denuncia_id_denuncia_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('fj2.denuncia_id_denuncia_seq', 4, true);
          fj2          postgres    false    220            �           0    0 $   estadoDenuncia_id_estadoDenuncia_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('fj2."estadoDenuncia_id_estadoDenuncia_seq"', 4, true);
          fj2          postgres    false    222            �           0    0    plataforma_id_plataforma_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('fj2.plataforma_id_plataforma_seq', 4, true);
          fj2          postgres    false    225            �           0    0    rolUsuario_id_rolUsuario_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('fj2."rolUsuario_id_rolUsuario_seq"', 1, false);
          fj2          postgres    false    227            �           0    0    venta_id_venta_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('fj2.venta_id_venta_seq', 1, false);
          fj2          postgres    false    229            �           0    0    videojuego_id_videojuego_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('fj2.videojuego_id_videojuego_seq', 22, true);
          fj2          postgres    false    231            �
           2606    35400     detalle_pedido PK_detalle_pedido 
   CONSTRAINT     d   ALTER TABLE ONLY financiero.detalle_pedido
    ADD CONSTRAINT "PK_detalle_pedido" PRIMARY KEY (id);
 P   ALTER TABLE ONLY financiero.detalle_pedido DROP CONSTRAINT "PK_detalle_pedido";
    
   financiero            postgres    false    204            �
           2606    35402    pedido PK_pedido 
   CONSTRAINT     [   ALTER TABLE ONLY financiero.pedido
    ADD CONSTRAINT "PK_pedido" PRIMARY KEY (id_pedido);
 @   ALTER TABLE ONLY financiero.pedido DROP CONSTRAINT "PK_pedido";
    
   financiero            postgres    false    206            �
           2606    35404    estadoVenta EstadoVenta_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY fj2."estadoVenta"
    ADD CONSTRAINT "EstadoVenta_pkey" PRIMARY KEY ("id_estadoVen");
 G   ALTER TABLE ONLY fj2."estadoVenta" DROP CONSTRAINT "EstadoVenta_pkey";
       fj2            postgres    false    208            �
           2606    35406    usuario PK_Usuario 
   CONSTRAINT     W   ALTER TABLE ONLY fj2.usuario
    ADD CONSTRAINT "PK_Usuario" PRIMARY KEY (id_usuario);
 ;   ALTER TABLE ONLY fj2.usuario DROP CONSTRAINT "PK_Usuario";
       fj2            postgres    false    212            �
           2606    35408    denuncia PK_denuncia 
   CONSTRAINT     Z   ALTER TABLE ONLY fj2.denuncia
    ADD CONSTRAINT "PK_denuncia" PRIMARY KEY (id_denuncia);
 =   ALTER TABLE ONLY fj2.denuncia DROP CONSTRAINT "PK_denuncia";
       fj2            postgres    false    219                       2606    35410    estadoVideojuego PK_estado 
   CONSTRAINT     c   ALTER TABLE ONLY fj2."estadoVideojuego"
    ADD CONSTRAINT "PK_estado" PRIMARY KEY ("id_estadoV");
 E   ALTER TABLE ONLY fj2."estadoVideojuego" DROP CONSTRAINT "PK_estado";
       fj2            postgres    false    223            �
           2606    35412    categoria PK_id_categoria 
   CONSTRAINT     `   ALTER TABLE ONLY fj2.categoria
    ADD CONSTRAINT "PK_id_categoria" PRIMARY KEY (id_categoria);
 B   ALTER TABLE ONLY fj2.categoria DROP CONSTRAINT "PK_id_categoria";
       fj2            postgres    false    216                       2606    35414    videojuego PK_id_videojuego 
   CONSTRAINT     c   ALTER TABLE ONLY fj2.videojuego
    ADD CONSTRAINT "PK_id_videojuego" PRIMARY KEY (id_videojuego);
 D   ALTER TABLE ONLY fj2.videojuego DROP CONSTRAINT "PK_id_videojuego";
       fj2            postgres    false    230            	           2606    35416    venta PK_venta 
   CONSTRAINT     Q   ALTER TABLE ONLY fj2.venta
    ADD CONSTRAINT "PK_venta" PRIMARY KEY (id_venta);
 7   ALTER TABLE ONLY fj2.venta DROP CONSTRAINT "PK_venta";
       fj2            postgres    false    228            �
           2606    35418    rol Rol_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY fj2.rol
    ADD CONSTRAINT "Rol_pkey" PRIMARY KEY (id_rol);
 5   ALTER TABLE ONLY fj2.rol DROP CONSTRAINT "Rol_pkey";
       fj2            postgres    false    210            �
           2606    35420    biblioteca biblioteca_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY fj2.biblioteca
    ADD CONSTRAINT biblioteca_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY fj2.biblioteca DROP CONSTRAINT biblioteca_pkey;
       fj2            postgres    false    214                       2606    35422 "   estadoDenuncia estadoDenuncia_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY fj2."estadoDenuncia"
    ADD CONSTRAINT "estadoDenuncia_pkey" PRIMARY KEY ("id_estadoDenuncia");
 M   ALTER TABLE ONLY fj2."estadoDenuncia" DROP CONSTRAINT "estadoDenuncia_pkey";
       fj2            postgres    false    221                       2606    35424    plataforma pk_plataforma 
   CONSTRAINT     ^   ALTER TABLE ONLY fj2.plataforma
    ADD CONSTRAINT pk_plataforma PRIMARY KEY (id_plataforma);
 ?   ALTER TABLE ONLY fj2.plataforma DROP CONSTRAINT pk_plataforma;
       fj2            postgres    false    224                       2606    35426    rolUsuario rolUsuario_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY fj2."rolUsuario"
    ADD CONSTRAINT "rolUsuario_pkey" PRIMARY KEY ("id_rolUsuario");
 E   ALTER TABLE ONLY fj2."rolUsuario" DROP CONSTRAINT "rolUsuario_pkey";
       fj2            postgres    false    226            �
           1259    35427     fki_fk_detalle_pedido_videojuego    INDEX     h   CREATE INDEX fki_fk_detalle_pedido_videojuego ON financiero.detalle_pedido USING btree (id_videojuego);
 8   DROP INDEX financiero.fki_fk_detalle_pedido_videojuego;
    
   financiero            postgres    false    204            �
           1259    35428    fki_fk_pedido_usuario    INDEX     R   CREATE INDEX fki_fk_pedido_usuario ON financiero.pedido USING btree (id_usuario);
 -   DROP INDEX financiero.fki_fk_pedido_usuario;
    
   financiero            postgres    false    206                       1259    35429    fki_FK_categoria    INDEX     N   CREATE INDEX "fki_FK_categoria" ON fj2.videojuego USING btree (id_categoria);
 #   DROP INDEX fj2."fki_FK_categoria";
       fj2            postgres    false    230                       1259    35430    fki_FK_estado    INDEX     K   CREATE INDEX "fki_FK_estado" ON fj2.videojuego USING btree ("id_estadoV");
     DROP INDEX fj2."fki_FK_estado";
       fj2            postgres    false    230            �
           1259    35431    fki_FK_estadoD    INDEX     Q   CREATE INDEX "fki_FK_estadoD" ON fj2.denuncia USING btree ("id_estadoDenuncia");
 !   DROP INDEX fj2."fki_FK_estadoD";
       fj2            postgres    false    219            
           1259    35432    fki_FK_estadoV    INDEX     I   CREATE INDEX "fki_FK_estadoV" ON fj2.venta USING btree ("id_estadoVen");
 !   DROP INDEX fj2."fki_FK_estadoV";
       fj2            postgres    false    228            �
           1259    35433 
   fki_FK_rol    INDEX     ?   CREATE INDEX "fki_FK_rol" ON fj2.usuario USING btree (id_rol);
    DROP INDEX fj2."fki_FK_rol";
       fj2            postgres    false    212            �
           1259    35434    fki_FK_usuario    INDEX     J   CREATE INDEX "fki_FK_usuario" ON fj2.comentario USING btree (id_usuario);
 !   DROP INDEX fj2."fki_FK_usuario";
       fj2            postgres    false    218            �
           1259    35435    fki_FK_usuarioD    INDEX     I   CREATE INDEX "fki_FK_usuarioD" ON fj2.denuncia USING btree (id_usuario);
 "   DROP INDEX fj2."fki_FK_usuarioD";
       fj2            postgres    false    219                       1259    35436    fki_FK_usuarioV    INDEX     F   CREATE INDEX "fki_FK_usuarioV" ON fj2.venta USING btree (id_usuario);
 "   DROP INDEX fj2."fki_FK_usuarioV";
       fj2            postgres    false    228            �
           1259    35437    fki_FK_video    INDEX     K   CREATE INDEX "fki_FK_video" ON fj2.comentario USING btree (id_videojuego);
    DROP INDEX fj2."fki_FK_video";
       fj2            postgres    false    218                       1259    35438    fki_FK_videoV    INDEX     G   CREATE INDEX "fki_FK_videoV" ON fj2.venta USING btree (id_videojuego);
     DROP INDEX fj2."fki_FK_videoV";
       fj2            postgres    false    228                       2606    35439 '   detalle_pedido fk_detalle_pedido_pedido    FK CONSTRAINT     �   ALTER TABLE ONLY financiero.detalle_pedido
    ADD CONSTRAINT fk_detalle_pedido_pedido FOREIGN KEY (id_pedido) REFERENCES financiero.pedido(id_pedido);
 U   ALTER TABLE ONLY financiero.detalle_pedido DROP CONSTRAINT fk_detalle_pedido_pedido;
    
   financiero          postgres    false    204    206    2797                       2606    35444 +   detalle_pedido fk_detalle_pedido_videojuego    FK CONSTRAINT     �   ALTER TABLE ONLY financiero.detalle_pedido
    ADD CONSTRAINT fk_detalle_pedido_videojuego FOREIGN KEY (id_videojuego) REFERENCES fj2.videojuego(id_videojuego);
 Y   ALTER TABLE ONLY financiero.detalle_pedido DROP CONSTRAINT fk_detalle_pedido_videojuego;
    
   financiero          postgres    false    204    2830    230                       2606    35449    pedido fk_pedido_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY financiero.pedido
    ADD CONSTRAINT fk_pedido_usuario FOREIGN KEY (id_usuario) REFERENCES fj2.usuario(id_usuario);
 F   ALTER TABLE ONLY financiero.pedido DROP CONSTRAINT fk_pedido_usuario;
    
   financiero          postgres    false    212    206    2804                       2606    35454    videojuego FK_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY fj2.videojuego
    ADD CONSTRAINT "FK_categoria" FOREIGN KEY (id_categoria) REFERENCES fj2.categoria(id_categoria);
 @   ALTER TABLE ONLY fj2.videojuego DROP CONSTRAINT "FK_categoria";
       fj2          postgres    false    230    216    2809                       2606    35459    videojuego FK_estado    FK CONSTRAINT     �   ALTER TABLE ONLY fj2.videojuego
    ADD CONSTRAINT "FK_estado" FOREIGN KEY ("id_estadoV") REFERENCES fj2."estadoVideojuego"("id_estadoV");
 =   ALTER TABLE ONLY fj2.videojuego DROP CONSTRAINT "FK_estado";
       fj2          postgres    false    223    230    2819                       2606    35464    denuncia FK_estadoD    FK CONSTRAINT     �   ALTER TABLE ONLY fj2.denuncia
    ADD CONSTRAINT "FK_estadoD" FOREIGN KEY ("id_estadoDenuncia") REFERENCES fj2."estadoDenuncia"("id_estadoDenuncia");
 <   ALTER TABLE ONLY fj2.denuncia DROP CONSTRAINT "FK_estadoD";
       fj2          postgres    false    221    2817    219                       2606    35469    venta FK_estadoV    FK CONSTRAINT     �   ALTER TABLE ONLY fj2.venta
    ADD CONSTRAINT "FK_estadoV" FOREIGN KEY ("id_estadoVen") REFERENCES fj2."estadoVenta"("id_estadoVen");
 9   ALTER TABLE ONLY fj2.venta DROP CONSTRAINT "FK_estadoV";
       fj2          postgres    false    2800    228    208                       2606    35474    videojuego FK_plataforma    FK CONSTRAINT     �   ALTER TABLE ONLY fj2.videojuego
    ADD CONSTRAINT "FK_plataforma" FOREIGN KEY (id_plataforma) REFERENCES fj2.plataforma(id_plataforma) NOT VALID;
 A   ALTER TABLE ONLY fj2.videojuego DROP CONSTRAINT "FK_plataforma";
       fj2          postgres    false    224    230    2821                       2606    35479    usuario FK_rolU    FK CONSTRAINT     k   ALTER TABLE ONLY fj2.usuario
    ADD CONSTRAINT "FK_rolU" FOREIGN KEY (id_rol) REFERENCES fj2.rol(id_rol);
 8   ALTER TABLE ONLY fj2.usuario DROP CONSTRAINT "FK_rolU";
       fj2          postgres    false    210    212    2802                       2606    35484    comentario FK_usuarioC    FK CONSTRAINT     ~   ALTER TABLE ONLY fj2.comentario
    ADD CONSTRAINT "FK_usuarioC" FOREIGN KEY (id_usuario) REFERENCES fj2.usuario(id_usuario);
 ?   ALTER TABLE ONLY fj2.comentario DROP CONSTRAINT "FK_usuarioC";
       fj2          postgres    false    218    2804    212                       2606    35489    denuncia FK_usuarioD    FK CONSTRAINT     |   ALTER TABLE ONLY fj2.denuncia
    ADD CONSTRAINT "FK_usuarioD" FOREIGN KEY (id_usuario) REFERENCES fj2.usuario(id_usuario);
 =   ALTER TABLE ONLY fj2.denuncia DROP CONSTRAINT "FK_usuarioD";
       fj2          postgres    false    212    2804    219                       2606    35494    venta FK_usuarioV    FK CONSTRAINT     y   ALTER TABLE ONLY fj2.venta
    ADD CONSTRAINT "FK_usuarioV" FOREIGN KEY (id_usuario) REFERENCES fj2.usuario(id_usuario);
 :   ALTER TABLE ONLY fj2.venta DROP CONSTRAINT "FK_usuarioV";
       fj2          postgres    false    212    2804    228                       2606    35499    comentario FK_videoC    FK CONSTRAINT     �   ALTER TABLE ONLY fj2.comentario
    ADD CONSTRAINT "FK_videoC" FOREIGN KEY (id_videojuego) REFERENCES fj2.videojuego(id_videojuego);
 =   ALTER TABLE ONLY fj2.comentario DROP CONSTRAINT "FK_videoC";
       fj2          postgres    false    230    2830    218                       2606    35504    venta FK_videoV    FK CONSTRAINT     �   ALTER TABLE ONLY fj2.venta
    ADD CONSTRAINT "FK_videoV" FOREIGN KEY (id_videojuego) REFERENCES fj2.videojuego(id_videojuego);
 8   ALTER TABLE ONLY fj2.venta DROP CONSTRAINT "FK_videoV";
       fj2          postgres    false    2830    230    228            �   n   x�u���0C�a�j�.�?�P�d�!��@;Cv�S*��$:�*�$\�`� l� p$XE��J:F�4x�*B͠�A��K��1���% �����m^?�\���J�/�      �   |   x�u��� ��g�"��3v����Q  Z���>	�B�B;��q!G}QG-਴@���H�
Z�����\������@m�j��>�����;([�:{�:�Ɩ)Pa^9��}^1�/�K=      �   Z   x�M���0���cShca	'����/�LL�A
n�q�\�.����li��Ib�re.=W�b��6��;9���G�?ǵ�iD� �i%4      �   R   x��;
�@�:�0�
~JQO��6A��l�m����2}�㥢��8n�)���H':YKP��[��b�3�`�YI���]�aD� ��      �      x���42��M�Q�*MM������ 3�      �      x������ � �      �   7   x�3�tL.�,��2�t,(�OJL��2�JM�H��M8��RR�2�2��=... �W�      �      x������ � �      �   &   x�3�t�,.���L�I���2�tL�/IL������ ��      �   *   x�3�p���2�Hʯ�2�6�2�.�,I������� �[      �   7   x�3�-.M,���2���OI-JL�/�2�tL����,.��M8��R�L�=... �?      �      x������ � �      �   T  x���AN�0Eד�`����3b�@���f�8�[ǎl'����8U����J�_f&.�0kT~�ο?���t�xk���4�PF)��o;���� [tH�Α
�I�I)4��&�:�*
�Őcς��ކ����@�:���ZZ��i^��v��uJ7�-;��(��Jj�8jFj�z�ѹ���:����I�N��n;���K����
�|n��<���;<-��3��rRJ��U q�œP�9��D\�V>�>�T�=f�w�!�2W'�8��:O� ©=OB�d�惚���D;y$��d���e�Mj!�ݎ}_�5e��jH�Cx�K>B�b+���g�h      �      x������ � �      �   +  x���Mn� F��Sp+�o[UQ�Mw]e3����;�M�K�S�b�m��j����<����m4<��⾥:��T��������(�W��1�o�j�o���Q7�z��o�L��Ę`z#��]6���:.��Ge��KrL�ƐzG��)�B]'�$҈@c0}��0���1�+sd���UTT�.��e��I�uǏ��J1�n�e	��M���a`6�nC���i��WR�G�#��ܜsz��d�AFp�|H�I�Vc��Rw�e��W�D+�-��Bwq���!�H�~�uY��K��     