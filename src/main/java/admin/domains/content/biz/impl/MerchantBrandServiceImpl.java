package admin.domains.content.biz.impl;

import admin.domains.pool.AdminDataFactory;
import admin.domains.content.dao.MerchantBrandDao;
import admin.domains.content.entity.MerchantBrand;
import admin.domains.content.biz.MerchantBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    @Override
    public List<MerchantBrand> listAll() {
        return brandDao.findAll();
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
