<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>商户列表</title>
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
        <h3 class="page-title">商户列表</h3>
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>当前位置：商户管理<i class="fa fa-angle-right"></i></li>
            </ul>
        </div>
        <%--START 新增商户--%>
        <div id="modal-add" class="modal fade" data-backdrop="static" tabindex="-1">
            <div class="modal-dialog" style="width: 680px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"></button>
                        <h4 class="modal-title">新增商户</h4>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 30px 20px 15px 20px;">
                        <form id="add-form" method="post" action="" class="form-horizontal">

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="break-add" data-dismiss="modal" class="btn default"><i class="fa fa-undo"></i> 返回列表</button>
                        <button type="button" data-command="submit" class="btn green-meadow"><i class="fa fa-check"></i> 确认添加</button>
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
                                        <div class="form-group">
                                            <div class="input-group input-medium">
                                                <span class="input-group-addon no-bg fixed">商户名称</span>
                                                <input name="merchant-name" class="form-control" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-medium">
                                                <span class="input-group-addon no-bg fixed">商户ID</span>
                                                <input name="merchant-id" class="form-control" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon no-bg fixed">状态</span>
                                                <select name="type" class="form-control">
                                                    <option value="">全部</option>
                                                    <option value="1">启用</option>
                                                    <option value="2">停用</option>
                                                    <option value="3">关闭</option>
                                                    <option value="4">维护</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <a data-command="search" href="javascript:;" class="btn green-meadow"><i
                                                    class="fa fa-search"></i> 搜索</a>
                                        </div>
                                        <div class="btn-group pull-right">
                                            <button  id="btn-add" class="btn green" data-toggle="modal" data-target="#modal-add">
                                                <i class="fa fa-plus"></i> 新增商户
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
                                    <th width="10%">商户别名</th>
                                    <th width="10%">商户ID</th>
                                    <th>商户名称</th>
                                    <th width="8%">线路费余额</th>
                                    <th width="16%">状态</th>
                                    <th width="8%">会员数</th>
                                    <th width="12%">创建时间</th>
                                    <th class="three">登入时间</th>
                                    <th class="three">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
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
                        <h4 class="modal-title">修改商户信息</h4>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 30px 20px 15px 20px;">
                        <form method="post" action="" class="form-horizontal">
                            <div class="form-body">

                                <div class="form-group">
                                    <label class="col-md-3 control-label">商户别名</label>
                                    <div class="col-md-9">
                                        <input id="nickname" name="nickname" class="form-control input-inline input-medium" autocomplete="off" type="text">
                                        <span class="help-inline" data-default=""></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">商户Id</label>
                                    <div class="col-md-9">
                                        <input id="code" name="code" class="form-control input-inline input-medium" autocomplete="off" type="text"
                                               required readonly="readonly">
                                        <span class="help-inline" data-default=""></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">商户账号</label>
                                    <div class="col-md-9">
                                        <input id="name" name="account" class="form-control input-inline input-medium" autocomplete="off" type="text"
                                               required readonly="readonly">
                                        <span class="help-inline" data-default=""></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">状态</label>
                                    <div class="col-md-9">
                                        <input id="status1" type="radio" name="status" value="1">启用
                                        <input id="status2" type="radio" name="status" value="2">停用
                                        <input id="status3" type="radio" name="status" value="3">关闭
                                        <input id="status4" type="radio" name="status" value="4">维护
                                    </div>
                                </div>
                                <div class="form-group has-success">
                                    <label class="col-md-3 control-label">角色</label>
                                    <div class="col-md-9">
                                        <select id="role_id" name="roleId" class="form-control input-medium" aria-invalid="false">
                                            <option value="1">超级管理员</option>
                                            <option value="2">运营主管</option>
                                            <option value="3">客服专员</option>
                                            <option value="4">财务组长</option>
                                            <option value="5">普通客服</option>
                                            <option value="6">充值专员</option>
                                            <option value="7">打款专员</option>
                                            <option value="9">客服组长</option>
                                            <option value="10">风控专员</option>
                                            <option value="11">风控组长</option>
                                            <option value="12">审计组长</option>
                                            <option value="13">审计专员</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">手机</label>
                                    <div class="col-md-9">
                                        <input id="phone" name="phone" class="form-control input-inline input-medium" autocomplete="off" type="text" required>
                                        <span class="help-inline" data-default="">请填写手机号</span>
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <label class="col-md-3 control-label">邮箱</label>
                                    <div class="col-md-9">
                                        <input id="email" name="email" class="form-control input-inline input-medium" autocomplete="off" type="text" required>
                                        <span class="help-inline" data-default="">请填写邮箱</span>
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <label class="col-md-3 control-label">qq</label>
                                    <div class="col-md-9">
                                        <input id="qq" name="qq" class="form-control input-inline input-medium" autocomplete="off" type="text" required>
                                        <span class="help-inline" data-default="">请填写qq</span>
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <label class="col-md-3 control-label">微信</label>
                                    <div class="col-md-9">
                                        <input id="wechat" name="wechat" class="form-control input-inline input-medium" autocomplete="off" type="text" required>
                                        <span class="help-inline" data-default="">请填写微信</span>
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <label class="col-md-3 control-label"></label>
                                    <div class="col-md-9">
                                        <input id="id" name="id" class="form-control input-inline input-medium" autocomplete="off" type="hidden">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="break-modify" data-dismiss="modal" class="btn default"><i class="fa fa-undo"></i> 返回列表</button>
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
<script src="${cdnDomain}theme/assets/admin/pages/scripts/merchant-list.js?v=${cdnVersion}" type="text/javascript"></script>

</body>
</html>