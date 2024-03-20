using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using SMIU_Admission.AppClasses.DataAccessLayer;
using System.Data;
using System.Configuration;
using AjaxControlToolkit.HTMLEditor.ToolbarButton;
using System.Text;

namespace SMIU_Admission.AppClasses.BusinessLogicLayer
{
    public class StudentPhoto
    {
        #region Fields & Properties
        public int StudentID { get; set; }
        public string ImageName { get; set; }
        public Int64? ImageSize { get; set; }
        public byte[] StudentPic { get; set; }
        public string ImagePath { get; set; }

        #endregion

        #region  Insert Student Photo Information With Transaction
        public bool InsertStudentPhoto(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[4];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@ImageName", ImageName);
                sqlparams[2] = new SqlParameter("@ImageSize", ImageSize);
                if(StudentPic != null)
                    sqlparams[3] = new SqlParameter("@StudentPhoto", StudentPic);
                else
                {
                    Encoding encoding = new UTF8Encoding();
                    sqlparams[3] = new SqlParameter("@StudentPhoto", encoding.GetBytes("0x"));
                }
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertStudentPhoto", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool NEW_InsertStudentPhoto(SqlTransaction sqltrans)
        {
            try
            {
               
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool InsertMTCStudentPhoto(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[4];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@ImageName", ImageName);
                sqlparams[2] = new SqlParameter("@ImageSize", ImageSize);
                sqlparams[3] = new SqlParameter("@StudentPhoto", StudentPic);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertMTCStudentPhoto", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }


        #endregion


        #region  Update Student Photo Information With Transaction
        public bool UpdateStudentPhoto(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[4];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@ImageName", ImageName);
                sqlparams[2] = new SqlParameter("@ImageSize", ImageSize);
                sqlparams[3] = new SqlParameter("@StudentPhoto", StudentPic);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "UpdateStudentPhoto", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion

        #region  Delete Student Photo Information With Transaction
        public bool DeleteStudentPhotoInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "DeleteStudentPhotoInfo", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion


        #region Update Form Status

        public bool UpdatStudentPhotoPath()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@ImagePath", ImagePath);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "UpdatStudentPhotoPath", sqlparams);
            }
            catch
            {
                return false;
            }
            return true;

        }


        public bool UpdatMTCStudentPhotoPath()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@ImagePath", ImagePath);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "UpdatMTCStudentPhotoPath", sqlparams);
            }
            catch
            {
                return false;
            }
            return true;

        }


        #endregion


    }
}