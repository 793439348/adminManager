package lottery.domains.content.dao;

import lottery.domains.content.entity.LotteryType;
import java.util.List;

public interface LotteryTypeDao
{
    List<LotteryType> listAll();
    
    boolean updateStatus(final int p0, final int p1);
}
