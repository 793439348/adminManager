<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>品牌管理</title>
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
        <h3 class="page-title">品牌管理</h3>
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>当前位置：品牌管理<i class="fa fa-angle-right"></i></li>
                <li>品牌列表</li>
            </ul>
        </div>
        <%--START 新增品牌--%>
        <div id="modal-brand-add" class="modal fade" data-backdrop="static" tabindex="-1">
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
                                    <label class="col-md-3 control-label">商户名</label>
                                    <div class="col-md-9">
                                        <input name="merchantId" class="form-control input-inline input-medium" autocomplete="off" type="text">
                                        <span class="help-inline" data-default="请选择商户名。"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">名称</label>
                                    <div class="col-md-9">
                                        <input name="name" class="form-control input-inline input-medium" autocomplete="off" type="text">
                                        <span class="help-inline" data-default="请填写名称。"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">品牌代号</label>
                                    <div class="col-md-9">
                                        <input name="code" class="form-control input-inline input-medium" autocomplete="off" type="text">
                                        <span class="help-inline" data-default="请输入品牌代号。"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">PC端模板</label>
                                    <div class="col-md-9">
                                        <input name="templete" class="form-control input-inline input-medium" autocomplete="off" type="text">
                                        <span class="help-inline" data-default="请选择模板。"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">移动端模板</label>
                                    <div class="col-md-9">
                                        <input name="mtemplete" class="form-control input-inline input-medium" autocomplete="off" type="text">
                                        <span class="help-inline" data-default="请选择模板。"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">状态</label>
                                    <div class="col-md-9">
                                        <input type="radio" name="status" value="1" checked="">启用
                                        <input type="radio" name="status" value="2">停用
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
        <div id="table-brand-list" class="row">
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
                                                <span class="input-group-addon no-bg fixed">商户名称</span>
                                                <input name="merchant-name" class="form-control" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-medium">
                                                <span class="input-group-addon no-bg fixed">品牌名称</span>
                                                <input name="brand-name" class="form-control" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <a data-command="search" href="javascript:;" class="btn green-meadow"><i
                                                    class="fa fa-search"></i> 搜索</a>
                                        </div>--%>
                                        <div class="btn-group pull-right">
                                            <button class="btn green" data-toggle="modal" data-target="#modal-brand-add">
                                                <i class="fa fa-plus"></i> 新增品牌
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
                                    <th width="8%">ID</th>
                                    <th width="10%">商户</th>
                                    <th width="10%">品牌名称</th>
                                    <th width="10%">品牌代号</th>
                                    <th width="16%">PC模板</th>
                                    <th>移动模板</th>
                                    <th width="8%">状态</th>
                                    <th class="three">操作</th>
                                </tr>
                                </thead>
                                <tbody id="tab-tbody">
                                </tbody>
                            </table>
                        </div>
                       <%-- <div class="page-list">
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

        <%--START 商户修改--%>
        <div id="modal-merchant-modify" class="modal fade" data-backdrop="static" tabindex="-1">
            <div class="modal-dialog" style="width: 680px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"></button>
                        <h4 class="modal-title">修改品牌</h4>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 30px 20px 15px 20px;">
                        <form method="post" action="/merchant/update" class="form-horizontal">
                            <div class="form-body">

                                <div class="form-group">
                                    <label class="col-md-3 control-label">商户名</label>
                                    <div class="col-md-9">
                                        <input id="mName" name="merchantId" class="form-control input-inline input-medium"
                                               autocomplete="off" type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">品牌名称</label>
                                    <div class="col-md-9">
                                        <input id="bName" name="name" class="form-control input-inline input-medium"
                                               autocomplete="off" type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">品牌代号</label>
                                    <div class="col-md-9">
                                        <input id="brand-code" name="code" class="form-control input-inline input-medium"
                                               autocomplete="off" type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">PC端模板</label>
                                    <div class="col-md-9">
                                        <input id="b-templete" name="templete" class="form-control input-inline input-medium"
                                               autocomplete="off" type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">移动端模板</label>
                                    <div class="col-md-9">
                                        <input id="b-mtemplete" name="mtemplete" class="form-control input-inline input-medium"
                                               autocomplete="off" type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">状态</label>
                                    <div class="col-md-9">
                                        <input id="status" name="status" class="form-control input-inline input-medium"
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
        search("./merchant-brand/list");
        tableList.find('[data-command="search"]').unbind('click').click(function () {
            // var page = $('#page').text();
            search("./merchant-brand/list");
        });
        function search(url) {
            /*var end = $('#end').val();
            if (end && page > end) {
                page = end;
            }
            if (page <= 0) {
                page = 1;
            }
            var merchantname = tableList.find('input[name=merchant-name]').val();
            var brandname = tableList.find('input[name=brand-name]').val();

            var data = {merchantname:merchantname,brandname:brandname,start:page,limit:1};*/
            $.ajax({
                type: 'post',
                url: url,
                data: '',
                dataType: 'json',
                success: function (list) {
                    var table = $('#tab-tbody')
                    var innerHtml = '';
                    $.each(list, function (idx, val) {
                        var type = '';
                        if (val.status == 0) {
                            type = '<form method="post" action="">' +
                                '<input type="radio" name="type" value="0" checked>启用' +
                                '<input type="radio" name="type" value="1">停用' +
                                '</form>';
                        } else if (val.status == 1) {
                            type = '<form method="post" action="">' +
                                '<input type="radio" name="type" value="0" >启用' +
                                '<input type="radio" name="type" value="1" checked>停用' +
                                '</form>';
                        }
                        innerHtml +=
                            '<tr class="align-center" data-id="' + val.id + '">' +
                            '<td>' + val.id + '</td>' +
                            '<td>' + val.merchantName + '</td>' +
                            '<td>' + val.name + '</td>' +
                            '<td>' + val.code + '</td>' +
                            '<td>' + val.templete + '</td>' +
                            '<td>' + val.mtemplete + '</td>' +
                            '<td>' + type + '</td>' +
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
                    // var totalCount = list.totalCount;
                    // var tatalPage = Math.ceil(totalCount / 1);
                    // $('#totalCount').text(totalCount);
                    // $('#page').text(page);
                    // $('#totalPage').text(tatalPage);
                    // $('#end').val(tatalPage);
                    // $('#inputPage').val();
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
            search("./merchant-brand/list", 1);
        })
        /!*尾页*!/
        $('#end').click(function () {
            var page = $('#end').val();
            search("./merchant-brand/list", parseInt(page));
        });
        /!*上页*!/
        $('#prev').click(function () {
            var page = $('#page').text();
            search("./merchant-brand/list", parseInt(page) - 1);
        });
        /!*下页*!/
        $('#next').click(function () {
            var page = $('#page').text();
            search("./merchant-brand/list", parseInt(page) + 1);
        });
        $('#btn-go').click(function () {
            var page = $('#inputPage').val();
            search("./merchant-brand/list", parseInt(page));
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
                $('#mName').val(bean.merchantId);
                $('#bName').val(bean.name);
                $('#brand-code').val(bean.code);
                $('#b-templete').val(bean.templete);
                $('#b-mtemplete').val(bean.mtemplete);
                $('#status').val(bean.status);


                $('#modal-merchant-modify').modal;
            }
        });
    }
    /*新增品牌提交*/
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
    /*修改品牌提交*/
    function sub1() {
        var data = $("form:last").serialize()
        $.ajax({
            type: 'post',
            url: '/merchant-brand/update',
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