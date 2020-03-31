package admin.domains.content.biz;

import admin.domains.content.entity.MerchantBrand;
import admin.domains.content.vo.MerchantBrandVO;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-27
 */
public interface MerchantBrandService {
    MerchantBrand getBean(Integer id);

    List<MerchantBrandVO> listAll();

    boolean add(MerchantBrand merchantBrand);

    boolean update(MerchantBrand merchantBrand);
}
