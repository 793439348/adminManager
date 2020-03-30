package admin.domains.content.dao;

import javautils.jdbc.PageList;
import admin.domains.content.entity.MerchantBrandDomain;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;

import java.util.List;

/**
 * <p>
 * 商户域名
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-26
 */
public interface MerchantBrandDomainDao {

    boolean add(MerchantBrandDomain merchantBrandDomain);

    boolean delete(MerchantBrandDomain merchantBrandDomain);

    boolean update(MerchantBrandDomain merchantBrandDomain);

    PageList find(final List<Criterion> condition, final List<Order> sort, final int page, final int pageSize);
}
