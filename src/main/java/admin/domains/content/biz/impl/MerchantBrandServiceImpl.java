package admin.domains.content.biz.impl;

import admin.domains.content.dao.MerchantDao;
import admin.domains.content.dao.SiteTemplateDao;
import admin.domains.content.entity.Merchant;
import admin.domains.content.entity.SiteTemplate;
import admin.domains.content.vo.MerchantBrandVO;
import admin.domains.pool.AdminDataFactory;
import admin.domains.content.dao.MerchantBrandDao;
import admin.domains.content.entity.MerchantBrand;
import admin.domains.content.biz.MerchantBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-27
 */
@Service
public class MerchantBrandServiceImpl implements MerchantBrandService {

    @Autowired
    private AdminDataFactory adminDataFactory;

    @Autowired
    private MerchantBrandDao brandDao;

    @Autowired
    private MerchantDao merchantDao;

    @Autowired
    private SiteTemplateDao templateDao;

    @Override
    public boolean updateType(Integer id, Integer status) {
        return brandDao.updateType(id,status);
    }

    @Override
    public boolean exists(String code) {
        MerchantBrand exists = brandDao.exists(code);
        if (null == exists) {
            return true;
        }
        return false;
    }

    @Override
    public MerchantBrandVO getBean(Integer id) {
        MerchantBrand bean = brandDao.getBean(id);
        SiteTemplate template = templateDao.getBeanByCode(bean.getTemplete());
        SiteTemplate mtemplate = templateDao.getBeanByCode(bean.getMtemplete());
        MerchantBrandVO brandVO = new MerchantBrandVO(bean);
        brandVO.setTemplete(template);
        brandVO.setMtemplete(mtemplate);
        return brandVO;
    }

    @Override
    public List<MerchantBrandVO> listAll() {
        List<MerchantBrand> brands = brandDao.findAll();
        List<MerchantBrandVO> list = new ArrayList<>();
        for (MerchantBrand brand : brands) {
            Merchant merchant = merchantDao.getBean(brand.getMerchantId());
            SiteTemplate mtemplate = templateDao.getBeanByCode(brand.getMtemplete());
            SiteTemplate template = templateDao.getBeanByCode(brand.getTemplete());
            MerchantBrandVO merchantBrandVO = new MerchantBrandVO(brand);
            merchantBrandVO.setMerchantName(merchant.getCode());
            merchantBrandVO.setTemplete(template);
            merchantBrandVO.setMtemplete(mtemplate);
            list.add(merchantBrandVO);
        }
        return list;
    }

    @Override
    public boolean add(MerchantBrand merchantBrand) {
        return brandDao.add(merchantBrand);
    }

    @Override
    public boolean update(MerchantBrand merchantBrand) {
        return brandDao.update(merchantBrand);
    }
}
