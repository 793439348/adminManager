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
            </ul>
        </div>
        <%--START 新增品牌--%>
        <div id="modal-add" class="modal fade" data-backdrop="static" tabindex="-1">
            <div class="modal-dialog" style="width: 680px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"></button>
                        <h4 class="modal-title">新增品牌</h4>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 30px 20px 15px 20px;">
                        <form id="add-form" class="form-horizontal">

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn default"><i class="fa fa-undo"></i> 返回列表</button>
                        <button type="button" data-command="submit" class="btn green-meadow"><i class="fa fa-check"></i> 确认添加</button>
                    </div>
                </div>
            </div>
        </div>
        <%--END 新增商户--%>


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

                                        <div class="btn-group pull-right">
                                            <button id="btn-add" class="btn green" data-toggle="modal" data-target="#modal-add">
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
                                    <th width="16%">手机端模板</th>
                                    <th>PC端模板</th>
                                    <th width="8%">状态</th>
                                    <th class="three">操作</th>
                                </tr>
                                </thead>
                                <tbody id="tab-tbody">
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
                <!-- END PORTLET-->
            </div>
        </div>
        <!-- END PAGE CONTENT-->

        <%--START 修改--%>
        <div id="modal-modify" class="modal fade" data-backdrop="static" tabindex="-1">
            <div class="modal-dialog" style="width: 680px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"></button>
                        <h4 class="modal-title">修改品牌</h4>
                        </button>
                    </div>
                    <div class="modal-body" style="padding: 30px 20px 15px 20px;">
                        <form class="form-horizontal">
                            <div class="form-body">

                                <div class="form-group">
                                    <label class="col-md-3 control-label">商户名</label>
                                    <div class="col-md-9">
                                        <select id="mName" name="merchantId">

                                        </select>
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
                                               autocomplete="off" type="text" readonly="readonly">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">状态</label>
                                    <div id="status" class="col-md-9">
                                        <input type="radio" name="status" value="0">启用
                                        <input type="radio" name="status" value="1">停用
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">移动端模板</label>
                                    <div class="col-md-9">
                                        <select id="modify-temp" name="templete" onchange="showTempIMG(this)">

                                        </select>
                                        <br/>
                                        <img id="b-templete" src="" alt="图片" width="40" height="40">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">PC端模板</label>
                                    <div class="col-md-9">
                                        <select id="modify-mtemp" name="mtemplete" onchange="showTempIMG(this)">

                                        </select>
                                        <br/>
                                        <img id="b-mtemplete" src="" alt="图片" width="40" height="40">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">PC端模板</label>
                                    <div class="col-md-9">
                                        <input type="hidden" name="id" id="hid-id">
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

<script type="text/javascript">
    $(document).ready(function () {

        var tableList = $('#table-merchant-list');
        var tablePagelist = tableList.find('.page-list');
        search("./merchant-brand/list");
        tableList.find('[data-command="search"]').unbind('click').click(function () {
            search("./merchant-brand/list");
        });
        function search(url) {
            $.ajax({
                type: 'post',
                url: url,
                data: '',
                dataType: 'json',
                success: function (list) {
                    var table = $('#tab-tbody');
                    var innerHtml = '';
                    $.each(list, function (idx, val) {
                        var type = '';
                        if (val.status == 0) {
                            type = '<form method="post" action="">' +
                                '<input type="radio" name="m-type" value="0" checked>启用' +
                                '<input type="radio" name="m-type" value="1">停用' +
                                '</form>';
                        } else if (val.status == 1) {
                            type = '<form method="post" action="">' +
                                '<input type="radio" name="m-type" value="0" >启用' +
                                '<input type="radio" name="m-type" value="1" checked>停用' +
                                '</form>';
                        }
                        innerHtml +=
                            '<tr class="align-center" data-id="' + val.id + '">' +
                            '<td>' + val.id + '</td>' +
                            '<td>' + val.merchantName + '</td>' +
                            '<td>' + val.name + '</td>' +
                            '<td>' + val.code + '</td>' +
                            '<td>' + '<img src="'+val.templete.smallImage+'" alt="图片" width="40" height="40">' + '</td>' +
                            '<td>' + '<img src="'+val.mtemplete.smallImage+'" alt="图片" width="40" height="40">' + '</td>' +
                            '<td>' + type + '</td>' +
                            '<td>' +
                            '<button class="btn gray" data-toggle="modal" data-target="#modal-modify" ' +
                            'onclick="modify('+val.id+')">' +
                            '修改' +
                            '</button>'+
                            '</td>' +
                            '</tr>';
                    });
                    table.html(innerHtml);

                    /*查询结果为空*/
                    if (list.length == 0) {
                        var tds = tableList.find('thead tr th').size();
                        tableList.find('table > tbody').html('<tr><td colspan="' + tds + '">没有相关数据</td></tr>');
                        $('#page').text(0);
                    }

                    $("input[name=m-type]").click(function(){
                        var type = this.value;
                        var id = $(this).parent().parent().siblings(":first").text();
                        modifyType(id, type);
                    });

                }
            });
        }


        $('#btn-add').click(function () {
            var innerhtml = '<div class="form-body">\n' +
                '\n' +
                '                                <div class="form-group">\n' +
                '                                    <label class="col-md-3 control-label">商户名</label>\n' +
                '                                    <div class="col-md-9">\n' +
                '                                        <select id="merchantName" name="merchantId">\n' +
                '\n' +
                '                                        </select>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="form-group">\n' +
                '                                    <label class="col-md-3 control-label">品牌名称</label>\n' +
                '                                    <div class="col-md-9">\n' +
                '                                        <input name="name" class="form-control input-inline input-medium" autocomplete="off" type="text">\n' +
                '                                        <span class="help-inline" data-default="请填写品牌名称。"></span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="form-group">\n' +
                '                                    <label class="col-md-3 control-label">品牌代号</label>\n' +
                '                                    <div class="col-md-9">\n' +
                '                                        <input name="code" class="form-control input-inline input-medium" autocomplete="off" type="text">\n' +
                '                                        <span class="help-inline" data-default="请输入品牌代号。"></span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="form-group">\n' +
                '                                    <label class="col-md-3 control-label">状态</label>\n' +
                '                                    <div class="col-md-9">\n' +
                '                                        <input type="radio" name="status" value="0" checked="">启用\n' +
                '                                        <input type="radio" name="status" value="1">停用\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="form-group">\n' +
                '                                    <label class="col-md-3 control-label">移动端模板</label>\n' +
                '                                    <div class="col-md-9">\n' +
                '                                        <select id="add-temp" name="templete" onchange="showTempIMG(this)">\n' +
                '\n' +
                '                                        </select>\n' +
                '                                        <br/>\n' +
                '                                        <img src="" alt="预览图" width="40" height="40">\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="form-group">\n' +
                '                                    <label class="col-md-3 control-label">PC端模板</label>\n' +
                '                                    <div class="col-md-9">\n' +
                '                                        <select id="add-mtemp" name="mtemplete" onchange="showTempIMG(this)">\n' +
                '\n' +
                '                                        </select>\n' +
                '                                        <br/>\n' +
                '                                        <img src="" alt="预览图" width="40" height="40">\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                            </div>'

            $('#add-form').html(innerhtml);

            findMerchant($('#merchantName'));
            findTemplete($("#add-temp"),$("#add-mtemp"));
        })
        function validation(obj) {
            var modal = $(obj);
            var form = modal.find('form');

            form.validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 4,
                        maxlength: 20
                    },
                    code: {
                        required: true,
                        minlength: 4,
                        maxlength: 10,
                        remote: {
                            url: '/merchant-brand/exists',
                            type: 'post'
                        }
                    }
                },
                messages: {
                    name: {
                        required: '品牌名称不能为空！',
                        minlength: '至少输入{0}个字符',
                        maxlength: '最多输入{0}个字符'
                    },
                    code: {
                        required: '品牌代号不能为空！',
                        minlength: '至少输入{0}个字符',
                        maxlength: '最多输入{0}个字符',
                        remote: '品牌代号已存在！'
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
                    sub();
                }
            });
        }
        $('#modal-add').click(function () {
            validation(this);
        });
        $('#modal-modify button[data-command=submit]').click(function () {
            sub1();
        });



    });
    /*修改*/
    function modify(id) {
        $.ajax({
            type: 'post',
            url: '/merchant-brand/get',
            data: "id="+id,
            dataType: 'json',
            success: function (bean) {
                $('#bName').val(bean.name);
                $('#brand-code').val(bean.code);
                $('#b-templete').attr("src",bean.templete.smallImage);
                $('#b-mtemplete').attr("src",bean.mtemplete.smallImage);
                $('#hid-id').val(bean.id);
                var ipts = $('#status').find('input');
                $(ipts[bean.status]).attr("checked","checked");
                $('#modal-merchant-modify').modal;
            }
        });

        findMerchant($('#mName'));
        findTemplete($("#modify-temp"),$("#modify-mtemp"));
    }
    /*新增提交*/
    function sub() {
        var data = $("form:first").serialize()
        $.ajax({
            type: 'post',
            url: '/merchant-brand/add',
            data: data,
            dataType: 'json',
            success: function (data) {
                if (data.error == "0") {
                    alert("保存成功");
                    $('#modal-add').modal("hide");
                    window.location.reload();
                }else{
                    alert("保存失败")
                }
            }
        });
    }
    /*修改提交*/
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
                    $('#modal-modify').modal("hide");
                    window.location.reload();
                }else{
                    alert("修改失败")
                }
            }
        });
    }


    function modifyType(id,type) {
        $.ajax({
            type: 'post',
            url: '/merchant-brand/modify-type',
            data: "id="+id+"&status="+type,
            dataType: 'text',
            success: function (dat){
                if (dat != "true") {
                    alert("修改状态失败");
                }
            }
        });
    }
    function addBrand() {
        findMerchant($("#merchantName"));
        findTemplete($("#add-temp"),$("#add-mtemp"));
        
    }
    function findTemplete(obj1,obj2) {
        $.ajax({
            type: 'post',
            url: '/site-template/list',
            data: '',
            dataType: "json",
            success: function (list) {
                var innerhtml1 = '';
                var innerhtml2 = '';
                var boo1 = true;
                var boo2 = true;
                var src1 = '';
                var src2 = '';
                $.each(list,function (idx, val) {
                    if (val.type == 1) {
                        /*手机端*/
                        innerhtml1 +='<option value="'+val.code+'">'+val.code+'</option>';
                        if (boo1) {
                            src1 = val.smallImage;
                            boo1 = false;
                        }
                    }else if (val.type == 2) {
                        /*pc端*/
                        innerhtml2 +='<option value="'+val.code+'">'+val.code+'</option>';
                        if (boo2){
                            src2 = val.smallImage;
                            boo2 = false;
                        }
                    }
                });
                $(obj1).html(innerhtml1);
                $(obj2).html(innerhtml2);
                $(obj1).next().next().attr("src", src1);
                $(obj2).next().next().attr("src", src2);

            }
        });
    }

    function showTempIMG(obj) {
        var code = $(obj.options[obj.selectedIndex]).val();
        $.ajax({
            type: 'post',
            url: '/site-template/getbycode',
            data: 'code='+code,
            dataType: "json",
            success: function (data) {
                $(obj).next().next().attr("src",data.smallImage);
            }
        })
    }

    function findMerchant(obj) {
        $.ajax({
            type: 'post',
            url: '/merchant/getlist',
            data: '',
            dataType: "json",
            success: function (data) {
                var innerhtml = '';
                if (data.length != 0) {
                    $.each(data,function (idx, val) {
                        innerhtml+='<option value='+val.id+' >'+val.code+'</option>';
                    })
                }else {
                 innerhtml = '<option value="0" >无商户信息</option>';
                };

                $(obj).html(innerhtml);
            }
        })
    }
</script>
</body>
</html>