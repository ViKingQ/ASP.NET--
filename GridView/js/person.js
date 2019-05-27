$(document).ready(function () {
    $('#person').bootstrapTable({
        url: 'Default.aspx?method=FetchData',
        onLoadSuccess: function (res) {//可不写
            //加载成功时
            console.log("onLoadSuccess");
            console.log(res);
        },
        onLoadError: function (statusCode) {
            console.log("onLoadError");
            console.log(statusCode);
            return "onLoadError";
        },
        formatLoadingMessage: function () {
            //正在加载
            console.log("formatLoadingMessage");
            return "formatLoadingMessage...";
        },
        formatNoMatches: function () {
            //没有匹配的结果
            console.log("formatNoMatches");
            return 'formatNoMatches';
        },
        pageSize: 10,
        columns: [
            {
                field: "ID",
                title: "ID",
            },
            {
                field: "Name",
                title: "Name",
            },
            {
                field: "Sex",
                title: "Sex",
            },
        ],
    });
});