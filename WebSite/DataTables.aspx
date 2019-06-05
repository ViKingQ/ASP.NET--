<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataTables.aspx.cs" Inherits="DataTables" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="third/bootstrap/4.3.1/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" />
    <script src="third/jquery/3.4.1/jquery.min.js"></script>
    <script src="third/bootstrap/4.3.1/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="js/my_datatables.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    DataTables Example</h6>
            </div>
            <div class="card-body">
                <table id="my_datatables" class="table display responsive nowrap" style="width: 100%">
                    <thead>
                        <tr>
                            <th>
                                ID
                            </th>
                            <th>
                                First name
                            </th>
                            <th>
                                Last name
                            </th>
                            <th>
                                Position
                            </th>
                            <th>
                                Office
                            </th>
                            <th>
                                Age
                            </th>
                            <th>
                                Start date
                            </th>
                            <th>
                                Salary
                            </th>
                            <th>
                                Extn.
                            </th>
                            <th>
                                E-mail
                            </th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
