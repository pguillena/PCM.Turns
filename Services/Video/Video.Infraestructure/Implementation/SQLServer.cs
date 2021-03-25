using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Video.Infraestructure.Base;

namespace Video.Infraestructure.Implementation
{
    public class SQLServer
    {
        Settings oSettings;
        SqlConnection sqlConnection;
        SqlCommand sqlCommand;
        public SQLServer()
        {
            oSettings = new Settings();
            try
            {
                oSettings.Load();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del archivo de configuración.", ex);
            }
        }
    
        public string ReadOneValue(string Command)
        {
            return ReadOneValue(Command, null);
        }
        public string ReadOneValue(string Command, SqlParameterCollection sqlParameterCollection)
        {
            if (sqlConnection == null)
                sqlConnection = new SqlConnection(oSettings.ConnectionString);
            try
            {
                using (sqlCommand = new SqlCommand(Command, sqlConnection))
                {
                    if (sqlParameterCollection != null)
                        sqlCommand.Parameters.Add(sqlParameterCollection);
                    string sReturnValue = null;
                    sqlConnection.Open();
                    SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                    if (sqlDataReader.HasRows)
                    {
                        sqlDataReader.Read();
                        sReturnValue = sqlDataReader.GetValue(0).ToString();
                    }
                    if (sqlDataReader != null && !sqlDataReader.IsClosed)
                        sqlDataReader.Close();
                    return sReturnValue;
                }
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo leer la información de la base de datos.", eXception);
            }
            finally
            {
                if (sqlConnection != null && sqlConnection.State != System.Data.ConnectionState.Closed)
                    sqlConnection.Close();
            }
        }

        public List<T> ReadValues<T>(string Command, List<SqlParameter> sqlParameterCollection)
        {
            List<T> listValues;
            if (sqlConnection == null)
                sqlConnection = new SqlConnection(oSettings.ConnectionString);
            try
            {
                using (sqlCommand = new SqlCommand(Command, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    if (sqlParameterCollection != null)
                        sqlCommand.Parameters.AddRange(sqlParameterCollection.ToArray());
                    listValues = new List<T>();
                    sqlConnection.Open();

                    SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

                    if (sqlDataReader.HasRows)
                    {
                        while (sqlDataReader.Read())
                        {
                            var item = Activator.CreateInstance<T>();
                            foreach (var property in typeof(T).GetProperties())
                            {
                                var propertyNameExists = Turns.Transversal.Common.DataRecordExtensions.HasColumn(sqlDataReader, property.Name);
                                if (propertyNameExists)
                                {
                                    if (!sqlDataReader.IsDBNull(sqlDataReader.GetOrdinal(property.Name)))
                                    {
                                        Type convertTo = Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType;
                                        property.SetValue(item, Convert.ChangeType(sqlDataReader[property.Name], convertTo), null);
                                    }
                                }
                            }
                            listValues.Add(item);
                        }
                    }
                    if (sqlDataReader != null && !sqlDataReader.IsClosed)
                        sqlDataReader.Close();
                    return listValues;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo leer la información de la base de datos.", ex);
            }
            finally
            {
                if (sqlConnection != null && sqlConnection.State != System.Data.ConnectionState.Closed)
                    sqlConnection.Close();
            }
        }

        public int Save(string Command, List<SqlParameter> sqlParameterCollection)
        {
            if (sqlConnection == null)
                sqlConnection = new SqlConnection(oSettings.ConnectionString);
            try
            {
                using (sqlCommand = new SqlCommand(Command, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    if (sqlParameterCollection != null)
                        sqlCommand.Parameters.AddRange(sqlParameterCollection.ToArray());
                    sqlConnection.Open();
                    return Convert.ToInt32(sqlCommand.ExecuteScalar());
                }
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo leer la información de la base de datos.", ex);
            }
            finally
            {
                if (sqlConnection != null && sqlConnection.State != System.Data.ConnectionState.Closed)
                    sqlConnection.Close();
            }
        }

    }
}
