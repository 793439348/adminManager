package admin.domains.content.dao;

import javautils.jdbc.PageList;
import admin.domains.content.entity.MerchantBrand;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;

import java.util.List;

/**
 * <p>
 * 商户品牌
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-26
 */
public interface MerchantBrandDao {

    List<MerchantBrand> findAll();

    boolean add(MerchantBrand merchantBrand);

    boolean delete(MerchantBrand merchantBrand);

    boolean update(MerchantBrand merchantBrand);

    PageList find(final List<Criterion> condition, final List<Order> sort, final int page, final int pageSize);
}