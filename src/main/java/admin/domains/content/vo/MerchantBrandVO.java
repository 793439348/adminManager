package admin.domains.content.vo;

import admin.domains.content.entity.Merchant;
import admin.domains.content.entity.MerchantBrand;
import lombok.Data;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-31
 */
@Data
public class MerchantBrandVO {
    private int id;
    private String merchantName;
    private String name;
    private String code;
    private String templete;
    private String mtemplete;
    private int status;

    public MerchantBrandVO() {
    }
    public MerchantBrandVO(Merchant merchant, MerchantBrand merchantBrand) {
        this.id = merchantBrand.getId();
        this.merchantName = merchant.getCode();
        this.name = merchantBrand.getName();
        this.code = merchantBrand.getCode();
        this.templete = merchantBrand.getTemplete();
        this.mtemplete = merchantBrand.getMtemplete();
        this.status = merchantBrand.getStatus();
    }


}
