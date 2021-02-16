package cc.mrbird.febs.gen.mapper;

import cc.mrbird.febs.gen.entity.SaleRecord;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 *  Mapper
 *
 * @author MrBird
 * @date 2021-02-05 15:35:48
 */
public interface SaleRecordMapper extends BaseMapper<SaleRecord> {

    @Select("SELECT SUM(amount) AS 'amount',SUM(total_balance) AS 'totalBalance',remark,collection_date AS 'collectionDate',price,category_name AS 'categoryName' FROM t_sale_record ${ew.customSqlSegment} group by category_name")
    public List<SaleRecord> listSaleRecordTotal(@Param(Constants.WRAPPER) QueryWrapper<SaleRecord> queryWrapper);

}
