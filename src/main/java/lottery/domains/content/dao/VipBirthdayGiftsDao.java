package lottery.domains.content.dao;

import javautils.jdbc.PageList;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Criterion;
import java.util.List;
import lottery.domains.content.entity.VipBirthdayGifts;

public interface VipBirthdayGiftsDao
{
    boolean add(final VipBirthdayGifts p0);
    
    VipBirthdayGifts getById(final int p0);
    
    int getWaitTodo();
    
    boolean hasRecord(final int p0, final int p1);
    
    boolean update(final VipBirthdayGifts p0);
    
    PageList find(final List<Criterion> p0, final List<Order> p1, final int p2, final int p3);
}
