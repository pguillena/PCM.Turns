USE [db_pcm_gob_pe_turn]
GO
/****** Object:  UserDefinedTableType [dbo].[dtAppointment]    Script Date: 7/10/2019 09:06:10 ******/
CREATE TYPE [dbo].[dtAppointment] AS TABLE(
	[CodeAppointment] [int] NULL,
	[CodePeople] [int] NULL,
	[CodeSchedule] [int] NULL,
	[CodeServAttenCenter] [int] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELIMINAR]
(
	@CodeEntity INT ,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	update Entity set State=0,RegistryUser=@RegistryUser,RegistryDate=GETDATE() where CodeEntity=@CodeEntity;
	RETURN 1;
END;



GO
/****** Object:  StoredProcedure [dbo].[sp_AttentionCenter_Entidad]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
-- Exec dbo.usp_ListarServiciosComboAppointment
-- DROP PROCEDURE dbo.usp_ListarServiciosComboAppointment
--===========================================================================================
CREATE PROCEDURE [dbo].[sp_AttentionCenter_Entidad]
@CodeEntity			 INT
AS
BEGIN
   SET NOCOUNT ON
	

	select s.CodeService,convert(varchar(300),S.Description,120) DescriptionService
	from Service s
	inner join ServiceAttentionCenter sa on sa.CodeService = s.CodeService and sa.State = 1
	inner join AttentionCenter ac on ac.CodeAttentionCenter = sa.CodeAttentionCenter and ac.State = 1
	inner join Entity_AttentionCenter eac on eac.CodeAttentionCenter = ac.CodeAttentionCenter and eac.State = 1
	inner join Entity e on e.CodeEntity = eac.CodeEntity and e.State = 1
	where e.CodeEntity = @CodeEntity 
	group by s.CodeService,s.Description;

   SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCita]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
-- Exec dbo.sp_InsertarCita  '43171962'
-- DROP PROCEDURE dbo.sp_InsertarCita
--===========================================================================================
CREATE PROCEDURE [dbo].[sp_InsertarCita]
  @tpmAppointmentEntity dbo.dtAppointment  READONLY

AS
BEGIN
   SET NOCOUNT ON
   SET DATEFORMAT dmy
   SET DATEFIRST 1

SELECT * INTO #tpmAppointmentEntity FROM @tpmAppointmentEntity 

 
   --SELECT @variable=dato FROM tabla
   DECLARE  
    @vCodePeople            INT,	
	@vCodeSchedule			INT,	
	@vCodeServAttenCenter	INT,
	@vCodetypeAttention		INT,
	@vCodeState				INT,
	@vContActivityExist     INT,
	@VALOR					INT,
	@NumRegistros			INT,
	@i						INT,
	@vCodeActivity			INT,
	@vDni					VARCHAR(50),
	@FirstName				VARCHAR(50),
	@FirstLastName			VARCHAR(50),
	@SecondLastName			VARCHAR(50),
	@Email					VARCHAR(50),
	@Telephone				VARCHAR(50)
		

	BEGIN TRANSACTION -- O solo BEGIN TRAN
	BEGIN TRY

	SET @NumRegistros=(SELECT COUNT(1) FROM #tpmAppointmentEntity)
	SET @i=0	

 WHILE @i<=@NumRegistros
  BEGIN
   SELECT @vCodePeople = CodePeople, @vCodeState = 0, @vContActivityExist =0 from Appointment ap 

	SELECT @vContActivityExist = Count(*)
	from  Appointment apo
	inner join People peo on peo.CodePeople = apo.CodePeople and peo.State = '1'
	WHERE apo.state = 1 and apo.AppointmentDate >=  cast(getdate() As Date) and peo.Dni = @vDni;

	IF (@vContActivityExist = 0) 
		BEGIN	
			IF ((SELECT COUNT(*) FROM People where Dni= @vDni) > 0)
				BEGIN
					SELECT @vCodePeople = CodePeople FROM People where Dni = @vDni--@DescriptionDocumentType

					INSERT INTO Appointment
					(CodePeople,CodeSchedule,CodeServAttenCenter,CodetypeAttention, CodeState, RegistryUser, RegistryDate)
					VALUES (@vCodePeople,@vCodeSchedule,@vCodeServAttenCenter, 1,1, 'System', GETDATE());
					
					UPDATE Activity
					SET EndQuota = EndQuota + 1
					WHERE CodeActivity = @vCodeActivity and State = '1' and Available = 1;
					
					IF ((SELECT COUNT(*) FROM Activity WHERE State = '1' and
						CodeState = 1 and (StartQuota-EndQuota)=0 and CodeActivity = @vCodeActivity) > 0)
						BEGIN
							UPDATE Activity
							SET Available = 0
							WHERE CodeActivity = @vCodeActivity and State = '1';
													
							SET @VALOR=1;--CITA RESERVADA CON EXITO				
						END
					ELSE
						BEGIN										
							SET @VALOR=1;--CITA RESERVADA CON EXITO							
						END
				END
			ELSE
				BEGIN

					INSERT INTO People
					(Dni, FirstName, FirstLastName, SecondLastName, Email, Telephone, RegistryUser, RegistryDate)
					VALUES (@vDni,@FirstName,@FirstLastName,@SecondLastName,@Email ,@Telephone, 'SYSTEM', GETDATE());

					SELECT @vCodePeople = CodePeople FROM People where Dni = @vDni;

					INSERT INTO Appointment
					(CodePeople,CodeSchedule,CodeServAttenCenter,CodetypeAttention, CodeState, RegistryUser, RegistryDate)
					VALUES (@vCodePeople,@vCodeSchedule,@vCodeServAttenCenter, 1,1, 'System', GETDATE());
					
					UPDATE Activity
					SET EndQuota = EndQuota + 1
					WHERE CodeActivity = @vCodeActivity and State = '1' and Available = 1;
					
					IF ((SELECT COUNT(*) FROM Activity WHERE State = '1' and
						CodeState = 1 and (StartQuota-EndQuota)=0 and CodeActivity = @vCodeActivity) > 0)
						BEGIN
							UPDATE Activity
							SET Available = 0
							WHERE CodeActivity = @vCodeActivity and State = '1';							
						
							SET @VALOR=1;--CITA RESERVADA CON EXITO						

						END
					ELSE
						BEGIN							
							SET @VALOR=1;--CITA RESERVADA CON EXITO			
						END
				END

		END 
	ELSE
		BEGIN
			SET @VALOR=2;--LA PERSONA YA TIENE CITA RESERVADA
		END

	SET @i+=1

	
 END
 SELECT @VALOR;
 COMMIT;

	END TRY

	BEGIN CATCH

	/* Hay un error, deshacemos los cambios*/ 

	ROLLBACK TRANSACTION -- O solo ROLLBACK

	PRINT 'SE HA PRODUCIDO UN ERROR!'
	RETURN 0
	END CATCH
	

	select *from #tpmAppointmentEntity;

   SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarBanner]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarBanner](
	@Description VARCHAR(200),
	@RegistryUser VARCHAR(200),
	@CodeBanner INT
)AS
BEGIN
	BEGIN TRANSACTION 
		BEGIN TRY
			DECLARE  @registrosafectados int = 0;
			UPDATE Banner 
				SET BannerName=UPPER(@Description)			
			WHERE CodeBanner=@CodeBanner;

			SET @registrosafectados = @@ROWCOUNT;
			SELECT @registrosafectados;
			COMMIT;
		END TRY
		BEGIN CATCH	
			ROLLBACK TRANSACTION
			SET @registrosafectados=-1;
			SELECT @registrosafectados;
		END CATCH
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarCentroAtencion]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarCentroAtencion](
  @Description  VARCHAR(250),  
  @RegistryUser VARCHAR(200),
  @CodeAttentionCenter INT
)AS
BEGIN
	BEGIN TRANSACTION 
	BEGIN TRY
		
		--IF (UPPER(@Description)<>(SELECT UPPER(ac.Description) FROM AttentionCenter ac WHERE ac.CodeAttentionCenter=@CodeAttentionCenter AND State='1'))
		IF NOT EXISTS (SELECT * FROM AttentionCenter WHERE UPPER(Description)=UPPER(@Description) AND State='1' )
		BEGIN
			DECLARE  @registrosafectados int = 0;
			UPDATE AttentionCenter 
				SET Description=@Description		
			WHERE CodeAttentionCenter=@CodeAttentionCenter;
			SET @registrosafectados = @@ROWCOUNT;			
		END
		ELSE
		BEGIN
			SET @registrosafectados = 0;
		END
		SELECT @registrosafectados;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH	
		ROLLBACK TRANSACTION
		SET @registrosafectados=-1;
		SELECT @registrosafectados;
	END CATCH
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarEntidad]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarEntidad](
  @Description  VARCHAR(250),
  @Abbreviation VARCHAR(250),
  @RegistryUser VARCHAR(200),
  @CodeEntity INT
)AS
BEGIN
	BEGIN TRANSACTION 
	BEGIN TRY
		DECLARE  @registrosafectados int = 0;
		UPDATE Entity 
			SET Description=UPPER(@Description),
			Abreviation=@Abbreviation
		WHERE CodeEntity=@CodeEntity;

		SET @registrosafectados = @@ROWCOUNT;
		SELECT @registrosafectados;
		COMMIT;
	END TRY
	BEGIN CATCH	
		ROLLBACK TRANSACTION
		SET @registrosafectados=-1;
		SELECT @registrosafectados;
	END CATCH
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarServicio]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarServicio](
	@CodeService INT,
	@CodeTypeService INT,
	@Description VARCHAR(250),
	@RegistryUser VARCHAR(250)
)AS
BEGIN
	BEGIN TRANSACTION 
	BEGIN TRY

		DECLARE @registrosafectados int = 0;
		UPDATE  Service
			SET Description=@Description,
			CodeTypeService=@CodeTypeService 
		WHERE CodeService=@CodeService;
		
		SET @registrosafectados = @@ROWCOUNT;
		SELECT @registrosafectados;
			COMMIT;
		END TRY
	BEGIN CATCH	
		ROLLBACK TRANSACTION
		SET @registrosafectados=-1;
		SELECT @registrosafectados;
	END CATCH

END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarTipoTicket]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarTipoTicket](
	@Description VARCHAR(250),
	@RegistryUser VARCHAR(250),
	@Priority INT,
	@CodeTicketType INT,
	@IsPreferential BIT
)AS
BEGIN
	DECLARE @registrosafectados int;
	IF (@Description=(SELECT Description FROM TicketType WHERE CodeTicketType=@CodeTicketType AND State='1')) 
	BEGIN
		UPDATE  TicketType
			SET Description=UPPER(@Description),
			Priority=@Priority,
			IsPreferential=@IsPreferential
		WHERE CodeTicketType=@CodeTicketType;
		SET @registrosafectados = @@ROWCOUNT;
	END
	ELSE
	BEGIN	
		IF NOT EXISTS(SELECT 1 FROM TicketType WHERE UPPER(Description)=@Description AND State='1') 
		BEGIN
			UPDATE  TicketType
			SET Description=UPPER(@Description),
			Priority=@Priority 
			WHERE CodeTicketType=@CodeTicketType;
			SET @registrosafectados = @@ROWCOUNT;
		END
		ELSE
		BEGIN
			SET @registrosafectados=0;
		END;		
	END	
	SELECT @registrosafectados;
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarVentanilla]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarVentanilla](
	@Description VARCHAR(200),
	@RegistryUser VARCHAR(200),
	@CodeWindow INT,
	@CodeZone INT 
)AS
BEGIN
	BEGIN TRANSACTION 
	BEGIN TRY
		DECLARE  @registrosafectados int = 0;
		UPDATE Window 
			SET WindowName=UPPER(@Description)	,
			CodeZone=@CodeZone		
		WHERE CodeWindow=@CodeWindow;

		SET @registrosafectados = @@ROWCOUNT;
		SELECT @registrosafectados;
		COMMIT;
	END TRY
	BEGIN CATCH	
		ROLLBACK TRANSACTION
		SET @registrosafectados=-1;
		SELECT @registrosafectados;
	END CATCH
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarZona]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarZona]
(
	@Description VARCHAR(200),
	@RegistryUser VARCHAR(200),
	@CodeZone INT

)AS
BEGIN
		BEGIN TRANSACTION 
		BEGIN TRY
			DECLARE  @registrosafectados int = 0;
			UPDATE Zone 
				SET ZoneName=UPPER(@Description)			
			WHERE CodeZone=@CodeZone;

			SET @registrosafectados = @@ROWCOUNT;
			SELECT @registrosafectados;
			COMMIT;
		END TRY
		BEGIN CATCH	
			ROLLBACK TRANSACTION
			SET @registrosafectados=-1;
			SELECT @registrosafectados;
		END CATCH
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_Autocompletar(prueba)]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXECUTE usp_Autocompletar 8,'BA',1
CREATE PROCEDURE [dbo].[usp_Autocompletar(prueba)](
	@piiMaxFilas int=0, 
	@psiEmpezarCon varchar(30)='',
	@piiFlag INT		

)AS
BEGIN
	IF(@piiFlag=1) 
	BEGIN
		SELECT TOP (@piiMaxFilas) e.CodeEntity AS Id, e.Description Valor FROM Entity  e  
		WHERE e.State ='1' AND e.Description LIKE '%'+ @psiEmpezarCon + '%'; 
	END;
	--IF(@piiFlag=2)
	--BEGIN
	--	SELECT TOP (@piiMaxFilas) ser.CodeService AS Id, ser.Description Valor FROM Service ser  
	--	WHERE ser.State ='1' AND ser.Description LIKE '%'+ @psiEmpezarCon + '%'; 
	--END;
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_CurrentRow]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CurrentRow](
	@FLAG INT,
	@ID INT
)AS
BEGIN
	IF(@FLAG=1) --lista una fila de entidad
	BEGIN
		SELECT CodeEntity,Description,Abreviation FROM Entity WHERE State='1' AND CodeEntity=@ID;				
	END;
	IF(@FLAG=2) --lista una fila de servicio
	BEGIN
		--SELECT CodeService,Description FROM Service WHERE State='1' AND CodeService=@ID;
		select CodeService,Description,ts.NameTypeService,ts.CodeTypeService from Service se inner join TypeService  ts on se.CodeTypeService=ts.CodeTypeService 
		where se.State = '1' AND CodeService=@ID;
	END;
	IF(@FLAG=3)
	BEGIN
		SELECT at.CodeAttentionCenter,at.Description FROM AttentionCenter at WHERE at.State=1 AND at.CodeAttentionCenter=@ID;
	END;	

	IF(@FLAG=4)
	BEGIN
		SELECT zo.CodeZone,zo.ZoneName,zo.CodeAttentionCenter FROM Zone zo WHERE zo.State=1 AND zo.CodeZone=@ID;
	END;

	IF(@FLAG=5)
	BEGIN
		SELECT ba.CodeBanner,ba.BannerName FROM Banner ba WHERE ba.State=1 AND ba.CodeBanner=@ID;
	END;

	IF(@FLAG=6)
	BEGIN
		SELECT wi.CodeWindow,wi.WindowName,wi.CodeZone FROM Window wi WHERE wi.State=1 AND wi.CodeWindow=@ID;
	END;

	IF(@FLAG=7)
	BEGIN
		SELECT tt.CodeTicketType,tt.Description,tt.Priority,tt.IsPreferential FROM TicketType tt WHERE tt.State=1 AND tt.CodeTicketType=@ID;
	END;

END;



GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarBanner]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarBanner]
(
	@CodeBanner INT,
	@RegistryUser VARCHAR(200)

)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE Banner
		SET State='0'
	WHERE CodeBanner=@CodeBanner;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;

END;



GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCentroAtencion]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EliminarCentroAtencion](
	@CodeAttentionCenter INT,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE AttentionCenter
		SET State='0'
	WHERE CodeAttentionCenter=@CodeAttentionCenter;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarEntidad]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarEntidad](
	@CodeEntity INT,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE Entity
		SET State='0'
	WHERE CodeEntity=@CodeEntity;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarSevicio]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarSevicio]
(
	@CodeServicio INT,
	@RegistryUser VARCHAR(250)
)
AS
BEGIN
	DECLARE @registrosafectados int = 0;
	UPDATE Service
	SET State='0'
	WHERE CodeService=@CodeServicio;

	SET @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;




GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarTipoTicket]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarTipoTicket](
	@CodeTicketType INT,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE TicketType
		SET State='0'
	WHERE CodeTicketType=@CodeTicketType;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarWindow]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarWindow]
(
	@CodeWindow INT,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE Window
		SET State='0'
	WHERE CodeWindow=@CodeWindow;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarZona]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarZona]
(
	@CodeZone INT,
	@RegistryUser VARCHAR(200)	
)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE Zone
		SET State='0'
	WHERE CodeZone=@CodeZone;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarActividadxIdCalendar]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
-- Exec dbo.[usp_ListarActividadxIdCalendar] 1,1
-- DROP PROCEDURE dbo.[usp_ListarActividadxIdCalendar]
--===========================================================================================
CREATE PROCEDURE [dbo].[usp_ListarActividadxIdCalendar](
@CodeService INT,
@CodeAttentionCenter INT
)
AS
BEGIN
   SET NOCOUNT ON
	
	SELECT act.CodeActivity,sch.Description DescriptionActivity,sch.CodeSchedule, act.ActivityDate,
	convert(varchar(20),act.ActivityDate,23) + ' ' + convert(varchar(20),sch.StartTime,8) StartTime,
	convert(varchar(20),act.ActivityDate,23) + ' ' + convert(varchar(20),sch.EndTime,8) EndTime,sa.CodeAttentionCenter,
	act.StartQuota,act.Available,(act.StartQuota-act.EndQuota) Quota
	from Activity act 
	inner join Schedule sch ON act.CodeSchedule=sch.CodeSchedule 
	inner join ServiceAttentionCenter sa on sa.CodeServAttenCenter = act.CodeServAttenCenter and sa.State = 1
	WHERE act.state = '1' and sa.CodeService = @CodeService and sa.CodeAttentionCenter = @CodeAttentionCenter 
	and act.ActivityDate >=  cast(getdate() As Date);

   SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarBanner]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--execute usp_ListarBanner 10,1,'CodeBanner','DESC'
CREATE PROCEDURE [dbo].[usp_ListarBanner]
(
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4)
	--@psiIdServicio INT,
	--@psiIdTipoServicio INT
)
AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int


	SET @RecordCount = (SELECT COUNT(CodeBanner) FROM Banner WHERE State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select ba.CodeBanner,ba.BannerName,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Banner ba where ba.State=1) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;


--where 
--	1= case when '+ CAST(@psiIdServicio AS VARCHAR(5)) + '= -1 THEN 1  WHEN se.CodeService = '+ CAST(@psiIdServicio AS VARCHAR(5)) + ' THEN 1 END AND
--		  1= case when '+ CAST(@psiIdTipoServicio AS VARCHAR(5)) + '= -1 THEN 1  WHEN ts.CodeTypeService = '+ CAST(@psiIdTipoServicio AS VARCHAR(5)) + ' THEN 1 END 
--	AND 
--	se.State=1) AS F'



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCentroAtencion]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXECUTE usp_ListarCentroAtencion  10,2,'CodeAttentionCenter','ASC',-1

CREATE PROCEDURE [dbo].[usp_ListarCentroAtencion]
(
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4),
	@psiCbxCentroAtencion INT
)
AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int


	SET @RecordCount = (SELECT COUNT(CodeAttentionCenter) FROM AttentionCenter WHERE State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
	--print @PageCount
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  
	FROM (select ca.CodeAttentionCenter,ca.Description,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from AttentionCenter ca 
	WHERE ca.State=1 AND 1=CASE WHEN  ca.CodeAttentionCenter = '+ CAST(@psiCbxCentroAtencion AS VARCHAR(5)) + '  THEN 1 
								WHEN '+ CAST(@psiCbxCentroAtencion AS VARCHAR(5)) + ' =-1 THEN 1 END
	) AS F'
  
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCentroAtencionxServicioCombo]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
-- Exec dbo.usp_ListarCentroAtencionxServicioCombo 1
-- DROP PROCEDURE dbo.usp_ListarEntidadxServicioCombo
--===========================================================================================
CREATE PROCEDURE [dbo].[usp_ListarCentroAtencionxServicioCombo](
@CodeService INT
)
AS
BEGIN
   SET NOCOUNT ON
   
	select ac.CodeAttentionCenter,convert(varchar(300),ac.Description,120) DescriptionAttentionCenter
	from AttentionCenter ac
	inner join ServiceAttentionCenter sa on sa.CodeAttentionCenter = ac.CodeAttentionCenter and sa.State = 1
	inner join Service s on s.CodeService = sa.CodeService and ac.State = 1
	where s.CodeService = @CodeService and ac.State = 1
	group by ac.CodeAttentionCenter,ac.Description;

   SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCombo]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ListarCombo](
	@flag INT
)
AS
BEGIN
	IF(@flag=1) 
		--SELECT CodeService,Description FROM Service ser WHERE ser.State=1;
		SELECT CodeService,Description,ts.NameTypeService FROM Service ser inner join TypeService ts on ser.CodeTypeService=ts.CodeTypeService  WHERE ser.State='1' AND ts.State='1';

	IF(@flag=2) 
		SELECT CodeAttentionCenter,Description FROM AttentionCenter ac WHERE ac.State='1';
	
	IF(@flag=3) 
		select CodeTypeService,NameTypeService from TypeService where State='1';

	IF(@flag=4) 
		select CodeEntity,Description from Entity where State='1';

	IF(@flag=5) 
		select zo.CodeZone,zo.ZoneName,ca.Description from Zone zo inner join AttentionCenter ca on zo.CodeAttentionCenter=ca.CodeAttentionCenter where zo.State='1' and ca.State='1';

	IF(@flag=6) 
		select CodeWindow,WindowName from Window where State='1';

	IF(@flag=7) 
	select CodeVideo,VideoName from Video where State='1';

	IF(@flag=8) 
	select CodeTicketType,Description from TicketType where State='1';
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarEntidades]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute usp_ListarEntidades 10,2,'[Order]','asc',-1;
CREATE PROCEDURE [dbo].[usp_ListarEntidades](
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4),
	@psidDescripcion INT
)
AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int


	SET @RecordCount = (select count(CodeEntity) from Entity where State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select RowOrder,CodeEntity,Description,Abreviation,UrlLogo,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Entity 
	where State = '+ CAST(1 AS VARCHAR(1)) + ' AND  
	1= case when '+ CAST(@psidDescripcion AS VARCHAR(5)) + '= -1 THEN 1  WHEN CodeEntity = '+ CAST(@psidDescripcion AS VARCHAR(5)) + ' THEN 1 END
	) AS F'
    print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;




GO
/****** Object:  StoredProcedure [dbo].[usp_ListarEntidadxServicio]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--execute usp_ListarEntidadxServicio 10,1,'CodeService','DESC',10
CREATE PROCEDURE [dbo].[usp_ListarEntidadxServicio](
	@pstrPagHasta INT,
	@pstrPagDesde INT,
	@psiSortColumn VARCHAR(200),
	@psiSortOrder VARCHAR(200),
	@psCodeEntity INT

)AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int


	SET @RecordCount = (SELECT COUNT(CodeService) FROM ServiceEntity WHERE State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select DISTINCT se.CodeEntity,se.CodeService,s.Description, ta.NameTypeService,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from ServiceEntity se inner join Service s on se.CodeService=s.CodeService
					inner join TypeService ta on ta.CodeTypeService=s.CodeTypeService where se.State=1 and s.State=1 and ta.State=1
					AND se.CodeEntity='+CAST(@psCodeEntity AS VARCHAR(10))+'
	) AS F'
    print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)

END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarServicioEntidad]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute usp_ListarServicioEntidad 10,1,'CodeEntity','DESC';
CREATE PROCEDURE [dbo].[usp_ListarServicioEntidad](
	@pstrPagHasta INT,
	@pstrPagDesde INT,
	@psiSortColumn VARCHAR(250),
	@psiSortOrder VARCHAR(250)
)AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int


	SET @RecordCount = (SELECT COUNT(e.CodeEntity) FROM Entity e inner join ServiceEntity se on e.CodeEntity=se.CodeEntity where se.State='1' AND e.State='1')
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1;   

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select  distinct e.CodeEntity,e.Description,e.Abreviation,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Entity e inner join ServiceEntity se on e.CodeEntity=se.CodeEntity where se.State=1 AND e.State=1) AS F'
    print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)

END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarServicios]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute usp_ListarServicios 10,1,'CodeService','DESC',1,2;
CREATE PROCEDURE [dbo].[usp_ListarServicios](
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4),
	@psiIdServicio INT,
	@psiIdTipoServicio INT
)
AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int


	SET @RecordCount = (SELECT COUNT(CodeService) FROM Service WHERE State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select CodeService,Description,ts.NameTypeService,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Service se inner join TypeService  ts on se.CodeTypeService=ts.CodeTypeService 
	where 1= case when '+ CAST(@psiIdServicio AS VARCHAR(5)) + '= -1 THEN 1  WHEN se.CodeService = '+ CAST(@psiIdServicio AS VARCHAR(5)) + ' THEN 1 END AND
		  1= case when '+ CAST(@psiIdTipoServicio AS VARCHAR(5)) + '= -1 THEN 1  WHEN ts.CodeTypeService = '+ CAST(@psiIdTipoServicio AS VARCHAR(5)) + ' THEN 1 END 
	AND se.State=1) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarServiciosComboAppointment]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
-- Exec dbo.usp_ListarServiciosComboAppointment
-- DROP PROCEDURE dbo.usp_ListarServiciosComboAppointment
--===========================================================================================
CREATE PROCEDURE [dbo].[usp_ListarServiciosComboAppointment]
AS
BEGIN
   SET NOCOUNT ON

	select s.CodeService,convert(varchar(300),S.Description,120) DescriptionService
	from Service s
	inner join ServiceAttentionCenter sa on sa.CodeService = s.CodeService and sa.State = 1
	inner join AttentionCenter ac on ac.CodeAttentionCenter = sa.CodeAttentionCenter and ac.State = 1
	group by s.CodeService,s.Description;

   SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarTipoDocumento]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
-- Exec dbo.usp_ListarTipoDocumento
-- DROP PROCEDURE dbo.usp_ListarTipoDocumento
--===========================================================================================
CREATE PROCEDURE [dbo].[usp_ListarTipoDocumento]
AS
BEGIN
   SET NOCOUNT ON

  select CodeDocumentType,convert(varchar(300),Description,120) DescriptionDocumentType from DocumentType;

   SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarTipoTicket]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE usp_ListarTipoTicket 10,1,'CodeTicketType','DESC',-1,3;
CREATE PROCEDURE [dbo].[usp_ListarTipoTicket](
	@pstrPagHasta INT,
	@pstrPagDesde INT,
	@psiSortColumn VARCHAR(200),
	@psiSortOrder VARCHAR(200),
	@psiTipoTicket INT,
	@psiPrioridad  INT
)AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int

	SET @RecordCount = (select count(CodeTicketType) from TicketType where State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select TT.CodeTicketType,TT.Description,TT.Priority ,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from TicketType TT where TT.State =1
	AND 1=CASE WHEN '+CAST(@psiTipoTicket AS VARCHAR(5))+'=-1 THEN 1 WHEN TT.CodeTicketType='''+CAST(@psiTipoTicket AS VARCHAR(5))+''' THEN 1 END
	AND 1=CASE WHEN '+CAST(@psiPrioridad AS VARCHAR(5))+'=-1 THEN 1 WHEN TT.Priority='''+CAST(@psiPrioridad AS VARCHAR(5))+''' THEN 1 END
	) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;





GO
/****** Object:  StoredProcedure [dbo].[usp_ListarVentanilla]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE usp_ListarVentanilla 10,1,'CodeWindow','DESC',1,1

CREATE PROCEDURE [dbo].[usp_ListarVentanilla]
(
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4),
	@psiCboZona INT,
	@psiCboVentanilla INT
)AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int

	SET @RecordCount = (SELECT COUNT(CodeWindow) FROM Window WHERE State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select ca.Description,zo.ZoneName,wi.CodeWindow,wi.WindowName,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Window wi inner join Zone zo  ON  wi.CodeZone=zo.CodeZone inner join  AttentionCenter ca ON ca.CodeAttentionCenter=zo.CodeAttentionCenter  where wi.State=1 and zo.State=1 AND ca.State=1
	AND 1= CASE WHEN '+CAST(@psiCboZona AS VARCHAR(5))+'=-1 THEN 1 WHEN wi.CodeZone='''+CAST(@psiCboZona AS VARCHAR(5))+''' THEN 1 END
	AND 1= CASE WHEN '+CAST(@psiCboVentanilla AS VARCHAR(5))+'=-1 THEN 1 WHEN wi.CodeWindow='''+CAST(@psiCboVentanilla AS VARCHAR(5))+''' THEN 1 END ) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;






GO
/****** Object:  StoredProcedure [dbo].[usp_ListarVideo]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarVideo]
(
	@pstrPagHasta INT,
	@pstrPagDesde INT,
	@psiSortColumn VARCHAR(200),
	@psiSortOrder VARCHAR(200)
) AS

BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int

	SET @RecordCount = (select count(CodeVideo) from Video where State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select vi.CodeVideo,vi.VideoName,vi.VideoDescription,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Video vi where vi.State =1) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarZonas]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXECUTE usp_ListarZonas 10,1,'CodeZone','DESC','a',1
CREATE PROCEDURE [dbo].[usp_ListarZonas]
(
	@pstrPagHasta INT,
	@pstrPagDesde INT,
	@psiSortColumn VARCHAR(200),
	@psiSortOrder VARCHAR(200),
	@psiTxtZona  VARCHAR(120),
	@psiCodeAttentionCenter INT
)AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int

	SET @RecordCount = (select count(CodeZone) from Zone where State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select zo.CodeZone,zo.ZoneName,zo.ZoneDescription,at.Description,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Zone zo inner join AttentionCenter at on zo.CodeAttentionCenter=at.CodeAttentionCenter
	where zo.State =1  AND at.State=1 AND
	1=CASE WHEN '''+@psiTxtZona+''' =CAST(-1 AS VARCHAR(5)) THEN 1 WHEN zo.ZoneName ='''+@psiTxtZona+''' THEN 1 END AND
	1=CASE  
			WHEN  '+ CAST(@psiCodeAttentionCenter AS VARCHAR(5))+'=-1 THEN 1
			WHEN at.CodeAttentionCenter='+CAST(@psiCodeAttentionCenter AS VARCHAR(5))+' THEN 1 END
	
	) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)

END;




GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarBanner]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarBanner]
(
	@Description VARCHAR(200),
	@RegistryUser VARCHAR(200),
	@CodeBanner INT
)AS
BEGIN
	BEGIN TRANSACTION		
	BEGIN TRY		
		DECLARE @VALOR INT;
		IF NOT EXISTS (SELECT 1 FROM Banner WHERE UPPER(BannerName)=UPPER(@Description) AND State='1')
		BEGIN
			INSERT INTO Banner(BannerName,RegistryUser,RegistryDate) VALUES(UPPER(@Description),@RegistryUser,GETDATE());
			SET @VALOR=SCOPE_IDENTITY();
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			SET @VALOR=0;--YA EXISTE UNA ENTIDAD REGISTRADA
		END	
		SELECT @VALOR;
	END TRY
	BEGIN CATCH			
		ROLLBACK TRANSACTION
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH
END



GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCentroAtencion]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_RegistrarCentroAtencion](
	@Description VARCHAR(250),
	@RegistryUser VARCHAR(250),
	@CodeAttentionCenter INT
)AS

BEGIN
	BEGIN TRANSACTION		
	BEGIN TRY		
		DECLARE @VALOR INT;
		IF NOT EXISTS (SELECT 1 FROM AttentionCenter WHERE UPPER(Description)=UPPER(@Description) AND State='1')
		BEGIN
			INSERT INTO AttentionCenter(Description,RegistryUser,RegistryDate) VALUES(UPPER(@Description),@RegistryUser,GETDATE());
			SET @VALOR=SCOPE_IDENTITY();
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			SET @VALOR=0;--YA EXISTE UNA ENTIDAD REGISTRADA
		END	
		SELECT @VALOR;
	END TRY
	BEGIN CATCH			
		ROLLBACK TRANSACTION
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH	
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarEntidad]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--execute usp_RegistrarEntidad 'CAMBIO','ccscs','cd',1

CREATE PROCEDURE [dbo].[usp_RegistrarEntidad](
	@Description VARCHAR(250),
	@Abbreviation VARCHAR(250),
	@RegistryUser VARCHAR(250),
	@CodeEntity INT
)AS

BEGIN
	BEGIN TRANSACTION		
	BEGIN TRY		
		DECLARE @VALOR INT;
		IF NOT EXISTS (SELECT 1 FROM Entity WHERE UPPER(Description)=UPPER(@Description) AND State='1')
		BEGIN
			INSERT INTO Entity(Description,abreviation,RegistryUser,RegistryDate) VALUES(UPPER(@Description),UPPER(@Abbreviation),@RegistryUser,GETDATE());
			SET @VALOR=SCOPE_IDENTITY();
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			SET @VALOR=0;--YA EXISTE UNA ENTIDAD REGISTRADA
		END	
		SELECT @VALOR;
	END TRY
	BEGIN CATCH			
		ROLLBACK TRANSACTION
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH	
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarEntidadServicio]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarEntidadServicio]
(
	@CodeEntity INT,
	@CodeServicio VARCHAR(20),
	@RegistryUser VARCHAR(250)

)AS
BEGIN
	DECLARE @VALOR INT;
	--BEGIN TRY	
		INSERT INTO ServiceEntity(CodeEntity,CodeService,RegistryUser,RegistryDate) VALUES(@CodeEntity,@CodeServicio,@RegistryUser,GETDATE());
		SET @VALOR=SCOPE_IDENTITY();
		SELECT @VALOR;
	--END TRY
	--BEGIN CATCH	
		--SET @VALOR=-1;	
		--SELECT @VALOR;
	--END CATCH
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarServicio]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarServicio]
(
	@CodeService INT,
	@CodeTypeService INT,
	@Description VARCHAR(250),
	@RegistryUser VARCHAR(250)
)AS

BEGIN
	DECLARE @VALOR INT;
	BEGIN TRANSACTION	
	BEGIN TRY
		IF NOT EXISTS(SELECT 1 FROM Service WHERE UPPER(Description)=UPPER(@Description) AND CodeTypeService=@CodeTypeService AND State='1') 
		BEGIN
			INSERT INTO Service(Description,CodeTypeService,RegistryUser,RegistryDate) VALUES(UPPER(@Description),@CodeTypeService,@RegistryUser,GETDATE());
			SET @VALOR=SCOPE_IDENTITY();
			SELECT @VALOR;
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			SET @VALOR=0;--YA EXISTE UN SERVICIO REGISTRADA
		END	
		SELECT @VALOR;
	END TRY
	BEGIN CATCH			
		ROLLBACK TRANSACTION
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarTipoTicket]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarTipoTicket](
	@Description VARCHAR(200),
	@RegistryUser VARCHAR(200),
	@Priority INT,
	@CodeTicketType INT,
	@IsPreferential BIT
)AS
BEGIN
	DECLARE @VALOR INT;
	IF NOT EXISTS (SELECT 1 FROM TicketType WHERE UPPER(Description)=UPPER(@Description) AND State='1')
	BEGIN
		INSERT INTO TicketType(Description,Priority,RegistryUser,RegistryDate,IsPreferential) VALUES(UPPER(@Description),@Priority,@RegistryUser,GETDATE(),@IsPreferential);
		SET @VALOR=SCOPE_IDENTITY();
	END
	ELSE
	BEGIN
		SET @VALOR=0;--YA EXISTE UNA TIPO DE TICKET REGISTRADA
	END	
	SELECT @VALOR;
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarVentanilla]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_RegistrarVentanilla]
(
	@Description VARCHAR(200),
	@RegistryUser VARCHAR(200),
	@CodeWindow INT,
	@CodeZone INT 
)AS
BEGIN
	BEGIN TRANSACTION		
	BEGIN TRY		
		DECLARE @VALOR INT;
		IF NOT EXISTS (SELECT 1 FROM Window WHERE UPPER(WindowName)=UPPER(@Description) AND State='1' AND CodeZone=@CodeZone)
		BEGIN
			INSERT INTO Window(WindowName,RegistryUser,RegistryDate,CodeZone) VALUES(UPPER(@Description),@RegistryUser,GETDATE(),@CodeZone);
			SET @VALOR=SCOPE_IDENTITY();
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			SET @VALOR=0;--YA EXISTE UNA ENTIDAD REGISTRADA
		END	
		SELECT @VALOR;
	END TRY
	BEGIN CATCH			
		ROLLBACK TRANSACTION
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH

END;



GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarZona]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarZona]
(
	@Description VARCHAR(200),
	@CodeAttentionCenter INT,
	@RegistryUser VARCHAR(200),
	@CodeZone VARCHAR(100)

)AS
BEGIN
	BEGIN TRANSACTION		
	BEGIN TRY		
		DECLARE @VALOR INT;
		IF NOT EXISTS (SELECT 1 FROM Zone WHERE UPPER(ZoneName)=UPPER(@Description) AND State='1' AND CodeAttentionCenter=@CodeAttentionCenter)
		BEGIN
			INSERT INTO Zone(ZoneName,RegistryUser,RegistryDate,CodeAttentionCenter) VALUES(UPPER(@Description),@RegistryUser,GETDATE(),@CodeAttentionCenter);
			SET @VALOR=SCOPE_IDENTITY();
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			SET @VALOR=0;--YA EXISTE UNA ENTIDAD REGISTRADA
		END	
		SELECT @VALOR;
	END TRY
	BEGIN CATCH			
		ROLLBACK TRANSACTION
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH
END;




GO
/****** Object:  Table [dbo].[Activity]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Activity](
	[CodeActivity] [int] IDENTITY(1,10) NOT NULL,
	[CodeSchedule] [int] NOT NULL,
	[CodeServAttenCenter] [int] NOT NULL,
	[StartQuota] [int] NULL,
	[EndQuota] [int] NULL,
	[Available] [bit] NULL,
	[ActivityDate] [date] NULL,
	[CodeState] [int] NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Activity__FEA2B62B1DEB6800] PRIMARY KEY CLUSTERED 
(
	[CodeActivity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alomac]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alomac](
	[CodeAlomac] [int] IDENTITY(1,1) NOT NULL,
	[CodeUser] [int] NOT NULL,
	[Dni] [nvarchar](8) NULL,
	[Telephone] [nvarchar](10) NULL,
	[Annexed] [nvarchar](10) NULL,
	[Wav] [nvarchar](10) NULL,
	[CodePeople] [int] NOT NULL,
	[StarDateAten] [datetime] NULL,
	[EndDateAten] [datetime] NULL,
	[Querys] [nvarchar](1000) NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[CodetypeAttention] [int] NOT NULL,
	[CodeProcedure] [int] NOT NULL,
	[AtentionTime] [int] NULL,
	[Channel] [nvarchar](100) NULL,
	[ChannelAnswered] [nvarchar](100) NULL,
	[AgentAnswer] [nvarchar](100) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeAlomac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Appointment](
	[CodeAppointment] [int] IDENTITY(1,1) NOT NULL,
	[CodePeople] [int] NOT NULL,
	[CodeSchedule] [int] NOT NULL,
	[CodeServAttenCenter] [int] NOT NULL,
	[CodetypeAttention] [int] NOT NULL,
	[CodeUser] [int] NULL,
	[AppointmentDate] [date] NULL,
	[Observation] [nvarchar](200) NULL,
	[CodePayment] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
	[CodeState] [int] NULL,
 CONSTRAINT [PK__Appointm__80CE02B35AB11122] PRIMARY KEY CLUSTERED 
(
	[CodeAppointment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Attention]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attention](
	[CodeAttention] [int] IDENTITY(1,1) NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeAttention] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AttentionCenter]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttentionCenter](
	[CodeAttentionCenter] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CodeGeoLocation] [char](6) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeAttentionCenter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AttentionCenter_Zone]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttentionCenter_Zone](
	[CodeAttentioCenterZone] [int] NOT NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[CodeZone] [int] NOT NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Attentio__F3575B14A795E3DD] PRIMARY KEY CLUSTERED 
(
	[CodeAttentioCenterZone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banner](
	[CodeBanner] [int] IDENTITY(1,1) NOT NULL,
	[BannerName] [nvarchar](100) NULL,
	[BannerDescription] [nvarchar](250) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeBanner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BannerZone]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BannerZone](
	[CodeBannerZone] [int] IDENTITY(1,1) NOT NULL,
	[CodeBanner] [int] NOT NULL,
	[CodeZone] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeBannerZone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailGroupService]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailGroupService](
	[CodeDetailGroupService] [int] IDENTITY(1,1) NOT NULL,
	[CodeGroupService] [int] NOT NULL,
	[CodeService] [int] NOT NULL,
	[RegistryUser] [varchar](200) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeDetailGroupService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentType]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentType](
	[CodeDocumentType] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeDocumentType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Entity](
	[CodeEntity] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Abreviation] [varchar](50) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
	[RowOrder] [int] NULL,
	[UrlLogo] [nvarchar](250) NULL,
 CONSTRAINT [PK__Entity__6D5166EC102CE1AB] PRIMARY KEY CLUSTERED 
(
	[CodeEntity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entity_AttentionCenter]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Entity_AttentionCenter](
	[CodeEntity_AtentionCenter] [int] IDENTITY(1,1) NOT NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[CodeEntity] [int] NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NOT NULL,
 CONSTRAINT [PK__Entity_A__F6275DDD897F1BAA] PRIMARY KEY CLUSTERED 
(
	[CodeEntity_AtentionCenter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupService]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupService](
	[CodeGroupService] [int] IDENTITY(1,1) NOT NULL,
	[CodeZone] [int] NOT NULL,
	[Name] [varchar](200) NULL,
	[Description] [varchar](300) NULL,
	[RegistryUser] [varchar](200) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeGroupService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[People]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[People](
	[CodePeople] [int] IDENTITY(1,1) NOT NULL,
	[Dni] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[FirstLastName] [nvarchar](50) NULL,
	[SecondLastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Telephone] [nvarchar](20) NULL,
	[Pide] [bit] NULL,
	[PideDate] [datetime] NULL,
	[Birthdate] [datetime] NULL,
	[Sex] [char](1) NULL,
	[CivilStatus] [char](1) NULL,
	[CodeGeoLocation] [char](6) NULL,
	[Address] [nvarchar](200) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodePeople] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proccedure]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proccedure](
	[CodeProcedure] [int] IDENTITY(1,1) NOT NULL,
	[CodeEntity] [int] NOT NULL,
	[CodeTypeProcedure] [int] NULL,
	[Description] [nvarchar](200) NULL,
	[Requirements] [nvarchar](200) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeProcedure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedule](
	[CodeSchedule] [int] IDENTITY(1,1) NOT NULL,
	[CodeService] [int] NULL,
	[Description] [nvarchar](50) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Schedule__A1F9D6BE134FE7A5] PRIMARY KEY CLUSTERED 
(
	[CodeSchedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[CodeService] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
	[AppoinmentFlag] [char](1) NULL,
	[CodeTypeService] [int] NOT NULL,
 CONSTRAINT [PK__Service__CAC616BF980F0112] PRIMARY KEY CLUSTERED 
(
	[CodeService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceAttention]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceAttention](
	[CodeServiceAttention] [int] IDENTITY(1,1) NOT NULL,
	[CodeAttention] [int] NOT NULL,
	[CodeService] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeServiceAttention] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceAttentionCenter]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceAttentionCenter](
	[CodeServAttenCenter] [int] IDENTITY(1,1) NOT NULL,
	[CodeService] [int] NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Procedur__373E264932516BA7] PRIMARY KEY CLUSTERED 
(
	[CodeServAttenCenter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceEntity]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceEntity](
	[CodeServiceEntity] [int] IDENTITY(1,1) NOT NULL,
	[CodeEntity] [int] NOT NULL,
	[CodeService] [int] NOT NULL,
	[RegistryUser] [varchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeServiceEntity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceTicket]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceTicket](
	[CodeServiceTicket] [int] IDENTITY(1,1) NOT NULL,
	[CodeService] [int] NOT NULL,
	[CodeTicket] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeServiceTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[CodeState] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ticket](
	[CodeTicket] [int] IDENTITY(1,1) NOT NULL,
	[TicketName] [nvarchar](100) NULL,
	[CodeTicketState] [int] NOT NULL,
	[CodeTicketType] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
	[CodePeople] [int] NOT NULL,
 CONSTRAINT [PK__Ticket__E7BD581B7B173398] PRIMARY KEY CLUSTERED 
(
	[CodeTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketState]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketState](
	[CodeTicketStat] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](100) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeTicketStat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketStateHistory]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketStateHistory](
	[CodeTicketStateHistory] [int] IDENTITY(1,1) NOT NULL,
	[CodeTicket] [int] NOT NULL,
	[CodeTicketState] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeTicketStateHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketType]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketType](
	[CodeTicketType] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Priority] [int] NULL,
	[IsPreferential] [bit] NULL,
	[Visible] [char](1) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__TypeAtte__E532FC438A62F62E] PRIMARY KEY CLUSTERED 
(
	[CodeTicketType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeProcedure]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeProcedure](
	[CodeTypeProcedure] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeTypeProcedure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeService]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeService](
	[CodeTypeService] [int] IDENTITY(1,1) NOT NULL,
	[NameTypeService] [nvarchar](120) NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeTypeService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Video]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Video](
	[CodeVideo] [int] IDENTITY(1,1) NOT NULL,
	[VideoName] [nvarchar](120) NULL,
	[VideoDescription] [nvarchar](250) NULL,
	[VideoAdress] [nvarchar](250) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Video__4E6C0241A98AD68F] PRIMARY KEY CLUSTERED 
(
	[CodeVideo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VideoZone]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VideoZone](
	[CodeVideoZone] [int] IDENTITY(1,1) NOT NULL,
	[CodeVideo] [int] NOT NULL,
	[CodeZone] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeVideoZone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Window]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Window](
	[CodeWindow] [int] IDENTITY(1,1) NOT NULL,
	[WindowName] [nvarchar](100) NULL,
	[CodeZone] [int] NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeWindow] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zone]    Script Date: 7/10/2019 09:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Zone](
	[CodeZone] [int] IDENTITY(1,1) NOT NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[ZoneName] [nvarchar](120) NULL,
	[ZoneDescription] [nvarchar](250) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Zone__13912F3596215FC6] PRIMARY KEY CLUSTERED 
(
	[CodeZone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Activity] ON 

INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (1, 1, 6, 4, 4, 0, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (11, 2, 6, 4, 0, 1, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (21, 3, 6, 4, 0, 1, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (31, 4, 6, 4, 0, 1, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (41, 5, 6, 4, 4, 0, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (51, 6, 6, 4, 4, 0, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (61, 7, 6, 4, 4, 0, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (71, 8, 6, 4, 4, 0, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (81, 9, 6, 4, 0, 1, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (91, 10, 6, 4, 0, 1, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (101, 11, 6, 4, 4, 0, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (111, 12, 6, 4, 4, 0, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (121, 13, 6, 4, 4, 0, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (131, 14, 6, 4, 4, 0, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (141, 15, 6, 4, 4, 0, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (151, 16, 6, 4, 0, 1, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (161, 17, 6, 4, 0, 1, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (181, 18, 6, 4, 0, 1, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (191, 19, 6, 4, 0, 1, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (201, 20, 6, 4, 0, 1, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (211, 21, 6, 4, 0, 1, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (221, 22, 6, 4, 0, 1, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (231, 23, 6, 4, 4, 0, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
INSERT [dbo].[Activity] ([CodeActivity], [CodeSchedule], [CodeServAttenCenter], [StartQuota], [EndQuota], [Available], [ActivityDate], [CodeState], [RegistryUser], [RegistryDate], [State]) VALUES (241, 24, 6, 4, 4, 0, CAST(0x3A400B00 AS Date), 1, NULL, NULL, N'1')
SET IDENTITY_INSERT [dbo].[Activity] OFF
SET IDENTITY_INSERT [dbo].[AttentionCenter] ON 

INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'Arequipa', NULL, NULL, NULL, N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'Lima Este', NULL, NULL, NULL, N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (3, N'Piura', NULL, NULL, NULL, N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (4, N'Callao', NULL, NULL, NULL, N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (5, N'Lima Norte', NULL, NULL, NULL, N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (6, N'Ventanilla', NULL, NULL, NULL, N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1002, N'DQDQ1', NULL, N'Admin', CAST(0x0000AAB501230BD7 AS DateTime), N'0')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1003, N'VEEWGGEW', NULL, N'Admin', CAST(0x0000AAB501233F5D AS DateTime), N'0')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1004, N'PRUEBA144', NULL, N'Admin', CAST(0x0000AAB60123DB42 AS DateTime), N'0')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1005, N'PRUEBA1', NULL, N'Admin', CAST(0x0000AAB60123FDBC AS DateTime), N'0')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1006, N'PRUEBA22', NULL, N'Admin', CAST(0x0000AABD00E53B2D AS DateTime), N'0')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1007, N'PRUEBA222211', NULL, N'Admin', CAST(0x0000AABD00E54A50 AS DateTime), N'0')
SET IDENTITY_INSERT [dbo].[AttentionCenter] OFF
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'ANTES DE RETIRARSE VERIFIQUE SUS DATOS', N'Antes de retirarse verifique sus datos', N'admin', CAST(0x0000AAA80143FCEA AS DateTime), N'1')
INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'BANNER DEL CENTRO MAC DE CONO ESTE', N'centro MAC', N'admin', CAST(0x0000AAA801434C81 AS DateTime), N'1')
INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [State]) VALUES (3, N'PRUEBA DE BANNER', NULL, N'Admin', CAST(0x0000AAC000D1801A AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[Banner] OFF
SET IDENTITY_INSERT [dbo].[DocumentType] ON 

INSERT [dbo].[DocumentType] ([CodeDocumentType], [Description], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'DNI', N'system', CAST(0x0000AAC300000000 AS DateTime), N'1')
INSERT [dbo].[DocumentType] ([CodeDocumentType], [Description], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'CE', N'system', CAST(0x0000AAC300000000 AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[DocumentType] OFF
SET IDENTITY_INSERT [dbo].[Entity] ON 

INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1, N'Banco de la Nacion', NULL, N'system', CAST(0x0000AAA0017E3A57 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (2, N'Caja Piura', NULL, N'system', CAST(0x0000AAA0017E3A58 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (3, N'Colegio de Notarios de Lima', NULL, N'system', CAST(0x0000AAA0017E3A58 AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (4, N'EPS Grau', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (5, N'ESSALUD', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (6, N'GORE Arequipa', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (7, N'GORE Callao', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (8, N'GORE Piura', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (9, N'INDECOPI', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (10, N'INPE', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (11, N'JNE', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (12, N'MIDIS', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (13, N'Migraciones', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (14, N'MININTER', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (15, N'MTC', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (16, N'MTPE', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (17, N'MUNICIPALIDAD DE VENTANILLA', N'', N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (18, N'MUNICIPALIDAD PROVINCIAL DE AREQUIPA', N'', N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (19, N'OSCE', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (20, N'OSINERGMIN', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (21, N'PODER JUDICIAL', N'', N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (22, N'PRODUCE', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (23, N'RENIEC', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (24, N'RREE', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (25, N'SAT', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (26, N'SAT Piura', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (27, N'SBS', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (28, N'SEDAPAL', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (29, N'SIS', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (30, N'SUNARP', NULL, N'system', CAST(0x0000AAA0017E3A59 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (31, N'SUNAT', NULL, N'system', CAST(0x0000AAA0017E3A5A AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (32, N'SUNEDU', NULL, N'system', CAST(0x0000AAA0017E3A5A AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1003, N'prueba de inercion', NULL, N'Admin', CAST(0x0000AAAA00D3CABC AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1004, N'fqwfqwf', NULL, N'Admin', CAST(0x0000AAAA00D3B050 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1005, N'fergfreferf', NULL, N'Admin', CAST(0x0000AAAF01280F4A AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1006, N'gregrgrwgrw', NULL, N'Admin', CAST(0x0000AAAF01294F0A AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1007, N'pruebaaaa 20082019', NULL, N'Admin', CAST(0x0000AAAF012A44B8 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1008, N'20082019', NULL, N'Admin', CAST(0x0000AAAF012C83CF AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1009, N'06:17 20190820', NULL, N'Admin', CAST(0x0000AAAF012D97D9 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1010, N'svsff', NULL, N'Admin', CAST(0x0000AAAF012DEF31 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1011, N'vsavagergergreg', NULL, N'Admin', CAST(0x0000AAAF012E02A3 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1012, N'GEWGEHQHGQ', N'', N'Admin', CAST(0x0000AAAF012E4695 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1013, N'gewqgeqrhrwhrg', NULL, N'Admin', CAST(0x0000AAAF012E7AAD AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1014, N'qwvwf', NULL, N'Admin', CAST(0x0000AAAF012F4A09 AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1015, N'vewgeqrhgwh', NULL, N'Admin', CAST(0x0000AAAF013AA6AA AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1016, N'guarddadadadadadadadoooo', NULL, N'Admin', CAST(0x0000AAAF013A8DB7 AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1017, N'g', NULL, N'Admin', CAST(0x0000AAAF013A4C06 AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1018, N'MILKI', NULL, N'Admin', CAST(0x0000AAAF013AAFB6 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1019, N'CAMBIO', N'', N'Admin', CAST(0x0000AAAF013ABABC AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1020, N'WQFQWFWQF', NULL, N'Admin', CAST(0x0000AAB000A886C1 AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1021, N'1', NULL, N'Admin', CAST(0x0000AAB000A89692 AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1022, N'W', NULL, N'Admin', CAST(0x0000AAB0011494FE AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1023, N'dwqdd', NULL, N'Admin', CAST(0x0000AAB00124855E AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1024, N'FWFWRQ', NULL, N'Admin', CAST(0x0000AAB00125232B AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1025, N'DWQDWQDWQD', NULL, N'Admin', CAST(0x0000AAB0012796BA AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1026, N'hg6h5h56h', NULL, N'Admin', CAST(0x0000AAB200C84B46 AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1027, N'PRUEBA1111', N'', N'Admin', CAST(0x0000AAB200F1B0B1 AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1028, N'HH56H65H', N'DWQDQD', N'Admin', CAST(0x0000AAB200F3ED65 AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1029, N'FWEFW', N'GWG', N'Admin', CAST(0x0000AAB200F8A59D AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1030, N'FF', N'F2', N'Admin', CAST(0x0000AAB200F94DF6 AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1031, N'WEGW', N'F2', N'Admin', CAST(0x0000AAB200FA23DB AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1032, N'DDD', N'CCSCS', N'cd', CAST(0x0000AAB200FD2654 AS DateTime), N'0', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Entity] OFF
SET IDENTITY_INSERT [dbo].[Entity_AttentionCenter] ON 

INSERT [dbo].[Entity_AttentionCenter] ([CodeEntity_AtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (1, 2, 7, NULL, NULL, N'1')
INSERT [dbo].[Entity_AttentionCenter] ([CodeEntity_AtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (2, 2, 23, NULL, NULL, N'1')
SET IDENTITY_INSERT [dbo].[Entity_AttentionCenter] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([CodePeople], [Dni], [FirstName], [FirstLastName], [SecondLastName], [Email], [Telephone], [Pide], [PideDate], [Birthdate], [Sex], [CivilStatus], [CodeGeoLocation], [Address], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'45654584', N'pablo', N'rivadeneira', N'alarcon', N'privadeneiraala@hotmail.com', N'9845822', NULL, NULL, NULL, N'M', NULL, NULL, NULL, NULL, NULL, N'1')
SET IDENTITY_INSERT [dbo].[People] OFF
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (1, 1041, N'08:00 - 08:30', CAST(0x0000AAA10083D600 AS DateTime), CAST(0x00000000008C1360 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (2, 1041, N'08:30 - 09:00', CAST(0x0000AAA1008C1360 AS DateTime), CAST(0x00000000009450C0 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (3, 1041, N'09:00 - 09:30', CAST(0x0000AAA1009450C0 AS DateTime), CAST(0x00000000009C8E20 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (4, 1041, N'09:30 - 10:00', CAST(0x0000AAA1009C8E20 AS DateTime), CAST(0x0000AAA100A4CB80 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (5, 1041, N'10:00 - 10:30', CAST(0x0000AAA100A4CB80 AS DateTime), CAST(0x0000AAA100AD08E0 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (6, 1041, N'10:30 - 11:00', CAST(0x0000AAA100AD08E0 AS DateTime), CAST(0x0000AAA100B54640 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (7, 1041, N'11:00 - 11:30', CAST(0x0000AAA100B54640 AS DateTime), CAST(0x0000AAA100BD83A0 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (8, 1041, N'11:30 - 12:00', CAST(0x0000AAA100BD83A0 AS DateTime), CAST(0x0000AAA100C5C100 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (9, 1041, N'12:00 - 12:30', CAST(0x0000AAA100C5C100 AS DateTime), CAST(0x0000AAA100CDFE60 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (10, 1041, N'12:30 - 13:00', CAST(0x0000AAA100CDFE60 AS DateTime), CAST(0x0000AAA100D63BC0 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (11, 1041, N'13:00 - 13:30', CAST(0x0000AAA100D63BC0 AS DateTime), CAST(0x0000AAA100DE7920 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (12, 1041, N'13:30 - 14:00', CAST(0x0000AAA100DE7920 AS DateTime), CAST(0x0000AAA100E6B680 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (13, 1041, N'14:00 - 14:30', CAST(0x0000AAA100E6B680 AS DateTime), CAST(0x0000AAA100EEF3E0 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (14, 1041, N'14:30 - 15:00', CAST(0x0000AAA100EEF3E0 AS DateTime), CAST(0x0000AAA100F73140 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (15, 1041, N'15:00 - 15:30', CAST(0x0000AAA100F73140 AS DateTime), CAST(0x0000AAA100FF6EA0 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (16, 1041, N'15:30 - 16:00', CAST(0x0000AAA100FF6EA0 AS DateTime), CAST(0x0000AAA10107AC00 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (17, 1041, N'16:00 - 16:30', CAST(0x0000AAA10107AC00 AS DateTime), CAST(0x0000AAA1010FE960 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (18, 1041, N'16:30 - 17:00', CAST(0x0000AAA1010FE960 AS DateTime), CAST(0x0000AAA1011826C0 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (19, 1041, N'17:00 - 17:30', CAST(0x0000AAA1011826C0 AS DateTime), CAST(0x0000AAA101206420 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (20, 1041, N'17:30 - 18:00', CAST(0x0000AAA101206420 AS DateTime), CAST(0x0000AAA10128A180 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (21, 1041, N'18:00 - 18:30', CAST(0x0000AAA10128A180 AS DateTime), CAST(0x0000AAA10130DEE0 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (22, 1041, N'18:30 - 19:00', CAST(0x0000AAA10130DEE0 AS DateTime), CAST(0x0000AAA101391C40 AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (23, 1041, N'19:00 - 19:30', CAST(0x0000AAA101391C40 AS DateTime), CAST(0x0000AAA1014159A0 AS DateTime), N'FPALOMINO', CAST(0x0000AA910126C8E7 AS DateTime), N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [CodeService], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (24, 1041, N'19:30 - 20:00', CAST(0x0000AAA1014159A0 AS DateTime), CAST(0x0000AAA101499700 AS DateTime), NULL, NULL, N'1')
SET IDENTITY_INSERT [dbo].[Schedule] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1, N'Transferencia de Capital Social', N'system', CAST(0x0000AAA001867BD3 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (2, N'Apertura de Cuenta Corriente Mype', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (3, N'Depósito de Capital Social', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (4, N'Depósito de Cuenta Corriente Mype', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (5, N'Devolución de Capital Social', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (6, N'Pago de Tasas', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1003, N'LHKGJ', N'Admin', CAST(0x0000AAB1017BFDD3 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1004, N'MJHGJ', N'Admin', CAST(0x0000AAB1017CC4BE AS DateTime), N'0', N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1005, N'GJYGFJYG', N'Admin', CAST(0x0000AAB1017CFE5B AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1006, N'eliminar', N'Admin', CAST(0x0000AAB1017D5787 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1007, N'JGFJYFH', N'Admin', CAST(0x0000AAB1017DD38C AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1008, N'GJYFGYJ', N'Admin', CAST(0x0000AAB1017DE615 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1009, N'gjgjyg', N'Admin', CAST(0x0000AAB1017F0455 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1010, N'PERCYPRUEBA', N'Admin', CAST(0x0000AAB10189CC3C AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1011, N'jfhfftffffffffffaca', N'Admin', CAST(0x0000AAB1018B4A32 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1012, N'fhfhf', N'Admin', CAST(0x0000AAB20000606F AS DateTime), N'0', N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1013, N'mhvnv', N'Admin', CAST(0x0000AAB200010EA8 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1014, N'jgjhgjg', N'Admin', CAST(0x0000AAB20001665F AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1015, N'hfhf', N'Admin', CAST(0x0000AAB200022815 AS DateTime), N'0', N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1016, N'xasxsax', N'Admin', CAST(0x0000AAB20002393A AS DateTime), N'0', N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1017, N'vng', N'Admin', CAST(0x0000AAB200025679 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1018, N'n,jhj', N'Admin', CAST(0x0000AAB200026FB9 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1019, N'hdtrgd', N'Admin', CAST(0x0000AAB20002C20E AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1020, N'bthbtbtb', N'Admin', CAST(0x0000AAB200C8D740 AS DateTime), N'0', N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1021, N'prueba', N'Admin', CAST(0x0000AAB200E30C19 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1022, N'sqsqs', N'Admin', CAST(0x0000AAB200E36897 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1023, N'fewfwf', N'Admin', CAST(0x0000AAB200E6E446 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1024, N'dwdqd', N'Admin', CAST(0x0000AAB200E6F5BB AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1025, N'dqdqd', N'Admin', CAST(0x0000AAB200E74007 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1026, N'cvwewef', N'Admin', CAST(0x0000AAB200E751EB AS DateTime), N'1', N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1027, N'fwdwf', N'Admin', CAST(0x0000AAB200E8FCFA AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1028, N'cmbio', N'Admin', CAST(0x0000AAB200E9105D AS DateTime), N'1', N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1029, N'fff232f32f32f', N'Admin', CAST(0x0000AAB200E91816 AS DateTime), N'0', N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1030, N'cwqdqwd', N'Admin', CAST(0x0000AAB200EB5A09 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1031, N'CQWCWQC111fff', N'Admin', CAST(0x0000AAB20119BA94 AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1032, N'PRUEBAAAAA', N'Admin', CAST(0x0000AAB20119C5FB AS DateTime), N'0', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1033, N'PAGO DE TASAS', N'Admin', CAST(0x0000AAB7014309AF AS DateTime), N'1', N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1034, N'FRANCIS EL PERDIDO2', N'Admin', CAST(0x0000AAC5011925C9 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1035, N'duplicado de licencia de conducir ', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1036, N'emisión de licencia de conducir (nuevos ai)', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1037, N'emisión de record del conductor ', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1038, N'recategorización de licencia de conducir ', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1039, N'revalidación de licencia de conducir', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1040, N'programación de examen de manejo', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1041, N'programación de examen de reglas de tránsito', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1042, N'certificado de inscripción de identidad', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1043, N'constancia negativa de inscripción', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1044, N'copia literal de acta de matrimonio', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1045, N'copia literal de partida de defunción', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1046, N'copia literal de partida de nacimiento', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1047, N'certificado de nombres iguales - homonimia', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1048, N'duplicado de dni', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1049, N'inscripción de dni', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1050, N'rectificación de datos con emisión de dni', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1051, N'rectificación de datos sin emisión de dni', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [AppoinmentFlag], [CodeTypeService]) VALUES (1052, N'renovación de dni / rectificación de imagen y datos', N'system', CAST(0x0000AAA001867BD4 AS DateTime), N'1', N'0', 1)
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[ServiceAttentionCenter] ON 

INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeService], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [State]) VALUES (1, 1, 1, NULL, NULL, N'1')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeService], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [State]) VALUES (2, 1, 1, NULL, NULL, N'1')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeService], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [State]) VALUES (3, 1, 1, NULL, NULL, N'1')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeService], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [State]) VALUES (4, 1, 1, NULL, NULL, N'1')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeService], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [State]) VALUES (5, 1, 1, NULL, NULL, N'1')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeService], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [State]) VALUES (6, 1041, 2, NULL, NULL, N'1')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeService], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [State]) VALUES (7, 1040, 2, NULL, NULL, N'1')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeService], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [State]) VALUES (8, 1036, 2, NULL, NULL, N'1')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeService], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [State]) VALUES (9, 1037, 2, NULL, NULL, N'1')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeService], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [State]) VALUES (10, 1052, 2, NULL, NULL, N'1')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeService], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [State]) VALUES (12, 1048, 2, NULL, NULL, N'1')
SET IDENTITY_INSERT [dbo].[ServiceAttentionCenter] OFF
SET IDENTITY_INSERT [dbo].[ServiceEntity] ON 

INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (8, 1, 3, N'admin', CAST(0x0000AAC3011A13A7 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (9, 1, 3, N'hhhh', NULL, N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (10, 1, 3, N'admin', CAST(0x0000AAC3011AEF06 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (11, 1, 3, N'admin', CAST(0x0000AAC3011B1B27 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (12, 1, 3, N'admin', CAST(0x0000AAC3011B3EB1 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (16, 1, 1, N'Admin', CAST(0x0000AAC3012306ED AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (25, 1, 3, N'Admin', CAST(0x0000AAC3012A9BA1 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (26, 1, 1, N'Admin', CAST(0x0000AAC3012ACC5A AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (27, 5, 3, N'Admin', CAST(0x0000AAC3012B3C72 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (28, 5, 1, N'Admin', CAST(0x0000AAC3012B3C74 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (29, 1, 3, N'Admin', CAST(0x0000AAC30131BFA1 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (30, 1, 1, N'Admin', CAST(0x0000AAC30131BFA3 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (31, 8, 1034, N'Admin', CAST(0x0000AAC700D2F2C5 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (32, 8, 1026, N'Admin', CAST(0x0000AAC700D2F2C7 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (33, 8, 6, N'Admin', CAST(0x0000AAC700D2F2C7 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (34, 8, 4, N'Admin', CAST(0x0000AAC700D2F2C8 AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (35, 8, 1, N'Admin', CAST(0x0000AAC700D2F2C8 AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[ServiceEntity] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([CodeState], [Description], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'Programado', NULL, NULL, N'1')
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[TicketState] ON 

INSERT [dbo].[TicketState] ([CodeTicketStat], [StateName], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'En espera', N'system', CAST(0x0000AAA0017D2B8F AS DateTime), N'1')
INSERT [dbo].[TicketState] ([CodeTicketStat], [StateName], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'Abandono', N'system', CAST(0x0000AAA0017D2B8F AS DateTime), N'1')
INSERT [dbo].[TicketState] ([CodeTicketStat], [StateName], [RegistryUser], [RegistryDate], [State]) VALUES (3, N'Reactivado', N'system', CAST(0x0000AAA0017D2B8F AS DateTime), N'1')
INSERT [dbo].[TicketState] ([CodeTicketStat], [StateName], [RegistryUser], [RegistryDate], [State]) VALUES (4, N'Atendido', N'system', CAST(0x0000AAA0017D2B8F AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[TicketState] OFF
SET IDENTITY_INSERT [dbo].[TicketType] ON 

INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'MENOR DE  EDAD', 4, 0, N'1', NULL, NULL, N'0')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'NORMAL', 1, 0, N'1', N'Admin', CAST(0x0000AAC70117CDF2 AS DateTime), N'1')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (3, N'DISCAPACITADO', 2, 1, N'1', N'Admin', CAST(0x0000AAC70118899A AS DateTime), N'1')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (4, N'ADULTO MAYOR', 3, 1, N'1', N'Admin', CAST(0x0000AAC7012EEEC7 AS DateTime), N'1')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (5, N'MENOR DE   EDAD', 5, 1, N'1', N'Admin', CAST(0x0000AAC70130D56F AS DateTime), N'1')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (6, N'MENOR DE EDAD', 100, 0, N'1', N'Admin', CAST(0x0000AAC701339972 AS DateTime), N'0')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (7, N'WDW', 1, 1, N'1', N'Admin', CAST(0x0000AAC701479FFC AS DateTime), N'0')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (8, N'GESTANTE', 15, 1, N'1', N'Admin', CAST(0x0000AACA00CD3923 AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[TicketType] OFF
SET IDENTITY_INSERT [dbo].[TypeService] ON 

INSERT [dbo].[TypeService] ([CodeTypeService], [NameTypeService], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'Tramite', N'system', CAST(0x0000AAA0017D5007 AS DateTime), N'1')
INSERT [dbo].[TypeService] ([CodeTypeService], [NameTypeService], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'Orientación', N'system', CAST(0x0000AAA0017D5007 AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[TypeService] OFF
SET IDENTITY_INSERT [dbo].[Window] ON 

INSERT [dbo].[Window] ([CodeWindow], [WindowName], [CodeZone], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'1', 1, N'Admin', CAST(0x0000AABE00B9F87A AS DateTime), N'1')
INSERT [dbo].[Window] ([CodeWindow], [WindowName], [CodeZone], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'2', 1, N'Admin', CAST(0x0000AABE00CE2042 AS DateTime), N'1')
INSERT [dbo].[Window] ([CodeWindow], [WindowName], [CodeZone], [RegistryUser], [RegistryDate], [State]) VALUES (3, N'2', 3, N'Admin', CAST(0x0000AABE00CE7724 AS DateTime), N'1')
INSERT [dbo].[Window] ([CodeWindow], [WindowName], [CodeZone], [RegistryUser], [RegistryDate], [State]) VALUES (4, N'1', 2, N'Admin', CAST(0x0000AABF00C650BA AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[Window] OFF
SET IDENTITY_INSERT [dbo].[Zone] ON 

INSERT [dbo].[Zone] ([CodeZone], [CodeAttentionCenter], [ZoneName], [ZoneDescription], [RegistryUser], [RegistryDate], [State]) VALUES (1, 1, N'A', NULL, N'Admin', CAST(0x0000AABD00EFC9F4 AS DateTime), N'1')
INSERT [dbo].[Zone] ([CodeZone], [CodeAttentionCenter], [ZoneName], [ZoneDescription], [RegistryUser], [RegistryDate], [State]) VALUES (2, 2, N'B', NULL, N'Admin', CAST(0x0000AABD01116388 AS DateTime), N'1')
INSERT [dbo].[Zone] ([CodeZone], [CodeAttentionCenter], [ZoneName], [ZoneDescription], [RegistryUser], [RegistryDate], [State]) VALUES (3, 5, N'A', NULL, N'Admin', CAST(0x0000AABE00CE5D45 AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[Zone] OFF
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF__Activity__State__108B795B]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Alomac] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Appointment] ADD  CONSTRAINT [DF_Appointment_State]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Appointment] ADD  CONSTRAINT [DF__Appointme__CodeS__619B8048]  DEFAULT ('1') FOR [CodeState]
GO
ALTER TABLE [dbo].[Attention] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[AttentionCenter] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[AttentionCenter_Zone] ADD  CONSTRAINT [DF__Attention__State__6225902D]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Banner] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[BannerZone] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Entity] ADD  CONSTRAINT [DF__Entity__State__607251E5]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Entity_AttentionCenter] ADD  CONSTRAINT [DF__Entity_At__State__318258D2]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[People] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Proccedure] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF__Schedule__State__33D4B598]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF__Service__State__00200768]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_AppoinmentFlag]  DEFAULT ((1)) FOR [AppoinmentFlag]
GO
ALTER TABLE [dbo].[ServiceAttention] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[ServiceAttentionCenter] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[ServiceEntity] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[ServiceTicket] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[State] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF__Ticket__State__7A3223E8]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[TicketState] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[TicketStateHistory] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[TicketType] ADD  CONSTRAINT [DF_TicketType_prioridad]  DEFAULT ((1)) FOR [Priority]
GO
ALTER TABLE [dbo].[TicketType] ADD  CONSTRAINT [DF_TicketType_IsPreferential]  DEFAULT ((0)) FOR [IsPreferential]
GO
ALTER TABLE [dbo].[TicketType] ADD  CONSTRAINT [DF_TicketType_Visible]  DEFAULT ('1') FOR [Visible]
GO
ALTER TABLE [dbo].[TicketType] ADD  CONSTRAINT [DF__TypeAtten__State__02C769E9]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[TypeProcedure] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[TypeService] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF__Video__State__0B5CAFEA]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[VideoZone] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Window] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF__Zone__State__13F1F5EB]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK__Activity__CodeSc__4222D4EF] FOREIGN KEY([CodeSchedule])
REFERENCES [dbo].[Schedule] ([CodeSchedule])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK__Activity__CodeSc__4222D4EF]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK__Activity__CodeSt__4316F928] FOREIGN KEY([CodeState])
REFERENCES [dbo].[State] ([CodeState])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK__Activity__CodeSt__4316F928]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_ServiceAttentionCenter] FOREIGN KEY([CodeServAttenCenter])
REFERENCES [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_ServiceAttentionCenter]
GO
ALTER TABLE [dbo].[AttentionCenter_Zone]  WITH CHECK ADD  CONSTRAINT [FK__Attention__CodeA__640DD89F] FOREIGN KEY([CodeAttentionCenter])
REFERENCES [dbo].[AttentionCenter] ([CodeAttentionCenter])
GO
ALTER TABLE [dbo].[AttentionCenter_Zone] CHECK CONSTRAINT [FK__Attention__CodeA__640DD89F]
GO
ALTER TABLE [dbo].[AttentionCenter_Zone]  WITH CHECK ADD  CONSTRAINT [FK__Attention__CodeZ__6319B466] FOREIGN KEY([CodeZone])
REFERENCES [dbo].[Zone] ([CodeZone])
GO
ALTER TABLE [dbo].[AttentionCenter_Zone] CHECK CONSTRAINT [FK__Attention__CodeZ__6319B466]
GO
ALTER TABLE [dbo].[BannerZone]  WITH CHECK ADD FOREIGN KEY([CodeBanner])
REFERENCES [dbo].[Banner] ([CodeBanner])
GO
ALTER TABLE [dbo].[BannerZone]  WITH CHECK ADD  CONSTRAINT [FK__BannerZon__CodeZ__1C873BEC] FOREIGN KEY([CodeZone])
REFERENCES [dbo].[Zone] ([CodeZone])
GO
ALTER TABLE [dbo].[BannerZone] CHECK CONSTRAINT [FK__BannerZon__CodeZ__1C873BEC]
GO
ALTER TABLE [dbo].[DetailGroupService]  WITH CHECK ADD  CONSTRAINT [FK_DetailGroupService_GroupService] FOREIGN KEY([CodeGroupService])
REFERENCES [dbo].[GroupService] ([CodeGroupService])
GO
ALTER TABLE [dbo].[DetailGroupService] CHECK CONSTRAINT [FK_DetailGroupService_GroupService]
GO
ALTER TABLE [dbo].[DetailGroupService]  WITH CHECK ADD  CONSTRAINT [FK_DetailGroupService_Service] FOREIGN KEY([CodeService])
REFERENCES [dbo].[Service] ([CodeService])
GO
ALTER TABLE [dbo].[DetailGroupService] CHECK CONSTRAINT [FK_DetailGroupService_Service]
GO
ALTER TABLE [dbo].[Entity_AttentionCenter]  WITH CHECK ADD  CONSTRAINT [FK__Entity_At__CodeA__10E07F16] FOREIGN KEY([CodeAttentionCenter])
REFERENCES [dbo].[AttentionCenter] ([CodeAttentionCenter])
GO
ALTER TABLE [dbo].[Entity_AttentionCenter] CHECK CONSTRAINT [FK__Entity_At__CodeA__10E07F16]
GO
ALTER TABLE [dbo].[Entity_AttentionCenter]  WITH CHECK ADD  CONSTRAINT [FK_Entity_AttentionCenter_Entity] FOREIGN KEY([CodeAttentionCenter])
REFERENCES [dbo].[Entity] ([CodeEntity])
GO
ALTER TABLE [dbo].[Entity_AttentionCenter] CHECK CONSTRAINT [FK_Entity_AttentionCenter_Entity]
GO
ALTER TABLE [dbo].[GroupService]  WITH CHECK ADD  CONSTRAINT [FK_GroupService_Zone] FOREIGN KEY([CodeZone])
REFERENCES [dbo].[Zone] ([CodeZone])
GO
ALTER TABLE [dbo].[GroupService] CHECK CONSTRAINT [FK_GroupService_Zone]
GO
ALTER TABLE [dbo].[Proccedure]  WITH CHECK ADD FOREIGN KEY([CodeTypeProcedure])
REFERENCES [dbo].[TypeProcedure] ([CodeTypeProcedure])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK__Service__CodeTyp__1EA48E88] FOREIGN KEY([CodeTypeService])
REFERENCES [dbo].[TypeService] ([CodeTypeService])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK__Service__CodeTyp__1EA48E88]
GO
ALTER TABLE [dbo].[ServiceAttention]  WITH CHECK ADD FOREIGN KEY([CodeAttention])
REFERENCES [dbo].[Attention] ([CodeAttention])
GO
ALTER TABLE [dbo].[ServiceAttention]  WITH CHECK ADD  CONSTRAINT [FK__ServiceAt__CodeS__208CD6FA] FOREIGN KEY([CodeService])
REFERENCES [dbo].[Service] ([CodeService])
GO
ALTER TABLE [dbo].[ServiceAttention] CHECK CONSTRAINT [FK__ServiceAt__CodeS__208CD6FA]
GO
ALTER TABLE [dbo].[ServiceAttentionCenter]  WITH CHECK ADD  CONSTRAINT [FK__Procedure__CodeA__46E78A0C] FOREIGN KEY([CodeAttentionCenter])
REFERENCES [dbo].[AttentionCenter] ([CodeAttentionCenter])
GO
ALTER TABLE [dbo].[ServiceAttentionCenter] CHECK CONSTRAINT [FK__Procedure__CodeA__46E78A0C]
GO
ALTER TABLE [dbo].[ServiceAttentionCenter]  WITH CHECK ADD  CONSTRAINT [FK_ServiceAttentionCenter_Service] FOREIGN KEY([CodeService])
REFERENCES [dbo].[Service] ([CodeService])
GO
ALTER TABLE [dbo].[ServiceAttentionCenter] CHECK CONSTRAINT [FK_ServiceAttentionCenter_Service]
GO
ALTER TABLE [dbo].[ServiceEntity]  WITH CHECK ADD  CONSTRAINT [FK__ServiceEn__CodeS__236943A5] FOREIGN KEY([CodeService])
REFERENCES [dbo].[Service] ([CodeService])
GO
ALTER TABLE [dbo].[ServiceEntity] CHECK CONSTRAINT [FK__ServiceEn__CodeS__236943A5]
GO
ALTER TABLE [dbo].[ServiceTicket]  WITH CHECK ADD  CONSTRAINT [FK__ServiceTi__CodeS__245D67DE] FOREIGN KEY([CodeService])
REFERENCES [dbo].[Service] ([CodeService])
GO
ALTER TABLE [dbo].[ServiceTicket] CHECK CONSTRAINT [FK__ServiceTi__CodeS__245D67DE]
GO
ALTER TABLE [dbo].[ServiceTicket]  WITH CHECK ADD  CONSTRAINT [FK__ServiceTi__CodeT__24285DB4] FOREIGN KEY([CodeTicket])
REFERENCES [dbo].[Ticket] ([CodeTicket])
GO
ALTER TABLE [dbo].[ServiceTicket] CHECK CONSTRAINT [FK__ServiceTi__CodeT__24285DB4]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK__Ticket__CodeTick__23F3538A] FOREIGN KEY([CodeTicketType])
REFERENCES [dbo].[TicketType] ([CodeTicketType])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK__Ticket__CodeTick__23F3538A]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_People] FOREIGN KEY([CodePeople])
REFERENCES [dbo].[People] ([CodePeople])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_People]
GO
ALTER TABLE [dbo].[TicketStateHistory]  WITH CHECK ADD FOREIGN KEY([CodeTicketState])
REFERENCES [dbo].[TicketState] ([CodeTicketStat])
GO
ALTER TABLE [dbo].[TicketStateHistory]  WITH CHECK ADD  CONSTRAINT [FK__TicketSta__CodeT__251C81ED] FOREIGN KEY([CodeTicket])
REFERENCES [dbo].[Ticket] ([CodeTicket])
GO
ALTER TABLE [dbo].[TicketStateHistory] CHECK CONSTRAINT [FK__TicketSta__CodeT__251C81ED]
GO
ALTER TABLE [dbo].[VideoZone]  WITH CHECK ADD  CONSTRAINT [FK__VideoZone__CodeV__2704CA5F] FOREIGN KEY([CodeVideo])
REFERENCES [dbo].[Video] ([CodeVideo])
GO
ALTER TABLE [dbo].[VideoZone] CHECK CONSTRAINT [FK__VideoZone__CodeV__2704CA5F]
GO
ALTER TABLE [dbo].[VideoZone]  WITH CHECK ADD  CONSTRAINT [FK__VideoZone__CodeZ__27F8EE98] FOREIGN KEY([CodeZone])
REFERENCES [dbo].[Zone] ([CodeZone])
GO
ALTER TABLE [dbo].[VideoZone] CHECK CONSTRAINT [FK__VideoZone__CodeZ__27F8EE98]
GO
ALTER TABLE [dbo].[Window]  WITH CHECK ADD  CONSTRAINT [FK__Window__CodeZone__28ED12D1] FOREIGN KEY([CodeZone])
REFERENCES [dbo].[Zone] ([CodeZone])
GO
ALTER TABLE [dbo].[Window] CHECK CONSTRAINT [FK__Window__CodeZone__28ED12D1]
GO
ALTER TABLE [dbo].[Zone]  WITH CHECK ADD FOREIGN KEY([CodeAttentionCenter])
REFERENCES [dbo].[AttentionCenter] ([CodeAttentionCenter])
GO
