using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;

public partial class DataTables : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private string QueryData()
    {
        MySqlConnection myCon = new MySqlConnection();
        myCon.ConnectionString = "server=127.0.0.1;Userid=root;password='******';Port=3309;Database=test;CharSet=utf8;";
        myCon.Open();

        string strSql = "select id,firstname,lastname,position,office,age,startdate,salary,extn,email from person";

        MySqlDataAdapter dataAdapter = new MySqlDataAdapter(strSql, myCon);
        DataSet ds = new DataSet();
        dataAdapter.Fill(ds);
        myCon.Close();

        return JsonConvert.SerializeObject(ds);        
    }

    public override void ProcessRequest(HttpContext context)
    {
        base.ProcessRequest(context);
        string strMethod = context.Request.QueryString["method"];
        if ("QueryData" == strMethod)
        {
            context.Response.Clear();
            context.Response.Write(QueryData());
        }
    }
}