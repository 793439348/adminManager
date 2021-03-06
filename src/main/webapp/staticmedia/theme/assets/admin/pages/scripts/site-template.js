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
                    var typeName = '';
                    if (val.type == 1) {
                        typeName = '移动端';
                    }else if (val.type == 2)
                        typeName = 'PC端';
                    innerHtml +=
                        '<tr class="align-center" data-id="' + val.id + '">' +
                        '<td>' + val.id + '</td>' +
                        '<td>' + val.code + '</td>' +
                        '<td>' + val.name + '</td>' +
                        '<td>' + typeName + '</td>' +
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
    $('#btn-add').click(function () {
        var innerhtml = '<div class="form-body">' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">模板编码</label>' +
            '<div class="col-md-9">' +
            '<input id="add-code" name="code" class="form-control input-inline input-medium" autocomplete="off" type="text">' +
            '<span class="help-inline" data-default="请输入商户昵称。"></span>' +
            '</div>' +
            '</div>' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">模板名称</label>' +
            '<div class="col-md-9">' +
            '<input id="add-name" name="name" class="form-control input-inline input-medium" autocomplete="off" type="text">' +
            '<span class="help-inline" data-default="请输入商户昵称。"></span>' +
            '</div>' +
            '</div>' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">类型</label>' +
            '<div id="add-type" class="col-md-9">' +
            '<input type="radio" name="type" value="1" checked>手机端'+
            '<input type="radio" name="type" value="2">PC端'+
            '</div>' +
            '</div>' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">缩略图</label>' +
            '<div class="col-md-9">' +
            '<input id="add-img1" name="smallImage" class="form-control input-inline input-medium" autocomplete="off" type="file" multiple>' +
            '<span class="help-inline" data-default="请选择缩略图。"></span>' +
            '</div>' +
            '</div>' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">预览图</label>' +
            '<div class="col-md-9">' +
            '<input id="add-img2" name="bigImage" class="form-control input-inline input-medium" autocomplete="off" type="file" multiple>' +
            '<span class="help-inline" data-default="请选择预览图。"></span>' +
            '</div>' +
            '</div>' +
            '<span id="error"></span> '+
            '</div>';
        $('#add-form').html(innerhtml);
    });
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
                }
            },
            messages: {
                code: {
                    required: "模板编码不能为空"
                },
                name: {
                    required: "模板名称不能为空"
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

            if (bean.type == 1) {
                $('#type1').attr("checked","checked");
            }else if (bean.type == 2)
                $('#type2').attr("checked","checked");

            $('#modal-modify').modal();
        }
    });
}
function sub() {
    var formData = new FormData();
    formData.append("templateImg", $('#add-img1').prop("files")[0]);
    formData.append("templateImg1", $('#add-img2').prop("files")[0]);
    // var data = $("form:first").serialize();

    var code = $('#add-code').val();
    var name = $('#add-name').val();
    var type = $('#add-type').find('input[type="radio"]:checked').val();

    formData.append("code", code);
    formData.append("name", name);
    formData.append("type", type);
    $.ajax({
        type: 'post',
        url: '/site-template/add',
        data: formData,
        processData:false,
        contentType: false,
        success: function (boo) {
            if (boo.error == 0) {
                alert("增加成功");
                $('#modal-add').modal("hide");
                window.location.reload();
            }else {
                $('#error').text(boo);
            }
        }
    });
}
function sub1() {

    var formData = new FormData();

    formData.append("id",$('#id').val());
    formData.append("code",$('#code').val());
    formData.append("name",$('#name').val());
    formData.append("type",$('#type').find('input[type="radio"]:checked').val());
    formData.append("templateImg", $('#modify-img1').prop("files")[0]);
    formData.append("templateImg1", $('#modify-img2').prop("files")[0]);

    var data = $("form:last").serialize();
    $.ajax({
        type: 'post',
        url: '/site-template/update',
        data: formData,
        processData:false,
        contentType: false,
        success: function (boo) {
            if (boo.error == 0) {
                alert("修改成功");
                $('#modal-modify').modal("hide");
                window.location.reload();
            }else{
                alert("修改失败")
            }
        }
    });
}
function dele(id) {
    if (confirm("请确认是否删除该模板信息")) {
        $.ajax({
            type: 'post',
            url: '/site-template/delete',
            data: 'id=' + id,
            dataType: 'text',
            success: function (data) {
                if (data == "true") {
                    alert("删除成功");
                    $('#modal-modify').modal("hide");
                    window.location.reload();
                } else {
                    alert("删除失败")
                }
            }
        });
    }
}
