using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using SMIU_Admission.AppClasses.DataAccessLayer;
using System.Data;
using System.Configuration;
using System.Runtime.InteropServices;

namespace SMIU_Admission.AppClasses.BusinessLogicLayer
{
    public class StudentPersonalInfo
    {

        #region Fields & Properties
        public int StudentID { get; set; }
        public int ReferenceNumber { get; set; }
        public string CNICNumber { get; set; }
        public string PassportNumber { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string FathersName { get; set; }
        public string FathersOccupation { get; set; }
        public string Nationality { get; set; }
        public string Religion { get; set; }
        public string Gender { get; set; }
        public DateTime DateofBirth { get; set; }
        public string PlaceOfBirth { get; set; }
        public string MaritalStatus { get; set; }
        public string PermanentAddress { get; set; }
        public string PostalAddress { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public Int64? HomePhoneNumber { get; set; }
        public Int64 MobileNumber { get; set; }
        public string EmailAddress { get; set; }
        public Int64 EmergencyContactNo { get; set; }
        public string DistrictOfDomicile { get; set; }
        public string UrbanorRural { get; set; }
        public int ProgramCode { get; set; }
        public int SemesterId { get; set; }
        public int RegistrationID { get; set; }
        public bool IsFinalSubmitted { get; set; }
        public string Filter { get; set; }
        public string Query { get; set; }
        public string SeatNumber { get; set; }
        public int? FromRange { get; set; }
        public int? ToRange { get; set; }
        public string DepartmentName { get; set; }
        public string PaperShift { get; set; }
        public string FacultyName { get; set; }
        public string CourseName { get; set; }
        public string PaperDay { get; set; }
        public string PaperTime { get; set; }
        public string PermanentCity { get; set; }
        public string PostalCity { get; set; }
        public long? MobileNumberHome { get; set; }
        public string EmergencyName { get; set; }
        public string EmergencyRelation { get; set; }
        public string EmergencyAddress { get; set; }
        public long? EmergencyMnumber { get; set; }
        public string DegreeProgram { get; set; }
        public string CPECourseName { get; set; }
        public string Password { get; set; }
        public bool Isdocumentsubmitted { get; set; }
        public bool AvailTransport { get; set; }
        public string TransportDesc { get; set; }
        public int TutionFeeAmount { get; set; }
        #endregion

        public int NEW_InsertStudentPersonalInfo()
        {
            int result = -1;
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[22];
                sqlparams[0] = new SqlParameter("@RegistrationID", RegistrationID);
                sqlparams[1] = new SqlParameter("@CNICNumber", CNICNumber);
                sqlparams[2] = new SqlParameter("@PassportNumber", PassportNumber);
                sqlparams[3] = new SqlParameter("@FirstName", FirstName);
                sqlparams[4] = new SqlParameter("@MiddleName", MiddleName);
                sqlparams[5] = new SqlParameter("@LastName", LastName);
                sqlparams[6] = new SqlParameter("@FathersName", FathersName);
                sqlparams[7] = new SqlParameter("@FathersOccupation", FathersOccupation);
                sqlparams[8] = new SqlParameter("@Nationality", Nationality);
                sqlparams[9] = new SqlParameter("@Religion", Religion);
                sqlparams[10] = new SqlParameter("@Gender", Gender);
                sqlparams[11] = new SqlParameter("@DateofBirth", DateofBirth);
                sqlparams[12] = new SqlParameter("@PlaceOfBirth", PlaceOfBirth);
                sqlparams[13] = new SqlParameter("@MaritalStatus", MaritalStatus);
                sqlparams[14] = new SqlParameter("@PermanentAddress", PermanentAddress);
                sqlparams[15] = new SqlParameter("@PostalAddress", PostalAddress);
                sqlparams[16] = new SqlParameter("@Country", Country);
                sqlparams[17] = new SqlParameter("@HomePhoneNumber", HomePhoneNumber);
                sqlparams[18] = new SqlParameter("@MobileNumber", MobileNumber);
                sqlparams[19] = new SqlParameter("@EmailAddress", EmailAddress);
                sqlparams[20] = new SqlParameter("@DistrictOfDomicile", DistrictOfDomicile );
                sqlparams[21] = new SqlParameter("@UrbanorRural", UrbanorRural);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                result = int.Parse(SqlHelper.ExecuteScalar(conn, CommandType.StoredProcedure, "NEW_InsertStudentPersonalInfo", sqlparams).ToString());
            }
            catch (Exception ex)
            {
                return -1;
            }
            return result;
        }

        public bool NEW_UpdateDocumentSubmitStatus()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@StudentId", StudentID);

                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                int.Parse(SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "NEW_UpdateDocumentSubmitStatus", sqlparams).ToString());
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        public bool NEW_UpdateFinalSubmitStatus(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "NEW_UpdateFinalSubmitStatus", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool NEW_UpdateTransportStatus(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@PickupLocation", TransportDesc);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "NEW_UpdateTransportStatus", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }

        #region  Insert Student Persoanl Information With Transaction
        public int InsertStudentPersoanlInfo(SqlTransaction sqltrans)
        {
            int result = -1;
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[35];
                sqlparams[0] = new SqlParameter("@RegistrationID", RegistrationID);
                sqlparams[1] = new SqlParameter("@ReferenceNumber", ReferenceNumber);
                sqlparams[2] = new SqlParameter("@CNICNumber", CNICNumber);
                sqlparams[3] = new SqlParameter("@PassportNumber", string.IsNullOrEmpty(PassportNumber) ? Convert.DBNull : PassportNumber);
                sqlparams[4] = new SqlParameter("@FirstName", FirstName);
                sqlparams[5] = new SqlParameter("@MiddleName", string.IsNullOrEmpty(MiddleName) ? Convert.DBNull : MiddleName);
                sqlparams[6] = new SqlParameter("@LastName", string.IsNullOrEmpty(LastName) ? Convert.DBNull : LastName);
                sqlparams[7] = new SqlParameter("@FathersName", FathersName);
                sqlparams[8] = new SqlParameter("@FathersOccupation", FathersOccupation);
                sqlparams[9] = new SqlParameter("@Nationality", Nationality);
                sqlparams[10] = new SqlParameter("@Religion", Religion);
                sqlparams[11] = new SqlParameter("@Gender", Gender);
                sqlparams[12] = new SqlParameter("@DateofBirth", DateofBirth);
                sqlparams[13] = new SqlParameter("@PlaceOfBirth", PlaceOfBirth);
                sqlparams[14] = new SqlParameter("@MaritalStatus", MaritalStatus);
                sqlparams[15] = new SqlParameter("@PermanentAddress", PermanentAddress);
                sqlparams[16] = new SqlParameter("@PermanentCity", PermanentCity);
                sqlparams[17] = new SqlParameter("@PostalAddress", PostalAddress);
                sqlparams[18] = new SqlParameter("@PostalCity", PostalCity);
                sqlparams[19] = new SqlParameter("@PostalCode", string.IsNullOrEmpty(PostalCode) ? Convert.DBNull : PostalCode);
                sqlparams[20] = new SqlParameter("@Country", Country);
                sqlparams[21] = new SqlParameter("@HomePhoneNumber", HomePhoneNumber);
                sqlparams[22] = new SqlParameter("@MobileNumber", MobileNumber);
                sqlparams[23] = new SqlParameter("@EmailAddress", EmailAddress);
                sqlparams[24] = new SqlParameter("@DistrictOfDomicile", DistrictOfDomicile);
                sqlparams[25] = new SqlParameter("@UrbanorRural", UrbanorRural);
                sqlparams[26] = new SqlParameter("@SemesterId", SemesterId);
                sqlparams[27] = new SqlParameter("@IsFinalSubmitted", IsFinalSubmitted);
                sqlparams[28] = new SqlParameter("@MobileNumberHome", MobileNumberHome);
                sqlparams[29] = new SqlParameter("@EmergencyName", EmergencyName);
                sqlparams[30] = new SqlParameter("@EmergencyRelation", EmergencyRelation);
                sqlparams[31] = new SqlParameter("@EmergencyAddress", EmergencyAddress);
                sqlparams[32] = new SqlParameter("@EmergencyMnumber", EmergencyMnumber);                          
                sqlparams[33] = new SqlParameter("@AvailTransport", AvailTransport);
                sqlparams[34] = new SqlParameter("@TransportDesc", TransportDesc);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                result = int.Parse(SqlHelper.ExecuteScalar(sqltrans, CommandType.StoredProcedure, "InsertStudentPersoanlInfo", sqlparams).ToString());
            }
            catch(Exception ex)
            {
                return -1;
            }
            return result;
        }
        #endregion

        #region  Update Student Persoanl Information With Transaction
        public bool UpdateStudentPersoanlInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[33];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@ReferenceNumber", ReferenceNumber);
                sqlparams[2] = new SqlParameter("@CNICNumber", CNICNumber);
                sqlparams[3] = new SqlParameter("@PassportNumber", string.IsNullOrEmpty(PassportNumber) ? Convert.DBNull : PassportNumber);
                sqlparams[4] = new SqlParameter("@FirstName", FirstName);
                sqlparams[5] = new SqlParameter("@MiddleName", string.IsNullOrEmpty(MiddleName) ? Convert.DBNull : MiddleName);
                sqlparams[6] = new SqlParameter("@LastName", string.IsNullOrEmpty(LastName) ? Convert.DBNull : LastName);
                sqlparams[7] = new SqlParameter("@FathersName", FathersName);
                sqlparams[8] = new SqlParameter("@FathersOccupation", FathersOccupation);
                sqlparams[9] = new SqlParameter("@Nationality", Nationality);
                sqlparams[10] = new SqlParameter("@Religion", Religion);
                sqlparams[11] = new SqlParameter("@Gender", Gender);
                sqlparams[12] = new SqlParameter("@DateofBirth", DateofBirth);
                sqlparams[13] = new SqlParameter("@PlaceOfBirth", PlaceOfBirth);
                sqlparams[14] = new SqlParameter("@MaritalStatus", MaritalStatus);
                sqlparams[15] = new SqlParameter("@PermanentAddress", PermanentAddress);
                sqlparams[16] = new SqlParameter("@PermanentCity", PermanentCity);
                sqlparams[17] = new SqlParameter("@PostalAddress", PostalAddress);
                sqlparams[18] = new SqlParameter("@PostalCity", PostalCity);
                sqlparams[19] = new SqlParameter("@PostalCode", string.IsNullOrEmpty(PostalCode) ? Convert.DBNull : PostalCode);
                sqlparams[20] = new SqlParameter("@Country", Country);
                sqlparams[21] = new SqlParameter("@HomePhoneNumber", HomePhoneNumber);
                sqlparams[22] = new SqlParameter("@MobileNumber", MobileNumber);
                sqlparams[23] = new SqlParameter("@EmailAddress", EmailAddress);
                sqlparams[24] = new SqlParameter("@DistrictOfDomicile", DistrictOfDomicile);
                sqlparams[25] = new SqlParameter("@UrbanorRural", UrbanorRural);
                sqlparams[26] = new SqlParameter("@MobileNumberHome", MobileNumberHome);
                sqlparams[27] = new SqlParameter("@EmergencyName", EmergencyName);
                sqlparams[28] = new SqlParameter("@EmergencyRelation", EmergencyRelation);
                sqlparams[29] = new SqlParameter("@EmergencyAddress", EmergencyAddress);
                sqlparams[30] = new SqlParameter("@EmergencyMnumber", EmergencyMnumber);
                sqlparams[31] = new SqlParameter("@AvailTransport", AvailTransport);
                sqlparams[32] = new SqlParameter("@TransportDesc", TransportDesc);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "UpdateStudentPersoanlInfo", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion

        public DataTable New_GetInitialRegistrationData()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Email", EmailAddress);
                sqlparams[1] = new SqlParameter("@CNIC", CNICNumber);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "New_GetInitialRegistrationData", sqlparams).Tables[0];
            }
            catch(Exception ex)
            {
            }
            return dt;
        }
        public bool InsertStudentFormDetails(StudentPersonalInfo objStudentPersonalInfo, StudentGuardiansInfo objStudentGuardiansInfo, StudentNTSTestInfo objStudentNTSTestInfo, StudentSSCEducation objStudentSSCEducation, StudentHSCEducation objStudentHSCEducation, Student14YearsEducation objStudent14YearsEducation, Student16YearsEducation objStudent16YearsEducation, StudentOtherEducation objStudentOtherEducation, StudentProgramInfo objStudentProgramInfo, StudentPhoto objStudentPhoto, FeeVoucherInfo objFeeVoucherInfo, Student18YearsEducation objStudent18YearsEducation)
        {
            bool result;
            SqlConnection sqlcon = null;
            SqlTransaction sqltrans = null;
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                sqlcon = new SqlConnection(conn);
                sqlcon.Open();
                sqltrans = sqlcon.BeginTransaction("InsertStudentformDetails");
                int StudentId = 0;
                StudentId = this.InsertStudentPersoanlInfo(sqltrans);
                if (StudentID == -1)
                    throw new Exception("Error in InsertStudentformDetails");

                objStudentGuardiansInfo.StudentID = StudentId;
                result = objStudentGuardiansInfo.InsertStudentGuardianInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                objStudentNTSTestInfo.StudentID = StudentId;
                result = objStudentNTSTestInfo.InsertStudentNTSTestInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                objStudentSSCEducation.StudentID = StudentId;
                result = objStudentSSCEducation.InsertStudentSSCEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                objStudentHSCEducation.StudentID = StudentId;
                result = objStudentHSCEducation.InsertStudentHSCEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                objStudent14YearsEducation.StudentId = StudentId;
                result = objStudent14YearsEducation.InsertStudent14YearEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");


                objStudent16YearsEducation.StudentId = StudentId;
                result = objStudent16YearsEducation.InsertStudent16YearEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");
                objStudent18YearsEducation.StudentId = StudentId;
                result = objStudent18YearsEducation.InsertStudent18YearEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                objStudentOtherEducation.StudentID = StudentId;
                result = objStudentOtherEducation.InsertStudentOtherEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                objStudentProgramInfo.StudentID = StudentId;
                result = objStudentProgramInfo.InsertStudentProgramChoicInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                objStudentPhoto.StudentID = StudentId;
                result = objStudentPhoto.InsertStudentPhoto(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                objFeeVoucherInfo.StudentID = StudentId;
                result = objFeeVoucherInfo.InsertStudentFeeVoucherInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                sqltrans.Commit();
                return true;
            }
            catch
            {
                sqltrans.Rollback("InsertStudentformDetails");
                return false;
            }
            finally
            {
                if (sqlcon.State == ConnectionState.Open)
                    sqlcon.Close();
            }
        }

        public bool UpdateStudentFormDetails(StudentPersonalInfo objStudentPersonalInfo, StudentGuardiansInfo objStudentGuardiansInfo, StudentNTSTestInfo objStudentNTSTestInfo, StudentSSCEducation objStudentSSCEducation, StudentHSCEducation objStudentHSCEducation, Student14YearsEducation objStudent14YearsEducation, Student16YearsEducation objStudent16YearsEducation, StudentOtherEducation objStudentOtherEducation, StudentProgramInfo objStudentProgramInfo, StudentPhoto objStudentPhoto, Student18YearsEducation objStudent18YearsEducation)
        {
            bool result;
            SqlConnection sqlcon = null;
            SqlTransaction sqltrans = null;
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                sqlcon = new SqlConnection(conn);
                sqlcon.Open();
                sqltrans = sqlcon.BeginTransaction("UpdateStudentformDetails");

                result = this.UpdateStudentPersoanlInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in UpdateStudentformDetails");

                result = objStudentGuardiansInfo.UpdateStudentGuardianInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in UpdateStudentformDetails");

                result = objStudentNTSTestInfo.UpdateStudentNTSTestInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in UpdateStudentformDetails");

                result = objStudentSSCEducation.UpdateStudentSSCEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in UpdateStudentformDetails");

                result = objStudentHSCEducation.UpdateStudentHSCEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in UpdateStudentformDetails");
                result = objStudent14YearsEducation.UpdateStudent14YearEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                result = objStudent16YearsEducation.UpdateStudent16YearEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");


                result = objStudent18YearsEducation.UpdateStudent18YearEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                result = objStudentOtherEducation.UpdateStudentOtherEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in UpdateStudentformDetails");

                result = objStudentProgramInfo.UpdateStudentProgramChoicInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in UpdateStudentformDetails");

                if (!string.IsNullOrEmpty(objStudentPhoto.ImageName))
                {
                    result = objStudentPhoto.UpdateStudentPhoto(sqltrans);
                    if (!result)
                        throw new Exception("Error in UpdateStudentformDetails");
                }
                sqltrans.Commit();
                return true;
            }
            catch
            {
                sqltrans.Rollback("UpdateStudentformDetails");
                return false;
            }
            finally
            {
                if (sqlcon.State == ConnectionState.Open)
                    sqlcon.Close();
            }
        }

        #region  Delete Student Persoanl Information With Transaction
        public bool DeleteStudentPersoanlInfo(SqlTransaction sqltrans)
        {

            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "DeleteStudentPersoanlInfo", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion

        public bool DeleteStudentFormDetails(StudentPersonalInfo objStudentPersonalInfo, StudentGuardiansInfo objStudentGuardiansInfo, StudentNTSTestInfo objStudentNTSTestInfo, StudentSSCEducation objStudentSSCEducation, StudentHSCEducation objStudentHSCEducation, Student14YearsEducation objStudent14YearsEducation, Student16YearsEducation objStudent16YearsEducation, StudentOtherEducation objStudentOtherEducation, StudentProgramInfo objStudentProgramInfo, StudentPhoto objStudentPhoto, FeeVoucherInfo objFeeVoucherInfo)
        {
            bool result;
            SqlConnection sqlcon = null;
            SqlTransaction sqltrans = null;
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                sqlcon = new SqlConnection(conn);
                sqlcon.Open();
                sqltrans = sqlcon.BeginTransaction("DeleteStudentformDetails");
                result = objStudentGuardiansInfo.DeleteStudentGuardianInformation(sqltrans);
                if (!result)
                    throw new Exception("Error in DeleteStudentformDetails");

                result = objStudentNTSTestInfo.DeleteStudentNTSTestInformation(sqltrans);
                if (!result)
                    throw new Exception("Error in DeleteStudentformDetails");

                result = objStudentSSCEducation.DeleteStudentSSCEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in UpdateStudentformDetails");

                result = objStudentHSCEducation.DeleteStudentHSCEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in DeleteStudentformDetails");
                result = objStudent14YearsEducation.DeleteStudent14YearEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in DeleteStudentformDetails");

                result = objStudent16YearsEducation.DeleteStudent16YearEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in DeleteStudentformDetails");

                result = objStudentOtherEducation.DeleteStudentOtherEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in DeleteStudentformDetails");

                result = objStudentProgramInfo.DeleteStudentProgramChoicInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in DeleteStudentformDetails");

                result = objStudentPhoto.DeleteStudentPhotoInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in DeleteStudentformDetails");

                result = objFeeVoucherInfo.DeleteStudentFeeVoucherInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in DeleteStudentformDetails");

                result = this.DeleteStudentPersoanlInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in DeleteStudentformDetails");
                sqltrans.Commit();
                return true;
            }
            catch
            {
                sqltrans.Rollback("DeleteStudentformDetails");
                return false;
            }
            finally
            {
                if (sqlcon.State == ConnectionState.Open)
                    sqlcon.Close();
            }
        }

        public DataTable GetStudentInfoByCNICNumber()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@CNICNumber", CNICNumber);
                sqlparams[1] = new SqlParameter("@SemesterId", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentID2", sqlparams).Tables[0];

            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentIDByCNICNumber()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@CNICNumber", CNICNumber);
                sqlparams[1] = new SqlParameter("@SemesterId", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentIDByCNICNumber", sqlparams).Tables[0];

            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public bool IsApplicantApproved()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentId", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetDataForDocumentsByCNICNumber", sqlparams).Tables[0];
            }
            catch { }
            return false;
        }


        public DataTable GetDataForDocumentsByCNICNumber()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@CNICNumber", CNICNumber);
                sqlparams[1] = new SqlParameter("@SemesterId", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetDataForDocumentsByCNICNumber", sqlparams).Tables[0];

            }
            catch (Exception ex)
            {

            }
            return dt;
        }
        public DataTable NEW_GetStudentInfoDataByRegistrationId()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@RegistrationId",RegistrationID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "NEW_GetStudentInfoDataByRegistrationId", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable NEW_GetStudentInfoDataByStudentId()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "NEW_GetStudentInfoDataByStudentId", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable NEW_GetStudentAdmissionFormInfoByStudentId()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "NEW_GetStudentAdmissionFormInfoByStudentId", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetStudentInfoByReferenceNumber()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByReferenceID", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetStudentInfoByReferenceIDForFeeVoucher()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByReferenceIDForFeeVoucher", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetAllStudentInfoBySemesterID()
        {
            DataTable dt = new DataTable();
            try
            {
                //SqlParameter[] sqlparams = new SqlParameter[1];
                //sqlparams[0] = new SqlParameter("@SemesterID", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAllStudentInfoBySemesterID").Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetStudentInfoByStudentIDpdf()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentIDPdf", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetStudentInfoByStudentIDForDoc()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentIDForDoc", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetStudentInfoByStudentIDforSemesterFeeVoucher()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentIDforSemesterFeeVoucher", sqlparams).Tables[0];
            }
            catch (Exception)
            {
            }
            return dt;
        }
        public DataTable GetStudentInfoByStudentIDforFeesPayment()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentIDforFeesPayment", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetStudentInfoByStudentIDforAttendance()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentIDforAttendance", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetStudentInfoByStudentIDforMeritbeforeInterview()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentIDforMeritbeforeInterview", sqlparams).Tables[0];
        
    }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetStudentMeritFinalBeforeInterview()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@RegistrationID", RegistrationID);
                sqlparams[2] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentMeritFinalBeforeInterview", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {

            }
            return dt;
        }
        public DataTable GetStudent1stMeritFinalAfterInterview(int meritlist)
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@RegistrationID", RegistrationID);
                sqlparams[2] = new SqlParameter("@MeritList", meritlist);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudent1stMeritFinalAfterInterview", sqlparams).Tables[0];
            }
            catch (Exception)
            {
            }
            return dt;
        }



        public DataTable DisplayStudentLoginCredentails()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@RegistrationID", RegistrationID);               
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "DisplayStudentLoginCredentails", sqlparams).Tables[0];
            }
            catch (Exception)
            {
            }
            return dt;
        }



        public DataTable GetStudentPortalAccounts()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentPortalAccounts", sqlparams).Tables[0];
            }
            catch (Exception)
            {
            }
            return dt;
        }



        public DataTable GetStudentMeritFinalAfterInterview()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@RegistrationID", RegistrationID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;                
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentMeritFinalAfterInterview", sqlparams).Tables[0];
            }
            catch (Exception)
            {
            }
            return dt;
        }

        public DataTable GetStudentPrograminalAfterInterview()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@SemesterID", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentPrograminalAfterInterview", sqlparams).Tables[0];
            }
            catch (Exception)
            {
            }
            return dt;
        }

        #region Class Time Table

        public DataTable GetStudentSemesterClassTimeTable()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentSemesterClassTimeTable", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        #endregion

        public DataTable GetStudentInfoByStudentIDforEntryTestMarks()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentIDforEntryTestMarks", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentInfoByStudentIDforEntryTestInterviewMarks()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                sqlparams[2] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentIDforEntryTestInterviewMarks", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentDetailsListBySearch()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                sqlparams[2] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentListBySearchWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentAccountsListBySearch()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                sqlparams[2] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentAccountListBySearchWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        #region Update Form Status

        public bool UpdateFormFianlSubmittedStatus()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@IsFinalSubmitted", IsFinalSubmitted);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "UpdateFormFianlSubmittedStatus", sqlparams);
            }
            catch
            {
                return false;
            }
            return true;

        }
        #endregion

        public DataTable GetSaleandSubmissionDetailsdeptWiseCount()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSaleandSubmissionDetailsdeptWiseCount", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetApplicationFeesPaymentDetailsdeptWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                sqlparams[2] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetApplicationFeesPaymentDetailsdeptWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentEntryTestAbsentDetailsdeptWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                sqlparams[2] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentEntryTestAbsentDetailsdeptWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentNTSTestDetailsdeptWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                sqlparams[2] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentNTSTestDetailsdeptWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetResultAwaitedStudentDetailsdeptWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetResultAwaitedListProgramdeptWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentMeritListBeforeInterviewdeptWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                sqlparams[2] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentMeritListBeforeInterviewdeptWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetStudentMeritListAfterInterviewdeptWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                sqlparams[2] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentMeritListAfterInterviewdeptWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        #region Department Wise Total Submission

        public DataTable GetSaleandSubmissionDetailsAIMSProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSaleandSubmissionDetailsAIMSProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetSaleandSubmissionDetailsAccountsandFinanceProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSaleandSubmissionDetailsAccountsandFinanceProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetSaleandSubmissionDetailsEnglsihProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSaleandSubmissionDetailsEnglsihProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetSaleandSubmissionDetailsDevelopmentPolicyProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSaleandSubmissionDetailsDevelopmentPolicyProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }



        public DataTable GetSaleandSubmissionDetailsSoftwareProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSaleandSubmissionDetailsSoftwareProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetSaleandSubmissionDetailsCSProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSaleandSubmissionDetailsCSProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetSaleandSubmissionDetailsENVProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSaleandSubmissionDetailsENVProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetSaleandSubmissionDetailsMediaProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSaleandSubmissionDetailsMediaProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetSaleandSubmissionDetailsEduProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSaleandSubmissionDetailsEduProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetRoomDetails()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@DepartmentName", DepartmentName);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetRoomDetails").Tables[0];

            }
            catch (Exception)
            {
            }
            return dt;
        }

        public DataTable GetSaleandSubmissionDetailsBussinessProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSaleandSubmissionDetailsBussinessProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        #endregion


        #region Department Wise Attendance Report

        public DataTable GetAttendanceDetailsAIMSProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAttendanceDetailsAIMSProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetAttendanceDetailsSoftwareProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAttendanceDetailsSoftwareProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetAttendanceDetailsAccountsandFinanceProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAttendanceDetailsAccountsandFinanceProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetAttendanceDetailsDevelopmentStudiesProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAttendanceDetailsDevelopmentStudiesProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetAttendanceDetailsEnglishProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                //  dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetOrientationAttendanceDetailsdEnglishProgramWise", sqlparams).Tables[0];
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAttendanceDetailsEnglishProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetAttendanceDetailsCSProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAttendanceDetailsCSProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetAttendanceDetailsENVProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAttendanceDetailsENVProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetAttendanceDetailsMediaProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAttendanceDetailsMediaProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetAttendanceDetailsEduProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAttendanceDetailsEduProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetAttendanceDetailsBussinessProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAttendanceDetailsBussinessProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentInfoByStudentIDforAttendanceReport()
        {
            DataTable dt = new DataTable();
            try
            {

                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentIDforAttendanceReport").Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }



        #endregion

        #region Update Student SeatNumber

        public bool UpdateStudentSeatNumber()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@SeatNumber", SeatNumber);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "UpdateStudentSeatNumber", sqlparams);
            }
            catch
            {
                return false;
            }
            return true;

        }
        #endregion


        #region Department Wise Merit Summary Before Interview Report

        public DataTable GetMeritBeforeInterviewDetailsCSProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetMeritBeforeInterviewDetailsCSProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetMeritBeforeInterviewDetailsENVProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetMeritBeforeInterviewDetailsENVProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetMeritBeforeInterviewDetailsMediaProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetMeritBeforeInterviewDetailsMediaProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetMeritBeforeInterviewDetailsEduProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetMeritBeforeInterviewDetailsEduProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetMeritBeforeInterviewDetailsBussinessProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetMeritBeforeInterviewDetailsBussinessProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        #endregion

        public DataTable GetStudentDocumentNotSubmittedListdeptWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentDocumentNotSubmittedListdeptWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }



        #region Department Wise Merit Summary After Interview Report

        public DataTable GetMeritAfterInterviewDetailsCSProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetMeritAfterInterviewDetailsCSProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetMeritAfterInterviewDetailsENVProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetMeritAfterInterviewDetailsENVProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetMeritAfterInterviewDetailsMediaProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetMeritAfterInterviewDetailsMediaProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetMeritAfterInterviewDetailsEduProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetMeritAfterInterviewDetailsEduProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetMeritAfterInterviewDetailsBussinessProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetMeritAfterInterviewDetailsBussinessProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        #endregion


        public DataTable GetStudentInfoByStudentIDforInterviewAttendance()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentIDforInterviewAttendance", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        #region Department Wise Interview Attendance Report

        public DataTable GetInterviewAttendanceDetailsBussinessProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetInterviewAttendanceDetailsBussinessProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetInterviewAttendanceDetailsCSProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetInterviewAttendanceDetailsCSProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetInterviewAttendanceDetailsENVProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetInterviewAttendanceDetailsENVProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetInterviewAttendanceDetailsMediaProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetInterviewAttendanceDetailsMediaProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetInterviewAttendanceDetailsEduProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetInterviewAttendanceDetailsEduProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetInterviewAttendanceDetailsAIMSProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetInterviewAttendanceDetailsAIMSProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetInterviewAttendanceDetailsSoftwareProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetInterviewAttendanceDetailsSoftwareProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetInterviewAttendanceDetailsAccountsandFinanceProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetInterviewAttendanceDetailsAccountsandFinanceProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetInterviewAttendanceDetailsDevelopmentStudiesProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetInterviewAttendanceDetailsDevelopmentStudiesProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetInterviewAttendanceDetailsEnglishProgramWise()
        {
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetInterviewAttendanceDetailsEnglishProgramWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetCourseListPaperWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[4];
                sqlparams[0] = new SqlParameter("@DepartmentName", DepartmentName);
                sqlparams[1] = new SqlParameter("@PaperDay", PaperDay);
                sqlparams[2] = new SqlParameter("@PaperTime", PaperTime);
                sqlparams[3] = new SqlParameter("@ProgramShift", PaperShift);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetCourseListPaperWise").Tables[0];


            }
            catch (Exception)
            {
            }
            return dt;
        }
        public DataTable GetEnrolledStudentPaperWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[4];
                sqlparams[0] = new SqlParameter("@DepartmentName", DepartmentName);
                sqlparams[1] = new SqlParameter("@CourseName", CourseName);
                sqlparams[2] = new SqlParameter("@FacultyName", FacultyName);
                sqlparams[3] = new SqlParameter("@ProgramShift", PaperShift);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetEnrolledStudentPaperWise", sqlparams).Tables[0];

            }
            catch (Exception)
            {
            }
            return dt;
        }

        public DataTable GetStudentReferenceNumberByRegistrationID()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@RegistrationID", this.RegistrationID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentReferenceNumberByRegistrationID", sqlparams).Tables[0];
            }
            catch (Exception)
            {
            }
            return dt;
        }


        public DataTable GetStudentIDCardPhotoUploadToOracleDB()
        {
            DataTable dt = new DataTable();
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentIDCardPhotoUploadToOracleDB").Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetDayWiseClassTimeTableForDepartments()
        {
            DataTable dt = new DataTable();
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUTConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetDayWiseClassTimeTableForDepartments").Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        #endregion

        #region Student Exam Seating

        public DataTable GetStudentListDepartmentWise()
        {

            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@DepartmentName", DepartmentName);
                sqlparams[1] = new SqlParameter("@SemesterId", SemesterId);
                // sqlparams[2] = new SqlParameter("@DegreeProgram", DegreeProgram);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentListDepartmentWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetExamRoomDetails()
        {

            DataTable dt = new DataTable();
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetRoomDetails").Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        #endregion

        public DataTable GetMediaStudentInfoByCNICNumber()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@CNICNumber", CNICNumber);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetMediaStudentInfoByStudentID", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public bool InsertStudentFormDetailsMedia(StudentPersonalInfo objStudentPersonalInfo, StudentSSCEducation objStudentSSCEducation, StudentProgramInfo objStudentProgramInfo,StudentPhoto objStudentPhoto)
        {
            bool result;
            SqlConnection sqlcon = null;
            SqlTransaction sqltrans = null;
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                sqlcon = new SqlConnection(conn);
                sqlcon.Open();
                sqltrans = sqlcon.BeginTransaction("InsertStudentformDetails");
                int StudentId = 0;
                StudentId = this.InsertMediaStudentPersoanlInfo(sqltrans);
                if (StudentID == -1)
                    throw new Exception("Error in InsertStudentformDetails");

                objStudentSSCEducation.StudentID = StudentId;
                result = objStudentSSCEducation.InsertMediaStudentSSCEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                objStudentProgramInfo.StudentID = StudentId;
                result = objStudentProgramInfo.InsertMediaStudentProgramChoicInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");

                objStudentPhoto.StudentID = StudentId;
                result = objStudentPhoto.InsertMTCStudentPhoto(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertStudentformDetails");



                sqltrans.Commit();
                return true;
            }
            catch
            {
                sqltrans.Rollback("InsertStudentformDetails");
                return false;
            }
            finally
            {
                if (sqlcon.State == ConnectionState.Open)
                    sqlcon.Close();
            }
        }


        public int InsertMediaStudentPersoanlInfo(SqlTransaction sqltrans)
        {
            int result = -1;
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[8];
                sqlparams[0] = new SqlParameter("@CNICNumber", CNICNumber);
                sqlparams[1] = new SqlParameter("@StudentName", FirstName);
                sqlparams[2] = new SqlParameter("@FatherName", string.IsNullOrEmpty(FathersName) ? Convert.DBNull : FathersName);
                sqlparams[3] = new SqlParameter("@Gender", Gender);
                sqlparams[4] = new SqlParameter("@DateOfBirth", DateofBirth);
                sqlparams[5] = new SqlParameter("@PostalAddress", PostalAddress);
                sqlparams[6] = new SqlParameter("@MobileNumber", MobileNumber);
                sqlparams[7] = new SqlParameter("@EmailAddress", EmailAddress);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                result = int.Parse(SqlHelper.ExecuteScalar(sqltrans, CommandType.StoredProcedure, "InsertMediaStudentPersoanlInfo", sqlparams).ToString());
            }
            catch
            {
                return -1;
            }
            return result;
        }

        public DataTable GetStudentPhotoWithReferenceID()
        {
            DataTable dt = new DataTable();
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentPhotoWithReferenceID").Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentReferenceIDFromPhotoByDegreeProgram()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@DegreeProgram", DegreeProgram);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentReferenceIDFromPhoto", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        #region CPE Admission

        public DataTable GetCpeApplicationFormSubmissionDetails()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                string conn = ConfigurationManager.ConnectionStrings["SMIUCPEConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetCPEStudentFilledFormDetails", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        #endregion

        public DataTable GetStudentInfoByStudentIDforEntryTestSchedule()
        {
            DataTable dtAllRooms = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dtAllRooms = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentIDforEntryTestSchedule", sqlparams).Tables[0];
            }
            catch
            {
            }
            return dtAllRooms;
        }

        public DataTable GetStudentInfoByStudentIDforMSAndPhDStudents()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByStudentIDforMSAndPhDStudents", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStdInfoByStudentIDforSecondApplyForAdmission()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@EmailAddress", EmailAddress);
                sqlparams[1] = new SqlParameter("@Password", Password);
                sqlparams[2] = new SqlParameter("@SemesterID", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStdInfoByStudentIDforSecondApplyForAdmission", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        #region FeeApprovedCheck

        public DataTable CheckIfFeeIsApproved()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@EmailAddress", EmailAddress);
                sqlparams[1] = new SqlParameter("@Password", Password);
                sqlparams[2] = new SqlParameter("@SemesterID", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentFeeApproval", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        #endregion


        #region Online Entry Test


        public DataTable GetStdInfoByStudentIDforOnlineEntryTest()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@EmailAddress", EmailAddress);
                sqlparams[1] = new SqlParameter("@Password", Password);
                sqlparams[2] = new SqlParameter("@SemesterID", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStdInfoByStudentIDforOnlineEntryTest", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetEntryTestResultDetailsforAllStudents()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@Filter", Filter);
                sqlparams[1] = new SqlParameter("@Query", Query);
                sqlparams[2] = new SqlParameter("@SemesterID", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetEntryTestResultDetailsforAllStudents", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        #endregion

        #region Manage Application

        public DataTable GetApplicationInfoByStatusforApprovalOrReject(string IsApproved)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@SemesterID", SemesterId);
                sqlparams[1] = new SqlParameter("@IsApproved", IsApproved);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetApplicationInfoforApprovalOrReject2", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetAdmissionFeePaymentDetails()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@SemesterID", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAdmissionFeePaymentDetails", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetSemesterFeeSummary()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@SemesterID", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSemesterFeeSummary", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetApplicationInfoforApprovalOrReject()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@SemesterID", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetApplicationInfoforApprovalOrReject", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        #endregion


        #region SelfFinance Report

        public DataTable GetSelfFinanceDetailsforAllStudents()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];              
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetSelfFinanceDetailsforAllStudents", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        #endregion


        #region MTC Workshop

        public DataTable GetMTCWorkshopApplicationFormSubmissionDetails()
        {
            DataTable dt = new DataTable();
            try
            {              
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetMTCWorkshopFormSubmissionDetails").Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        #endregion

        public DataTable GetStudentInterviewScheduleInfoSemesterWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];               
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInterviewScheduleInfoSemesterWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetEntryTestMarks()
        {
            DataTable dt = new DataTable();
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetEntryTestMarks").Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudent1stMeritListSemesterWise(int degree, int meritlist)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                sqlparams[1] = new SqlParameter("@DegreeProgram", degree);
                sqlparams[2] = new SqlParameter("@MeritList", meritlist);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudent1stMeritListSemesterWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentMeritListSemesterWise(int degree, int meritlist)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                sqlparams[1] = new SqlParameter("@DegreeProgram", degree);
                sqlparams[2] = new SqlParameter("@MeritList", meritlist);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudent1stMeritListSemesterWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudent1stIsSelfFinanceListSemesterWise(int meritlist)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                sqlparams[1] = new SqlParameter("@MeritList", meritlist);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudent1stIsSelfFinanceListSemesterWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentIsSelfFinanceListSemesterWise(int meritlist)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                sqlparams[1] = new SqlParameter("@MeritList", meritlist);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudent1stIsSelfFianceListSemesterWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetStudentMeritListSemesterWise(int degree)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                sqlparams[1] = new SqlParameter("@DegreeProgram", degree);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentMeritListSemesterWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentIsSelfFinanceListSemesterWise()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@Semester", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentIsSelfFinanceListSemesterWise", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public DataTable GetStudentFeesDetailsUploadToOracleDB()
        {
            DataTable dt = new DataTable();
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentFeesDetailsUploadToOracleDB").Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public bool UpdatStudentDocumentStatus()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@Isdocumentsubmitted", Isdocumentsubmitted);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "UpdatStudentDocumentStatus", sqlparams);
            }
            catch
            {
                return false;
            }
            return true;

        }

    }
}