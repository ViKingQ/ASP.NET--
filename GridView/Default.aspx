<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link rel="stylesheet" type="text/css" href="third/bootstrap/4.3.1/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="third/bootstrap-table/bootstrap-table.min.css" />

</head>

<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button runat="server" ID="btnSelectAll" Text="全选" OnClick="btnSelectAll_Click" />
            <asp:Button runat="server" ID="btnUnSelectAll" Text="取消全选" OnClick="btnUnSelectAll_Click" />
            <asp:Button runat="server" ID="btnInvertSelect" Text="反选" OnClick="btnInvertSelect_Click" />
        </div>
        <div>
            <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="5"
                OnRowEditing="GridView_RowEditing"
                OnRowCancelingEdit="GridView_RowCancelingEdit"
                OnRowUpdating="GridView_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="选择">
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="CheckBox_Select" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="身份证号" ReadOnly="true" />
                    <asp:TemplateField HeaderText="姓名">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="性别">
                        <EditItemTemplate>
                            <asp:DropDownList runat="server" ID="DropDownList_Sex" DataSource="<% # DropDownList_Sex() %>"></asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label_Sex" runat="server" Text='<%# Bind("Sex") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                </Columns>
                <HeaderStyle ForeColor="White" BackColor="#006699" Font-Bold="true" />
                <FooterStyle ForeColor="White" BackColor="#990000" Font-Bold="true" />
            </asp:GridView>
        </div>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
                <table id="person" class="bootstrap-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Sex</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>

    </form>

    <script src="third/jquery/3.4.1/jquery.min.js"></script>
    <script src="third/bootstrap/4.3.1/bootstrap.min.js"></script>
    <script src="third/bootstrap-table/bootstrap-table.js"></script>

    <%--<script src="js/person.js"></script>--%>

    <script type="text/javascript">
        $(function () {
            //初始化表格
            var Table = new TableInit();
            Table.Init();
        });

        var TableInit = function () {
            var TableInit = new Object();
            //初始化Table
            TableInit.Init = function () {
                //清空表格数据
                $('#person').bootstrapTable('destroy');
                //设置表格属性
                $('#person').bootstrapTable({
                    url: 'Default.aspx?method=FetchData',          //请求数据的URL，先空着
                    dataField: "rows",//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
                    method: 'get',      //请求方法
                    contentType: "application/x-www-form-urlencoded",//请求数据内容格式 默认是 application/json 自己根据格式自行服务端处理
                    dataType: "json",//期待返回数据类型
                    toolbar: '#toolbar',     //工具栏
                    striped: false,         //表格斑马纹
                    cahce: true,
                    pagination: true,       //分页
                    sortable: true,     //排序
                    sortOrder: "asc",   //排序方式
                    queryParams: TableInit.queryParams,     //要传递的参数，这里是一个方法名，之后实现
                    sidePagination: "server",   //分页的类型“服务端”还是“客户端”
                    pageNumber: 1,      //分页起始页
                    pageSize: 10,       //分页显示的条数
                    pageList: [10, 25, 50, 'All'],  //分页可以显示条数
                    search: true,       //搜索
                    strictSearch: true,
                    showColumns: true,      //设置可以显示的列
                    minimumCountColumns: 2, //最少显示的列数，对应上条
                    showRefresh: true,      //刷新按钮
                    clickToSelect: true,    //点击选择
                    singleSelect: true,     //单选
                    //showToggle:true,
                    showFooter: true,   //设置表底
                    //双击选择方法
                    onDblClickRow: function (row) {
                        Dbclick(row);
                    },
                    //下面是列名,
                    columns: [
                        {
                            field: 'ID',   //数据键
                            title: 'ID',      //列名
                            sortable: true,     //是否允许排序
                            align: 'center',    //居中
                            footerFormatter: 'Total',   //表底显示
                        }, {
                            field: 'Name',
                            title: 'Name',
                            sortable: true,
                            align: 'center',
                        }, {
                            field: 'Sex',
                            title: 'Sex',
                            sortable: true,
                            align: 'center',
                        },
                    ],
                });
            };
            return TableInit;
        };
        </script>

</body>
</html>
