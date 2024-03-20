using Microsoft.Reporting.WebForms;
using System;
using System.Data;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace SMIU_Admission.AppClasses.UtilityClasses
{
    public enum MessageType { success, error };

    // Added New 
    public enum OptChkLstItemStatus { Active = 1, InActive = 2 };
    public enum DesignationStatus { Active = 1, InActive = 0 }
    public enum ProjectStatus { Active = 1, InActive = 2 };
    public enum DocumentType { CV = 1, Picture = 2, SignedCopy = 3 };
    public enum DepartmentStatus { Active = 1, InActive = 0 }
    public enum UserEmpStatus { Active = 1, InActive = 2 };
    public enum QuarterStatus { Active = 1, InActive = 2 };
    public enum AllowanceStatus { Active = 1, InActive = 0 };
    public enum PayScaleStatus { Active = 1, InActive = 0 };
    public enum EmployeeStatus { Active = 1, InActive = 0 };
    public enum DegreeLevelStatus { Active = 1, InActive = 0 };
    public enum DegreeProgram { Ugrad = 2, Grad = 1, PostGrad = 3 }

   // public enum EntryTestDateTime { EntryTestDay = 'Saturday', PaperTime = '09:30 AM', PaperDate = '06/07/2019' }



    public enum MonthsOfYear
    {
        January = 1,
        February = 2,
        March = 3,
        April = 4,
        May = 5,
        June = 6,
        July = 7,
        August = 8,
        September = 9,
        October = 10,
        November = 11,
        December = 12
    }

    public class UtilityMethods
    {
        //Rights Messages
        public static string AddMessage = "You don't have right to Add Record.";
        public static string UpdateMessage = "You don't have right to Update Record.";
        public static string DeleteMessage = "You don't have right to Delete Record.";
        public static string Active_DeactiveMessage = "You don't have right to Activate/Deactivate Record.";
        public static string Add_UpdateMessage = "You don't have right to Add/Update Record(s).";
        public static string GenerateCARMessage = "You don't have right to Generate CAR.";
        public static string CloseCARMessage = "You don't have right to Close CAR.";
        public static string FillSTOPCardMessage = "You don't have right to Fill STOP Card.";      


        //end

        public static void DisplayStatusMessage(string Message, MessageType MessageType, Page CurrentPageObject)
        {
            try
            {
                ((Label)CurrentPageObject.Master.FindControl("pnlmessage").FindControl("lblmsg")).Text = Message;
                ((Panel)CurrentPageObject.Master.FindControl("pnlmessage")).CssClass = MessageType.ToString();
                ((Panel)CurrentPageObject.Master.FindControl("pnlmessage")).Visible = true;
            }
            catch { }
        }

        public static void HideStatusMessage(Page CurrentPageObject)
        {
            try
            {
                ((Panel)CurrentPageObject.Master.FindControl("pnlmessage")).Visible = false;
            }
            catch { }
        }
        public static void GetMyMonthList(DropDownList MyddlMonthList, bool SetCurruntMonth)
        {
            string CurrentYear = DateTime.Now.Year.ToString();
            DateTime month = Convert.ToDateTime("1/1/" + CurrentYear);
            for (int i = 0; i < 12; i++)
            {
                DateTime NextMont = month.AddMonths(i);
                ListItem list = new ListItem();
                list.Text = NextMont.ToString("MMMM") + " " + NextMont.Year.ToString();
                list.Value = NextMont.Month.ToString();
                MyddlMonthList.Items.Add(list);
            }
            if (SetCurruntMonth == true)
            {
                MyddlMonthList.Items.FindByValue(DateTime.Now.Month.ToString()).Selected = true;
            }
        }

        private DataTable ConvertHTMLTablesToDataTable(string HTML)
        {
            // Declarations    
            DataSet ds = new DataSet();
            DataTable dt = null;
            DataRow dr = null;
            string TableExpression = "<table[^>]*>(.*?)</table>";
            string HeaderExpression = "<th[^>]*>(.*?)</th>";
            string RowExpression = "<tr[^>]*>(.*?)</tr>";
            string ColumnExpression = "<td[^>]*>(.*?)</td>";
            bool HeadersExist = false;
            int iCurrentColumn = 0;
            int iCurrentRow = 0;

            // Get a match for all the tables in the HTML    
            MatchCollection Tables = Regex.Matches(HTML, TableExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase);

            // Loop through each table element    
            foreach (Match Table in Tables)
            {

                // Reset the current row counter and the header flag    
                iCurrentRow = 0;
                HeadersExist = false;

                // Add a new table to the DataSet    
                dt = new DataTable();

                // Create the relevant amount of columns for this table (use the headers if they exist, otherwise use default names)    
                if (Table.Value.Contains("<th"))
                {
                    // Set the HeadersExist flag    
                    HeadersExist = true;

                    // Get a match for all the rows in the table    
                    MatchCollection Headers = Regex.Matches(Table.Value, HeaderExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase);

                    // Loop through each header element    
                    foreach (Match Header in Headers)
                    {
                        if (!dt.Columns.Contains(Header.Groups[1].ToString()))
                            dt.Columns.Add(Header.Groups[1].ToString().Replace("&nbsp;", ""));
                    }
                }
                else
                {
                    for (int iColumns = 1; iColumns <= Regex.Matches(Regex.Matches(Regex.Matches(Table.Value, TableExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase).ToString(), RowExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase).ToString(), ColumnExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase).Count; iColumns++)
                    {
                        dt.Columns.Add("Column " + iColumns);
                    }
                }

                // Get a match for all the rows in the table    
                MatchCollection Rows = Regex.Matches(Table.Value, RowExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase);

                // Loop through each row element    
                foreach (Match Row in Rows)
                {

                    // Only loop through the row if it isn't a header row    
                    if (!(iCurrentRow == 0 & HeadersExist == true))
                    {

                        // Create a new row and reset the current column counter    
                        dr = dt.NewRow();
                        iCurrentColumn = 0;

                        // Get a match for all the columns in the row    
                        MatchCollection Columns = Regex.Matches(Row.Value, ColumnExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase);

                        // Loop through each column element    
                        foreach (Match Column in Columns)
                        {
                            if (Columns.Count - 1 != iCurrentColumn)
                                // Add the value to the DataRow    
                                dr[iCurrentColumn] = Convert.ToString(Column.Groups[1]).Replace("&nbsp;", "");

                            // Increase the current column     
                            iCurrentColumn += 1;
                        }

                        // Add the DataRow to the DataTable    
                        dt.Rows.Add(dr);

                    }

                    // Increase the current row counter    
                    iCurrentRow += 1;
                }

                // Add the DataTable to the DataSet    
                // ds.Tables.Add(dt);

            }

            return dt;

        }


        /// <summary>
        /// A generic method that will generate report based on Dataset as a datasource
        /// </summary>
        /// <param name="ReportViewerObject"></param>
        /// <param name="DatasetObject"> Dataset Object that contains the data for the report to display</param>
        /// <param name="ReportFilePath">a string containing relative report path along with report filename and extension</param>
        /// <example>MyReport.rdlc</example>
        /// 
        public void GenerateReport(ReportViewer ReportViewerObject, string ReportFilePath, DataSet DatasetObject, ReportParameter[] ReportParametersObject)
        {
            try
            {
                ReportViewerObject.ProcessingMode = ProcessingMode.Local;
                LocalReport report = ReportViewerObject.LocalReport;
                report.ReportPath = ReportFilePath;
                report.EnableExternalImages = true;
                ReportDataSource dsReportDataSource = new ReportDataSource();
                dsReportDataSource.Name = DatasetObject.Tables[0].TableName;
                dsReportDataSource.Value = DatasetObject.Tables[0];
                report.SetParameters(ReportParametersObject);
                report.DataSources.Clear();
                report.DataSources.Add(dsReportDataSource);
                report.Refresh();
            }
            catch { }
        }

        /// <summary>
        /// A generic method that will generate report based on Dataset as a datasource with parameters
        /// </summary>
        /// <param name="ReportViewerObject"></param>
        /// <param name="DatasetObject"> Dataset Object that contains the data for the report to display</param>
        /// <param name="ReportFilePath">a string containing relative report path along with report filename and extension</param>
        /// <example>MyReport.rdlc</example>      

        public void GenerateReport_SubReport(ReportViewer ReportViewerObject, string ReportFilePath, DataSet DatasetObject, DataSet DatasetObject2, ReportParameter[] ReportParametersObject)
        {
            try
            {

                ReportViewerObject.ProcessingMode = ProcessingMode.Local;
                LocalReport report = ReportViewerObject.LocalReport;
                report.ReportPath = ReportFilePath;
                report.EnableExternalImages = true;
                ReportDataSource dsReportDataSource = new ReportDataSource();
                dsReportDataSource.Name = DatasetObject.Tables[0].TableName;
                dsReportDataSource.Value = DatasetObject.Tables[0];
                report.SetParameters(ReportParametersObject);
                report.DataSources.Clear();
                report.DataSources.Add(dsReportDataSource);
                ReportDataSource dsReportDataSource2 = new ReportDataSource();
                dsReportDataSource2.Name = DatasetObject2.Tables[0].TableName;// "dsReportTest_ReportTest";
                dsReportDataSource2.Value = DatasetObject2.Tables[0];
                report.DataSources.Add(dsReportDataSource2);
                // testingpurpose -remove when done
                report.SubreportProcessing += new SubreportProcessingEventHandler(report_SubreportProcessing);
                //end test code
                HttpContext.Current.Session["test"] = dsReportDataSource2;
                // HttpContext.Current.Session["test1"] = dsReportDataSource3;
                report.Refresh();

                //  report.SubreportProcessing += new SubreportProcessingEventHandler(report_SubreportProcessing);
                //  report.Refresh();
            }
            catch { }
        }


        void report_SubreportProcessing(object sender, SubreportProcessingEventArgs e)
        {
            //  ReportsBusinessLogic objReportBusinessLogic = new ReportsBusinessLogic();
            // DataSet SubReport = new DataSet();
            //string strParameter = e.Parameters["StudentId"].Values[0].ToString();
            //  objReportBusinessLogic.EmployeeId = int.Parse(e.Parameters["EmployeeId"].ToString());

            //  SubReport = objReportBusinessLogic.GetEmployeeAllwoancesDetailsforPayslip("GetAllownaceDetailsForPayrollProcessReport");
            // ReportDataSource dsReportDataSource2 = new ReportDataSource();
            // dsReportDataSource2.Name = SubReport.Tables[0].TableName;// "dsReportTest_ReportTest";
            // dsReportDataSource2.Value = SubReport.Tables[0];
            //  e.DataSources.Add(dsReportDataSource2);
            //  e.DataSources.Add(new ReportDataSource("./Modules/Reports/GetAllowancesDetailsforPaySlip.rdlc", dsReportDataSource2));



            e.DataSources.Add(((ReportDataSource)(HttpContext.Current.Session["test"])));

        }



        public void GenerateReportOverAllDept(ReportViewer ReportViewerObject, string ReportFilePath, DataSet DatasetObject, DataSet DatasetObject2)
        {
            try
            {
                ReportViewerObject.ProcessingMode = ProcessingMode.Local;
                LocalReport report = ReportViewerObject.LocalReport;
                report.ReportPath = ReportFilePath;
                ReportDataSource dsReportDataSource = new ReportDataSource();
                dsReportDataSource.Name = DatasetObject.Tables[0].TableName;
                dsReportDataSource.Value = DatasetObject.Tables[0];
                report.DataSources.Add(dsReportDataSource);
                ReportDataSource dsReportDataSource2 = new ReportDataSource();
                dsReportDataSource2.Name = DatasetObject2.Tables[0].TableName;// "dsReportTest_ReportTest";
                dsReportDataSource2.Value = DatasetObject2.Tables[0];
                report.DataSources.Add(dsReportDataSource2);
                report.Refresh();
            }
            catch { }
        }

        // Code for Disable the PDF in all reports

        /// A generic method that will Disable the PDF in the report.
        ///
        // Traverse all controls/child controls to get the dropdownlist. 
        // The first dropdown list is the ZoomGroup, followed by the ExportGroup. 
        // We just wanted the ExportGroup. 
        // When a dropdownlist is found, create a event handler to be used upon rendering
        public void CustomizeRV(System.Web.UI.Control reportControl)
        {
            foreach (System.Web.UI.Control childControl in reportControl.Controls)
            {
                if (childControl.GetType() == typeof(System.Web.UI.WebControls.DropDownList))
                {
                    System.Web.UI.WebControls.DropDownList ddList = (System.Web.UI.WebControls.DropDownList)childControl;
                    ddList.PreRender += new EventHandler(ddList_PreRender);
                }
                if (childControl.Controls.Count > 0)
                {
                    CustomizeRV(childControl);
                }
            }
        }
        // This is the event handler added from CustomizeRV 
        // We just check the object type to get what we needed. 
        // Once the dropdownlist is found, we check if it is for the ExportGroup. 
        // Meaning, the "PDF" text should exists. 
        // Then, just traverse the list and disable the "Excel". 
        // When the report is shown, "PDF" will no longer be on the list. 
        // You can also do this to "Excel" or if you want to change the text. 

        void ddList_PreRender(object sender, EventArgs e)
        {
            if (sender.GetType() == typeof(System.Web.UI.WebControls.DropDownList))
            {
                System.Web.UI.WebControls.DropDownList ddList = (System.Web.UI.WebControls.DropDownList)sender;
                System.Web.UI.WebControls.ListItemCollection listItems = ddList.Items;
                if ((listItems != null) && (listItems.Count > 0) && (listItems.FindByText("Acrobat (PDF) file") != null))
                {
                    foreach (System.Web.UI.WebControls.ListItem list in listItems)
                    {
                        if (list.Text.Equals("Acrobat (PDF) file"))
                        {
                            list.Enabled = false;
                        }
                    }
                }
            }
        }

        //CODE for disable Excel Format ____________________ 
        // Code for Disable the PDF in all reports
        /// A generic method that will Disable the PDF in the report.       
        // Traverse all controls/child controls to get the dropdownlist. 
        // The first dropdown list is the ZoomGroup, followed by the ExportGroup. 
        // We just wanted the ExportGroup. 
        // When a dropdownlist is found, create a event handler to be used upon rendering
        public void CustomizeRVForExcelFormat(System.Web.UI.Control reportControl)
        {
            foreach (System.Web.UI.Control childControl in reportControl.Controls)
            {
                if (childControl.GetType() == typeof(System.Web.UI.WebControls.DropDownList))
                {
                    System.Web.UI.WebControls.DropDownList ddList = (System.Web.UI.WebControls.DropDownList)childControl;
                    ddList.PreRender += new EventHandler(ddList_PreRenderExcel);
                }
                if (childControl.Controls.Count > 0)
                {
                    CustomizeRVForExcelFormat(childControl);
                }
            }
        }
        // This is the event handler added from CustomizeRV 
        // We just check the object type to get what we needed. 
        // Once the dropdownlist is found, we check if it is for the ExportGroup. 
        // Meaning, the "PDF" text should exists. 
        // Then, just traverse the list and disable the "Excel". 
        // When the report is shown, "PDF" will no longer be on the list. 
        // You can also do this to "Excel" or if you want to change the text. 

        void ddList_PreRenderExcel(object sender, EventArgs e)
        {
            if (sender.GetType() == typeof(System.Web.UI.WebControls.DropDownList))
            {
                System.Web.UI.WebControls.DropDownList ddList = (System.Web.UI.WebControls.DropDownList)sender;
                System.Web.UI.WebControls.ListItemCollection listItems = ddList.Items;
                if ((listItems != null) && (listItems.Count > 0) && (listItems.FindByText("Excel") != null))
                {
                    foreach (System.Web.UI.WebControls.ListItem list in listItems)
                    {
                        if (list.Text.Equals("Excel"))
                        {
                            list.Enabled = false;
                        }
                    }
                }
            }
        }
    }
}

