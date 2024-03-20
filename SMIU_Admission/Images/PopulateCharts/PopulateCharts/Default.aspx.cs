using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace PopulateCharts
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           /* string connString = @"Data Source=mbiz0069\sqlexpress;Initial Catalog=ClassDB;Integrated Security=True";
        SqlConnection conn = new SqlConnection(connString);
        string query = "select * from Inv";
        SqlDataAdapter adp = new SqlDataAdapter(query, conn);
        DataTable dt = new DataTable();
        adp.Fill(dt);
       //Loop and add pie chart value(pie slice) for each data row 
        foreach (DataRow row in dt.Rows)
        {
            //Add a pie chart value (pie slice) for each data row
            AjaxControlToolkit.PieChartValue segment = new AjaxControlToolkit.PieChartValue();
            //Set category for the pie chart value
            segment.Category = row["Company"].ToString();
            //Set data for the pie chart value
            segment.Data = Convert.ToDecimal(row["InvPrice"]);
            PieChart1.PieChartValues.Add(segment);
            * */

        }
    }
}
