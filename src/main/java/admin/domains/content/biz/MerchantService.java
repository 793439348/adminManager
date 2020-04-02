package admin.domains.content.biz;

import javautils.jdbc.PageList;
import admin.domains.content.entity.Merchant;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-27
 */
public interface MerchantService {

    boolean add(Merchant merchant);

    PageList search(String name,String code,Integer status,Integer page,Integer pageSize);

    boolean updateMerchant(Merchant merchant);

    Merchant getBean(Integer id);

    List<Merchant> getListAll();

    boolean updateType(Integer id, Integer status);

}
