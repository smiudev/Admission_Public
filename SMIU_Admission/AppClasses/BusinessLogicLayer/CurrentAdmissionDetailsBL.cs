using SMIU_Admission.AppClasses.DataAccessLayer;
using System;
using System.Configuration;
using System.Data;

namespace SMIU_Admission.AppClasses.BusinessLogicLayer
{
    public class CurrentAdmissionDetailsBL
    {
        public DataTable GetCurrentAdmissionDetails()
        {
            try
            {   
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetCurrentAdmissionDetails").Tables[0];
            }
            catch (Exception ex)
            {
            }
            return null;
        }

    }
}