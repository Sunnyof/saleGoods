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
 * @date 2021-02-05 09:47:59
 */
@Data
@Excel("商品类型表")
@TableName("t_category")
public class Category implements Serializable, Cloneable {

    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;

    /**
     * 创建者ID
     */
    @TableField("creator_id")
    private Long creatorId;

    /**
     * 创建者名称
     */
    @TableField("creator_name")
    private String creatorName;

    /**
     *
     */
    @TableId(value = "id", type = IdType.AUTO)
    @ExcelField("商品ID")
    private Long id;

    /**
     * 修改者ID
     */
    @TableField("modifier_id")
    private Long modifierId;

    /**
     * 修改者名称
     */
    @TableField("modifier_name")
    private String modifierName;

    /**
     * 修改时间
     */
    @TableField("modify_time")
    private Date modifyTime;

    /**
     * 种类名称
     */
    @TableField("name")
    @ExcelField("商品名称")
    private String name;

    /**
     * 单价
     */
    @TableField("price")
    @ExcelField("商品价格")
    private BigDecimal price;

    /**
     * 商品编号
     */
    @TableField("category_code")
    @ExcelField("商品编号")
    private String categoryCode;
}
