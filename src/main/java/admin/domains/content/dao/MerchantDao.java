package admin.domains.content.dao;

import javautils.jdbc.PageList;
import admin.domains.content.entity.Merchant;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;

import java.util.List;

/**
 * <p>
 * 商户
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-26
 */
public interface MerchantDao {

    boolean add(Merchant merchant);

    boolean delete(Merchant merchant);

    boolean update(Merchant merchant);

    Merchant getMerchant(Integer id);

    PageList find(final List<Criterion> condition, final List<Order> sort, final int page, final int pageSize);
}
