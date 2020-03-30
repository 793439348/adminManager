package admin.web.content;

import admin.domains.content.biz.MerchantService;
import admin.domains.content.entity.AdminUser;
import admin.domains.content.entity.Merchant;
import admin.domains.jobs.AdminUserActionLogJob;
import admin.web.WebJSONObject;
import admin.web.helper.AbstractActionController;
import javautils.http.HttpUtil;
import javautils.jdbc.PageList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-27
 */
@Controller
public class MerchantController extends AbstractActionController {

    @Autowired
    private AdminUserActionLogJob adminUserActionLogJob;
    @Autowired
    private MerchantService merchantService;

    @ResponseBody
    @RequestMapping(value = "/merchant/list", method = RequestMethod.POST)
    public void MERCHANT_LIST(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant/list";
        final long t1 = System.currentTimeMillis();
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);
//        if (uEntity != null) {
//            if (super.hasAccess(uEntity, actionKey)) {
                String name = request.getParameter("name");
                String code = request.getParameter("code");
                Integer status = HttpUtil.getIntParameter(request, "status");
                Integer page = HttpUtil.getIntParameter(request, "start");
                Integer pageSize = HttpUtil.getIntParameter(request, "limit");

        System.out.println(name+"-"+code+"-"+status+"-"+page+"-"+pageSize);

                PageList pList = merchantService.search(name, code, status, page, pageSize);
                if (pList != null) {
                    json.accumulate("totalCount", pList.getCount());
                    json.accumulate("data", pList.getList());
                } else {
                    json.accumulate("totalCount", 0);
                    json.accumulate("data", "[]");
                }
                json.set(0, "0-3");
//            } else
//                json.set(2, "2-4");
//        } else
//            json.set(2, "2-6");
        final long t2 = System.currentTimeMillis();
        if (uEntity != null) {
            this.adminUserActionLogJob.add(request, actionKey, uEntity, json, t2 - t1);
        }
        HttpUtil.write(response, json.toString(), "text/json");
    }

    @ResponseBody
    @RequestMapping(value = "/merchant/add", method = RequestMethod.POST)
    public void MERCHANT_ADD(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant/add";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)) {

            } else
                json.set(2, "2-4");
        } else
            json.set(2, "2-6");

        String code = request.getParameter("code");
        String account = request.getParameter("account");
        String pwd1 = request.getParameter("pwd1");
        String pwd2 = request.getParameter("pwd2");
        String nickname = request.getParameter("nickname");
        Integer status = HttpUtil.getIntParameter(request,"status");
        Integer role_id = HttpUtil.getIntParameter(request,"role_id");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String qq = request.getParameter("qq");
        Merchant merchant = new Merchant();
        merchant.setAccount(account);
        merchant.setCode(code);
        merchant.setPassword(pwd1);
        merchant.setNickname(nickname);
        merchant.setStatus(status);
        merchant.setEmail(email);
        merchant.setRoleId(role_id);
        merchant.setPhone(phone);
        merchant.setQq(qq);
        System.out.println(merchant);
        HttpUtil.write(response, json.toString(), "text/json");
    }

    @ResponseBody
    @RequestMapping(value = "/merchant/delete", method = RequestMethod.POST)
    public void MERCHANT_DELETE(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant/delete";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)) {

            } else
                json.set(2, "");
        } else
            json.set(2, "");
        HttpUtil.write(response, json.toString(), "text/json");
    }

    @ResponseBody
    @RequestMapping(value = "/merchant/update", method = RequestMethod.POST)
    public void MERCHANT_UPDATE(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant/update";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)) {

            } else
                json.set(2, "");
        } else
            json.set(2, "");
        HttpUtil.write(response, json.toString(), "text/json");
    }

}
