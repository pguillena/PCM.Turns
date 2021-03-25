

private DataTable dtMovArchivo(List<TUMovArchivo> olistaTUMovArchivo)
{
	DataTable dtMovArchivo = new DataTable();
	dtMovArchivo.Columns.Add("CodMovArchivo", typeof(Int32));
	dtMovArchivo.Columns.Add("CodMaeSolicitud", typeof(Int32));
	dtMovArchivo.Columns.Add("CodMaeDocumento", typeof(String));
	dtMovArchivo.Columns.Add("NumDocRespuesta", typeof(String));
	dtMovArchivo.Columns.Add("FechRegArchivo", typeof(DateTime));
	dtMovArchivo.Columns.Add("NomArchivo", typeof(String));
	dtMovArchivo.Columns.Add("UrlArchivo", typeof(String));
	dtMovArchivo.Columns.Add("TamArchivo", typeof(Int32));
	dtMovArchivo.Columns.Add("ExtArchivo", typeof(String));

	foreach (TUMovArchivo oTUMovArchivo in olistaTUMovArchivo)
	{
		DataRow newRow = dtMovArchivo.NewRow();

		newRow["CodMovArchivo"] = oTUMovArchivo.CodMovArchivo;
		newRow["CodMaeSolicitud"] = oTUMovArchivo.CodMaeSolicitud;
		newRow["CodMaeDocumento"] = oTUMovArchivo.CodMaeDocumento;
		newRow["NumDocRespuesta"] = oTUMovArchivo.NumDocRespuesta;
		newRow["FechRegArchivo"] = oTUMovArchivo.FechRegArchivo;
		newRow["NomArchivo"] = oTUMovArchivo.NomArchivo;
		newRow["UrlArchivo"] = oTUMovArchivo.UrlArchivo;
		newRow["TamArchivo"] = oTUMovArchivo.TamArchivo;
		newRow["ExtArchivo"] = oTUMovArchivo.ExtArchivo;

		dtMovArchivo.Rows.Add(newRow);
	}
	return dtMovArchivo;
} 
--------------------------------

 public int GestionarBandejaFuncionarioDetalle(int CodMovUsuario,int CodMaeSolicitud,List<TUMovSolicitud> olistaTUMovSolicitud, List<TUMovArchivo> oListaTUMovArchivo)
        {

            int codRespuesta = -1;
            SqlConnection cn = new SqlConnection(Conexion.ConexionTupa);
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TUPA.USP_I_ArchivoDetalle_Insertar";

            cmd.Parameters.AddWithValue("@CodMovUsuario", CodMovUsuario);
            cmd.Parameters.AddWithValue("@CodMaeSolicitud", CodMaeSolicitud);

            SqlParameter sqlp1 = cmd.Parameters.AddWithValue("@tpmMovSolicitud", dtMovSolicitud(olistaTUMovSolicitud));
            sqlp1.SqlDbType = SqlDbType.Structured;
            sqlp1.TypeName = "TUPA.dtMovSolicitud";

            SqlParameter sqlp2 = cmd.Parameters.AddWithValue("@tpmMovArchivo", dtMovArchivo(oListaTUMovArchivo));
            sqlp2.SqlDbType = SqlDbType.Structured;
            sqlp2.TypeName = "TUPA.dtMovArchivo";

            cmd.Connection.Open();

            try
            {
                codRespuesta = Convert.ToInt32(cmd.ExecuteScalar());
                return codRespuesta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cmd.Connection.Close();
                cmd.Dispose();
            }
        } 

-----------------------------------------------------------------
ALTER PROCEDURE [TUPA].[USP_I_ArchivoDetalle_Insertar]   
@CodMaeSolicitud    INT,
@CodMovUsuario INT,
/*TABLAS TUPADAS*/   
@tpmMovArchivo  TUPA.dtMovArchivo READONLY,
@tpmMovSolicitud  TUPA.dtMovSolicitud READONLY

txtRazonSocialDi


/*INSERTAR TABLA MOVARCHIVO*/
   SELECT IDENTITY (INT,1,1) AS IdRow,* INTO #tpmMovArchivo FROM @tpmMovArchivo 
  
   SET @NumRegistros=(SELECT COUNT(1) FROM #tpmMovArchivo)
   SET @i=0	
   WHILE @i<=@NumRegistros
   BEGIN

		IF((SELECT CodMovArchivo FROM #tpmMovArchivo WHERE IdRow=@i)=0)
		BEGIN

			SELECT @CodMovArchivo = ISNULL(MAX(CodMovArchivo),0) + 1 FROM TUPA.TUMovArchivo (NOLOCK)   

			INSERT INTO TUPA.TUMovArchivo
			(
				CodMovArchivo, 
				CodMaeSolicitud, 
				CodMovSolicitud, 
				CodMaeDocumento, 
				NumDocRespuesta, 
				NomArchivo, 
				UrlArchivo, 
				TamArchivo, 
				ExtArchivo, 
				FechRegArchivo, 
				Descripcion, 
				--CodUniPasarela, 
				--CodVoucher, 
				RegUsuaRegistra, 
				FechRegistra, 
				Estado
				)
			   SELECT 
				@CodMovArchivo,  			
				@CodMaeSolicitud, 
				NULL,
				CodMaeDocumento, 
				NumDocRespuesta, 
				NomArchivo, 
				UrlArchivo, 
				TamArchivo, 
				ExtArchivo,
				FechRegArchivo, 
				NULL,
				@CodMovUsuario, 					               
				@dtHoy,                        
				@bEstado
			   FROM #tpmMovArchivo
			WHERE IdRow=@i								
		END	
		SET @i+=1
   END
   
   ------------------------------------------------------------------
   
   -- ================================
-- Create User-defined Table Type
-- ================================
USE [db_pcm_gob_pe_turn]
GO

-- Create the data type
CREATE TYPE dtAppointment AS TABLE(
	CodeAppointment[int] NULL,
	CodePeople [int] NULL,
	CodeSchedule [int] NULL,
	CodeServAttenCenter [int] NULL
)
GO

	 
 