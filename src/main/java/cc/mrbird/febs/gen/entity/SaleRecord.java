package cc.mrbird.febs.gen.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.wuwenze.poi.annotation.Excel;
import com.wuwenze.poi.annotation.ExcelField;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

/**
 * Entity
 *
 * @author MrBird
 * @date 2021-02-05 15:35:48
 */
@Data
@Excel("销售记录")
@TableName("t_sale_record")
public class SaleRecord implements Serializable, Cloneable {

    /**
     * 数量
     */
    @TableField("amount")
    @ExcelField("销售数量")
    private BigDecimal amount;
    /**
     * 商品ID
     */
    @TableField("category_id")
    private Long categoryId;

    /**
     * 商品名称
     */
    @TableField("category_name")
    @ExcelField("销售商品名称")
    private String categoryName;

    /**
     * 统计日期
     */
    @ExcelField("统计日期")
    @TableField("collection_date")
    private Date collectionDate;

    /**
     * 创建时间
     */
    @TableField("create_time")
    @ExcelField("销售时间")
    private Date createTime;

    /**
     * 创建者ID
     */
    @TableField("creator_id")
    private Long creatorId;

    /**
     * 创建者名字
     */
    @TableField("creator_name")
    private String creatorName;

    /**
     *
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 单价
     */
    @TableField("price")
    @ExcelField("销售价格")
    private BigDecimal price;
    /**
     * 总价
     */
    @ExcelField("销售总价")
    @TableField("total_balance")
    private BigDecimal totalBalance;

    /**
     * 备注
     */
    @TableField("remark")
    @ExcelField("备注")
    private String remark;

}
