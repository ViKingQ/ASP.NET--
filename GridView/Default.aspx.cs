using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections;
using Newtonsoft.Json;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGridView();
    }

    private void BindGridView()
    {
        MySqlConnection myCon = new MySqlConnection();
        myCon.ConnectionString = "server=127.0.0.1;Userid=root;password='******';Port=3309;Database=jetloom;CharSet=utf8;";
        myCon.Open();

        string strSql = "select id, name, sex from person";
        MySqlDataAdapter dataAdapter = new MySqlDataAdapter(strSql, myCon);
        DataSet ds = new DataSet();
        dataAdapter.Fill(ds);
        myCon.Close();

        GridView.DataSource = ds;
        GridView.DataBind();
    }


    protected void btnSelectAll_Click(object sender, EventArgs e)
    {

    }

    protected void btnUnSelectAll_Click(object sender, EventArgs e)
    {

    }

    protected void btnInvertSelect_Click(object sender, EventArgs e)
    {

    }

    protected void GridView_RowCreated(object sender, GridViewRowEventArgs e)
    {

    }

    protected ArrayList DropDownList_Sex()
    {
        ArrayList arrList = new ArrayList();
        arrList.Add(new ListItem("male", "male"));
        arrList.Add(new ListItem("female", "female"));
        return arrList;
    }

    protected void GridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        this.GridView.EditIndex = e.NewEditIndex;
        BindGridView();
    }

    protected void GridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        this.GridView.EditIndex = -1;
        BindGridView();
    }

    protected void GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string id = this.GridView.Rows[e.RowIndex].Cells[1].ToString();
        string name = ((TextBox)(this.GridView.Rows[e.RowIndex].FindControl("TextBox1"))).Text.ToString().Trim();

        DropDownList ddl = this.GridView.Rows[e.RowIndex].FindControl("DropDownList_Sex") as DropDownList;
        int ind = ddl.SelectedIndex;

        string sex = ((DropDownList)(this.GridView.Rows[e.RowIndex].FindControl("DropDownList_Sex"))).SelectedValue;

        this.GridView.EditIndex = -1;
        BindGridView();
    }

    public override void ProcessRequest(HttpContext context)
    {
        base.ProcessRequest(context);
        string strMethod = context.Request.QueryString["method"];
        if (!string.IsNullOrEmpty(strMethod))
        {
            if ("FetchData" == strMethod)
            {
                MySqlConnection myCon = new MySqlConnection();
                myCon.ConnectionString = "server=127.0.0.1;Userid=root;password='******';Port=3309;Database=jetloom;CharSet=utf8;";
                myCon.Open();

                string strSql = "select ID, name, sex from person";
                MySqlDataAdapter dataAdapter = new MySqlDataAdapter(strSql, myCon);
                DataSet ds = new DataSet();
                dataAdapter.Fill(ds);
                myCon.Close();

                string strJson = JsonConvert.SerializeObject(ds);
                strJson = strJson.Replace("Table", "rows");

                strJson = strJson.Insert(strJson.LastIndexOf("}"), ",\"total\":3");
                context.Response.Write(strJson);
                //context.Response.Write(JsonConvert.DeserializeObject(strJson));
                context.Response.End();
            }
        }
    }

}