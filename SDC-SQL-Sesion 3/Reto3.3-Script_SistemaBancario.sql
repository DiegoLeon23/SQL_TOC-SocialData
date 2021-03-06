USE [Sistema_Bancario]
GO
/****** Object:  Table [cuotasCumplidas]    Script Date: 25/02/2021 16:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cuotasCumplidas](
	[id_cuotasCumplidas] [int] IDENTITY(1,1) NOT NULL,
	[id_detalle_registro] [int] NULL,
	[cuota_cumplida] [varchar](2) NULL,
	[date] [date] NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cuotasCumplidas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [detalle_registroDeudas]    Script Date: 25/02/2021 16:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [detalle_registroDeudas](
	[id_detalle_registro] [int] IDENTITY(1,1) NOT NULL,
	[id_registro] [int] NULL,
	[id_usuario] [int] NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle_registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [garantia]    Script Date: 25/02/2021 16:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [garantia](
	[id_garantia] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[detalle] [varchar](50) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_garantia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [modalidad]    Script Date: 25/02/2021 16:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [modalidad](
	[id_modalidad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](70) NULL,
	[detalle] [varchar](50) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_modalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [registroDeudas]    Script Date: 25/02/2021 16:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [registroDeudas](
	[id_registro] [int] IDENTITY(1,1) NOT NULL,
	[id_garantia] [int] NULL,
	[id_modalidad] [int] NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [revision_pagos]    Script Date: 25/02/2021 16:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [revision_pagos](
	[id_pagos] [int] IDENTITY(1,1) NOT NULL,
	[id_detalle_registro] [int] NULL,
	[cuota1] [int] NULL,
	[cuota2] [int] NULL,
	[cuota3] [int] NULL,
	[cuota4] [int] NULL,
	[cuota5] [int] NULL,
	[cuota6] [int] NULL,
	[cuota7] [int] NULL,
	[cuota8] [int] NULL,
	[cuota9] [int] NULL,
	[cuota10] [int] NULL,
	[cuota11] [int] NULL,
	[cuota12] [int] NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pagos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usuario]    Script Date: 25/02/2021 16:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[primerApellido] [varchar](50) NULL,
	[segundoApellido] [varchar](50) NULL,
	[nombres] [varchar](50) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [detalle_registroDeudas] ON 

INSERT [detalle_registroDeudas] ([id_detalle_registro], [id_registro], [id_usuario], [create_at], [update_at]) VALUES (1, 1, 1, CAST(N'2021-02-25T15:54:12.550' AS DateTime), CAST(N'2021-02-25T15:54:12.550' AS DateTime))
SET IDENTITY_INSERT [detalle_registroDeudas] OFF
SET IDENTITY_INSERT [garantia] ON 

INSERT [garantia] ([id_garantia], [descripcion], [detalle], [create_at], [update_at]) VALUES (1, N'Hipoteca', N'', CAST(N'2021-02-25T15:23:33.227' AS DateTime), CAST(N'2021-02-25T15:23:33.227' AS DateTime))
SET IDENTITY_INSERT [garantia] OFF
SET IDENTITY_INSERT [modalidad] ON 

INSERT [modalidad] ([id_modalidad], [descripcion], [detalle], [create_at], [update_at]) VALUES (1, N'Prestamo en cuotas', N'mensual x 1 año', CAST(N'2021-02-25T15:23:25.417' AS DateTime), CAST(N'2021-02-25T15:23:25.417' AS DateTime))
SET IDENTITY_INSERT [modalidad] OFF
SET IDENTITY_INSERT [registroDeudas] ON 

INSERT [registroDeudas] ([id_registro], [id_garantia], [id_modalidad], [create_at], [update_at]) VALUES (1, 1, 1, CAST(N'2021-02-25T15:23:43.467' AS DateTime), CAST(N'2021-02-25T15:23:43.467' AS DateTime))
SET IDENTITY_INSERT [registroDeudas] OFF
SET IDENTITY_INSERT [usuario] ON 

INSERT [usuario] ([id_usuario], [primerApellido], [segundoApellido], [nombres], [create_at], [update_at]) VALUES (1, N'Leon', N'Ortiz', N'Diego', CAST(N'2021-02-25T15:23:12.623' AS DateTime), CAST(N'2021-02-25T15:23:12.623' AS DateTime))
SET IDENTITY_INSERT [usuario] OFF
ALTER TABLE [cuotasCumplidas] ADD  DEFAULT ('NO') FOR [cuota_cumplida]
GO
ALTER TABLE [revision_pagos] ADD  DEFAULT ((0)) FOR [cuota1]
GO
ALTER TABLE [revision_pagos] ADD  DEFAULT ((0)) FOR [cuota2]
GO
ALTER TABLE [revision_pagos] ADD  DEFAULT ((0)) FOR [cuota3]
GO
ALTER TABLE [revision_pagos] ADD  DEFAULT ((0)) FOR [cuota4]
GO
ALTER TABLE [revision_pagos] ADD  DEFAULT ((0)) FOR [cuota5]
GO
ALTER TABLE [revision_pagos] ADD  DEFAULT ((0)) FOR [cuota6]
GO
ALTER TABLE [revision_pagos] ADD  DEFAULT ((0)) FOR [cuota7]
GO
ALTER TABLE [revision_pagos] ADD  DEFAULT ((0)) FOR [cuota8]
GO
ALTER TABLE [revision_pagos] ADD  DEFAULT ((0)) FOR [cuota9]
GO
ALTER TABLE [revision_pagos] ADD  DEFAULT ((0)) FOR [cuota10]
GO
ALTER TABLE [revision_pagos] ADD  DEFAULT ((0)) FOR [cuota11]
GO
ALTER TABLE [revision_pagos] ADD  DEFAULT ((0)) FOR [cuota12]
GO
ALTER TABLE [cuotasCumplidas]  WITH CHECK ADD FOREIGN KEY([id_detalle_registro])
REFERENCES [detalle_registroDeudas] ([id_detalle_registro])
GO
ALTER TABLE [detalle_registroDeudas]  WITH CHECK ADD FOREIGN KEY([id_registro])
REFERENCES [registroDeudas] ([id_registro])
GO
ALTER TABLE [detalle_registroDeudas]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [usuario] ([id_usuario])
GO
ALTER TABLE [registroDeudas]  WITH CHECK ADD FOREIGN KEY([id_garantia])
REFERENCES [garantia] ([id_garantia])
GO
ALTER TABLE [registroDeudas]  WITH CHECK ADD FOREIGN KEY([id_modalidad])
REFERENCES [modalidad] ([id_modalidad])
GO
ALTER TABLE [revision_pagos]  WITH CHECK ADD FOREIGN KEY([id_detalle_registro])
REFERENCES [detalle_registroDeudas] ([id_detalle_registro])
GO
