package cc.mrbird.febs.gen.entity.dto;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.wuwenze.poi.annotation.ExcelField;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;

@Data
public class SaleRecordDTO implements Serializable {

    /**
     * 数量
     */
    private BigDecimal amount;
    /**
     * 商品ID
     */
    private Long categoryId;

    /**
     * 商品名称
     */
    private String categoryName;

    /**
     * 统计日期
     */
    private LocalDate collectionDate;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建者ID
     */
    private Long creatorId;

    /**
     * 创建者名字
     */
    private String creatorName;

    /**
     *
     */
    private Long id;

    /**
     * 单价
     */
    private BigDecimal price;
    /**
     * 总价
     */
    private BigDecimal totalBalance;

    /**
     * 备注
     */
    private String remark;

    /**
     * 统计开始时间
     */
    private String collectionStartDate;
    /**
     * 统计结束时间
     */
    private String collectionEndDate;
}
