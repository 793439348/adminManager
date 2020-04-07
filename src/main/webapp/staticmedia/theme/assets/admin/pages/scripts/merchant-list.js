$(document).ready(function () {
        var tableList = $('#table-merchant-list');
        var tablePagelist = tableList.find('.page-list');

        search("./merchant/list", 1);
        tableList.find('[data-command="search"]').unbind('click').click(function () {
            var page = $('#page').text();
            search("./merchant/list", parseInt(page));
        });

        $('#modal-add').click(function () {
            addValidation(this);
        });
        $('#modal-modify').click(function () {
            modifyValidation(this);
        });
        $('#btn-add').click(function () {
            var innerhtml = '<div class="form-body">' +
                '<div class="form-group">' +
                '<label class="col-md-3 control-label">商户别名</label>' +
                '<div class="col-md-9">' +
                '<input name="nickname" class="form-control input-inline input-medium" autocomplete="off" type="text">' +
                '<span class="help-inline" data-default="">请填写商户别名</span>' +
                '</div>' +
                '</div>' +
                '<div class="form-group">' +
                '<label class="col-md-3 control-label">商户Id</label>' +
                '<div class="col-md-9">\n' +
                '<input name="code" class="form-control input-inline input-medium" autocomplete="off" type="text"' +
                ' required>' +
                '<span class="help-inline" data-default="">请填写商户Id</span>' +
                '</div>' +
                '</div>' +
                '<div class="form-group">' +
                '<label class="col-md-3 control-label">商户账号</label>' +
                '<div class="col-md-9">' +
                '<input name="account" class="form-control input-inline input-medium" autocomplete="off" type="text" required>' +
                '<span class="help-inline" data-default="">请输入商户账号</span>' +
                '</div>' +
                '</div>' +
                '<div class="form-group">' +
                '<label class="col-md-3 control-label">密码</label>' +
                '<div class="col-md-9">' +
                '<input name="pwd1" class="form-control input-inline input-medium" autocomplete="off" type="password" required>' +
                '<span class="help-inline" data-default="">请输入密码</span>' +
                '</div>' +
                '</div>' +
                '<div class="form-group">' +
                '<label class="col-md-3 control-label">确认密码</label>' +
                '<div class="col-md-9">' +
                '<input name="pwd2" class="form-control input-inline input-medium" autocomplete="off" type="password" required>' +
                '<span class="help-inline" data-default="">请确认密码</span>' +
                '</div>' +
                '</div>' +
                '<div class="form-group">' +
                '<label class="col-md-3 control-label">状态</label>' +
                '<div class="col-md-9">' +
                '<div class="radio-list">' +
                '<input type="radio" name="status" value="1" checked="checked">启用' +
                '<input type="radio" name="status" value="2">停用' +
                '<input type="radio" name="status" value="3">关闭' +
                '<input type="radio" name="status" value="4">维护' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="form-group has-success">' +
                '<label class="col-md-3 control-label">角色</label>' +
                '<div class="col-md-9">' +
                '<select name="role_id" class="form-control input-medium" aria-invalid="false">' +
                '<option value="1" selected="selected">超级管理员</option>' +
                '<option value="2">运营主管</option>' +
                '<option value="3">客服专员</option>' +
                '<option value="4">财务组长</option>' +
                '<option value="5">普通客服</option>' +
                '<option value="6">充值专员</option>' +
                '<option value="7">打款专员</option>' +
                '<option value="9">客服组长</option>' +
                '<option value="10">风控专员</option>' +
                '<option value="11">风控组长</option>' +
                '<option value="12">审计组长</option>' +
                '<option value="13">审计专员</option>' +
                '</select>' +
                '</div>' +
                '</div>' +
                '<div class="form-group">' +
                '<label class="col-md-3 control-label">手机</label>' +
                '<div class="col-md-9">' +
                '<input name="phone" class="form-control input-inline input-medium" autocomplete="off" type="text" required>' +
                '<span class="help-inline" data-default="">请填写手机号</span>' +
                '</div>' +
                '</div>' +
                '<div class="form-group" >' +
                '<label class="col-md-3 control-label">邮箱</label>' +
                '<div class="col-md-9">' +
                '<input name="email" class="form-control input-inline input-medium" autocomplete="off" type="text" required>' +
                '<span class="help-inline" data-default="">请填写邮箱</span>' +
                '</div>' +
                '</div>' +
                '<div class="form-group" >' +
                '<label class="col-md-3 control-label">qq</label>' +
                '<div class="col-md-9">' +
                '<input name="qq" class="form-control input-inline input-medium" autocomplete="off" type="text" required>' +
                '<span class="help-inline" data-default="">请填写qq</span>' +
                '</div>' +
                '</div>' +
                '<div class="form-group" >' +
                '<label class="col-md-3 control-label">微信</label>' +
                '<div class="col-md-9">' +
                '<input name="wechat" class="form-control input-inline input-medium" autocomplete="off" type="text" required>' +
                '<span class="help-inline" data-default="">请填写微信</span>' +
                '</div>' +
                '</div>' +
                '</div>';

            $('#add-form').html(innerhtml);
        })
        function addValidation(obj) {
            var modal = $(obj);
            var form = modal.find('form');
            // 手机号码验证
            jQuery.validator.addMethod("isPhone", function(value, element) {
                var length = value.length;
                return this.optional(element) || (length == 11 && /^[1][3,4,5,7,8][0-9]{9}$/.test(value));
            }, "请正确填写您的手机号码。");
            // 邮箱验证
            jQuery.validator.addMethod("isEmail",function (val, element) {
                return this.optional(element) || (/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(.[a-zA-Z0-9_-]+)+$/.test(val));
            },"请填写正确的邮箱。");
            // qq验证
            jQuery.validator.addMethod("isQQ",function (val, element) {
                return this.optional(element) || (/[1-9][0-9]{4,14}/.test(val));
            },"请填写正确的QQ号码。");
            // 微信验证
            jQuery.validator.addMethod("isWechat",function (val, element) {
                return this.optional(element) || (/^[a-zA-Z\d_]{5,}$/.test(val));
            },"请填写正确的微信号。");
            // 非法字符
            jQuery.validator.addMethod("isInegal",function (val, element) {
                return this.optional(element) || (/^[0-9a-zA-Z_]{1,}$/.test(val));
            },"包含非法字符，只能使用字母、数字、下划线。");
            form.validate({
                rules: {
                    nickname: {
                        required: true,
                        minlength: 6,
                        maxlength: 20
                    },
                    code: {
                        required: true,
                        minlength: 4,
                        maxlength: 4,
                        remote: {
                            url: '/merchant/exists',
                            type: 'post'
                        },
                        isInegal: true
                    },
                    account: {
                        required: true,
                        minlength: 6,
                        maxlength: 20,
                        remote: {
                            url: '/merchant/exists',
                            type: 'post'
                        },
                        isInegal: true
                    },
                    pwd1: {
                        required: true,
                        minlength: 6,
                        maxlength: 20
                    },
                    pwd2: {
                        required: true,
                        minlength: 6,
                        maxlength: 20,
                        equalTo: 'input[name="pwd1"]'
                    },
                    phone: {
                        required: true,
                        isPhone: true
                    },
                    email:{
                        required: true,
                        isEmail: true
                    },
                    qq:{
                        required: true,
                        isQQ: true
                    },
                    wechat:{
                        required: true,
                        isWechat: true
                    }
                },
                messages: {
                    nickname: {
                        required: '商户别名不能为空！',
                        minlength: '至少输入{0}个字符',
                        maxlength: '最多输入{0}个字符'
                    },
                    code: {
                        required: '商户Id不能为空！',
                        minlength: '至少输入{0}个字符',
                        maxlength: '最多输入{0}个字符',
                        remote: '商户Id已存在！'
                    },
                    account: {
                        required: '商户账号不能为空！',
                        minlength: '至少输入{0}个字符',
                        maxlength: '最多输入{0}个字符',
                        remote: '商户账号已存在！'
                    },
                    pwd1: {
                        required: '密码不能为空！',
                        minlength: '至少输入{0}个字符',
                        maxlength: '最多输入{0}个字符'
                    },
                    pwd2: {
                        required: '确认密码不能为空！',
                        equalTo: '两次密码不一致！',
                        minlength: '至少输入{0}个字符',
                        maxlength: '最多输入{0}个字符'
                    },
                    phone: {
                        required: '手机号不能为空！'
                    },
                    email: {
                        required: '邮箱不能为空！'
                    },
                    qq: {
                        required: '手机号不能为空！'
                    },
                    wechat: {
                        required: '微信号不能为空！'
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
        function modifyValidation(obj) {
            var modal = $(obj);
            var form = modal.find('form');
            // 手机号码验证
            jQuery.validator.addMethod("isPhone", function(value, element) {
                var length = value.length;
                return this.optional(element) || (length == 11 && /^[1][3,4,5,7,8][0-9]{9}$/.test(value));
            }, "请正确填写您的手机号码。");
            // 邮箱验证
            jQuery.validator.addMethod("isEmail",function (val, element) {
                return this.optional(element) || (/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(.[a-zA-Z0-9_-]+)+$/.test(val));
            },"请填写正确的邮箱。");
            // qq验证
            jQuery.validator.addMethod("isQQ",function (val, element) {
                return this.optional(element) || (/[1-9][0-9]{4,14}/.test(val));
            },"请填写正确的QQ号码。");
            // 微信验证
            jQuery.validator.addMethod("isWechat",function (val, element) {
                return this.optional(element) || (/^[a-zA-Z\d_]{5,}$/.test(val));
            },"请填写正确的微信号。");
            // 非法字符
            jQuery.validator.addMethod("isInegal",function (val, element) {
                return this.optional(element) || (/^[0-9a-zA-Z_]{1,}$/.test(val));
            },"包含非法字符，只能使用字母、数字、下划线。");
            form.validate({
                rules: {
                    nickname: {
                        required: true,
                        minlength: 6,
                        maxlength: 20
                    },
                    code: {
                        required: true,
                        minlength: 4,
                        maxlength: 4,
                        /*remote: {
                            url: '',
                            type: 'post'
                        },*/
                        isInegal: true
                    },
                    account: {
                        required: true,
                        minlength: 6,
                        maxlength: 20,
                        isInegal: true
                    },
                    phone: {
                        required: true,
                        isPhone: true
                    },
                    email:{
                        required: true,
                        isEmail: true
                    },
                    qq:{
                        required: true,
                        isQQ: true
                    },
                    wechat:{
                        required: true,
                        isWechat: true
                    }
                },
                messages: {
                    nickname: {
                        required: '商户别名不能为空！',
                        minlength: '至少输入{0}个字符',
                        maxlength: '最多输入{0}个字符'
                    },
                    code: {
                        required: '商户Id不能为空！',
                        minlength: '至少输入{0}个字符',
                        maxlength: '最多输入{0}个字符'
                        /*,
                        remote: '商户Id已存在！'*/
                    },
                    account: {
                        required: '商户账号不能为空！',
                        minlength: '至少输入{0}个字符',
                        maxlength: '最多输入{0}个字符',
                        remote: '商户账号已存在！'
                    },
                    phone: {
                        required: '手机号不能为空！'
                    },
                    email: {
                        required: '邮箱不能为空！'
                    },
                    qq: {
                        required: '手机号不能为空！'
                    },
                    wechat: {
                        required: '微信号不能为空！'
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
                    sub1();
                }
            });
        }
        function search(url, page) {
            var end = $('#end').val();
            if (end && page > end) {
                page = end;
            }
            if (page <= 0) {
                page = 1;
            }
            var merchantname = tableList.find('input[name=merchant-name]').val();
            var id = tableList.find('input[name=merchant-id]').val();
            var type = tableList.find('select[name="type"]').val();
            var data = {name: merchantname, code: id, status: type, start: (page - 1)*10, limit: 10};
            $.ajax({
                type: 'post',
                url: url,
                data: data,
                dataType: 'json',
                success: function (list) {
                    var table = tableList.find('table > tbody').empty();
                    var innerHtml = '';
                    $.each(list.data, function (idx, val) {
                        var merchantType = '';
                        if (val.status == 1) {
                            merchantType = '<form method="post" action="">' +
                                '<input type="radio" name="m-type" value="1" checked>启用' +
                                '<input type="radio" name="m-type" value="2">停用' +
                                '<input type="radio" name="m-type" value="3">关闭' +
                                '<input type="radio" name="m-type" value="4">维护' +
                                '</form>';
                        } else if (val.status == 2) {
                            merchantType = '<form method="post" action="">' +
                                '<input type="radio" name="m-type" value="1" >启用' +
                                '<input type="radio" name="m-type" value="2" checked>停用' +
                                '<input type="radio" name="m-type" value="3">关闭' +
                                '<input type="radio" name="m-type" value="4">维护' +
                                '</form>';
                        } else if (val.status == 3) {
                            merchantType = '<form method="post" action="">' +
                                '<input type="radio" name="m-type" value="1" >启用' +
                                '<input type="radio" name="m-type" value="2">停用' +
                                '<input type="radio" name="m-type" value="3" checked>关闭' +
                                '<input type="radio" name="m-type" value="4">维护' +
                                '</form>';
                        } else if (val.status == 4) {
                            merchantType = '<form method="post" action="">' +
                                '<input type="radio" name="m-type" value="1" >启用' +
                                '<input type="radio" name="m-type" value="2">停用' +
                                '<input type="radio" name="m-type" value="3">关闭' +
                                '<input type="radio" name="m-type" value="4" checked>维护' +
                                '</form>';
                        }
                        innerHtml +=
                            '<tr class="align-center" data-id="' + val.id + '">' +
                            '<td>' + val.id + '</td>' +
                            '<td>' + val.nickname + '</td>' +
                            '<td>' + val.code + '</td>' +
                            '<td>' + val.name + '</td>' +
                            '<td>' + val.balance + '</td>' +
                            '<td>' + merchantType + '</td>' +
                            '<td>' + val.userNumber + '</td>' +
                            '<td>' + val.createTime + '</td>' +
                            '<td>' + val.loginTime + '</td>' +
                            '<td>' +
                            '<button class="btn gray" data-toggle="modal" data-target="#modal-modify" ' +
                            'onclick="modify('+val.id+')">' +
                            '修改' +
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

                    $("input[name=m-type]").click(function(){
                        var type = this.value;
                        var id = $(this).parent().parent().siblings(":first").text();
                        modifyType(id, type);
                    });
                }
            });
        }
        /*首页*/
        $('#top').click(function () {
            search("./merchant/list", 1);
        });
        /*尾页*/
        $('#end').click(function () {
            var page = $('#end').val();
            search("./merchant/list", parseInt(page));
        });
        /*上页*/
        $('#prev').click(function () {
            var page = $('#page').text();
            search("./merchant/list", parseInt(page) - 1);
        });
        /*下页*/
        $('#next').click(function () {
            var page = $('#page').text();
            search("./merchant/list", parseInt(page) + 1);
        });
        $('#btn-go').click(function () {
            var page = $('#inputPage').val();
            if(!page || page == ''){
                page = 1;
            }
            search("./merchant/list", parseInt(page));
        });


    });

function modifyType(id,type) {
    $.ajax({
        type: 'post',
        url: '/merchant/modify-type',
        data: "id="+id+"&status="+type,
        dataType: 'text',
        success: function (dat){
            if (dat != "true") {
                alert("修改状态失败");
            }
        }
    });
}
/*商户信息修改*/
function modify(id) {
    $.ajax({
        type: 'post',
        url: '/merchant/get',
        data: "id="+id,
        dataType: 'json',
        success: function (bean) {
            $('#nickname').val(bean.nickname);
            $('#code').val(bean.code);
            $('#name').val(bean.account);
            $('#email').val(bean.email);
            $('#qq').val(bean.qq);
            $('#wechat').val(bean.wechat);
            $('#phone').val(bean.phone);
            $('#id').val(bean.id);
            if(parseInt(bean.status)==1)
                $('#status1').attr("checked","checked");
            if(parseInt(bean.status)==2)
                $('#status2').attr("checked","checked");
            if(parseInt(bean.status)==3)
                $('#status3').attr("checked","checked");
            if(parseInt(bean.status)==4)
                $('#status4').attr("checked","checked");

            var opts = $('#role_id option');
            $(opts[bean.roleId]).attr("selected", true);
            $('#modal-modify').modal('show');
        }
    });
}
/*新增商户提交*/
function sub() {
    var data = $("form:first").serialize();
    $.ajax({
        type: 'post',
        url: '/merchant/add',
        data: data,
        dataType: 'json',
        success: function (boo) {
            if (boo.error == "0") {
                alert("保存成功");
                $('#modal-add').modal("hide");
                window.location.reload();
            }else{
                alert("保存失败")
            }
        }
    });
}
/*修改商户提交*/
function sub1() {
    var data = $("form:last").serialize();
    $.ajax({
        type: 'post',
        url: '/merchant/update',
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