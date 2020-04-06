package admin.web.content;

import admin.domains.content.entity.AdminUser;
import admin.domains.content.vo.MerchantBrandVO;
import admin.web.WebJSONObject;
import admin.web.helper.AbstractActionController;
import com.alibaba.fastjson.JSON;
import javautils.http.HttpUtil;
import admin.domains.content.entity.MerchantBrand;
import admin.domains.content.biz.MerchantBrandService;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
public class MerchantBrandController extends AbstractActionController {

    @Autowired
    private MerchantBrandService merchantBrandService;
    @ResponseBody
    @RequestMapping(value = "/merchant-brand/list",method = RequestMethod.POST)
    public void MERCHANT_BRAND_LIST(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand/list";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

//        if (uEntity != null) {
//            if (super.hasAccess(uEntity, actionKey)){
                List<MerchantBrandVO> list = merchantBrandService.listAll();

                final JSONArray data = JSONArray.fromObject((Object)list);
                HttpUtil.write(response,data.toString(),"text/json");
                return;
            /*}else
                json.set(2,"2-4");
        }else
            json.set(2,"2-6");
        HttpUtil.write(response,json.toString(),"text/json");*/
    }
    @ResponseBody
    @RequestMapping(value = "/merchant-brand/add",method = RequestMethod.POST)
    public void MERCHANT_BRAND_ADD(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand/add";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);
        if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)) {
                Integer merchantId = HttpUtil.getIntParameter(request, "merchantId");
                String name = request.getParameter("name");
                String code = request.getParameter("code");
                String templete = request.getParameter("templete");
                String mtemplete = request.getParameter("mtemplete");
                Integer status = HttpUtil.getIntParameter(request, "status");
                MerchantBrand merchantBrand = new MerchantBrand(merchantId, name, code, templete, mtemplete, status);
                log.info("Brand Add:[{}]",merchantBrand);
                try {
                    boolean b = merchantBrandService.add(merchantBrand);
                    json.set(0,"0-6");
                } catch (Exception e) {
                    json.set(1,"1-6");
                }
            } else
                json.set(2, "2-4");
        } else
            json.set(2, "2-6");
        HttpUtil.write(response, json.toString(), "text/json");
    }
    @ResponseBody
    @RequestMapping(value = "/merchant-brand/delete",method = RequestMethod.POST)
    public void MERCHANT_BRAND_DELETE(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand/delete";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)){

            }else
                json.set(2,"");
        }else
            json.set(2,"");
        HttpUtil.write(response,json.toString(),"text/json");
    }
    @ResponseBody
    @RequestMapping(value = "/merchant-brand/update",method = RequestMethod.POST)
    public void MERCHANT_BRAND_UPDATE(MerchantBrand merchantBrand,HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand/update";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        System.out.println(merchantBrand);
        if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)){
                boolean update = merchantBrandService.update(merchantBrand);
                HttpUtil.write(response, String.valueOf(update), "text");
                return;
            }else
                json.set(2,"2-4");
        }else
            json.set(2,"2-6");
        HttpUtil.write(response,json.toString(),"text/json");
    }
    @ResponseBody
    @RequestMapping(value = "/merchant-brand/get",method = RequestMethod.POST)
    public void MERCHANT_BRAND_GET(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);
        Integer id = HttpUtil.getIntParameter(request, "id");

        MerchantBrandVO bean = merchantBrandService.getBean(id);
        HttpUtil.write(response, JSON.toJSONString(bean),"text/json");
    }
    @ResponseBody
    @RequestMapping(value = "/merchant-brand/getlist",method = RequestMethod.POST)
    public void getList(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

        List<MerchantBrandVO> list = merchantBrandService.listAll();
        HttpUtil.write(response,JSON.toJSONString(list),"text/json");
    }

    @ResponseBody
    @RequestMapping(value = "/merchant-brand/exists", method = RequestMethod.POST)
    public void exists(String code,HttpSession session, HttpServletRequest request, HttpServletResponse response){
        HttpUtil.write(response,String.valueOf(merchantBrandService.exists(code)),"text");
    }
    @ResponseBody
    @RequestMapping(value = "/merchant-brand/modify-type", method = RequestMethod.POST)
    public void modifyType(Integer id,Integer status,HttpSession session, HttpServletRequest request, HttpServletResponse response) {

        log.info("modify type:{} == {}",id,status);
        boolean b = merchantBrandService.updateType(id, status);
        HttpUtil.write(response, JSON.toJSONString(b), "text");
    }

}
