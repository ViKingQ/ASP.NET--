using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

using Newtonsoft.Json;

public partial class DataTables : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string FetchData()
    {
        string strRet = "{\"draw\": 1, \"recordsTotal\": 57, \"recordsFiltered\": 57, \"data\":[[1001,\"ZhangSan\",\"Male\"],[1002,\"LiSi\",\"Female\"]]}";
        return strRet;
    }

    public override void ProcessRequest(HttpContext context)
    {
        base.ProcessRequest(context);
        string strMethod = context.Request.QueryString["method"];
        if (!string.IsNullOrEmpty(strMethod) && "FetchData" == strMethod)
        {
            context.Response.Clear();
            context.Response.Write(FetchData());
        }
    }
}