<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>域名管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${cdnDomain}theme/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link href="${cdnDomain}theme/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet"
          type="text/css">
    <link href="${cdnDomain}theme/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"
          type="text/css">
    <link href="${cdnDomain}theme/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet"
          type="text/css">
    <link href="${cdnDomain}theme/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <link href="${cdnDomain}theme/assets/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet"
          type="text/css"/>

    <link href="${cdnDomain}theme/assets/custom/plugins/jquery.easyweb/jquery.easyweb.css" rel="stylesheet"
          type="text/css"/>
    <!-- BEGIN THEME STYLES -->
    <link href="${cdnDomain}theme/assets/global/css/components.css?v=${cdnVersion}" rel="stylesheet" type="text/css"/>
    <link href="${cdnDomain}theme/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="${cdnDomain}theme/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
    <link href="${cdnDomain}theme/assets/admin/layout/css/themes/default.css?v=${cdnVersion}" rel="stylesheet"
          type="text/css"/>
    <link href="${cdnDomain}theme/assets/admin/layout/css/custom.css?v=${cdnVersion}" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<body>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper"></div>
<!-- END SIDEBAR -->
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <h3 class="page-title">域名管理</h3>
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>当前位置：域名管理<i class="fa fa-angle-right"></i></li>
                <li>域名列表</li>
            </ul>
        </div>
        <%--START 新增商户--%>
        <div id="modal-merchant-brand-add" class="modal fade" data-backdrop="static" tabindex="-1">
            <div class="modal-dialog" style="width: 680px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"></button>
                        <h4 class="modal-title">新增品牌</h4>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 30px 20px 15px 20px;">
                        <form method="post" action="/merchant/add" class="form-horizontal">
                            <div class="form-body">

                                <div class="form-group">
                                    <label class="col-md-3 control-label">品牌名称</label>
                                    <div class="col-md-9">
                                        <input name="nickname" class="form-control input-inline input-medium" autocomplete="off" type="text">
                                        <span class="help-inline" data-default="请选择品牌名称。"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">域名</label>
                                    <div class="col-md-9">
                                        <input name="nickname" class="form-control input-inline input-medium" autocomplete="off" type="text">
                                        <span class="help-inline" data-default="请输入域名。"></span>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn default"><i class="fa fa-undo"></i> 返回列表</button>
                        <button type="button" data-command="submit" onclick="sub()" class="btn green-meadow"><i class="fa fa-check"></i> 确认添加</button>
                    </div>
                </div>
            </div>
        </div>
        <%--END 新增商户--%>

        <!-- END PAGE HEADER-->
        <div id="modal-lottery-user-card-edit" class="modal fade" data-backdrop="static" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-footer">
                        <button type="button" data-command="submit" class="btn green-meadow"><i class="fa fa-check"></i>
                            确认
                        </button>
                        <button type="button" data-dismiss="modal" class="btn default"><i class="fa fa-undo"></i> 取消
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- BEGIN PAGE CONTENT-->
        <div id="table-merchant-list" class="row">
            <div class="col-md-12">
                <!-- BEGIN PORTLET-->
                <div class="portlet light" style="margin-bottom: 10px;">
                    <div class="portlet-body">
                        <div class="table-toolbar">
                            <div class="form-inline">
                                <div class="row">
                                    <div class="col-md-12">
                                        <%--<div class="form-group">
                                            <div class="input-group input-medium">
                                                <span class="input-group-addon no-bg fixed">商户</span>
                                                <input name="merchant-name" class="form-control" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-medium">
                                                <span class="input-group-addon no-bg fixed">名称</span>
                                                <input name="merchant-name" class="form-control" type="text">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <a data-command="search" href="javascript:;" class="btn green-meadow"><i
                                                    class="fa fa-search"></i> 搜索</a>
                                        </div>--%>
                                        <div class="btn-group pull-right">
                                            <button class="btn green" data-toggle="modal" data-target="#modal-merchant-brand-add">
                                                <i class="fa fa-plus"></i> 新增域名
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="table-scrollable table-scrollable-borderless">
                            <table class="table table-hover table-light">
                                <thead>
                                <tr class="align-center">
                                    <th width="10%">商户</th>
                                    <th width="10%">品牌</th>
                                    <%--<th width="10%">名称</th>--%>
                                    <%--<th width="8%">类型</th>--%>
                                    <th width="16%">域名</th>
                                    <%--<th width="16%">用该域名生产代理推广链接</th>--%>
                                    <%--<th width="8%">状态</th>--%>
                                    <th class="three">操作</th>
                                </tr>
                                </thead>
                                <tbody id="tab-tbody">
                                </tbody>
                            </table>
                        </div>
                        <%--<div class="page-list">
                            <div class="easyweb-pagination">
                                <div class="infos">记录总数：<span id="totalCount" class="t">0</span>，
                                    页数：<span id="page" class="p">0</span>/
                                    <span id="totalPage" class="p">0</span>
                                </div>
                                <div class="pages"><a class="top" id="top">首页</a><a class="prev" id="prev">上一页</a>
                                    &lt;%&ndash;<a class="page selected">1</a>&ndash;%&gt;
                                    <a class="next" id="next">下一页</a>
                                    <a class="end" id="end">尾页</a>
                                </div>
                                <div class="go"><input type="number" id="inputPage"><a id="btn-go" class="btn-go">搜索</a>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
                <!-- END PORTLET-->
            </div>
        </div>
        <!-- END PAGE CONTENT-->

        <%--START 域名修改--%>
        <div id="modal-merchant-modify" class="modal fade" data-backdrop="static" tabindex="-1">
            <div class="modal-dialog" style="width: 680px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"></button>
                        <h4 class="modal-title">域名修改</h4>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 30px 20px 15px 20px;">
                        <form method="post" action="/merchant/update" class="form-horizontal">
                            <div class="form-body">


                                <div class="form-group">
                                    <label class="col-md-3 control-label">商户名</label>
                                    <div class="col-md-9">
                                        <input id="merchantCode" name="merchantCode" class="form-control input-inline input-medium"
                                               autocomplete="off" type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">品牌</label>
                                    <div class="col-md-9">
                                        <input id="brand" name="brand" class="form-control input-inline input-medium"
                                               autocomplete="off" type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">域名</label>
                                    <div class="col-md-9">
                                        <input id="domain" name="domain" class="form-control input-inline input-medium"
                                               autocomplete="off" type="text">
                                    </div>
                                </div>


                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn default"><i class="fa fa-undo"></i> 返回列表</button>
                        <button type="button" data-command="submit" onclick="sub1()" class="btn green-meadow"><i class="fa fa-check"></i> 确认修改</button>
                    </div>
                </div>
            </div>
        </div>
        <%--END 商户修改--%>
    </div>
</div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${cdnDomain}theme/assets/global/plugins/respond.min.js"></script>
<script src="${cdnDomain}theme/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="${cdnDomain}theme/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${cdnDomain}theme/assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"
        type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
        type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
        type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>

<%--<script src="${cdnDomain}theme/assets/custom/plugins/jquery.easyweb/jquery.easyweb.js" type="text/javascript"></script>--%>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${cdnDomain}theme/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/scripts/md5.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>

<script src="${cdnDomain}theme/assets/custom/scripts/global.js?v=${cdnVersion}" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var tableList = $('#table-merchant-list');
        var tablePagelist = tableList.find('.page-list');
        search("/merchant-brand-domain/list");
        tableList.find('[data-command="search"]').unbind('click').click(function () {
            // var page = $('#page').text();
            search("/merchant-brand-domain/list");
        });
        function search(url) {
            /*var end = $('#end').val();
            if (end && page > end) {
                page = end;
            }
            if (page <= 0) {
                page = 1;
            }*/
            // var merchantname = tableList.find('input[name=merchant-name]').val();
            var data = {};
            $.ajax({
                type: 'post',
                url: url,
                data: '',
                dataType: 'json',
                success: function (list) {
                    var table = $('#tab-tbody');
                    var innerHtml = '';
                    $.each(list, function (idx, val) {
                        /*var merchantType = '';
                        if (val.status == 1) {
                            merchantType = '<form method="post" action="">' +
                                '<input type="radio" name="type" value="1" checked>启用' +
                                '<input type="radio" name="type" value="2">停用' +
                                '<input type="radio" name="type" value="3">关闭' +
                                '<input type="radio" name="type" value="4">维护' +
                                '</form>';
                        } else if (val.status == 2) {
                            merchantType = '<form method="post" action="">' +
                                '<input type="radio" name="type" value="1" >启用' +
                                '<input type="radio" name="type" value="2" checked>停用' +
                                '<input type="radio" name="type" value="3">关闭' +
                                '<input type="radio" name="type" value="4">维护' +
                                '</form>';
                        } else if (val.status == 3) {
                            merchantType = '<form method="post" action="">' +
                                '<input type="radio" name="type" value="1" >启用' +
                                '<input type="radio" name="type" value="2">停用' +
                                '<input type="radio" name="type" value="3" checked>关闭' +
                                '<input type="radio" name="type" value="4">维护' +
                                '</form>';
                        } else if (val.status == 4) {
                            merchantType = '<form method="post" action="">' +
                                '<input type="radio" name="type" value="1" >启用' +
                                '<input type="radio" name="type" value="2">停用' +
                                '<input type="radio" name="type" value="3">关闭' +
                                '<input type="radio" name="type" value="4" checked>维护' +
                                '</form>';
                        }*/
                        innerHtml +=
                            '<tr class="align-center" data-id="' + val.id + '">' +
                            '<td>' + val.merchantCode + '</td>' +
                            '<td>' + val.brandName + '</td>' +
                            // '<td>' + val.name + '</td>' +
                            // '<td>' + val.type + '</td>' +
                            '<td>' + val.domain + '</td>' +
                            // '<td>' + val.isfalse + '</td>' +
                            // '<td>' + val.status + '</td>' +
                            '<td>' +
                            // '<a href="javascript:;" onclick="modify('+val.id+')" class="btn default btn-xs black"><i class="fa fa-modify"></i> 修改 </a>' +
                            '<button class="btn gray" data-toggle="modal" data-target="#modal-merchant-modify" ' +
                            'onclick="modify('+val.id+')">' +
                            '修改' +
                            '</button>'+
                            '</td>' +
                            '</tr>';
                    });
                    table.html(innerHtml);
                    /*var totalCount = list.totalCount;
                    var tatalPage = Math.ceil(totalCount / 1);
                    $('#totalCount').text(totalCount);
                    $('#page').text(page);
                    $('#totalPage').text(tatalPage);
                    $('#end').val(tatalPage);
                    $('#inputPage').val();*/
                    /*查询结果为空*/
                    if (list.length == 0) {
                        var tds = tableList.find('thead tr th').size();
                        tableList.find('table > tbody').html('<tr><td colspan="' + tds + '">没有相关数据</td></tr>');
                        $('#page').text(0);
                    }
                }
            });
        }
        /*/!*首页*!/
        $('#top').click(function () {
            search(".merchant-brand-domain/list", 1);
        })
        /!*尾页*!/
        $('#end').click(function () {
            var page = $('#end').val();
            search(".merchant-brand-domain/list", parseInt(page));
        });
        /!*上页*!/
        $('#prev').click(function () {
            var page = $('#page').text();
            search(".merchant-brand-domain/list", parseInt(page) - 1);
        });
        /!*下页*!/
        $('#next').click(function () {
            var page = $('#page').text();
            search(".merchant-brand-domain/list", parseInt(page) + 1);
        });
        $('#btn-go').click(function () {
            var page = $('#inputPage').val();
            search(".merchant-brand-domain/list", parseInt(page));
        });*/
    });
    /*商户信息修改*/
    function modify(id) {
        $.ajax({
            type: 'post',
            url: '/merchant-brand/get',
            data: "id="+id,
            dataType: 'json',
            success: function (bean) {
                $('#merchantCode').val(bean.merchantCode);
                $('#brand').val(bean.brand);
                $('#domain').val(bean.domain);

                $('#modal-merchant-modify').modal;
            }
        });
    }
    /*新增商户提交*/
    function sub() {
        var data = $("form:first").serialize()
        $.ajax({
            type: 'post',
            url: '/merchant-brand/add',
            data: data,
            dataType: 'text',
            success: function (data) {
                if (data == "true") {
                    alert("增加成功");
                }else {
                    alert("增加失败");
                }
                $('#modal-merchant-add').modal("hide");
                window.location.reload();
            }
        });
    }
    /*修改商户提交*/
    function sub1() {
        var data = $("form:last").serialize()
        alert(data)
        $.ajax({
            type: 'post',
            url: '/merchant/update',
            data: data,
            dataType: 'text',
            success: function (data) {
                if (data == "true") {
                    alert("修改成功");
                }else{
                    alert("修改失败")
                }
                $('#modal-merchant-modify').modal("hide");
                window.location.reload();
            }
        });
    }
</script>
</body>
</html>