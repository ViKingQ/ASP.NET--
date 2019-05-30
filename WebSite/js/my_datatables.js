//var dataSet = 
//[
//    [1001,"ZhangSan","Male"],
//    [1002,"LiSi","Female"],
//];

$(document).ready(function () {
    $('#my_datatables').DataTable({
//        data: dataSet,
//        columns: [
//            { title: "标识ID" },
//            { title: "名字" },
//            { title: "性别" },
//        ],
        serverSide: true,
        ajax: {
            url: 'data/array.txt',
            //type: 'POST',
        },
    });
});