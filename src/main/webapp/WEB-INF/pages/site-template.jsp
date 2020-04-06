<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>模板管理</title>
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
        <h3 class="page-title">模板管理</h3>
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>当前位置：模板管理<i class="fa fa-angle-right"></i></li>
            </ul>
        </div>
        <%--START 新增模板--%>
        <div id="modal-add" class="modal fade" data-backdrop="static" tabindex="-1">
            <div class="modal-dialog" style="width: 680px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"></button>
                        <h4 class="modal-title">新增模板</h4>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 30px 20px 15px 20px;">
                        <form class="form-horizontal">
                            <div class="form-body">

                                <div class="form-group">
                                    <label class="col-md-3 control-label">模板编码</label>
                                    <div class="col-md-9">
                                        <input name="code" class="form-control input-inline input-medium" autocomplete="off" type="text">
                                        <span class="help-inline" data-default="请输入商户昵称。"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">模板名称</label>
                                    <div class="col-md-9">
                                        <input name="name" class="form-control input-inline input-medium" autocomplete="off" type="text">
                                        <span class="help-inline" data-default="请输入商户昵称。"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">类型</label>
                                    <div class="col-md-9">
                                        <select name="type" class="form-control input-medium" aria-invalid="false">
                                            <option value="1" selected>手机端</option>
                                            <option value="2">PC端</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">缩略图</label>
                                    <div class="col-md-9">
                                        <input name="smallImage" class="form-control input-inline input-medium" autocomplete="off" type="text" >
                                        <span class="help-inline" data-default="请选择缩略图。"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">预览图</label>
                                    <div class="col-md-9">
                                        <input name="bigImage" class="form-control input-inline input-medium" autocomplete="off" type="text"  >
                                        <span class="help-inline" data-default="请选择预览图。"></span>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn default"><i class="fa fa-undo"></i> 返回列表</button>
                        <button type="button" data-command="submit" class="btn green-meadow"><i class="fa fa-check"></i> 确认添加</button>
                    </div>
                </div>
            </div>
        </div>
        <%--END 新增模板--%>

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
                                        <div class="form-group">
                                            <div class="input-group input-medium">
                                                <span class="input-group-addon no-bg fixed">模板名称</span>
                                                <input data-command="name" name="name" class="form-control" type="text">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon no-bg fixed">类型</span>
                                                <select data-command="type" name="type" class="form-control">
                                                    <option value="">全部</option>
                                                    <option value="1">手机端</option>
                                                    <option value="2">PC端</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <a data-command="search" href="javascript:;" class="btn green-meadow"><i
                                                    class="fa fa-search"></i> 搜索</a>
                                        </div>
                                        <div class="btn-group pull-right">
                                            <button class="btn green" data-toggle="modal" data-target="#modal-add">
                                                <i class="fa fa-plus"></i> 新增模板
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
                                    <th width="10%">模板编码</th>
                                    <th width="10%">模板名称</th>
                                    <th width="10%">模板类型</th>
                                    <th >缩略图</th>
                                    <th >预览图</th>
                                    <th class="three">操作</th>
                                </tr>
                                </thead>
                                <tbody id="tab-tbody">
                                </tbody>
                            </table>
                        </div>
                        <%--分页--%>
                        <div class="page-list">
                            <div class="easyweb-pagination">
                                <div class="infos">记录总数：<span id="totalCount" class="t">0</span>，
                                    页数：<span id="page" class="p">0</span>/
                                    <span id="totalPage" class="p">0</span>
                                </div>
                                <div class="pages"><a class="top" id="top">首页</a><a class="prev" id="prev">上一页</a>
                                    <%--<a class="page selected">1</a>--%>
                                    <a class="next" id="next">下一页</a>
                                    <a class="end" id="end">尾页</a>
                                </div>
                                <div class="go"><input type="number" id="inputPage"><a id="btn-go" class="btn-go">搜索</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PORTLET-->
            </div>
        </div>
        <!-- END PAGE CONTENT-->

        <%--START 商户修改--%>
        <div id="modal-modify" class="modal fade" data-backdrop="static" tabindex="-1">
            <div class="modal-dialog" style="width: 680px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"></button>
                        <h4 class="modal-title">修改模板</h4>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 30px 20px 15px 20px;">
                        <form class="form-horizontal">
                            <div class="form-body">

                                <div class="form-group">
                                    <label class="col-md-3 control-label">模板编码</label>
                                    <div class="col-md-9">
                                        <input id="code" name="code" class="form-control input-inline input-medium"
                                               autocomplete="off" type="text">
                                        <span class="help-inline" data-default=""></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">模板名称</label>
                                    <div class="col-md-9">
                                        <input id="name" name="name" class="form-control input-inline input-medium"
                                               autocomplete="off" type="text">
                                        <span class="help-inline" data-default=""></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">模板类型</label>
                                    <div class="col-md-9">
                                        <select name="type" class="form-control input-medium" aria-invalid="false">
                                            <option value="1" selected>手机端</option>
                                            <option value="2">PC端</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">缩略图</label>
                                    <div class="col-md-9">
                                        <input id="smallImage" name="smallImage" class="form-control input-inline input-medium"
                                               autocomplete="off" type="text">
                                        <span class="help-inline" data-default=""></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">预览图</label>
                                    <div class="col-md-9">
                                        <input id="bigImage" name="bigImage" class="form-control input-inline input-medium"
                                               autocomplete="off" type="text">
                                        <span class="help-inline" data-default=""></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-9">
                                        <input id="id" name="id" class="form-control input-inline input-medium"
                                               autocomplete="off" type="hidden">
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn default"><i class="fa fa-undo"></i> 返回列表</button>
                        <button type="button" data-command="submit" class="btn green-meadow"><i class="fa fa-check"></i> 确认修改</button>
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
        search("/site-template/search", 1);
        tableList.find('[data-command="search"]').unbind('click').click(function () {
            var page = $('#page').text();
            search("/site-template/search", parseInt(page));
        });
        function search(url, page) {
            var end = $('#end').val();
            if (end && page > end) {
                page = end;
            }
            if (page <= 0) {
                page = 1;
            }
            var name = tableList.find('[data-command="name"]').val();
            var type = tableList.find('[data-command="type"]').val();
            var data = {name:name,type:type,page:(page-1)*10,pageSize:10};
            $.ajax({
                type: 'post',
                url: url,
                data: data,
                dataType: 'json',
                success: function (list) {
                    var table = $('#tab-tbody');
                    var innerHtml = '';
                    $.each(list.data, function (idx, val) {
                        innerHtml +=
                            '<tr class="align-center" data-id="' + val.id + '">' +
                            '<td>' + val.id + '</td>' +
                            '<td>' + val.code + '</td>' +
                            '<td>' + val.name + '</td>' +
                            '<td>' + val.type + '</td>' +
                            '<td>' + '<img src="'+val.smallImage+'" alt="缩略图" width="40" height="40">' + '</td>' +
                            '<td>' + '<img src="'+ val.bigImage +'" alt="预览图" width="40" height="40">' + '</td>' +
                            '<td>' +
                            '<button class="btn gray" data-toggle="modal" data-target="#modal-modify" ' +
                            'onclick="modify('+val.id+')">' +
                            '修改' +
                            '</button>'+
                            '<button class="btn gray" data-toggle="modal" ' +
                            'onclick="dele('+val.id+')">' +
                            '删除' +
                            '</button>'+
                            '</td>' +
                            '</tr>';
                    });
                    table.html(innerHtml);
                    var totalCount = list.totalCount;
                    var tatalPage = Math.ceil(totalCount / 10);
                    $('#totalCount').text(totalCount);
                    $('#page').text(page);
                    $('#totalPage').text(tatalPage);
                    $('#end').val(tatalPage);
                    $('#inputPage').val();
                    /*查询结果为空*/
                    if (list.data.length == 0) {
                        var tds = tableList.find('thead tr th').size();
                        tableList.find('table > tbody').html('<tr><td colspan="' + tds + '">没有相关数据</td></tr>');
                        $('#page').text(0);
                    }
                }
            });
        }

        $('#modal-add').click(function () {
            validation(this, "add");
        });
        $('#modal-modify').click(function () {
            validation(this,"modify");
        });
        function validation(obj,action) {
            var modal = $(obj);
            var form = modal.find('form');

            form.validate({
                rules: {
                    code: {
                        required: true
                    },
                    name: {
                        required: true
                    },
                    smallImage: {
                        required: true
                    },
                    bigImage: {
                        required: true
                    }
                },
                messages: {
                    code: {
                        required: "模板编码不能为空"
                    },
                    name: {
                        required: "模板名称不能为空"
                    },
                    smallImage: {
                        required: "缩略图不能为空"
                    },
                    bigImage: {
                        required: "预览图不能为空"
                    }
                },
                invalidHandler: function (event, validator) {},
                errorPlacement: function (error, element) {
                    $(element).closest('.form-group').find('.help-inline').html('<i class="fa fa-warning"></i> ' + error.text());
                },
                highlight: function (element) {
                    $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                },
                unhighlight: function (element) {
                    $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                    $(element).closest('.form-group').find('.help-inline').html('<i class="fa fa-check"></i> 填写正确。');
                }
            });
            modal.find('[data-command="submit"]').unbind('click').click(function() {
                if(form.validate().form()) {
                    if (action == "add")
                        sub();
                    else if(action == "modify")
                        sub1();
                }
            });
        }
        /*首页*/
        $('#top').click(function () {
            search("/site-template/search", 1);
        })
        /*尾页*/
        $('#end').click(function () {
            var page = $('#end').val();
            search("/site-template/search", parseInt(page));
        });
        /*上页*/
        $('#prev').click(function () {
            var page = $('#page').text();
            search("/site-template/search", parseInt(page) - 1);
        });
        /*下页*/
        $('#next').click(function () {
            var page = $('#page').text();
            search("/site-template/search", parseInt(page) + 1);
        });
        $('#btn-go').click(function () {
            var page = $('#inputPage').val();
            if(!page || page == ''){
                page = 1;
            }
            search("/site-template/search", parseInt(page));
        });
    });
    function modify(id) {
        $.ajax({
            type: 'post',
            url: '/site-template/get',
            data: "id="+id,
            dataType: 'json',
            success: function (bean) {
                $('#id').val(bean.id);
                $('#code').val(bean.code);
                $('#name').val(bean.name);
                $('#type').val(bean.type);
                $('#smallImage').val(bean.smallImage);
                $('#bigImage').val(bean.bigImage);

                $('#modal-merchant-modify').modal;
            }
        });
    }
    function sub() {
        var data = $("form:first").serialize();
        $.ajax({
            type: 'post',
            url: '/site-template/add',
            data: data,
            dataType: 'text',
            success: function (boo) {
                if (boo == "true") {
                    alert("增加成功");
                    $('#modal-merchant-add').modal("hide");
                    window.location.reload();
                }else {
                    alert("增加失败");
                }
            }
        });
    }
    function sub1() {
        var data = $("form:last").serialize();
        $.ajax({
            type: 'post',
            url: '/site-template/update',
            data: data,
            dataType: 'text',
            success: function (boo) {
                if (boo == "true") {
                    alert("修改成功");
                    $('#modal-merchant-modify').modal("hide");
                    window.location.reload();
                }else{
                    alert("修改失败")
                }
            }
        });
    }
    function dele(id) {
        $.ajax({
            type: 'post',
            url: '/site-template/delete',
            data: 'id='+id,
            dataType: 'text',
            success: function (data) {
                if (data == "true") {
                    alert("删除成功");
                    $('#modal-merchant-modify').modal("hide");
                    window.location.reload();
                }else{
                    alert("删除失败")
                }
            }
        });
    }
</script>
</body>
</html>