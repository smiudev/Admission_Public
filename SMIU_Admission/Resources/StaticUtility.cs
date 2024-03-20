using SMIU_Admission.AppClasses.BusinessLogicLayer;
using System;
using System.Data;

namespace SMIU_Admission.Resources
{
    public enum SecurityProtocolType { Tls, Tls12};
    public class StaticUtility
    {
        public static string CurrentAdmission { get; set; }
        public static DateTime LastDate { get; set; }        
        public static bool Prospectus { get; set; }
        public static bool SamplePaper { get; set; }
        public static bool AdmitCard { get; set; }
        public static string WaitingDays { get; set; }
        public static DateTime TestStartDate { get; set; }
        public static DateTime TestEndDate { get; set; }
        public static DateTime TestResultDate { get; set; }
        public static DateTime FirstMeritDate { get; set; }
        public static DateTime SecondMeritDate { get; set; }
        public static DateTime ThirdMeritDate { get; set; }
        public static bool IsFeeReceived { get; set; }

        public static void PopulateCurrentAdmissionDetails()
        {
            DataTable dt = new CurrentAdmissionDetailsBL().GetCurrentAdmissionDetails();
            if (dt.Rows.Count > 0)
            {
                CurrentAdmission = dt.Rows[0]["SemesterName"].ToString();
                LastDate = Convert.ToDateTime(dt.Rows[0]["LastDate"].ToString());
                TestStartDate = DateTime.Parse(dt.Rows[0]["TestStartDate"].ToString());
                TestEndDate = DateTime.Parse(dt.Rows[0]["TestEndDate"].ToString());

                TestResultDate = DateTime.Parse(dt.Rows[0]["TestResultDate"].ToString());
                FirstMeritDate = DateTime.Parse(dt.Rows[0]["FirstMeritDate"].ToString());
                SecondMeritDate = DateTime.Parse(dt.Rows[0]["SecondMeritDate"].ToString());
                ThirdMeritDate = DateTime.Parse(dt.Rows[0]["ThirdMeritDate"].ToString());

                Prospectus = Convert.ToBoolean(dt.Rows[0]["Prospectus"].ToString());
                SamplePaper = Convert.ToBoolean(dt.Rows[0]["SamplePaper"].ToString());
                AdmitCard = Convert.ToBoolean(dt.Rows[0]["AdmitCard"].ToString());

            }
        }
    }
}