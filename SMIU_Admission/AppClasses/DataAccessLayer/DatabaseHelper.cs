using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Globalization;
using System.Diagnostics.CodeAnalysis;
namespace SMIU_Admission.AppClasses.DataAccessLayer
{
    public class DatabaseHelper : IDisposable
    {
        #region Fields / Properties
        private Database _Database;
        private DbConnection _Connection;
        private DbTransaction _Transaction;
        private DbCommand _Command;

        private string _StoredProcedureName;
        public string StoredProcedureName
        {
            get { return _StoredProcedureName; }
            set
            {
                System.Diagnostics.Debug.Assert(value != null);
                if (value == null)
                    return;

                _StoredProcedureName = value;

                //check if command object already exists and has some parameters already defined
                if (_Command != null && _Command.Parameters.Count != 0)
                    _Command.Parameters.Clear();

                _Command = _Database.GetStoredProcCommand(_StoredProcedureName);
            }
        }
        #endregion

        #region Constructor
        public DatabaseHelper()
        {
            _Database = DatabaseFactory.CreateDatabase("smi_ConnectionString");
        }
        public DatabaseHelper(ApplicationConnectionString connectionString)
        {
            switch (connectionString)
            {
                case ApplicationConnectionString.smi_ConnectionString:
                    _Database = DatabaseFactory.CreateDatabase("smi_ConnectionString");
                    break;
            }
        }
        public DatabaseHelper(string connectionString)
        {
            _Database = DatabaseFactory.CreateDatabase(connectionString);
        }
        #endregion

        #region Connection
        private void OpenConnection()
        {
            if (_Connection == null)
                _Connection = _Database.CreateConnection();

            if (_Connection.State != ConnectionState.Open)
                _Connection.Open();
        }
        private void CloseConnection()
        {
            //if connection is still open then close it
            if (_Connection != null && _Connection.State != ConnectionState.Closed)
                _Connection.Close();
        }
        #endregion

        #region Transaction
        private void BeginTransaction()
        {
            OpenConnection();

            if (_Transaction == null)
                _Transaction = _Connection.BeginTransaction();

            if (_Transaction != null)
                _Command.Transaction = _Transaction;
        }
        private void EndTransaction()
        {
            if (_Transaction != null)
            {
                _Transaction.Commit();
                _Transaction = null;
            }

            //CloseConnection();
        }

        public void Commit()
        {
            EndTransaction();
        }

        public void Rollback()
        {
            if (_Transaction != null)
                _Transaction.Rollback();
        }
        #endregion

        #region Command.Parameters
        public void AddParameterBool(string name, bool value)
        {
            AddParameter(name, DbType.Boolean, value);
        }
        public void AddParameterInt(string name, int value)
        {
            AddParameter(name, DbType.Int32, value);
        }
        public void AddParameterDecimal(string name, decimal value)
        {
            AddParameter(name, DbType.Decimal, value);
        }
        public void AddParameterMoney(string name, decimal value)
        {
            AddParameter(name, DbType.Currency, value);
        }
        public void AddParameterDateTime(string name, DateTime value)
        {
            AddParameter(name, DbType.DateTime, value);
        }
        public void AddParameterChar(string name, string value)
        {
            AddParameter(name, DbType.AnsiStringFixedLength, value);
        }
        public void AddParameterVarChar(string name, string value)
        {
            AddParameter(name, DbType.AnsiString, value);

        }
        public void AddParameter(string name, DbType dbType, object value)
        {
            _Database.AddInParameter(_Command, name, dbType, value);
        }
        public void AddOutParameter(string name, DbType dbType, int size)
        {
            _Database.AddOutParameter(_Command, name, dbType, size);
        }
        public object GetParameterValue(string name)
        {
            return _Database.GetParameterValue(_Command, name);
        }

        #endregion

        #region Execute
        // Execute* methods create a transaction explicitly, it is the responsibility of the caller to Commit the transaction otherwise the Dispose method will Rollback the transaction
        public IDataReader ExecuteReader()
        {
            //BeginTransaction();
            if (_Transaction == null)
                return _Database.ExecuteReader(_Command);

            return _Database.ExecuteReader(_Command, _Transaction);
        }
        // Execute* methods create a transaction explicitly, it is the responsibility of the caller to Commit the transaction otherwise the Dispose method will Rollback the transaction
        public int ExecuteNonQuery()
        {
            BeginTransaction();

            return _Database.ExecuteNonQuery(_Command, _Transaction);
        }
        // Execute* methods create a transaction explicitly, it is the responsibility of the caller to Commit the transaction otherwise the Dispose method will Rollback the transaction
        public object ExecuteScalar()
        {
            BeginTransaction();

            return _Database.ExecuteScalar(_Command, _Transaction);
        }
        // Execute* methods create a transaction explicitly, it is the responsibility of the caller to Commit the transaction otherwise the Dispose method will Rollback the transaction
        public DataSet ExecuteDataSet()
        {
            //BeginTransaction();
            if (_Transaction == null)
                return _Database.ExecuteDataSet(_Command);

            return _Database.ExecuteDataSet(_Command, _Transaction);
        }
        #endregion

        #region Coalesce
        public static decimal Coalesce(object value, decimal defaultValue)
        {
            decimal RetVal = defaultValue;

            if (value != null && value != DBNull.Value && value.ToString().Length != 0)
                RetVal = Convert.ToDecimal(value, CultureInfo.CurrentCulture);

            return RetVal;
        }
        public static int Coalesce(object value, int defaultValue)
        {
            int RetVal = defaultValue;

            if (value != null && value != DBNull.Value && value.ToString().Length != 0)
                RetVal = Convert.ToInt32(value, CultureInfo.CurrentCulture);

            return RetVal;
        }
        public static string Coalesce(object value, string defaultValue)
        {
            if (value == null)
                return defaultValue;

            string RetVal = defaultValue;

            if (value != null && value != DBNull.Value && value.ToString().Length != 0 && string.Compare(value.ToString(), "''", true, CultureInfo.CurrentCulture) != 0)
                RetVal = value.ToString();

            return RetVal;
        }
        public static DateTime Coalesce(object value, DateTime defaultValue)
        {
            DateTime RetVal = defaultValue;

            if (value != null && value != DBNull.Value)
                RetVal = Convert.ToDateTime(value, CultureInfo.CurrentCulture);

            return RetVal;
        }
        public static bool Coalesce(object value, bool defaultValue)
        {
            bool RetVal = defaultValue;

            if (value != null && value != DBNull.Value && value.ToString().Length != 0)
                RetVal = Convert.ToBoolean(value, CultureInfo.CurrentCulture);

            return RetVal;
        }
        public static double Coalesce(object value, double defaultValue)
        {
            double RetVal = defaultValue;

            if (value != null && value != DBNull.Value && value.ToString().Length != 0)
                RetVal = Convert.ToDouble(value, CultureInfo.CurrentCulture);

            return RetVal;
        }
        #endregion

        public static decimal ToDecimal(string value)
        {
            if (value == null || value.Length == 0)
                return 0;

            if (value == null)
                throw new ArgumentNullException("value");

            return Decimal.Parse(
                value.Replace(" ", ""),
                NumberStyles.AllowThousands | NumberStyles.AllowDecimalPoint | NumberStyles.AllowCurrencySymbol,
                CultureInfo.CurrentCulture);
        }

        #region IsClean
        public static bool IsClean(DataSet ds)
        {
            return (ds != null && ds.Tables.Count != 0 && ds.Tables[0].Rows.Count != 0);
        }

        public static bool IsClean(DataTable dt)
        {
            return (dt != null && dt.Rows.Count != 0);
        }
        #endregion

        #region Converters
        public static string[] TableToArray(DataTable table)
        {
            // Validate arguments
            if (table == null)
                throw new ArgumentNullException("table");

            if (table.Rows.Count == 0)
                return new string[0];

            // Convert table to array
            string[] data = new string[table.Rows.Count];

            for (int i = 0; i < table.Rows.Count; i++)
                data[i] = Convert.ToString(table.Rows[i][0], CultureInfo.CurrentCulture);

            return data;
        }
        #endregion

        #region Dispose Pattern
        #region IDisposable Members
        // Dispose() calls Dispose(true)
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        #endregion

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                // free managed resources

                //dispose and rollback the transaction
                if (_Transaction != null)
                {
                    //rollback transaction
                    _Transaction.Rollback();

                    //dispose the transaction object
                    _Transaction.Dispose();
                    _Transaction = null;
                }

                //dispose the command object
                if (_Command != null)
                {
                    _Command.Dispose();
                    _Command = null;
                }

                CloseConnection();

                //dispose the connection object
                if (_Connection != null)
                {
                    _Connection.Dispose();
                    _Connection = null;
                }

                //dispose the database object
                if (_Database != null)
                    _Database = null;
            }
        }
        #endregion
    }

    public enum ApplicationConnectionString
    {
        smi_ConnectionString,

    }
}
