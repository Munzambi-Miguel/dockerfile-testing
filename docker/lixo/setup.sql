CREATE DATABASE [MomentosPlenaria]




USE [MomentosPlenaria]
GO
/****** Object:  Schema [MomentosPlenaria]    Script Date: 19/09/2023 09:46:16 ******/
CREATE SCHEMA [MomentosPlenaria]
GO
/****** Object:  Table [Autores]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Autores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[autor] [nvarchar](260) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cargos]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cargos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[designacao] [nvarchar](260) NULL,
	[outra_designacao] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Deputados]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Deputados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](220) NULL,
	[grupo_parlamentar_id] [int] NULL,
	[partido_id] [int] NULL,
	[email] [varchar](500) NOT NULL,
	[cargo_id] [bigint] NULL,
	[sexo_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Entidades]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Entidades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome_entidade] [nvarchar](120) NULL,
	[desig_entidade] [nvarchar](120) NULL,
	[tipoEntidade_id] [int] NULL,
	[funcao_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GrelhaTempo]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GrelhaTempo](
	[uuid] [varchar](250) NOT NULL,
	[designacao] [varchar](500) NULL,
	[reuniao_plenaria_uuid] [varchar](250) NULL,
	[total_minutes] [int] NULL,
	[order] [int] NULL,
 CONSTRAINT [GrelhaTempo_pk] PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GroupParlamentar]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GroupParlamentar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](250) NULL,
	[detalhes] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Legislatura]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Legislatura](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ordem_legislatura] [varchar](10) NULL,
	[ano_inicial] [int] NULL,
	[ano_final] [int] NULL,
	[sessao_atual] [int] NULL,
	[legislatura_atual] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [LinhasDocs]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LinhasDocs](
	[uuid] [varchar](max) NOT NULL,
	[status] [bit] NOT NULL,
	[ObjectJson] [varchar](max) NULL,
	[user_respo_id] [bigint] NULL,
	[user_respo_email] [varchar](250) NULL,
	[sherid_users] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [LinhasTempo]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LinhasTempo](
	[uuid] [varchar](250) NOT NULL,
	[entidade_name] [varchar](200) NULL,
	[entidade_id] [bigint] NULL,
	[order] [bigint] NULL,
	[grupo_parlamentar_id] [bigint] NULL,
	[partido_id] [bigint] NULL,
	[time] [varchar](20) NOT NULL,
	[tipo_id] [int] NULL,
	[contexto] [varchar](45) NULL,
	[tipo_entidade] [varchar](45) NULL,
	[parent_uuid] [varchar](250) NOT NULL,
	[genero] [varchar](45) NULL,
	[descricao] [varchar](max) NULL,
	[designacao] [varchar](250) NULL,
 CONSTRAINT [LinhasTempo_pk] PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [LinhasVotoIntervencao]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LinhasVotoIntervencao](
	[uuid] [varchar](250) NOT NULL,
	[afavor] [int] NULL,
	[contra] [int] NULL,
	[abstencao] [int] NULL,
	[contexto] [varchar](45) NULL,
	[entity_id] [bigint] NULL,
	[tipo_entidade] [varchar](45) NULL,
	[entity_name] [varchar](250) NULL,
	[parent_uuid] [varchar](250) NOT NULL,
	[interviram] [int] NULL,
	[grupo_parlamentar_id] [bigint] NULL,
	[grupo_parlamentar_name] [varchar](250) NULL,
	[order] [int] NULL,
 CONSTRAINT [votos_pk] PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MesaPresidio]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MesaPresidio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[deputado_id] [bigint] NULL,
	[prefixo_id] [bigint] NULL,
	[cargo_id] [bigint] NULL,
	[uuid] [varchar](max) NULL,
	[reuniao_plenario_uuid] [varchar](250) NULL,
	[order] [bigint] SPARSE  NULL,
	[cargo_text] [varchar](100) NULL,
 CONSTRAINT [MesaPresidio_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [OrdemDia]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrdemDia](
	[autor] [varchar](45) NULL,
	[notas] [nvarchar](max) NULL,
	[order] [int] NULL,
	[uuid] [varchar](250) NOT NULL,
	[reuniao_plenaria_uuid] [varchar](250) NULL,
	[parent_uuid] [varchar](250) NULL,
 CONSTRAINT [OrdemDia_pk] PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [OrdemTrabalho]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrdemTrabalho](
	[uuid] [varchar](250) NOT NULL,
	[reuniao_plenaria_uuid] [varchar](250) NULL,
	[contexto] [varchar](max) NULL,
	[parent_uuid] [varchar](250) NULL,
 CONSTRAINT [OrdemTrabalho_pk] PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Partidos]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Partidos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](250) NULL,
	[detalhes] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[grupo_parlamentar_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [PontoDebate]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PontoDebate](
	[uuid] [varchar](250) NOT NULL,
	[descricao] [varchar](max) NULL,
	[grelha_uuid] [varchar](250) NULL,
	[order] [int] NULL,
 CONSTRAINT [PontoDebate_pk] PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [PrefixoDesignacao]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PrefixoDesignacao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[designacao] [nvarchar](260) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [PresencaAuxiliar]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PresencaAuxiliar](
	[uuid] [varchar](250) NOT NULL,
	[order] [int] NOT NULL,
	[reuniaoplenaria_uuid] [varchar](250) NOT NULL,
	[nome] [nvarchar](250) NULL,
	[cargo] [nvarchar](250) NULL,
	[departamentoMinistrial] [nvarchar](250) NULL,
	[observacoes] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Requerimento]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Requerimento](
	[uuid] [varchar](250) NOT NULL,
	[reuniaoplenaria_uuid] [varchar](250) NOT NULL,
	[autor] [varchar](100) NULL,
	[total_intervencoes] [int] NULL,
	[total_votos_favor] [int] NULL,
	[total_votos_contra] [int] NULL,
	[total_abstencoes] [int] NULL,
	[notas] [nvarchar](max) NULL,
	[notas_intervencoes] [nvarchar](250) NULL,
	[tipo_entidade] [varchar](30) NULL,
	[voto_observacao] [varchar](250) NULL,
	[contexto] [varchar](250) NULL,
	[autor_id] [bigint] NULL,
	[parent_uuid] [varchar](250) NULL,
	[title] [varchar](100) NULL,
	[tipo_contexto_text] [varchar](100) NULL,
	[order] [int] NULL,
	[tipo_context_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ReuniaoPlenaria]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ReuniaoPlenaria](
	[uuid] [varchar](250) NOT NULL,
	[legislatura_id] [int] NOT NULL,
	[sessao_legislativa] [int] NOT NULL,
	[ordem_reuniao] [int] NOT NULL,
	[data_reuniao] [datetime2](0) NULL,
	[hora_inicio] [datetime2](0) NULL,
	[hora_termo] [datetime2](0) NULL,
	[deput_present_inicio] [int] NULL,
	[deput_present_termo] [int] NULL,
	[data_prox_reuniao] [datetime2](0) NULL,
	[decl_politica_ok] [bit] NULL,
	[ordem_dia_ok] [bit] NULL,
	[ordem_trabalho_ok] [bit] NULL,
	[presenc_aux_ok] [bit] NULL,
	[presenc_civ_ok] [bit] NULL,
	[tipo_reuniao] [int] NULL,
	[req_ok] [bit] NULL,
	[order] [bigint] NULL,
	[relatorio_analitico] [varchar](10) NULL,
	[num_doc] [int] IDENTITY(1,1) NOT NULL,
	[introducao] [varchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[urlPdf] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ReuniaoPlenaria_pk] UNIQUE NONCLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TipoIntervencao]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TipoIntervencao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [nvarchar](100) NULL,
	[contaTempo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [TipoRequerimento]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TipoRequerimento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[designacao] [varchar](250) NULL,
 CONSTRAINT [TipoRequerimento_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [TipoReuniao]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TipoReuniao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipoReuniao] [varchar](100) NULL,
 CONSTRAINT [PK_MomentosPlenaria.TipoReuniao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [TomadaDePosse]    Script Date: 19/09/2023 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TomadaDePosse](
	[uuid] [varchar](250) NOT NULL,
	[order] [int] NOT NULL,
	[reuniaoplenaria_uuid] [varchar](250) NOT NULL,
	[nome] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ReuniaoPlenaria] ADD  CONSTRAINT [DF_ReuniaoPlenaria_decl_politica_ok]  DEFAULT ((0)) FOR [decl_politica_ok]
GO
ALTER TABLE [ReuniaoPlenaria] ADD  CONSTRAINT [DF_ReuniaoPlenaria_ordem_dia_ok]  DEFAULT ((0)) FOR [ordem_dia_ok]
GO
ALTER TABLE [ReuniaoPlenaria] ADD  CONSTRAINT [DF_ReuniaoPlenaria_ordem_trabalho_ok]  DEFAULT ((0)) FOR [ordem_trabalho_ok]
GO
ALTER TABLE [ReuniaoPlenaria] ADD  CONSTRAINT [DF_ReuniaoPlenaria_presenc_aux_ok]  DEFAULT ((0)) FOR [presenc_aux_ok]
GO
ALTER TABLE [ReuniaoPlenaria] ADD  CONSTRAINT [DF_ReuniaoPlenaria_presenc_civ_ok]  DEFAULT ((0)) FOR [presenc_civ_ok]
GO
ALTER TABLE [GrelhaTempo]  WITH CHECK ADD  CONSTRAINT [GrelhaTempo_ReuniaoPlenaria__uuid_fk] FOREIGN KEY([reuniao_plenaria_uuid])
REFERENCES [ReuniaoPlenaria] ([uuid])
GO
ALTER TABLE [GrelhaTempo] CHECK CONSTRAINT [GrelhaTempo_ReuniaoPlenaria__uuid_fk]
GO
ALTER TABLE [MesaPresidio]  WITH CHECK ADD  CONSTRAINT [MesaPresidio_ReuniaoPlenaria__uuid_fk] FOREIGN KEY([reuniao_plenario_uuid])
REFERENCES [ReuniaoPlenaria] ([uuid])
GO
ALTER TABLE [MesaPresidio] CHECK CONSTRAINT [MesaPresidio_ReuniaoPlenaria__uuid_fk]
GO
ALTER TABLE [OrdemDia]  WITH CHECK ADD  CONSTRAINT [OrdemDia_OrdemDia__uuid_fk] FOREIGN KEY([parent_uuid])
REFERENCES [OrdemDia] ([uuid])
GO
ALTER TABLE [OrdemDia] CHECK CONSTRAINT [OrdemDia_OrdemDia__uuid_fk]
GO
ALTER TABLE [OrdemDia]  WITH CHECK ADD  CONSTRAINT [OrdemDia_ReuniaoPlenaria__uuid_fk] FOREIGN KEY([reuniao_plenaria_uuid])
REFERENCES [ReuniaoPlenaria] ([uuid])
GO
ALTER TABLE [OrdemDia] CHECK CONSTRAINT [OrdemDia_ReuniaoPlenaria__uuid_fk]
GO
ALTER TABLE [OrdemTrabalho]  WITH CHECK ADD  CONSTRAINT [OrdemTrabalho_OrdemTrabalho__uuid_fk] FOREIGN KEY([parent_uuid])
REFERENCES [OrdemTrabalho] ([uuid])
GO
ALTER TABLE [OrdemTrabalho] CHECK CONSTRAINT [OrdemTrabalho_OrdemTrabalho__uuid_fk]
GO
ALTER TABLE [OrdemTrabalho]  WITH CHECK ADD  CONSTRAINT [OrdemTrabalho_ReuniaoPlenaria__uuid_fk] FOREIGN KEY([reuniao_plenaria_uuid])
REFERENCES [ReuniaoPlenaria] ([uuid])
GO
ALTER TABLE [OrdemTrabalho] CHECK CONSTRAINT [OrdemTrabalho_ReuniaoPlenaria__uuid_fk]
GO
ALTER TABLE [PresencaAuxiliar]  WITH CHECK ADD  CONSTRAINT [PresencaAuxiliar_ReuniaoPlenaria__uuid_fk] FOREIGN KEY([reuniaoplenaria_uuid])
REFERENCES [ReuniaoPlenaria] ([uuid])
GO
ALTER TABLE [PresencaAuxiliar] CHECK CONSTRAINT [PresencaAuxiliar_ReuniaoPlenaria__uuid_fk]
GO
ALTER TABLE [Requerimento]  WITH CHECK ADD  CONSTRAINT [Requerimento_ReuniaoPlenaria__uuid_fk] FOREIGN KEY([reuniaoplenaria_uuid])
REFERENCES [ReuniaoPlenaria] ([uuid])
GO
ALTER TABLE [Requerimento] CHECK CONSTRAINT [Requerimento_ReuniaoPlenaria__uuid_fk]
GO
ALTER TABLE [ReuniaoPlenaria]  WITH CHECK ADD  CONSTRAINT [fk_ReuniaoPlenaria_Legislatura1] FOREIGN KEY([legislatura_id])
REFERENCES [Legislatura] ([id])
GO
ALTER TABLE [ReuniaoPlenaria] CHECK CONSTRAINT [fk_ReuniaoPlenaria_Legislatura1]
GO
ALTER TABLE [ReuniaoPlenaria]  WITH CHECK ADD  CONSTRAINT [ReuniaoPlenaria_TipoReuniao__id_fk] FOREIGN KEY([tipo_reuniao])
REFERENCES [TipoReuniao] ([id])
GO
ALTER TABLE [ReuniaoPlenaria] CHECK CONSTRAINT [ReuniaoPlenaria_TipoReuniao__id_fk]
GO
ALTER TABLE [TipoReuniao]  WITH CHECK ADD  CONSTRAINT [FK_MomentosPlenaria.TipoReuniao_MomentosPlenaria.TipoReuniao] FOREIGN KEY([id])
REFERENCES [TipoReuniao] ([id])
GO
ALTER TABLE [TipoReuniao] CHECK CONSTRAINT [FK_MomentosPlenaria.TipoReuniao_MomentosPlenaria.TipoReuniao]
GO
ALTER TABLE [TomadaDePosse]  WITH CHECK ADD  CONSTRAINT [TomadaDePosse_ReuniaoPlenaria__uuid_fk] FOREIGN KEY([reuniaoplenaria_uuid])
REFERENCES [ReuniaoPlenaria] ([uuid])
GO
ALTER TABLE [TomadaDePosse] CHECK CONSTRAINT [TomadaDePosse_ReuniaoPlenaria__uuid_fk]
GO
