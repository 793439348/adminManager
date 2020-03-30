package admin.web.content;

import admin.domains.content.entity.AdminUser;
import admin.web.WebJSONObject;
import admin.web.helper.AbstractActionController;
import javautils.http.HttpUtil;
import admin.domains.content.entity.MerchantBrand;
import admin.domains.content.biz.MerchantBrandService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
@Controller
public class MerchantBrandController extends AbstractActionController {

    @Autowired
    private MerchantBrandService merchantBrandService;

    @RequestMapping(value = "/merchant-brand/list",method = RequestMethod.POST)
    public void MERCHANT_BRAND_LIST(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand/list";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)){
                List<MerchantBrand> list = merchantBrandService.listAll();
                final JSONArray data = JSONArray.fromObject((Object)list);
                HttpUtil.write(response,data.toString(),"text/json");
                return;
            }else
                json.set(2,"2-4");
        }else
            json.set(2,"2-6");
        HttpUtil.write(response,json.toString(),"text/json");
    }

    @RequestMapping(value = "/merchant-brand/add",method = RequestMethod.POST)
    public void MERCHANT_BRAND_ADD(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand/add";
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

    @RequestMapping(value = "/merchant-brand/update",method = RequestMethod.POST)
    public void MERCHANT_BRAND_UPDATE(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand/update";
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



}
