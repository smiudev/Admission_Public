using Microsoft.Reporting.Map.WebForms.BingMaps;
using SMIU_Admission.AppClasses.BusinessLogicLayer;
using System;
using System.Data.SqlClient;

using System.Data;

using System.Xml.Linq;
using System.Dynamic;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Web.Globalization;
using SMIU_Admission.AppClasses.UtilityClasses;
using System.Web.UI.HtmlControls;
using System.IO;
using iTextSharp.text.pdf.parser;
using System.Web;
using System.Net;

namespace SMIU_Admission.NewForms
{
    public partial class _UploadDocuments : System.Web.UI.Page
    {
        protected StudentPersonalInfo stdPer;
        protected StudentProgramInfo stdProgramInfo;
        public _UploadDocuments()
        {
            stdPer = new StudentPersonalInfo();
            stdProgramInfo = new StudentProgramInfo();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.Visible = false;
                lblSuccess.Visible = false;
                if (Session["StudentId"] != null)
                {
                    stdProgramInfo.StudentID = Convert.ToInt32(Session["StudentId"].ToString());
                    DataTable dt = stdProgramInfo.NEW_GetDegreeProgramInfoDataByStudentId();
                    if (dt.Rows.Count > 0)
                    {
                        DataRow row = dt.Rows[0];
                        divFeeVoucher.Visible = true;

                        if (row["DegreeProgram"].ToString() == "Undergraduate")
                        {
                            if (row["FirstChoice"].ToString().Contains("BBA 2 Years (Evening) After 14 Years Education"))
                            {
                                divLastTranscript.Visible = true;
                                divSSC.Visible = false;
                                divHSC.Visible = false;
                            }
                            else
                                divLastTranscript.Visible = false;

                        }
                        else if (row["DegreeProgram"].ToString() == "Graduate" || row["DegreeProgram"].ToString() == "Postgraduate")
                        {
                            divSSC.Visible = false;
                            divHSC.Visible = false;
                        }

                        stdPer.StudentID = Convert.ToInt32(Session["StudentId"]);
                        dt = stdPer.NEW_GetStudentInfoDataByStudentId();
                        if (dt.Rows.Count > 0)
                        {
                            if (dt.Rows[0]["Isdocumentsubmitted"] != null && Convert.ToBoolean(dt.Rows[0]["Isdocumentsubmitted"]))
                            {
                                lblSuccess.Text = "All required documents are uploaded successfully. Please check \"Application Updates\" menu for further information on Application process.";
                                lblSuccess.Visible = true;
                                lblNote.Visible = false;
                                Lock();
                            }
                        }
                    }

                    string documentPath = "~/Document/";
                    string StudentID = Session["StudentId"].ToString();
                    int dotIndex;
                    string ext;
                    string[] documentFiles = Directory.GetFiles(HttpContext.Current.Server.MapPath(documentPath), "*" + StudentID + "*.*");
                    if (documentFiles.Count() > 0)
                    {
                        foreach (var file in documentFiles)
                        {
                            dotIndex = file.LastIndexOf(".");
                            ext = file.Substring(dotIndex, file.Length - dotIndex);

                            if (file.Contains("_FeeVoucher") && file.EndsWith(ext))
                            {
                                int bkSlshIndex = file.LastIndexOf(@"\") + 1;
                                imgFeeVoucher.ImageUrl = imgFeeVoucher.NavigateUrl = documentPath + file.Substring(bkSlshIndex, file.Length - bkSlshIndex);
                                lblFeeVoucherUpl.Visible = true;
                                lblFeeVoucherNotUpl.Visible = false;
                            }
                            else if (file.Contains("_CNIC") || file.Contains("FormB") && file.EndsWith(ext))
                            {
                                int bkSlshIndex = file.LastIndexOf(@"\") + 1;
                                imgCNIC.ImageUrl = imgCNIC.NavigateUrl = documentPath + file.Substring(bkSlshIndex, file.Length - bkSlshIndex);
                                lblCNICUpl.Visible = true;
                                lblCNICNotUpl.Visible = false;
                            }
                            else if (file.Contains("_SSC") && file.EndsWith(ext))
                            {
                                int bkSlshIndex = file.LastIndexOf(@"\") + 1;
                                imgSSC.ImageUrl = imgSSC.NavigateUrl = documentPath + file.Substring(bkSlshIndex, file.Length - bkSlshIndex);
                                lblSSCUpl.Visible = true;
                                lblSSCNotUpl.Visible = false;
                            }
                            else if (file.Contains("_HSC") && file.EndsWith(ext))
                            {
                                int bkSlshIndex = file.LastIndexOf(@"\") + 1;
                                imgHSC.ImageUrl = imgHSC.NavigateUrl = documentPath + file.Substring(bkSlshIndex, file.Length - bkSlshIndex);
                                lblHSCUpl.Visible = true;
                                lblHSCNotUpl.Visible = false;
                            }
                            else if (file.Contains("_Transcript") && file.EndsWith(ext))
                            {
                                int bkSlshIndex = file.LastIndexOf(@"\") + 1;
                                imgTranscript.ImageUrl = imgTranscript.NavigateUrl = documentPath + file.Substring(bkSlshIndex, file.Length - bkSlshIndex);
                                lblTranscriptUpl.Visible = true;
                                lblTranscriptNotUpl.Visible = false;
                            }
                        }
                    }
                }

            }
            catch { }
        }

        private string SaveImage(FileUpload upload, ref string errorMsg, string photoType, string path)
        {
            try
            {
                int dotIndex = upload.PostedFile.FileName.LastIndexOf(".");
                int length = upload.PostedFile.FileName.Length;
                string ext = upload.PostedFile.FileName.Substring(dotIndex, length - dotIndex);
                if (ext.ToUpper() == ".JPG" || ext.ToUpper() == ".JPEG" || ext.ToUpper() == ".PNG" || ext.ToUpper() == ".BMP" || ext.ToUpper() == "GIF")
                {
                    long allowedFileSize = 1048576; //1MB
                    if (upload.PostedFile.ContentLength <= allowedFileSize)
                    {
                        string imgName = Session["StudentId"].ToString() + "_" + photoType + ext;
                        //string imgName = "_" + photoType + ext;
                        //sets the image path
                        string imgPath = "~/" + path + "/" + imgName;
                        //then save it to the Folder
                        upload.SaveAs(Server.MapPath(imgPath));
                        upload.Dispose();
                        return imgPath;
                    }
                    else
                    {
                        errorMsg = "Error: " + photoType + " file size must not exceed 1 MB.";
                        //int ratio = 100;

                        //System.Drawing.Bitmap bmpPostedImage;
                        //System.Drawing.Image newImage;

                        //do
                        //{
                        //    bmpPostedImage = new System.Drawing.Bitmap(uploadPhoto.PostedFile.InputStream);
                        //    newImage = ScaleImage(bmpPostedImage, 81);
                        //}
                        //while (true);
                    }

                }
                else
                {
                    errorMsg = "Error: Unsupported file extention. Upload the images files with allowed extentions only.";
                }
            }
            catch (Exception e)
            {
                errorMsg = "Error: Some error occured while saving the image. Please contact Admission department";
            }
            return null;
        }
        string errorMsg = "";
        protected void btnFeeVoucher_Click(object sender, EventArgs e)
        {
            if (uploadFeeVoucher.HasFile)
            {
                string photoType = "FeeVoucher";
                string imageUrl = SaveImage(uploadFeeVoucher, ref errorMsg, photoType, "Document");
                if (!string.IsNullOrEmpty(imageUrl))
                {
                    imgFeeVoucher.NavigateUrl = imgFeeVoucher.ImageUrl = imageUrl;
                    lblSuccess.Text = photoType + " Image uploaded successfully.";
                    lblSuccess.Visible = true;
                    lblFeeVoucherUpl.Visible = true;
                    lblFeeVoucherNotUpl.Visible = false;
                }
            }
            else
                errorMsg = "Error: No file uploaded.";

            lblError.Text = errorMsg;
            lblError.Visible = true;
        }

        protected void btnCNIC_Click(object sender, EventArgs e)
        {
            if (uploadCNIC.HasFile)
            {
                string photoType = "CNIC";
                string imageUrl = SaveImage(uploadCNIC, ref errorMsg, photoType, "Document");
                if (!string.IsNullOrEmpty(imageUrl))
                {
                    imgCNIC.NavigateUrl = imgCNIC.ImageUrl = imageUrl;
                    lblSuccess.Text = photoType + " Image uploaded successfully.";
                    lblSuccess.Visible = true;
                    lblCNICUpl.Visible = true;
                    lblCNICNotUpl.Visible = false;
                }
            }
            else
                errorMsg = "Error: No file uploaded.";

            lblError.Text = errorMsg;
            lblError.Visible = true;
        }

        protected void btnSSC_Click(object sender, EventArgs e)
        {
            if (uploadSSC.HasFile)
            {
                string photoType = "SSC";
                string imageUrl = SaveImage(uploadSSC, ref errorMsg, photoType, "Document");
                if (!string.IsNullOrEmpty(imageUrl))
                {
                    imgSSC.NavigateUrl = imgSSC.ImageUrl = imageUrl;
                    lblSuccess.Text = photoType + " Image uploaded successfully.";
                    lblSuccess.Visible = true;
                    lblSSCUpl.Visible = true;
                    lblSSCNotUpl.Visible = false;
                }
            }
            else
                errorMsg = "Error: No file uploaded.";

            lblError.Text = errorMsg;
            lblError.Visible = true;
        }

        protected void btnHSC_Click(object sender, EventArgs e)
        {
            if (uploadHSC.HasFile)
            {
                string photoType = "HSC";
                string imageUrl = SaveImage(uploadHSC, ref errorMsg, photoType, "Document");
                if (!string.IsNullOrEmpty(imageUrl))
                {
                    imgHSC.NavigateUrl = imgHSC.ImageUrl = imageUrl;
                    lblSuccess.Text = photoType + " Image uploaded successfully.";
                    lblSuccess.Visible = true;
                    lblHSCUpl.Visible = true;
                    lblHSCNotUpl.Visible = false;
                }
            }
            else
                errorMsg = "Error: No file uploaded.";

            lblError.Text = errorMsg;
            lblError.Visible = true;
        }

        protected void btnTranscript_Click(object sender, EventArgs e)
        {
            if (uploadTranscript.HasFile)
            {
                string photoType = "Transcript";
                string imageUrl = SaveImage(uploadTranscript, ref errorMsg, photoType, "Document");
                if (!string.IsNullOrEmpty(imageUrl))
                {
                    imgTranscript.NavigateUrl = imgTranscript.ImageUrl = imageUrl;
                    lblSuccess.Text = photoType + " Image uploaded successfully.";
                    lblSuccess.Visible = true;
                    lblTranscriptUpl.Visible = true;
                    lblTranscriptNotUpl.Visible = false;
                }
            }
            else
                errorMsg = "Error: No file uploaded.";

            lblError.Text = errorMsg;
            lblError.Visible = true;
        }

        protected void btnSubmitDocs_Click(object sender, EventArgs e)
        {
            //string errorMessage;
            bool isError = false;
            stdPer.StudentID = Convert.ToInt32(Session["StudentId"]);
            DataTable dt = stdPer.NEW_GetStudentInfoDataByStudentId();
            if (dt.Rows.Count > 0 && Convert.ToBoolean(dt.Rows[0]["IsFinalSubmitted"]))
            {
                stdProgramInfo.StudentID = Convert.ToInt32(Session["StudentId"]);
                dt = stdProgramInfo.NEW_GetDegreeProgramInfoDataByStudentId();
                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    if (row["DegreeProgram"].ToString() == "Undergraduate")
                    {
                        if (row["FirstChoice"].ToString().Contains("BBA 2 Years (Evening) After 14 Years Education"))
                        {
                            if (
                                imgCNIC.ImageUrl.ToUpper().Contains("NOIMAGE")
                                || imgFeeVoucher.ImageUrl.ToUpper().Contains("NOIMAGE")
                                || imgTranscript.ImageUrl.ToUpper().Contains("NOIMAGE")
                                )
                            {
                                isError = true;
                            }
                        }
                        else
                        {
                            if (
                                imgCNIC.ImageUrl.ToUpper().Contains("NOIMAGE")
                                || imgFeeVoucher.ImageUrl.ToUpper().Contains("NOIMAGE")
                                || imgSSC.ImageUrl.ToUpper().Contains("NOIMAGE")
                                || imgHSC.ImageUrl.ToUpper().Contains("NOIMAGE")
                                )
                            {
                                isError = true;
                            }
                        }
                    }
                    else
                    {
                        if (
                                imgCNIC.ImageUrl.ToUpper().Contains("NOIMAGE")
                                || imgFeeVoucher.ImageUrl.ToUpper().Contains("NOIMAGE")
                                || imgTranscript.ImageUrl.ToUpper().Contains("NOIMAGE")
                                )
                        {
                            isError = true;
                        }
                    }

                    if (isError)
                    {
                        lblError.Visible = true;
                        lblError.Text = "Error: Please upload all the documents before you submit them.";
                    }
                    else
                    {
                        StudentPersonalInfo sper = new StudentPersonalInfo();
                        sper.StudentID = Convert.ToInt32(Session["StudentId"]);
                        bool isSuccess = sper.NEW_UpdateDocumentSubmitStatus();
                        if (isSuccess)
                        {
                            Response.Redirect("~/NewForms/_Updates.aspx");
                            lblNote.Visible = false;
                            Lock();
                            lblSuccess.Visible = true;
                            lblSuccess.Text = "Success: Documents have been submitted successfully.";
                        }

                    }

                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "Error: Please submit your Admission form first by completing all the required steps.";
                }
            }
        }

        protected void Lock()
        {
            uploadCNIC.Enabled = false;
            uploadFeeVoucher.Enabled = false;
            uploadSSC.Enabled = false;
            uploadHSC.Enabled = false;
            uploadTranscript.Enabled = false;

            btnCNIC.Enabled = false;
            btnFeeVoucher.Enabled = false;
            btnSSC.Enabled = false;
            btnHSC.Enabled = false;
            btnTranscript.Enabled = false;
            btnSubmitDocs.Visible = false;
        }
    }
}