package admin.web.content;

import admin.domains.content.entity.AdminUser;
import admin.domains.content.entity.Merchant;
import admin.domains.content.entity.SiteTemplate;
import admin.web.WebJSONObject;
import admin.web.helper.AbstractActionController;
import com.alibaba.fastjson.JSON;
import javautils.http.HttpUtil;
import admin.domains.content.biz.SiteTemplateService;
import javautils.jdbc.PageList;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-27
 */
@Slf4j
@Controller
public class SiteTemplateController extends AbstractActionController {

    @Autowired
    private SiteTemplateService siteTemplateService;

    @ResponseBody
    @RequestMapping(value = "/site-template/list", method = RequestMethod.POST)
    public void SITE_TEMPLATE_LIST(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/site-template/list";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        List<SiteTemplate> all = siteTemplateService.findAll();
        HttpUtil.write(response, JSON.toJSONString(all), "text/json");

        /*if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)){

            }else
                json.set(2,"");
        }else
            json.set(2,"");
        HttpUtil.write(response,json.toString(),"text/json");*/
    }

    @ResponseBody
    @RequestMapping(value = "/site-template/add", method = RequestMethod.POST)
    public void SITE_TEMPLATE_ADD(@RequestParam MultipartFile templateImg, MultipartFile templateImg1, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/site-template/add";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        String code = request.getParameter("code");
        String name = request.getParameter("name");
        Integer type = HttpUtil.getIntParameter(request, "type");

        /*if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)){

            }else
                json.set(2,"");
        }else
            json.set(2,"");
        HttpUtil.write(response,json.toString(),"text/json");*/


        //验证code唯一
        SiteTemplate beanByCode = siteTemplateService.getBeanByCode(code);
        if (null == beanByCode){
            /*文件上传start*/
            String savePath = request.getSession().getServletContext().getRealPath("staticmedia/templateImg");
            //文件格式判断
            String imgFormat = "bmp,jpg,png,tif,gif,pcx,tga,exif,fpx,svg,psd,cdr,pcd,dxf,ufo,eps,ai,raw,webp";
            String suf = templateImg.getOriginalFilename().substring(templateImg.getOriginalFilename().lastIndexOf(".") + 1);
            String suf1 = templateImg1.getOriginalFilename().substring(templateImg1.getOriginalFilename().lastIndexOf(".") + 1);
            InputStream is = null;
            OutputStream os = null;
            InputStream is1 = null;
            OutputStream os1 = null;
            try {
                File f = new File(savePath);
                if (!f.exists()) {
                    f.mkdir();
                }

                if (imgFormat.contains(suf.toLowerCase()) && imgFormat.contains(suf1.toLowerCase())) {

                    String smallImage = code + "-smallImage." + suf;
                    String bigImage = code + "-bigImage." + suf;

                    File file = new File(savePath + "/" + smallImage );
                    if (!file.exists())
                        file.createNewFile();
                    File file1 = new File(savePath + "/" + bigImage);
                    if (!file1.exists())
                        file1.createNewFile();

                    is = templateImg.getInputStream();
                    os = new FileOutputStream(file);
                    byte[] bytes = new byte[1024];
                    int n = 0;
                    while ((n = is.read(bytes)) != -1) {
                        os.write(bytes);
                    }
                    is1 = templateImg1.getInputStream();
                    os1 = new FileOutputStream(file1);
                    while ((n = is1.read(bytes)) != -1) {
                        os1.write(bytes);
                    }


                    SiteTemplate siteTemplate = new SiteTemplate(code, name, type, "templateImg/"+smallImage,"templateImg/"+ bigImage);
                    log.info("===================================图片上传成功");
                    if (siteTemplateService.add(siteTemplate))
                        json.set(0,"0-6");
                    else
                        json.set(1,"1-6");
                } else {
                    //图片格式验证失败，返回错误消息
                    json.set(1,"1-6");
                }
            } catch (IOException e) {
                e.printStackTrace();
            }finally {
                try {
                    if (os1!=null)
                        os1.close();
                    if (is1!=null)
                        is1.close();
                    if (os!=null)
                        os.close();
                    if (is!=null)
                        is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            /*文件上传end*/
        }else {
            //验证失败
            json.set(1,"1-6");
        }

        HttpUtil.write(response,json.toString(),"text/json");
    }

    @ResponseBody
    @RequestMapping(value = "/site-template/delete", method = RequestMethod.POST)
    public void SITE_TEMPLATE_DELETE(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/site-template/delete";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        Integer id = HttpUtil.getIntParameter(request, "id");
        boolean delete = siteTemplateService.delete(id);
        HttpUtil.write(response, String.valueOf(delete), "text");

        /*if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)) {

            } else
                json.set(2, "");
        } else
            json.set(2, "");
        HttpUtil.write(response, json.toString(), "text/json");*/
    }

    @ResponseBody
    @RequestMapping(value = "/site-template/update", method = RequestMethod.POST)
    public void SITE_TEMPLATE_UPDATE(@RequestParam(required = false) MultipartFile templateImg, MultipartFile templateImg1, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/site-template/update";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);
        Integer id = HttpUtil.getIntParameter(request, "id");
        Integer type = HttpUtil.getIntParameter(request, "type");
        String name = request.getParameter("name");
        String code = request.getParameter("code");

        StringBuffer err = new StringBuffer();// 返回前端的错误消息

        //验证code
        SiteTemplate beanByCode = siteTemplateService.getBeanByCode(code);
        if (beanByCode == null || beanByCode.getId() == id ) {
            String savePath = request.getSession().getServletContext().getRealPath("staticmedia/templateImg");
            //文件格式判断
            String imgFormat = "bmp,jpg,png,tif,gif,pcx,tga,exif,fpx,svg,psd,cdr,pcd,dxf,ufo,eps,ai,raw,webp";
            InputStream is = null;
            OutputStream os = null;
            InputStream is1 = null;
            OutputStream os1 = null;
            String smallImage = "";
            String bigImage = "";
            try {
                // 是否修改图片
                byte[] bytes = new byte[1024];
                int n = 0;
                if (templateImg != null) {
                    String suf = templateImg.getOriginalFilename().substring(templateImg.getOriginalFilename().lastIndexOf(".") + 1);
                    if (imgFormat.contains(suf.toLowerCase())){
                        smallImage = code + "-smallImage." + suf;
                        File file = new File(savePath + "/" + smallImage );
                        if (!file.exists())
                            file.createNewFile();
                        is = templateImg.getInputStream();
                        os = new FileOutputStream(file);
                        while ((n = is.read(bytes)) != -1) {
                            os.write(bytes);
                        }
                    }else {
                        json.set(1,"");
                        err.append("\n 缩略图格式错误");
                    }
                }
                if (templateImg1 != null) {
                    String suf1 = templateImg1.getOriginalFilename().substring(templateImg1.getOriginalFilename().lastIndexOf(".") + 1);
                    if (imgFormat.contains(suf1.toLowerCase())){
                        bigImage = code + "-bigImage." + suf1;
                        File file1 = new File(savePath + "/" + bigImage);
                        if (!file1.exists())
                            file1.createNewFile();
                        is = templateImg.getInputStream();
                        os = new FileOutputStream(file1);
                        while ((n = is.read(bytes)) != -1) {
                            os.write(bytes);
                        }
                    }else {
                        json.set(1,"");
                        err.append("\n 预览图格式错误");
                    }
                }
            } catch (IOException e) {
                e.getMessage();
            }finally {
                try {
                    if (os1!=null)
                        os1.close();
                    if (is1!=null)
                        is1.close();
                    if (os!=null)
                        os.close();
                    if (is!=null)
                        is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            SiteTemplate siteTemplate = new SiteTemplate(code, name, type, smallImage, bigImage);
            siteTemplate.setId(id);
            log.info("SITE_TEMPLATE_UPDATE :{}", siteTemplate);

            boolean update = siteTemplateService.update(siteTemplate);
            json.set(0,"");
        }else {
            // code 已存在
            json.set(1,"");
            err.append("\n code已存在");
        }

        HttpUtil.write(response,json.toString(),"text/json");



       /* if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)){

            }else
                json.set(2,"");
        }else
            json.set(2,"");
        HttpUtil.write(response,json.toString(),"text/json");*/
    }

    @ResponseBody
    @RequestMapping(value = "/site-template/get", method = RequestMethod.POST)
    public void getMerchant(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        Integer id = HttpUtil.getIntParameter(request, "id");
        SiteTemplate siteTemplate = siteTemplateService.getBean(id);
        HttpUtil.write(response, JSON.toJSONString(siteTemplate), "text/json");
    }

    @ResponseBody
    @RequestMapping(value = "/site-template/getbycode", method = RequestMethod.POST)
    public void getMerchantByCode(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        String code = request.getParameter("code");
        SiteTemplate siteTemplate = siteTemplateService.getBeanByCode(code);
        HttpUtil.write(response, JSON.toJSONString(siteTemplate), "text/json");
    }

    @ResponseBody
    @RequestMapping(value = "/site-template/search", method = RequestMethod.POST)
    public void search(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Integer type = HttpUtil.getIntParameter(request, "type");
        Integer page = HttpUtil.getIntParameter(request, "page");
        Integer pageSize = HttpUtil.getIntParameter(request, "pageSize");
        PageList pList = siteTemplateService.search(type, name, page, pageSize);
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        if (pList != null) {
            json.accumulate("totalCount", pList.getCount());
            json.accumulate("data", pList.getList());
        } else {
            json.accumulate("totalCount", 0);
            json.accumulate("data", "[]");
        }
        json.set(0, "0-3");
        HttpUtil.write(response, json.toString(), "text/json");

    }

}
