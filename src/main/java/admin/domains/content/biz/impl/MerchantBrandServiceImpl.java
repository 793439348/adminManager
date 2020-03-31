package admin.domains.content.biz.impl;

import admin.domains.content.dao.MerchantDao;
import admin.domains.content.entity.Merchant;
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

    @Override
    public MerchantBrand getBean(Integer id) {
        return brandDao.getBean(id);
    }

    @Override
    public List<MerchantBrandVO> listAll() {
        List<MerchantBrand> brands = brandDao.findAll();
        List<MerchantBrandVO> list = new ArrayList<>();
        for (MerchantBrand brand : brands) {
            Merchant merchant = merchantDao.getBean(brand.getMerchantId());
            MerchantBrandVO merchantBrandVO = new MerchantBrandVO(merchant,brand);
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
