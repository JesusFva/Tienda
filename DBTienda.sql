PGDMP     3                    |            Tienda    14.5    14.5 C    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    27131    Tienda    DATABASE     e   CREATE DATABASE "Tienda" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE "Tienda";
                postgres    false            �            1259    27142 
   categorias    TABLE     �   CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    nombre_categoria character varying(150),
    descripcion text
);
    DROP TABLE public.categorias;
       public         heap    postgres    false            �            1259    27141    categorias_id_categoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categorias_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.categorias_id_categoria_seq;
       public          postgres    false    212            A           0    0    categorias_id_categoria_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.categorias_id_categoria_seq OWNED BY public.categorias.id_categoria;
          public          postgres    false    211            �            1259    27203 	   direccion    TABLE     I  CREATE TABLE public.direccion (
    id_direccion integer NOT NULL,
    id_usuario integer,
    estado character varying(100),
    municipio character varying(100),
    colonia character varying(100),
    codigo_postal character varying(10),
    numero_exterior character varying(20),
    numero_interior character varying(20)
);
    DROP TABLE public.direccion;
       public         heap    postgres    false            �            1259    27202    direccion_id_direccion_seq    SEQUENCE     �   CREATE SEQUENCE public.direccion_id_direccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.direccion_id_direccion_seq;
       public          postgres    false    220            B           0    0    direccion_id_direccion_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.direccion_id_direccion_seq OWNED BY public.direccion.id_direccion;
          public          postgres    false    219            �            1259    27215    pedido    TABLE     �   CREATE TABLE public.pedido (
    id_pedido integer NOT NULL,
    id_producto integer,
    id_persona integer,
    fecha date,
    monto numeric(10,2),
    unidades integer
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    27214    pedido_id_pedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pedido_id_pedido_seq;
       public          postgres    false    222            C           0    0    pedido_id_pedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_id_pedido_seq OWNED BY public.pedido.id_pedido;
          public          postgres    false    221            �            1259    27232    permisos    TABLE     V   CREATE TABLE public.permisos (
    id_permiso integer NOT NULL,
    id_rol integer
);
    DROP TABLE public.permisos;
       public         heap    postgres    false            �            1259    27231    permisos_id_permiso_seq    SEQUENCE     �   CREATE SEQUENCE public.permisos_id_permiso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.permisos_id_permiso_seq;
       public          postgres    false    224            D           0    0    permisos_id_permiso_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.permisos_id_permiso_seq OWNED BY public.permisos.id_permiso;
          public          postgres    false    223            �            1259    27190    persona    TABLE     j  CREATE TABLE public.persona (
    id_persona integer NOT NULL,
    id_usuario integer,
    nombre_persona character varying(75),
    app_usuario character varying(50),
    apm_usuario character varying(50) DEFAULT 'Sin apellido Materno'::character varying,
    edad integer,
    numero_telefono character varying(20),
    numero_celular character varying(20)
);
    DROP TABLE public.persona;
       public         heap    postgres    false            �            1259    27189    persona_id_persona_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.persona_id_persona_seq;
       public          postgres    false    218            E           0    0    persona_id_persona_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.persona.id_persona;
          public          postgres    false    217            �            1259    27151 	   productos    TABLE     �   CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre character varying(150),
    descripcion text,
    id_categoria integer,
    precio numeric(10,2),
    unidades integer,
    marca character varying(75)
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    27150    productos_id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.productos_id_producto_seq;
       public          postgres    false    214            F           0    0    productos_id_producto_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;
          public          postgres    false    213            �            1259    27133    roles    TABLE     x   CREATE TABLE public.roles (
    id_rol integer NOT NULL,
    nombre_rol character varying(100),
    descripcion text
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    27132    roles_id_rol_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.roles_id_rol_seq;
       public          postgres    false    210            G           0    0    roles_id_rol_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.roles_id_rol_seq OWNED BY public.roles.id_rol;
          public          postgres    false    209            �            1259    27175    usuario    TABLE     ~  CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    id_rol integer,
    nombre_usuario character varying(50),
    app_usuario character varying(50),
    apm_usuario character varying(50) DEFAULT 'Sin apellido Materno'::character varying,
    correo character varying(100),
    "contrase¤a" character varying(100),
    estado character varying(50),
    foto bytea
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    27174    usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public          postgres    false    216            H           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;
          public          postgres    false    215            �           2604    27145    categorias id_categoria    DEFAULT     �   ALTER TABLE ONLY public.categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.categorias_id_categoria_seq'::regclass);
 F   ALTER TABLE public.categorias ALTER COLUMN id_categoria DROP DEFAULT;
       public          postgres    false    212    211    212            �           2604    27206    direccion id_direccion    DEFAULT     �   ALTER TABLE ONLY public.direccion ALTER COLUMN id_direccion SET DEFAULT nextval('public.direccion_id_direccion_seq'::regclass);
 E   ALTER TABLE public.direccion ALTER COLUMN id_direccion DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    27218    pedido id_pedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedido_id_pedido_seq'::regclass);
 ?   ALTER TABLE public.pedido ALTER COLUMN id_pedido DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    27235    permisos id_permiso    DEFAULT     z   ALTER TABLE ONLY public.permisos ALTER COLUMN id_permiso SET DEFAULT nextval('public.permisos_id_permiso_seq'::regclass);
 B   ALTER TABLE public.permisos ALTER COLUMN id_permiso DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    27193    persona id_persona    DEFAULT     x   ALTER TABLE ONLY public.persona ALTER COLUMN id_persona SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);
 A   ALTER TABLE public.persona ALTER COLUMN id_persona DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    27154    productos id_producto    DEFAULT     ~   ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);
 D   ALTER TABLE public.productos ALTER COLUMN id_producto DROP DEFAULT;
       public          postgres    false    213    214    214                       2604    27136    roles id_rol    DEFAULT     l   ALTER TABLE ONLY public.roles ALTER COLUMN id_rol SET DEFAULT nextval('public.roles_id_rol_seq'::regclass);
 ;   ALTER TABLE public.roles ALTER COLUMN id_rol DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    27178    usuario id_usuario    DEFAULT     x   ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    216    215    216            .          0    27142 
   categorias 
   TABLE DATA           Q   COPY public.categorias (id_categoria, nombre_categoria, descripcion) FROM stdin;
    public          postgres    false    212   �O       6          0    27203 	   direccion 
   TABLE DATA           �   COPY public.direccion (id_direccion, id_usuario, estado, municipio, colonia, codigo_postal, numero_exterior, numero_interior) FROM stdin;
    public          postgres    false    220   �O       8          0    27215    pedido 
   TABLE DATA           \   COPY public.pedido (id_pedido, id_producto, id_persona, fecha, monto, unidades) FROM stdin;
    public          postgres    false    222   P       :          0    27232    permisos 
   TABLE DATA           6   COPY public.permisos (id_permiso, id_rol) FROM stdin;
    public          postgres    false    224   -P       4          0    27190    persona 
   TABLE DATA           �   COPY public.persona (id_persona, id_usuario, nombre_persona, app_usuario, apm_usuario, edad, numero_telefono, numero_celular) FROM stdin;
    public          postgres    false    218   JP       0          0    27151 	   productos 
   TABLE DATA           l   COPY public.productos (id_producto, nombre, descripcion, id_categoria, precio, unidades, marca) FROM stdin;
    public          postgres    false    214   gP       ,          0    27133    roles 
   TABLE DATA           @   COPY public.roles (id_rol, nombre_rol, descripcion) FROM stdin;
    public          postgres    false    210   �P       2          0    27175    usuario 
   TABLE DATA           �   COPY public.usuario (id_usuario, id_rol, nombre_usuario, app_usuario, apm_usuario, correo, "contrase¤a", estado, foto) FROM stdin;
    public          postgres    false    216   �P       I           0    0    categorias_id_categoria_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 1, false);
          public          postgres    false    211            J           0    0    direccion_id_direccion_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.direccion_id_direccion_seq', 1, false);
          public          postgres    false    219            K           0    0    pedido_id_pedido_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pedido_id_pedido_seq', 1, false);
          public          postgres    false    221            L           0    0    permisos_id_permiso_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.permisos_id_permiso_seq', 1, false);
          public          postgres    false    223            M           0    0    persona_id_persona_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.persona_id_persona_seq', 1, false);
          public          postgres    false    217            N           0    0    productos_id_producto_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.productos_id_producto_seq', 1, false);
          public          postgres    false    213            O           0    0    roles_id_rol_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.roles_id_rol_seq', 1, false);
          public          postgres    false    209            P           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, false);
          public          postgres    false    215            �           2606    27149    categorias categorias_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);
 D   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
       public            postgres    false    212            �           2606    27208    direccion direccion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_pkey PRIMARY KEY (id_direccion);
 B   ALTER TABLE ONLY public.direccion DROP CONSTRAINT direccion_pkey;
       public            postgres    false    220            �           2606    27220    pedido pedido_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    222            �           2606    27237    permisos permisos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.permisos
    ADD CONSTRAINT permisos_pkey PRIMARY KEY (id_permiso);
 @   ALTER TABLE ONLY public.permisos DROP CONSTRAINT permisos_pkey;
       public            postgres    false    224            �           2606    27196    persona persona_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public            postgres    false    218            �           2606    27158    productos productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    214            �           2606    27140    roles roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_rol);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    210            �           2606    27183    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    216            �           2606    27209 #   direccion direccion_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 M   ALTER TABLE ONLY public.direccion DROP CONSTRAINT direccion_id_usuario_fkey;
       public          postgres    false    3216    216    220            �           2606    27226    pedido pedido_id_persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_persona_fkey;
       public          postgres    false    218    3218    222            �           2606    27221    pedido pedido_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);
 H   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_producto_fkey;
       public          postgres    false    222    3214    214            �           2606    27238    permisos permisos_id_rol_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.permisos
    ADD CONSTRAINT permisos_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id_rol);
 G   ALTER TABLE ONLY public.permisos DROP CONSTRAINT permisos_id_rol_fkey;
       public          postgres    false    210    3210    224            �           2606    27197    persona persona_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_id_usuario_fkey;
       public          postgres    false    3216    218    216            �           2606    27159 %   productos productos_id_categoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria) ON UPDATE CASCADE;
 O   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_id_categoria_fkey;
       public          postgres    false    3212    214    212            �           2606    27184    usuario usuario_id_rol_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id_rol) ON UPDATE CASCADE;
 E   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_id_rol_fkey;
       public          postgres    false    3210    216    210            .      x������ � �      6      x������ � �      8      x������ � �      :      x������ � �      4      x������ � �      0      x������ � �      ,      x������ � �      2      x������ � �     