using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;

public partial class Highcharts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private string QueryRate()
    {
        MySqlConnection myCon = new MySqlConnection();
        myCon.ConnectionString = "server=127.0.0.1;Userid=root;password='******';Port=3309;Database=test;CharSet=utf8;";
        myCon.Open();

        string strSql = "select mac_rate from realtime_cfg where mac_id='110000000000'";

        MySqlDataAdapter dataAdapter = new MySqlDataAdapter(strSql, myCon);
        DataSet ds = new DataSet();
        dataAdapter.Fill(ds);
        myCon.Close();
        string strjson = JsonConvert.SerializeObject(ds.Tables[0]);
        return JsonConvert.SerializeObject(ds.Tables[0]);
    }

    public override void ProcessRequest(HttpContext context)
    {
        base.ProcessRequest(context);
        string strMethod = context.Request.QueryString["method"];
        if ("QueryRate" == strMethod)
        {
            context.Response.Clear();
            context.Response.Write(QueryRate());
        }
    }
}